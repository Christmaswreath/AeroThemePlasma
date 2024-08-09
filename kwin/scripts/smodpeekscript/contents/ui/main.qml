// Qt
import QtCore
import QtQuick 2.15
import QtQuick.Layouts 1.15
import QtQuick.Window 2.15
import Qt5Compat.GraphicalEffects

// KDE

import org.kde.kwin as KWin
import org.kde.kwin.private.effects 1.0
import org.kde.kwindowsystem 1.0
import org.kde.plasma.core 2.0 as PlasmaCore
import org.kde.plasma.extras 2.0 as PlasmaExtras
import org.kde.kirigami as Kirigami
import org.kde.ksvg as KSvg

Item
{
    //property bool inEditMode: Plasmoid.containment.corona.editMode;
    property bool showingDesktop: KWindowSystem.showingDesktop //false
    property real peekOpacity: showingDesktop ? 1 : 0
    property bool instantiatorActive: true
    property bool delayActive: false

    x:      0
    y:      0
    width:  Screen.width
    height: Screen.height

    Behavior on peekOpacity
    {
        NumberAnimation { duration: 150; easing.type: Easing.Linear; }
    }

    Timer {
        id: timer
        interval: 20
        onTriggered: {
            delayActive = showingDesktop;
        }
    }
    onShowingDesktopChanged: {
        if(showingDesktop) delayActive = true;
        else timer.start();
    }

    KWin.WindowFilterModel {
        id: windowmodel
        activity: KWin.Workspace.currentActivity
        desktop: KWin.Workspace.currentDesktop
        windowModel: KWin.WindowModel {}
        minimizedWindows: false
        windowType: ~KWin.WindowFilterModel.Dock &
        ~KWin.WindowFilterModel.Desktop &
        ~KWin.WindowFilterModel.Notification &
        ~KWin.WindowFilterModel.CriticalNotification
    }

    // Hack that ignores windows that are present in edit mode
    function ignoreWindow(w) {
        return !((w.resourceClass == "plasmashell" && w.skipTaskbar && w.caption == "plasmashell") ||
                 (w.resourceClass == "plasmashell") && w.dialog && !w.normalWindow && w.caption == "plasmashell" && w.modal && w.desktopFileName == "org.kde.plasmashell" && w.transient)
    }

    Instantiator
    {
        active: true
        asynchronous: true
        model: 1

        delegate: Window
        {
            flags: Qt.BypassWindowManagerHint | Qt.FramelessWindowHint | Qt.WindowTransparentForInput
            color: "transparent"
            x:       0
            y:       0
            width:   Screen.width
            height:  Screen.height
            visible: delayActive
            opacity: peekOpacity

            title: "aeropeek-aerothemeplasma"
            // Setup reflection
            Image
            {
                id: reflection
                x:            0
                y:            0
                width:        Screen.width
                height:       Screen.height
                source:       StandardPaths.writableLocation(StandardPaths.GenericDataLocation) + "/smod/reflections.png" //"~/.local/share/smod/reflections.png"
                sourceSize:   Qt.size(width, height)
                smooth:       true
                visible:      false
            }

            // Setup mask
            Item
            {
                id: mask
                anchors.fill: reflection
                visible: true
                opacity: 0.01

                // Paint over all window geometry
                Repeater
                {
                    model: windowmodel
                    delegate: Rectangle
                    {
                        x:      model.window.x
                        y:      model.window.y
                        width:  model.window.width
                        height: model.window.height
                        color: "black"
                        radius: 6
                        visible: {

                            //if(!model.window.minimized) console.log(JSON.stringify(model.window));
                            return !model.window.minimized && model.window.managed && ignoreWindow(model.window)
                        }

                        //visible: { if(!model.window.minimized && model.window.caption !== "") console.log(model.window.stackingOrder + " " + model.window.active + " " + model.window.caption); return !model.window.minimized && model.window.managed; }
                        //visible: { if(!model.window.minimized && model.window.caption !== "") console.log(JSON.stringify(model.window)); return !model.window.minimized && model.window.managed }
                    }
                }
            }

            // Paint reflection
            OpacityMask
            {
                anchors.fill: reflection
                source:       reflection
                maskSource:   mask
            }


            // Paint frames
            Repeater
            {
                model: windowmodel
                delegate: Item
                {
                    id: peekwindow

                    // Assume the topmost window is the active window
                    property bool clientActive: model.window.stackingOrder == windowmodel.rowCount() - 1
                    // Assume window is maximized under these conditions
                    property bool clientMaximized: model.window.x == 0 && model.window.y == 0 && model.window.width == Screen.width && model.window.height >= Screen.height / 2

                    anchors.fill: parent
                    visible: !model.window.minimized && !clientMaximized && model.window.managed && ignoreWindow(model.window)
                    //&& !(model.window.dialog && !model.window.normalWindow && model.window.resourceClass == "plasmashell" && model.window.caption == "plasmashell <2>‎")
                    z: model.window.stackingOrder

                    Item {
                        id: glowCorners
                        anchors.fill: frame
                        Image
                        {
                            anchors.top: parent.top
                            anchors.left: parent.left
                            source:       StandardPaths.writableLocation(StandardPaths.GenericDataLocation) + "/smod/" + (peekwindow.clientActive ? "framecornereffect.png" : "framecornereffect-unfocus.png")
                            smooth:       true
                        }

                        Image
                        {
                            anchors.top: parent.top
                            anchors.right: parent.right
                            source:       StandardPaths.writableLocation(StandardPaths.GenericDataLocation) + "/smod/" + (peekwindow.clientActive ? "framecornereffect.png" : "framecornereffect-unfocus.png")
                            smooth:       true
                            mirror:       true
                        }

                        layer.enabled: true
                        layer.effect: OpacityMask {
                            maskSource: Rectangle {
                                x:      frame.x
                                y:      frame.y
                                width:  frame.width
                                height: frame.height
                                radius: 6
                            }
                        }
                    }

                    KSvg.FrameSvgItem
                    {
                        id: frameshadow

                        property int actualMarginLeft:   frameshadow.margins.left   - 16
                        property int actualMarginRight:  frameshadow.margins.right  - 9
                        property int actualMarginTop:    frameshadow.margins.top    - 17
                        property int actualMarginBottom: frameshadow.margins.bottom - 17

                        imagePath:      Qt.resolvedUrl("res/peek-frame.svgz")
                        prefix:         peekwindow.clientActive ? "shadow" : "shadowunfocus"

                        x:      frame.x      - frameshadow.actualMarginLeft
                        y:      frame.y      - frameshadow.actualMarginTop
                        width:  frame.width  + frameshadow.actualMarginLeft + frameshadow.actualMarginRight
                        height: frame.height + frameshadow.actualMarginTop  + frameshadow.actualMarginBottom
                    }

                    KSvg.FrameSvgItem
                    {
                        id: frame

                        imagePath:      Qt.resolvedUrl("res/peek-frame.svgz")
                        prefix:         peekwindow.clientActive ? "" : "unfocus"

                        x:      model.window.x
                        y:      model.window.y
                        width:  model.window.width
                        height: model.window.height
                    }


                }
            }
        }
    }
}