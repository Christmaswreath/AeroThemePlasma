import QtQuick 2.8
import SddmComponents 2.0
import QtQuick.Layouts 1.15
import QtGraphicalEffects 1.0
import QtQuick.Controls 2.8 as QQC2
import "SMOD" as SMOD
import org.kde.plasma.core 2.0 as PlasmaCore
import org.kde.plasma.components 3.0 as PlasmaComponents3
import org.kde.plasma.extras 2.0 as PlasmaExtras
import org.kde.kirigami 2.13 as Kirigami
import org.kde.plasma.workspace.components 2.0 as PW


Item
{
    id: root

    LayoutMirroring.enabled : Qt.locale().textDirection == Qt.RightToLeft
    LayoutMirroring.childrenInherit : true

    property bool m_forceUserSelect: config.boolValue("forceUserSelect")
    property bool m_biggerUserFrame: config.boolValue("biggerUserFrame")
    property bool m_biggerMultiUserFrame: config.boolValue("biggerMultiUserFrame")

    enum LoginPage
    {
        SelectUser,
        Login,
        LoginFailed
    }

    // copied from sddm/src/greeter/UserModel.h because
    // it doesn't seem accessible via e.g. SDDM.UserModel.NameRole
    enum UserRoles
    {
        NameRole = 257,
        RealNameRole,
        HomeDirRole,
        IconRole,
        NeedsPasswordRole
    }

    Connections
    {
        target: sddm

        function onLoginFailed()
        {
            password.text = ""
            pages.currentIndex = Main.LoginPage.LoginFailed
        }
    }

    Keys.onEscapePressed:
    {
        if (pages.currentIndex === Main.LoginPage.Login && switchuser.enabled)
        {
            password.text = ""
            pages.currentIndex = Main.LoginPage.SelectUser
        }
        else if (pages.currentIndex === Main.LoginPage.LoginFailed)
        {
            pages.currentIndex = Main.LoginPage.Login
        }
    }

    PlasmaCore.DataSource {
        id: keystateSource
        engine: "keystate"
        connectedSources: "Caps Lock"
    }
    FontLoader
    {
        id: mainfont
        source: "font.ttf"
    }

    Background
    {
        anchors.fill: parent
        fillMode: Image.Stretch
        source: config.stringValue("background")
    }

    Component
    {
        id: userDelegate

        Column
        {
            id: delegateColumn
            width: listView.cellWidth
            height: listView.cellHeight

            Item
            {
                id: avatarparent
                width: m_biggerMultiUserFrame ? 100 : 80
                height: width

                anchors.centerIn: parent

                Item
                {
                    width: m_biggerMultiUserFrame ? 60 : 48
                    height: width

                    anchors.centerIn: parent

                    Rectangle
                    {
                        id: maskmini

                        anchors.fill: parent
                        anchors.centerIn: parent
                        radius: 2
                        visible: false
                    }

                    Image
                    {
                        id: avatarmini

                        property string m_fallbackPicture: "Assets/user.png"

                        onStatusChanged:
                        {
                            if (avatarmini.status == Image.Error)
                            {
                                avatarmini.source = avatarmini.m_fallbackPicture;
                            }
                        }

                        source: model.icon

                        fillMode: Image.PreserveAspectCrop

                        anchors.fill: parent
                        anchors.centerIn: parent

                        layer.enabled: true
                        layer.effect: OpacityMask
                        {
                            maskSource: maskmini
                        }
                    }
                }

                Image
                {
                    id: avatarminiframe

                    property bool m_hovered: false

                    source:
                    {
                        if (m_biggerMultiUserFrame)
                        {
                            if (m_hovered && delegateColumn.focus)   return "Assets/12235.png"
                            if (m_hovered && !delegateColumn.focus)  return "Assets/12233.png"
                            if (!m_hovered && delegateColumn.focus)  return "Assets/12234.png"
                            if (!m_hovered && !delegateColumn.focus) return "Assets/12237.png"
                        }
                        else
                        {
                            if (m_hovered && delegateColumn.focus)   return "Assets/12220.png"
                            if (m_hovered && !delegateColumn.focus)  return "Assets/12218.png"
                            if (!m_hovered && delegateColumn.focus)  return "Assets/12219.png"
                            if (!m_hovered && !delegateColumn.focus) return "Assets/12222.png"
                        }
                    }
                    anchors.fill: parent
                    anchors.centerIn: parent
                }
            }

            Text
            {
                text: (model.realName === "") ? model.name : model.realName
                color: "white"
                font.pixelSize: 12
                //font.family: mainfont.name

                renderType: Text.NativeRendering
                font.hintingPreference: Font.PreferFullHinting
                font.kerning: false
                anchors.top: avatarparent.bottom
                //anchors.topMargin: -3
                anchors.horizontalCenter: avatarparent.horizontalCenter

                layer.enabled: true
                layer.effect: DropShadow
                {
                    verticalOffset: 1
                    color: "#000"
                    radius: 7
                    samples: 20
                }
            }

            MouseArea
            {
                anchors.fill: delegateColumn
                hoverEnabled: true

                onEntered:
                {
                    avatarminiframe.m_hovered = true
                }
                onExited:
                {
                    avatarminiframe.m_hovered = false
                }
            }

            Keys.onReturnPressed:
            {
                if (focus)
                {
                    let username = model.name

                    if (username != null)
                    {
                        let realname = model.realName
                        let pic = model.icon
                        let needspassword = model.needsPassword

                        if (needspassword)
                        {
                            userNameLabel.text = realname
                            avatar.source = pic

                            listView.currentIndex = index
                            pages.currentIndex = Main.LoginPage.Login
                        }
                        else
                        {
                            sddm.login(username, password.text, session.index)
                        }
                    }
                }
            }
        }
    }

    StackLayout
    {
        id: pages
        anchors.fill: parent

        onCurrentIndexChanged:
        {
            if (currentIndex == Main.LoginPage.SelectUser)
            {
                listView.forceActiveFocus()
            }
            else if (currentIndex == Main.LoginPage.Login)
            {
                password.forceActiveFocus()
            }
            else if (currentIndex == Main.LoginPage.LoginFailed)
            {
                dismissButton.forceActiveFocus()
            }
        }

        // for testing failed login
        //currentIndex: Main.LoginPage.LoginFailed

        Component.onCompleted:
        {
            let singleusermode = userModel.count < 2 && !m_forceUserSelect

            if (singleusermode)
            {
                let index = 0;
                let username = userModel.data(userModel.index(index, 0), Main.UserRoles.NameRole)

                if (username != null)
                {
                    let userDisplayName = userModel.data(userModel.index(index, 0), Main.UserRoles.RealNameRole)
                    let userPicture = userModel.data(userModel.index(index, 0), Main.UserRoles.IconRole)

                    //console.log(userDisplayName)

                    userNameLabel.text = userDisplayName
                    avatar.source = userPicture

                    switchuser.enabled = false
                    switchuser.visible = false

                    pages.currentIndex = Main.LoginPage.Login
                }
            }
        }

        Item
        {
            id: userlistpage
            anchors.fill: parent

            GridView
            {
                id: listView
                anchors.centerIn: parent

                anchors.verticalCenterOffset:
                {
                    if (count < 5)
                    {
                        return 72
                    }
                    else
                    {
                        return 0
                    }
                }

                width:
                {
                    if (count < 5)
                    {
                        return cellWidth * count
                    }
                    else
                    {
                        return cellWidth * 5
                    }
                }

                height:
                {
                    if (count > 5)
                    {
                        return 200 * 2
                    }
                    else
                    {
                        return 200
                    }
                }

                clip: true
                interactive: true
                keyNavigationEnabled: true
                keyNavigationWraps: false
                focus: true
                boundsBehavior: Flickable.StopAtBounds

                QQC2.ScrollBar.vertical: QQC2.ScrollBar {}

                cellWidth: 200
                cellHeight: 200

                model: userModel
                delegate: userDelegate
                currentIndex: userModel.lastIndex

                KeyNavigation.backtab: rebootButton
                KeyNavigation.tab: accessbutton

                MouseArea
                {
                    anchors.fill: parent

                    onClicked:
                    {
                        let posInGridView = Qt.point(mouse.x, mouse.y)
                        let posInContentItem = mapToItem(listView.contentItem, posInGridView)
                        let index = listView.indexAt(posInContentItem.x, posInContentItem.y)

                        let username = userModel.data(userModel.index(index, 0), Main.UserRoles.NameRole)

                        if (username != null)
                        {
                            let realname = userModel.data(userModel.index(index, 0), Main.UserRoles.RealNameRole)
                            let pic = userModel.data(userModel.index(index, 0), Main.UserRoles.IconRole)
                            let needspassword = userModel.data(userModel.index(index, 0), Main.UserRoles.NeedsPasswordRole)

                            if (needspassword)
                            {
                                userNameLabel.text = realname == "" ? username : realname;
                                avatar.source = pic

                                listView.currentIndex = index
                                pages.currentIndex = Main.LoginPage.Login
                            }
                            else
                            {
                                sddm.login(username, password.text, session.index)
                            }
                        }
                    }
                }
            }
        }

        Item
        {
            id: loginpage

            Column
            {
                id: mainColumn
                anchors.centerIn: parent

                Item
                {
                    id: userpic

                    anchors.horizontalCenter: parent.horizontalCenter
                    anchors.horizontalCenterOffset: -1
                    anchors.bottom: parent.verticalCenter
                    anchors.bottomMargin: m_biggerUserFrame ? -64 : -56

                    width: m_biggerUserFrame ? 238 : 190
                    height: width

                    Item
                    {
                        width: m_biggerUserFrame ? 158 : 126
                        height: width

                        anchors.centerIn: parent

                        Rectangle
                        {
                            id: mask

                            anchors.fill: parent
                            anchors.centerIn: parent
                            radius: 2
                            visible: false
                        }

                        Image
                        {
                            id: avatar

                            fillMode: Image.PreserveAspectCrop

                            source: ""

                            property string defaultPic: "Assets/user.png"

                            onStatusChanged:
                            {
                                if (avatar.status == Image.Error)
                                {
                                    avatar.source = avatar.defaultPic;
                                }
                            }

                            anchors.fill: parent
                            anchors.centerIn: parent

                            layer.enabled: true
                            layer.effect: OpacityMask
                            {
                                maskSource: mask
                            }
                        }
                    }

                    Image
                    {
                        source: m_biggerUserFrame ? "Assets/12238.png" : "Assets/12223.png"
                        anchors.fill: parent
                        anchors.centerIn: parent
                    }
                }


                Item
                {
                    id: loginbox

                    anchors.horizontalCenter: parent.horizontalCenter
                    anchors.top: userpic.bottom
                    anchors.topMargin: 4

                    QQC2.Label
                    {
                        id: userNameLabel

                        anchors.horizontalCenter: parent.horizontalCenter

                        text: ""
                        color: "white"

                        //font.family: mainfont.name
                        font.pixelSize: 23
                        font.kerning: false
                        renderType: Text.NativeRendering
                        font.hintingPreference: Font.PreferVerticalHinting
                        //font.weight: Font.Medium

                        layer.enabled: true
                        layer.effect: DropShadow
                        {
                            verticalOffset: 1
                            color: "#ef000000"
                            radius: 9
                            samples: 80
                        }
                    }

                    QQC2.TextField
                    {
                        id: password

                        anchors.top: userNameLabel.bottom
                        anchors.horizontalCenter: parent.horizontalCenter
                        anchors.topMargin: 8

                        width: 225
                        height: 25

                        leftPadding: 7

                        font.pointSize:
                        {
                            if (password.length > 0)
                            {
                                return 7
                            }

                            return 9
                        }
                        //font.family: mainfont.name

                        placeholderTextColor: "#555"

                        background: Image
                        {
                            source:
                            {
                                if (password.focus) return "Assets/input-focus.png"
                                if (password.hovered) return "Assets/input-hover.png"
                                return "Assets/input.png"
                            }
                        }

                        placeholderText: "Password"
                        selectByMouse: true
                        echoMode : TextInput.Password
                        inputMethodHints: Qt.ImhSensitiveData | Qt.ImhNoPredictiveText

                        KeyNavigation.backtab: switchLayoutButton
                        KeyNavigation.tab: loginButton
                        KeyNavigation.down:
                        {
                            if (switchuser.enabled)
                            {
                                return switchuser
                            }
                            else
                            {
                                return accessbutton
                            }
                        }

                        Keys.onPressed : {
                            if (event.key === Qt.Key_Return || event.key === Qt.Key_Enter)
                            {
                                let index = listView.currentIndex
                                let username = userModel.data(userModel.index(index, 0), Main.UserRoles.NameRole)

                                if (username != null)
                                {
                                    sddm.login(username, password.text, session.index)
                                }

                                event.accepted = true
                            }
                            else if (
                                event.matches(StandardKey.Undo) ||
                                event.matches(StandardKey.Redo) ||
                                event.matches(StandardKey.Cut) ||
                                event.matches(StandardKey.Copy) ||
                                event.matches(StandardKey.Paste)
                                )
                            {
                                // disable these events
                                event.accepted = true
                            }
                        }
                    }
                    RowLayout {
                        spacing: 2
                        anchors.top: password.bottom
                        anchors.horizontalCenter: parent.horizontalCenter
                        anchors.topMargin: 2
                        visible: keystateSource.data["Caps Lock"]["Locked"] && password.visible
                        Kirigami.Icon {
                            source: "dialog-warning"
                            implicitHeight: 16
                            implicitWidth: 16
                        }
                        QQC2.Label {
                            id: notificationsLabel
                            font.pointSize: 9
                            text: i18nd("plasma_lookandfeel_org.kde.lookandfeel", "Caps Lock is on");
                            width: implicitWidth
                            color: "white"
                        }
                    }

                    QQC2.Button
                    {
                        id: loginButton

                        anchors.left: password.right
                        anchors.verticalCenter: password.verticalCenter
                        anchors.verticalCenterOffset: -1
                        anchors.leftMargin: 4

                        width: 30
                        height: 30

                        background: Image
                        {
                            source: loginButton.pressed ? "Assets/gopressed.png" : (loginButton.focus || loginButton.hovered ? "Assets/gohover.png" : "Assets/go.png")
                            /*source:
                            {
                                if (loginButton.pressed) return "Assets/12275.png"
                                if (loginButton.hovered && loginButton.focus) return "Assets/12274.png"
                                if (loginButton.hovered && !loginButton.focus) return "Assets/12274.png"
                                if (!loginButton.hovered && loginButton.focus) return "Assets/12276.png"
                                return "Assets/12276.png"

                            }*/
                        }

                        onClicked:
                        {
                            let index = listView.currentIndex
                            let username = userModel.data(userModel.index(index, 0), Main.UserRoles.NameRole)

                            if (username != null)
                            {
                                sddm.login(username, password.text, session.index)
                            }
                        }

                        KeyNavigation.backtab: password
                        KeyNavigation.tab:
                        {
                            if (switchuser.enabled)
                            {
                                return switchuser
                            }
                            else
                            {
                                return accessbutton
                            }
                        }

                        KeyNavigation.down:
                        {
                            if (switchuser.enabled)
                            {
                                return switchuser
                            }
                            else
                            {
                                return accessbutton
                            }
                        }
                    }
                }
                QQC2.Button
            {
                id: switchuser

                anchors.horizontalCenter: parent.horizontalCenter
                anchors.top: userpic.bottom
                anchors.topMargin: 124
                //anchors.bottom: parent.bottom

                //anchors.bottomMargin: 332

                width: 108
                height: 28

                background: Image
                {
                    source:
                    {
                        if (switchuser.pressed) return "Assets/switch-user-button-active.png"
                        if (switchuser.hovered && switchuser.focus) return "Assets/switch-user-button-hover-focus.png"
                        if (switchuser.hovered && !switchuser.focus) return "Assets/switch-user-button-hover.png"
                        if (!switchuser.hovered && switchuser.focus) return "Assets/switch-user-button-focus.png"
                        return "Assets/switch-user-button.png"
                    }
                }

                contentItem: Text
                {
                    text: "Switch User"
                    color: "white"

                    //font.family: mainfont.name
                    font.pointSize: 11
                    font.kerning: false
                    renderType: Text.NativeRendering
                    font.hintingPreference: Font.PreferFullHinting


                    horizontalAlignment : Text.AlignHCenter
                    verticalAlignment : Text.AlignVCenter

                    bottomPadding: 3
                }

                KeyNavigation.backtab: password
                KeyNavigation.up: password
                KeyNavigation.tab: accessbutton
                KeyNavigation.down: accessbutton

                onClicked:
                {
                    password.text = ""
                    pages.currentIndex = Main.LoginPage.SelectUser
                }

                Keys.onReturnPressed:
                {
                    clicked()
                    event.accepted = true
                }
            }
            }


        }


        Item
        {
            id: loginfailedpage

            Keys.onEscapePressed:
            {
                pages.currentIndex = Main.LoginPage.Login
            }

            Image
            {
                id: currentMessageIcon

                anchors.right: currentMessage.left
                anchors.verticalCenter: currentMessage.verticalCenter

                anchors.verticalCenterOffset: -2
                anchors.rightMargin: 11

                source: "Assets/dialog-error.png"
                width: 32
                height: 32

                focus: false

                smooth: false
            }

            QQC2.Label
            {
                id: currentMessage

                anchors.verticalCenter: parent.verticalCenter
                anchors.horizontalCenter: parent.horizontalCenter

                anchors.verticalCenterOffset: 126
                anchors.horizontalCenterOffset: 14

                text: "The user name or password is incorrect."
                Layout.alignment: Qt.AlignHCenter
                font.pointSize: 9

                focus: false

                width: implicitWidth
                color: "white"
                horizontalAlignment: Text.AlignCenter
                layer.enabled: true
                layer.effect: DropShadow {
                    horizontalOffset: 0
                    verticalOffset: 1
                    radius: 6
                    samples: 14
                    spread: 0.0001
                    color: "#bf000000"
                }
            }

            QQC2.Button
            {
                id: dismissButton

                anchors.top: currentMessage.bottom
                anchors.horizontalCenter: parent.horizontalCenter

                anchors.topMargin: 46

                width: 93
                height: 28

                background: Image
                {
                    source:
                    {
                        if (dismissButton.pressed) return "Assets/button-active.png"
                        if (dismissButton.hovered && dismissButton.focus) return "Assets/button-hover-focus.png"
                        if (dismissButton.hovered && !dismissButton.focus) return "Assets/button-hover.png"
                        if (!dismissButton.hovered && dismissButton.focus) return "Assets/button-focus.png"
                        return "Assets/button.png"
                    }
                }

                contentItem: Text
                {
                    text: "OK"
                    color: "white"

                    //font.family: mainfont.name
                    font.pointSize: 11

                    horizontalAlignment : Text.AlignHCenter
                    verticalAlignment : Text.AlignVCenter

                    bottomPadding: 3
                    rightPadding: 1
                }

                onClicked:
                {
                    pages.currentIndex = Main.LoginPage.Login
                }

                Keys.onReturnPressed:
                {
                    clicked()
                    event.accepted = true
                }
            }
        }
    }

    Image
    {
        id: branding
        anchors.bottom: parent.bottom
        anchors.bottomMargin: 23
        anchors.horizontalCenter: parent.horizontalCenter
        source: "Assets/branding-white.png"
    }
    SMOD.GenericButton {
            id: switchLayoutButton
            anchors {
                top: parent.top
                topMargin: 5
                left: parent.left
                leftMargin: 7
            }
            implicitWidth: 35
            implicitHeight: 28
            label.font.pointSize: 9
            label.font.capitalization: Font.AllUppercase
            //focusPolicy: Qt.TabFocus
            Accessible.description: i18ndc("plasma_lookandfeel_org.kde.lookandfeel", "Button to change keyboard layout", "Switch layout")
            KeyNavigation.backtab: rebootButton
            KeyNavigation.tab: pages.currentIndex === Main.LoginPage.SelectUser ? listView : password
            KeyNavigation.down: pages.currentIndex === Main.LoginPage.SelectUser ? listView : password
            PW.KeyboardLayoutSwitcher {
                id: keyboardLayoutSwitcher

                anchors.fill: parent
                acceptedButtons: Qt.NoButton
            }

            text: keyboardLayoutSwitcher.layoutNames.shortName
            onClicked: keyboardLayoutSwitcher.keyboardLayout.switchToNextLayout()

            visible: keyboardLayoutSwitcher.hasMultipleKeyboardLayouts
        }
    QQC2.CheckBox
    {
        id: accessbutton

        anchors.bottom: parent.bottom
        anchors.left: parent.left
        anchors.bottomMargin: 34
        anchors.leftMargin: 34

        width: 38
        height: 28

        visible: pages.currentIndex != Main.LoginPage.LoginFailed

        indicator.width: 0
        indicator.height: 0

        background: Image
        {
            source:
            {
                if (accessbutton.pressed) return "Assets/access-button-active.png"
                if (accessbutton.hovered && accessbutton.focus) return "Assets/access-button-hover-focus.png"
                if (accessbutton.hovered && !accessbutton.focus) return "Assets/access-button-hover.png"
                if (!accessbutton.hovered && accessbutton.focus) return "Assets/access-button-focus.png"
                return "Assets/access-button.png"
            }
        }

        contentItem: Item
        {
            anchors.centerIn: parent

            width: 24
            height: 24

            Image
            {
                anchors.centerIn: parent
                width: 24
                height: 24
                source: "Assets/12213.png"
                smooth: false
            }
        }

        onClicked:
        {
            session.visible = !session.visible
            session.enabled = session.visible
        }

        Keys.onReturnPressed:
        {
            clicked()
            event.accepted = true
        }

        KeyNavigation.backtab:
        {
            if (pages.currentIndex === Main.LoginPage.SelectUser)
            {
                return listView
            }
            else if (switchuser.enabled)
            {
                return switchuser
            }

            return password
        }

        KeyNavigation.up:
        {
            if (pages.currentIndex === Main.LoginPage.Login && switchuser.enabled)
            {
                return switchuser
            }

            return accessbutton
        }

        KeyNavigation.tab: shutdownButton
        KeyNavigation.right: shutdownButton
        Item
    {
        anchors.bottom: parent.top
        anchors.left: parent.left
        //anchors.bottom: parent.bottom
        anchors.bottomMargin: -32
        //anchors.leftMargin: 94

        visible: pages.currentIndex != Main.LoginPage.LoginFailed
        enabled: visible

        width: 128
        height: 64

        // SMOD.ComboBox is a copy of SddmComponents.ComboBox
        // with the only change being the cursor shape
        // because there is no public API to change it
        SMOD.ComboBox
        {
            id: session

            width: parent.width
            height: 24

            visible: false
            enabled: false

            font.pixelSize: 10
            //font.family: mainfont.name

            model: sessionModel
            index: sessionModel.lastIndex
            borderColor: "#0c191c"
            color: "#eaeaec"
            menuColor : "#f4f4f8"
            textColor : "#323232"
            hoverColor : "#36a1d3"
            focusColor : "#36a1d3"
        }
    }
    }



    Item
    {
        anchors.bottom: parent.bottom
        anchors.right: parent.right
        anchors.bottomMargin: 34
        anchors.rightMargin: 30

        visible: pages.currentIndex != Main.LoginPage.LoginFailed

        width: 62
        height: 28

        QQC2.Button
        {
            id: shutdownButton

            anchors.bottom: parent.bottom
            anchors.left: parent.left

            width: 38
            height: 28

            background: Image
            {
                source:
                {
                    if (shutdownButton.pressed) return "Assets/power-active.png"
                    if (shutdownButton.hovered && shutdownButton.focus) return "Assets/power-hover-focus.png"
                    if (shutdownButton.hovered && !shutdownButton.focus) return "Assets/power-hover.png"
                    if (!shutdownButton.hovered && shutdownButton.focus) return "Assets/power-focus.png"
                    return "Assets/power.png"
                }
            }

            contentItem: Item
            {
                anchors.centerIn: parent

                width: 24
                height: 24

                Image
                {
                    anchors.centerIn: parent
                    width: 24
                    height: 24
                    source: "Assets/power-glyph.png"
                    smooth: false
                }
            }

            onClicked : sddm.powerOff()

            Keys.onReturnPressed:
            {
                clicked()
                event.accepted = true
            }

            KeyNavigation.backtab: accessbutton
            KeyNavigation.left: accessbutton
            KeyNavigation.tab: rebootButton
            KeyNavigation.right: rebootButton
            KeyNavigation.up:
            {
                if (pages.currentIndex === Main.LoginPage.Login && switchuser.enabled)
                {
                    return switchuser
                }

                return shutdownButton
            }

            QQC2.ToolTip.visible: hovered
            QQC2.ToolTip.delay: Qt.styleHints.mousePressAndHoldInterval
            QQC2.ToolTip.text: qsTr("Shut down")
        }

        QQC2.Button
        {
            id: rebootButton

            anchors.bottom: parent.bottom
            anchors.left: shutdownButton.right

            width: 20
            height: 28

            background: Image
            {
                source:
                {
                    if (rebootButton.pressed) return "Assets/12301.png"
                    if (rebootButton.hovered && rebootButton.focus) return "Assets/12298.png"
                    if (rebootButton.hovered && !rebootButton.focus) return "Assets/12300.png"
                    if (!rebootButton.hovered && rebootButton.focus) return "Assets/12299.png"
                    return "Assets/12302.png"
                }
            }

            contentItem: Item
            {
                anchors.centerIn: parent

                width: 9
                height: 6

                Image
                {
                    anchors.centerIn: parent
                    width: 9
                    height: 6
                    source: "Assets/power-glyph-arrow.png"
                    smooth: false
                }
            }

            onClicked: sddm.reboot()

            Keys.onReturnPressed:
            {
                clicked()
                event.accepted = true
            }

            KeyNavigation.backtab: shutdownButton
            KeyNavigation.left: shutdownButton
            KeyNavigation.up:
            {
                if (pages.currentIndex === Main.LoginPage.Login && switchuser.enabled)
                {
                    return switchuser
                }

                return rebootButton
            }

            KeyNavigation.tab: switchLayoutButton
        }
    }
}
