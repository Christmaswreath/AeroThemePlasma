/*
    Copyright (C) 2011  Martin Gräßlin <mgraesslin@kde.org>
    Copyright (C) 2012  Gregor Taetzner <gregor@freenet.de>
    Copyright 2014 Sebastian Kügler <sebas@kde.org>
    Copyright (C) 2015-2018  Eike Hein <hein@kde.org>

    This program is free software; you can redistribute it and/or modify
    it under the terms of the GNU General Public License as published by
    the Free Software Foundation; either version 2 of the License, or
    (at your option) any later version.

    This program is distributed in the hope that it will be useful,
    but WITHOUT ANY WARRANTY; without even the implied warranty of
    MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
    GNU General Public License for more details.

    You should have received a copy of the GNU General Public License along
    with this program; if not, write to the Free Software Foundation, Inc.,
    51 Franklin Street, Fifth Floor, Boston, MA 02110-1301 USA.
*/
import org.kde.plasma.plasmoid
import QtQuick 2.0
import org.kde.plasma.core 2.0 as PlasmaCore
import org.kde.plasma.extras 2.0 as PlasmaExtras
import org.kde.plasma.components as PlasmaComponents

import org.kde.kirigami as Kirigami

Item {
    id: appViewContainer

    objectName: "ApplicationsView"

    property ListView listView: applicationsView.listView
    property alias currentIndex: applicationsView.currentIndex
    property alias count: applicationsView.count

    function decrementCurrentIndex() {
        var tempIndex = applicationsView.currentIndex-1;
        if(tempIndex < (crumbModel.count == 0 ? 1 : 0)) {
            //applicationsView.currentIndex = applicationsView.count-1;
            return;
        }
        applicationsView.decrementCurrentIndex();
    }

    function incrementCurrentIndex() {
        var tempIndex = applicationsView.currentIndex+1;
        if(tempIndex >= applicationsView.count) {
            applicationsView.currentIndex = -1;
            root.m_showAllButton.focus = true;
            return;
        }
        applicationsView.incrementCurrentIndex();
    }

    function activateCurrentIndex(start) {
        if (!applicationsView.currentItem.modelChildren) {
            if (!start) {
                return;
            }
        }
        applicationsView.state = "OutgoingLeft";
    }

    function openContextMenu() {
        applicationsView.currentItem.openActionMenu();
    }

    function deactivateCurrentIndex() {
        if (crumbModel.count > 0) { // this is not the case when switching from the "Applications" to the "Favorites" tab using the "Left" key
            breadcrumbsElement.children[crumbModel.count-1].clickCrumb();
            applicationsView.state = "OutgoingRight";
            return true;
        }
        return false;
    }

    onFocusChanged: {
        if(focus)
            applicationsView.currentIndex = crumbModel.count == 0 ? 1 : 0;
        else applicationsView.currentIndex = -1;
    }

    Keys.onPressed: {
        if(event.key == Qt.Key_Up) {
            decrementCurrentIndex();
        } else if(event.key == Qt.Key_Down) {
            incrementCurrentIndex();
        } else if(event.key == Qt.Key_Return || event.key == Qt.Key_Right) {
            activateCurrentIndex(applicationsView.currentIndex);
        } else if(event.key == Qt.Key_Menu) {
            openContextMenu();
        } else if(event.key == Qt.Key_Left || event.key == Qt.Key_Backspace) {
            deactivateCurrentIndex();
        }
    }
    KeyNavigation.tab: root.m_showAllButton
    function reset() {
        applicationsView.model = rootModel;
        applicationsView.clearBreadcrumbs();
        //root.resetRecents();
    }

    function refreshed() {
        reset();
        updatedLabelTimer.running = true;
    }

    Connections {
        target: kicker
        function onExpandedChanged() {
            
            if (!plasmoid.expanded) {
                reset();
            }
        }
    }
    
    Item {
        id: crumbContainer

        anchors {
            top: parent.top
            left: parent.left
            right: parent.right
        }
        height: childrenRect.height
        visible: false
        opacity: crumbModel.count > 0
        Behavior on opacity { NumberAnimation { duration: Kirigami.Units.longDuration } }

        Flickable {
            id: breadcrumbFlickable
            anchors {
                top: parent.top
                left: parent.left
                right: parent.right
            }
            height: breadcrumbsElement.height
            boundsBehavior: Flickable.StopAtBounds

            contentWidth: breadcrumbsElement.width
            pixelAligned: true
            //contentX: contentWidth - width

            // HACK: Align the content to right for RTL locales
            leftMargin: LayoutMirroring.enabled ? Math.max(0, width - contentWidth) : 0

            ButtonRow {
                id: breadcrumbsElement

                exclusive: false

                Breadcrumb {
                    id: rootBreadcrumb
                    root: true
                    text: i18n("Back")
                    depth: 0
                }
                Repeater {
                    model: ListModel {
                        id: crumbModel
                        // Array of the models
                        property var models: []
                    }

                    Breadcrumb {
                        root: false
                        text: model.text
                        visible: false
                    }
                }
                onWidthChanged: {
                    if (LayoutMirroring.enabled) {
                        breadcrumbFlickable.contentX = -Math.max(0, breadcrumbsElement.width - breadcrumbFlickable.width)
                    } else {
                        breadcrumbFlickable.contentX = Math.max(0, breadcrumbsElement.width - breadcrumbFlickable.width)
                    }
                }
            }
             
        }  
        Rectangle {
       		id: sepLine
	   		anchors {
       			top: breadcrumbFlickable.bottom
                topMargin: -1
       			left: breadcrumbFlickable.left
       			leftMargin: Kirigami.Units.smallSpacing*2
       			right: breadcrumbFlickable.right
       			rightMargin: Kirigami.Units.smallSpacing*2
	   		}
       		height: 1
       		color: "#d6e5f5"
       		opacity: 1
       		z: 6
        }
    } // crumbContainer

    KickoffListView {
        id: applicationsView

        anchors {
            top: (crumbContainer.visible && crumbContainer.opacity) ? crumbContainer.bottom : parent.top
            topMargin: Kirigami.Units.smallSpacing/ (crumbContainer.visible ? 2 : 1) + 1
            bottom: parent.bottom
            rightMargin: -Kirigami.Units.gridUnit
            leftMargin: -Kirigami.Units.gridUnit
        }

		width: parent.width
		small: true

        property Item activatedItem: null
        property var newModel: null

        Behavior on opacity { NumberAnimation { duration: Kirigami.Units.longDuration } }

        focus: true

        appView: true

        model: rootModel

        function moveLeft() {
            state = "";
            // newModelIndex set by clicked breadcrumb
            var oldModel = applicationsView.model;
            applicationsView.model = applicationsView.newModel;

            var oldModelIndex = model.rowForModel(oldModel);
            listView.currentIndex = oldModelIndex;
            listView.positionViewAtIndex(oldModelIndex, ListView.Center);
            crumbContainer.visible = false;
        }

        function moveRight() {
            state = "";
            activatedItem.activate();
            applicationsView.listView.positionViewAtBeginning();
            crumbContainer.visible = true;
            //root.visible = false;
        }

        function clearBreadcrumbs() {
            crumbModel.clear();
            crumbModel.models = [];
            applicationsView.listView.currentIndex = -1;
        }

        onReset: appViewContainer.reset()

        onAddBreadcrumb: {
            crumbModel.append({"text": title, "depth": crumbModel.count+1})
            crumbModel.models.push(model);
        }

        states: [
            State {
                name: "OutgoingLeft"
                PropertyChanges {
                    target: applicationsView
                    x: -parent.width
                    opacity: 0.0
                }
            },
            State {
                name: "OutgoingRight"
                PropertyChanges {
                    target: applicationsView
                    x: parent.width
                    opacity: 0.0
                }
            }
        ]

        transitions:  [
            Transition {
                to: "OutgoingLeft"
                SequentialAnimation {
                    // We need to cache the currentItem since the selection can move during animation,
                    // and we want the item that has been clicked on, not the one that is under the
                    // mouse once the animation is done
                    ScriptAction { script: applicationsView.activatedItem = applicationsView.currentItem }
                    NumberAnimation { properties: "opacity"; easing.type: Easing.InQuad; duration: 100 }
                    ScriptAction { script: {  applicationsView.moveRight(); } }
                }
            },
            Transition {
                to: "OutgoingRight"
                SequentialAnimation {
                    NumberAnimation { properties: "opacity"; easing.type: Easing.InQuad; duration: 100 }
                    ScriptAction { script: applicationsView.moveLeft() }
                }
            }
        ]
        Component.onCompleted: {
            applicationsView.listView.currentIndex = -1;
        }
    }

    MouseArea {
        anchors.fill: parent

        acceptedButtons: Qt.BackButton

        onClicked: {
            deactivateCurrentIndex()
        }
    }

    Timer {
        id: updatedLabelTimer
        interval: 1500
        running: false
        repeat: true

        onRunningChanged: {
            if (running) {
                updatedLabel.opacity = 1;
                crumbContainer.opacity = 0.3;
                applicationsView.scrollArea.opacity = 0.3;
            }
        }
        onTriggered: {
            updatedLabel.opacity = 0;
            crumbContainer.opacity = 1;
            applicationsView.scrollArea.opacity = 1;
            running = false;
        }
    }

    PlasmaComponents.Label {
        id: updatedLabel
        text: i18n("Applications updated.")
        opacity: 0
        visible: opacity != 0
        anchors.centerIn: parent

        Behavior on opacity { NumberAnimation { duration: Kirigami.Units.shortDuration } }
    }

    Component.onCompleted: {
        rootModel.cleared.connect(refreshed);
        
        
    }

} // appViewContainer
