/***************************************************************************
 *   Copyright (C) 2014 by Weng Xuetian <wengxt@gmail.com>
 *   Copyright (C) 2013-2017 by Eike Hein <hein@kde.org>                   *
 *                                                                         *
 *   This program is free software; you can redistribute it and/or modify  *
 *   it under the terms of the GNU General Public License as published by  *
 *   the Free Software Foundation; either version 2 of the License, or     *
 *   (at your option) any later version.                                   *
 *                                                                         *
 *   This program is distributed in the hope that it will be useful,       *
 *   but WITHOUT ANY WARRANTY; without even the implied warranty of        *
 *   MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the         *
 *   GNU General Public License for more details.                          *
 *                                                                         *
 *   You should have received a copy of the GNU General Public License     *
 *   along with this program; if not, write to the                         *
 *   Free Software Foundation, Inc.,                                       *
 *   51 Franklin Street, Fifth Floor, Boston, MA  02110-1301  USA .        *
 ***************************************************************************/

import QtQuick
import QtQuick.Layouts
import QtQuick.Dialogs
import QtQuick.Window
import QtCore

import org.kde.plasma.plasmoid
import org.kde.plasma.core as PlasmaCore
import org.kde.plasma.extras as PlasmaExtras

import org.kde.plasma.private.kicker as Kicker
import org.kde.coreaddons 1.0 as KCoreAddons // kuser
import org.kde.kitemmodels as KItemModels

import org.kde.kwindowsystem 1.0
import org.kde.kquickcontrolsaddons 2.0
import org.kde.plasma.private.quicklaunch 1.0

import org.kde.kirigami 2.13 as Kirigami
import org.kde.kquickcontrolsaddons 2.0 as KQuickAddons

import org.kde.ksvg as KSvg
import org.kde.plasma.plasma5support as Plasma5Support
import org.kde.kirigami as Kirigami

PlasmaCore.Dialog {
    id: root
    objectName: "popupWindow"
    location: "Floating" // To make the panel display all 4 borders, the panel will be positioned at a corner.
    flags: Qt.WindowStaysOnTopHint //| Qt.Popup // Set to popup so that it is still considered a plasmoid popup, despite being a floating dialog window.
	hideOnWindowDeactivate: true
    
    //backgroundHints: PlasmaCore.Types.NoBackground

    property int iconSize: Kirigami.Units.iconSizes.medium
    property int iconSizeSide: Kirigami.Units.iconSizes.smallMedium
    property int cellWidth: 253 // Width for all standard menu items.
    property int cellWidthSide: 138 // Width for sidebar menu items.
    property int cellHeight: iconSize + Kirigami.Units.smallSpacing + (Math.max(highlightItemSvg.margins.top + highlightItemSvg.margins.bottom,
                                                    				   highlightItemSvg.margins.left + highlightItemSvg.margins.right)) - Kirigami.Units.smallSpacing/2
    property bool searching: (searchField.text != "")
    property bool showingAllPrograms: false
    property bool firstTimePopup: false // To make sure the user icon is displayed properly.

    property int slideAnimationDuration: 105

	property color leftPanelBackgroundColor: "white"
	property color leftPanelBorderColor: "#44000000"
	property color leftPanelSeparatorColor: "#d6e5f5"
	property color searchPanelSeparatorColor: "#cddbea"
	property color searchPanelBackgroundColor: "#f3f7fb"

	property color searchFieldBackgroundColor: "white"
	property color searchFieldTextColor: "black"
	property color searchFieldPlaceholderColor: "#707070"

	property color shutdownTextColor: "#202020"

	// A bunch of references for easier access by child QML elements.
	property alias m_recents: recents
	property alias m_faves: faves
	property alias m_showAllButton: allButtonsArea
	property alias m_shutDownButton: shutdown
	property alias m_lockButton: lockma
	property alias m_searchField: searchField
	property alias m_delayTimer: delayTimer

	function setFloatingAvatarPosition()  {
		// It's at this point where everything actually gets properly initialized and we don't have to worry about
		// random unpredictable values, so we can safely allow the popup icon to show up.
		iconUser.x = root.x + sidePanel.x+sidePanel.width/2-Kirigami.Units.iconSizes.huge/2 + Kirigami.Units.smallSpacing*2;
		iconUser.y = root.y-Kirigami.Units.iconSizes.huge/2 + Kirigami.Units.smallSpacing;
		firstTimePopup = true;
	}

    onVisibleChanged: {
        var pos = popupPosition(width, height); // Calculates the position of the floating dialog window.
        x = pos.x;
        y = pos.y;
        if (!visible) {
            reset();
        } else {
            requestActivate();
			searchField.forceActiveFocus();
			if(!firstTimePopup) setFloatingAvatarPosition();
        }
		resetRecents(); // Resets the recents model to prevent errors and crashes.
    }
    onHeightChanged: {
        var pos = popupPosition(width, height);
        x = pos.x;
        y = pos.y;
		setFloatingAvatarPosition();
    }

    onWidthChanged: {
        var pos = popupPosition(width, height);
        x = pos.x;
        y = pos.y;
    }

    onSearchingChanged: {
        if (!searching) {
			reset();
        }
    }
    
    function selectItem(itemIndex) {
		//Stub
    }

    function resetRecents() {
        recents.model.sourceModel = rootModel.modelForRow(0);
        recents.model.sourceModel.refresh();
        recents.currentIndex = -1;
    }
    function reset() {
        searchField.text = "";
		compositingIcon.iconSource = "";
		nonCompositingIcon.iconSource = "";
		searchField.forceActiveFocus();
		
    }
	
	//The position calculated is always at a corner.
    function popupPosition(width, height) {
        var screenAvail = kicker.availableScreenRect;
        var screen = kicker.screenGeometry;

        var offset = 0;
        // Fall back to bottom-left of screen area when the applet is on the desktop or floating.
        var x = offset;
        var y = screen.height - height - offset;
        var horizMidPoint = screen.x + (screen.width / 2);
        var vertMidPoint = screen.y + (screen.height / 2);
        var appletTopLeft = kicker.mapToGlobal(0, 0);
        var appletBottomLeft = kicker.mapToGlobal(0, kicker.height);

        x = (appletTopLeft.x < horizMidPoint) ? screen.x : (screen.x + screen.width) - width;
        
        if (appletTopLeft.x < horizMidPoint) {
        	x += offset
        } else if (appletTopLeft.x + width > horizMidPoint){
        	x -= offset
        }

        if (Plasmoid.location == PlasmaCore.Types.TopEdge) {
        	/*this is floatingAvatar.width*/
        	offset = 2;
        	y = screen.y + parent.height + panelSvg.margins.bottom + offset;
        } else {
          	y = screen.y + screen.height - parent.height - height - offset;
        }

        return Qt.point(x, y);
    }
    function raiseOrb() {
		orb.raise();
	}

    FocusScope {
		id: mainFocusScope
		objectName: "MainFocusScope"
        Layout.minimumWidth: Math.max(397, root.cellWidth + Kirigami.Units.mediumSpacing + columnItems.width)
		Layout.maximumWidth: Math.max(397, root.cellWidth + Kirigami.Units.mediumSpacing + columnItems.width)
		//Layout.preferredWidth: Layout.maximumWidth

		property int mainPanelHeight: ((root.cellHeight+Kirigami.Units.smallSpacing/2) * (Plasmoid.configuration.numberRows-1)) + searchBackground.height + (allButtonsArea.height) + (Kirigami.Units.smallSpacing * (15 - Plasmoid.configuration.numberRows)) + Kirigami.Units.smallSpacing - (Plasmoid.configuration.showRecentsView ? 0 : Kirigami.Units.smallSpacing*2)
		property int sidePanelHeight: backgroundBorderLine.height + searchBackground.height + columnItems.height + (compositingEnabled ? Kirigami.Units.iconSizes.huge / 2 + Kirigami.Units.smallSpacing : nonCompositingIcon.height + Kirigami.Units.smallSpacing);
		property bool sidePanelOverflow: mainPanelHeight <= sidePanel; 

        Layout.minimumHeight: Math.max(mainPanelHeight, sidePanelHeight) + Kirigami.Units.smallSpacing/2
        Layout.maximumHeight: Math.max(mainPanelHeight, sidePanelHeight) + Kirigami.Units.smallSpacing/2
        
        focus: true
		clip: false

        KCoreAddons.KUser {   id: kuser  }  // Used for getting the username and icon.
        Logic {   id: logic }				// Probably useful.
        
        /*
		 * The user icon is supposed to stick out of the start menu, so a separate dialog window
		 * is required to pull that effect off. Inspiration taken from SnoutBug's MMcK launcher,
		 * however with some minor adjustments and improvements.
		 *
		 * The flag Qt.X11BypassWindowManagerHint is used to prevent the dialog from animating its
		 * opacity when its visibility is changed directly, and Qt.Popup is used to ensure that it's
		 * above the parent dialog window.
		 *
		 * Setting the location to "Floating" means that we can use manual positioning for the dialog
		 * which is important as positioning a dialog like this is tricky at best and unpredictable
		 * at worst. Positioning of this dialog window can only be done reliably when:
		 *
		 * 1. The parent dialog window is visible, this ensures that the positioning of the window
		 * 	  is actually initialized and not simply declared.
		 * 2. The width and height of the parent dialog window are properly initialized as well.
		 *
		 * This is why the position of this window is determined on the onHeightChanged slot of the
		 * parent window, as by then both the position and size of the parent are well defined.
		 * It should be noted that the position values for any dialog window are gonna become
		 * properly initialized once the visibility of the window is enabled, at least from what
		 * I could figure out. Anything before that and the properties won't behave well.
		 *
		 * To comment on MMcK's implementation, this is likely why positioning of the floating
		 * avatar is so weird and unreliable. Using uninitialized values always leads to
		 * unpredictable behavior, which leads to positioning being all over the place.
		 *
		 * The firstTimePopup is used to make sure that the dialog window has its correct position
		 * values before it is made visible to the user.
		 */
		Item {
			PlasmaCore.Dialog {
        		id: iconUser
        		//flags: Qt.WindowStaysOnTopHint// | Qt.BypassWindowManagerHint  // To prevent the icon from animating its opacity when its visibility is changed
        		//type: "Notification" // So that we don't have to rely on this
				location: "Floating"

				type: "Notification"
				title: "seventasks-floatingavatar"
				x: 0
				y: 0
				backgroundHints: PlasmaCore.Types.NoBackground // To prevent the dialog background SVG from being rendered, we want a fully transparent window.
				//visualParent: root
				visible: root.visible && !searching && compositingEnabled
				opacity: iconUser.visible && firstTimePopup // To prevent even more NP-hard unpredictable behavior
				mainItem: FloatingIcon {
					id: compositingIcon
					visible: compositingEnabled
				}
        	}
		}
		Connections { 
			target: root 
			function onActiveFocusItemChanged() {
				if(root.activeFocusItem === null) {
					root.requestActivate();
				}
			}
		}
		Connections {
			target: kicker

			function onScreenGeometryChanged() {
				firstTimePopup = false;
			}
			function onScreenChanged() {
				firstTimePopup = false;
			}
		}
        Connections {
        target: Plasmoid.configuration
            function onNumberRowsChanged() {
                recents.model.sourceModel = rootModel.modelForRow(0);
				//recents.model = recentUsa
                recents.model.sourceModel.refresh();
            }
        }
        Plasma5Support.DataSource {
            id: pmEngine
            engine: "powermanagement"
            connectedSources: ["PowerDevil", "Sleep States"]
            function performOperation(what) {
                var service = serviceForSource("PowerDevil")
                var operation = service.operationDescription(what)
                service.startOperationCall(operation)
            }
        }

        Plasma5Support.DataSource {
            id: executable
            engine: "executable"
            connectedSources: []
            onNewData: {
                var exitCode = data["exit code"]
                var exitStatus = data["exit status"]
                var stdout = data["stdout"]
                var stderr = data["stderr"]
                exited(sourceName, exitCode, exitStatus, stdout, stderr)
                disconnectSource(sourceName)
            }
            function exec(cmd) {
                if (cmd) {
                    connectSource(cmd)
                }
            }
            signal exited(string cmd, int exitCode, int exitStatus, string stdout, string stderr)
        }

        PlasmaExtras.Highlight {
            id: delegateHighlight
            visible: false
            z: -1 // otherwise it shows ontop of the icon/label and tints them slightly
        }

        PlasmaExtras.Heading {
            id: dummyHeading
            visible: false
            width: 0
            level: 5
        }

        TextMetrics {
            id: headingMetrics
            font: dummyHeading.font
        }

        /*ActionMenu {
            id: actionMenu
            onActionClicked: visualParent.actionTriggered(actionId, actionArgument)
            onClosed: {
                //if (pageList.currentItem) {
                //    pageList.currentItem.itemGrid.currentIndex = -1;
                //}
            }
        }*/
        Kicker.SystemModel {
			id: systemModel
			favoritesModel: globalFavorites
		}
        component FilteredModel : KItemModels.KSortFilterProxyModel {
			sourceModel: systemModel

			function systemFavoritesContainsRow(sourceRow, sourceParent) {
				const FavoriteIdRole = sourceModel.KItemModels.KRoleNames.role("favoriteId");
				const favoriteId = sourceModel.data(sourceModel.index(sourceRow, 0, sourceParent), FavoriteIdRole);
				return String(Plasmoid.configuration.systemFavorites).includes(favoriteId);
			}

			function trigger(index) {
				const sourceIndex = mapToSource(this.index(index, 0));
				systemModel.trigger(sourceIndex.row, "", null);
			}

			Component.onCompleted: {
				Plasmoid.configuration.valueChanged.connect((key, value) => {
					if (key === "systemFavorites") {
						invalidateFilter();
					}
				});
			}
		}


		FilteredModel {
			id: filteredMenuItemsModel
			filterRowCallback: root.shouldCollapseButtons
			? null /*i.e. keep all rows*/
			: (sourceRow, sourceParent) => !systemFavoritesContainsRow(sourceRow, sourceParent)
		}

		Instantiator {
			model: filteredMenuItemsModel
			delegate: PlasmaExtras.MenuItem {
				required property int index
				required property var model

				text: "       " + model.display + "      "
				onClicked: filteredMenuItemsModel.trigger(index)
			}
			onObjectAdded: (index, object) => {
				if(object.model.decoration != "system-shutdown") {
					if(index == 3 || index == 5)
						var separator = Qt.createQmlObject(`
					import org.kde.plasma.extras as PlasmaExtras

					PlasmaExtras.MenuItem { separator: true }
					`, contextMenu);
					contextMenu.addMenuItem(object);
				}
			}
			onObjectRemoved: (index, object) => contextMenu.removeMenuItem(object)
		}

        PlasmaExtras.Menu {
			id: contextMenu
			visualParent: lockScreenDelegate //leaveButton
			//minimumWidth: 111
			placement: {
				//return PlasmaCore.Types.FloatingPopup
				switch (Plasmoid.location) {
					case PlasmaCore.Types.LeftEdge:
					case PlasmaCore.Types.RightEdge:
					case PlasmaCore.Types.TopEdge:
						return PlasmaExtras.Menu.BottomPosedRightAlignedPopup;
					case PlasmaCore.Types.BottomEdge:
					default:
						return PlasmaExtras.Menu.RightPosedBottomAlignedPopup;
				}
			}
		}

        Rectangle {
			id: backgroundGradient
			anchors.fill: parent
			anchors.topMargin: -root.margins.top+2
			anchors.leftMargin: -root.margins.left-1
			anchors.rightMargin: -root.margins.right-1
			anchors.bottomMargin: -root.margins.bottom+2
			gradient: Gradient {
				GradientStop { position: 0.0; color: "#11000000" }
				GradientStop { position: 0.333; color: "#99000000" }
				GradientStop { position: 0.666; color: "#99000000" }
				GradientStop { position: 1.0; color: "#11000000" }
			}
		}

		/*
		 * This rectangle acts as a background for the left panel of the start menu.
		 * The rectangle backgroundBorderLine is the border separating the search field
		 * and the rest of the panel, while the searchBackground rectangle is the background
		 * for the search field.
		 */
        KSvg.FrameSvgItem {
        	id: backgroundRect
        	anchors.top: faves.top
        	anchors.topMargin: -Kirigami.Units.smallSpacing
        	anchors.left: faves.left
        	imagePath: Qt.resolvedUrl("svgs/background.svg")

			width:  searching ? searchView.width : root.cellWidth
        	height: Math.max(mainFocusScope.mainPanelHeight, mainFocusScope.sidePanelHeight)

        	z: 5

        	CrossFadeBehavior on width {
				fadeDuration: 200
				easingType: "Linear"
			}
        	Rectangle {
        		id: backgroundBorderLine

        		//width: backgroundRect.width-2
        		height: Kirigami.Units.smallSpacing+1

        		gradient: Gradient {
					GradientStop { position: 0.0; color: "#ccd9ea" }
					GradientStop { position: 1.0; color: "#f0f4fa" }
				}

        	 	anchors { 
        	   		top: searchBackground.top
        	   		left: parent.left
        	   		right: parent.right
        	   		leftMargin: 2
        	   		rightMargin: 2 //+ (searching ? 1 : 0)
        		}
        		z: 5
        	}
        	Rectangle {
                id: searchBackground

                height: searchField.height + Kirigami.Units.smallSpacing * 4.5 - Kirigami.Units.smallSpacing/2

                color: searchPanelBackgroundColor
                radius: 3

                anchors { 
                    bottom: parent.bottom 
                    bottomMargin: 2
                    left: parent.left
                    right: parent.right
                    leftMargin: 2
                    rightMargin: 2 //+ (searching ? 1 : 0)
                }
            }
        }
		/* 
		 *  Displays bookmarked/favorite applications and is displayed at the top of the start menu.
		 *  The source code is taken directly from Kickoff without additional changes.
		 */
        FavoritesView {
            id: faves

			anchors {
            	left: parent.left
            	top: parent.top
            	topMargin: 5
            	leftMargin: 1
			}

            width: root.cellWidth
            height: (Plasmoid.configuration.showRecentsView ?
					(((root.cellHeight-2) * (faves.getFavoritesCount() > 9 ? 9 : faves.getFavoritesCount()))/* - Kirigami.Units.smallSpacing * 2*/) :
					((root.cellHeight-2) * (Plasmoid.configuration.numberRows+1) + Kirigami.Units.smallSpacing*2+1 - allProgramsButton.height*2 - allProgramsSeparator.height)) - Kirigami.Units.smallSpacing/2 

            visible: !showingAllPrograms && !searching
            z: 8
        }
		/* 
			This is the separator between favorite applications and recently used applications.
		*/
        Rectangle {
       		id: tabBarSeparator

			anchors {
				top: faves.bottom
				left: parent.left
				right: faves.right
				leftMargin: 11
				rightMargin: 7
				topMargin: Kirigami.Units.smallSpacing
			}
       		
       		height: 1
       		opacity: 1

       		color: leftPanelSeparatorColor
       		visible: Plasmoid.configuration.showRecentsView && (!showingAllPrograms && !searching)
        
       		z: 6
        }
		/*
			This is the view showing recently used applications. As soon as a program is executed and has a start menu
			entry (appears in KMenuEdit), it will be pushed at the beginning of the list. The source code is forked from
			Kickoff, featuring very minor changes. 
		*/
        OftenUsedView {
            id: recents

			anchors {
				top: tabBarSeparator.bottom
				topMargin: Kirigami.Units.smallSpacing
				//top: faves.bottom
				left: parent.left
				bottomMargin: Kirigami.Units.smallSpacing
           		bottom: allProgramsSeparator.top
				leftMargin: 1
				right: faves.right
			}

            //width: root.cellWidth-2
            //height: (root.cellHeight * Plasmoid.configuration.numberRows) - (root.cellHeight * (faves.getFavoritesCount() > 9 ? 9 : 
					//faves.getFavoritesCount())) - allProgramsButton.height * 2
					
            visible: Plasmoid.configuration.showRecentsView && (!showingAllPrograms && !searching)

            z: 8
        }
		/*
			Another separator between the button to show all programs and recently used applications
		*/
        Rectangle {
       		id: allProgramsSeparator
			anchors {
				//top: Plasmoid.configuration.showRecentsView ? recents.bottom : faves.bottom
				topMargin: Kirigami.Units.smallSpacing-1
				left: parent.left
				leftMargin: 11
				right: faves.right
				rightMargin: Kirigami.Units.smallSpacing*2-1
				bottom: allButtonsArea.top
				bottomMargin: Kirigami.Units.smallSpacing-1
			}


       		/*Behavior on width {
       			NumberAnimation { easing.type: Easing.Linear; duration: slideAnimationDuration }
       		}*/

       		//width: root.cellWidth - Kirigami.Units.smallSpacing*8
       		height: 1
       		opacity: 1

       		color: leftPanelSeparatorColor
       		z: 6
        }
		/* 
		 * Shows/hides the main view of the panel. Clicking on it in the default state will show the
		 * application menu. If the start menu is showing the application menu element or is in a searching
		 * state, clicking on this button will bring the start menu back to its default state.
		 */
        MouseArea {
        	id: allButtonsArea
        	hoverEnabled: true

        	property alias textLabel: showingAllProgramsText.text
        	property alias svgArrow: arrowDirection.elementId

        	CrossFadeBehavior on textLabel {
				fadeDuration: 200
				easingType: "Linear"
			}
			CrossFadeBehavior on svgArrow {
				fadeDuration: 200
				easingType: "Linear"
			}
			anchors {
				//top: Plasmoid.configuration.showRecentsView ? recents.bottom : faves.bottom
				left: parent.left
				leftMargin: Kirigami.Units.smallSpacing+1
				rightMargin: Kirigami.Units.smallSpacing
				bottom: searchField.top
				bottomMargin: Kirigami.Units.smallSpacing*3
			}
			KeyNavigation.tab: searchField;
			KeyNavigation.backtab: returnPreviousView();
			function returnPreviousView() {
				if(searching) {
					return searchView.itemGrid;
				} else if(showingAllPrograms) {
					return appsView;
				} else if(Plasmoid.configuration.showRecentsView) {
					return recents;
				} else {
					return faves;
				}
			}
			Keys.onPressed: event => {
				if (event.key == Qt.Key_Return || event.key == Qt.Key_Enter) {
					click(true);
				} else if(event.key == Qt.Key_Up) {
					var view = returnPreviousView();
					view.focus = true;
					if(typeof view.currentIndex !== "undefined") {
						view.currentIndex = returnPreviousView().count-1;
					} else {
						// To implement for search view
					}
				} else if(event.key == Qt.Key_Down) {
					searchField.focus = true;
				}
			}
        	onClicked: {
				click(false);
        	}
			function click(focusAppsView) {
        	    if(searching)
        	    {
        	        searchField.text = "";
        	    }
        	    else if(showingAllPrograms)
        	    {
        	        showingAllPrograms = false;
        	        appsView.reset();
        	    }
        	    else if(!searching && !showingAllPrograms)
        	    {
        	        showingAllPrograms = true;
					if(focusAppsView) appsView.focus = true;
        	    }
			}
        	width: root.cellWidth - Kirigami.Units.smallSpacing*2
        	height: Kirigami.Units.iconSizes.smallMedium+1

        	/*Behavior on width {
        	    NumberAnimation { easing.type: Easing.Linear; duration: slideAnimationDuration }
        	}*/

        	z: 8
            KSvg.FrameSvgItem {
        	    id: allProgramsButton
       			anchors.fill: parent
       			imagePath: Qt.resolvedUrl("svgs/menuitem.svg")
       			
       			prefix: "hover"
       			opacity: {
					if(allButtonsArea.containsMouse) return 1.0;
					else if(allButtonsArea.focus) return 0.5;
					else return 0;
				}
        	}
            KSvg.SvgItem {
           		id: arrowDirection
           		svg: arrowsSvg
           		elementId: (searching || showingAllPrograms) ? "all-applications-left" : "all-applications-right"

           		anchors.left: parent.left
           		anchors.verticalCenter: parent.verticalCenter
           		anchors.leftMargin: Kirigami.Units.smallSpacing

           		width: 16
           		height: 16
        	}
            Text {
				id: showingAllProgramsText
            	text: showingAllPrograms || searching ? "    Back" : "    All Programs"
            	font.pixelSize: 12
            	anchors.left: arrowDirection.right
            	anchors.leftMargin: Kirigami.Units.smallSpacing
            	anchors.verticalCenter: parent.verticalCenter
            	style: Text.Sunken
            	styleColor: "transparent"
				//renderType: Text.QtRendering

            }
        }
        /*
		 * Shows search results when the user types something into the textbox. This view will only
		 * appear if that textbox is not empty, and it will extend the left panel to the entire
		 * width of the plasmoid. The source code is forked from Kickoff and features aesthetic
		 * changes.
		 */
        SearchView {
            id: searchView

            clip: true
			anchors {
           		top: backgroundRect.top
           		left: parent.left
           		right: parent.right
           		bottom: backgroundRect.bottom


           		topMargin: Kirigami.Units.smallSpacing*2 -2
           		bottomMargin: searchBackground.height + Kirigami.Units.smallSpacing*2 -3
           		leftMargin: 2
           		rightMargin: -Kirigami.Units.smallSpacing+1
			}

            //height: root.cellHeight * Plasmoid.configuration.numberRows - Kirigami.Units.smallSpacing*2 - allProgramsButton.height

            opacity: 0
            visible: opacity
            Behavior on opacity {
                NumberAnimation { easing.type: Easing.InOutQuart; duration: 150 }
            }

            z: 9
        }
		/*
		 * Shows a list of all applications organized by categories. The source code is forked from Kickoff
		 * and features mostly aesthetic changes.
		 */
        ApplicationsView {
            id: appsView

			anchors {
            	top: parent.top
            	left: parent.left
            	right: faves.right
            	bottom: allProgramsSeparator.top

            	topMargin: 2
            	leftMargin: 1
            	bottomMargin: Kirigami.Units.smallSpacing
			}

            width: root.cellWidth
            height: (root.cellHeight * Plasmoid.configuration.numberRows) - Kirigami.Units.smallSpacing*2 - allProgramsButton.height

            opacity: 0
			visible: opacity

            function resetIndex() {
                appsView.listView.currentIndex = -1;
            }

            z: 1
        }
        
        states: [

            State {
                name: "AllPrograms"; when: !searching && showingAllPrograms
                PropertyChanges {
                    target: faves; opacity: 0;
                }
                PropertyChanges {
                    target: recents; opacity: 0;
                }
                PropertyChanges {
                    target: tabBarSeparator; opacity: 0;
                }
                PropertyChanges {
                    target: appsView; opacity: 1;
                }
                PropertyChanges { 
                    target: appsView; z: 7;
                }
                StateChangeScript {
                    script: appsView.resetIndex();
                }
            },

            State {
                name: "Searching"; when: searching


                PropertyChanges {
					target: searchView; opacity: (backgroundRect.width === searchView.width ? 1 : 0);
				}
                PropertyChanges {
					target: searchBackground; anchors.rightMargin: 3
				}
				PropertyChanges {
					target: backgroundBorderLine; anchors.rightMargin: 3
				}
                PropertyChanges {
                    target: faves; opacity: 0;
                }
                PropertyChanges {
                    target: recents; opacity: 0;
                }
                PropertyChanges {
                    target: tabBarSeparator; opacity: 0;
                }

                PropertyChanges {
                    target: allProgramsButton; opacity: 0;
                }
                PropertyChanges {
					target: allProgramsButton; enabled: false;
				}
                PropertyChanges {
                    target: allProgramsSeparator; opacity: 0;
                }
                PropertyChanges {
                    target: allButtonsArea; opacity: 0;
                }

                PropertyChanges {
					target: allButtonsArea; enabled: false;
				}
                PropertyChanges {
                    target: sidePanel; opacity: 0;
                }
                PropertyChanges {
                    target: sidePanel; enabled: false
                }
		}
        ]
        transitions: [ 
       		Transition {
				id: transition
       		    PropertyAnimation { properties: "opacity"; easing.type: Easing.Linear; duration: Kirigami.Units.longDuration*1.5 }
       		    onRunningChanged: {
					if(!searching && !running) {
						// fixes another inexplicable bug, makes it look just a tad bit nicer
						backgroundBorderLine.anchors.rightMargin = Qt.binding(() => 2);
						searchBackground.anchors.rightMargin = Qt.binding(() => 2);
					}
				}
       		}
        ]

        PlasmaExtras.ActionTextField {
            id: searchField
            z: 7

            focus: true

            anchors{
                bottom: parent.bottom
                bottomMargin: Kirigami.Units.smallSpacing * 2.5
                left: parent.left
                right: faves.right
                rightMargin: Kirigami.Units.smallSpacing * 2 + 1
                leftMargin:  Kirigami.Units.smallSpacing * 2 + 2
            }  

			background:	KSvg.FrameSvgItem {
				anchors.fill:parent
				anchors.left: parent.left
				imagePath: Qt.resolvedUrl("svgs/lineedit.svg")
				prefix: "base"

				Text {
					anchors.fill: parent
					anchors.leftMargin: Kirigami.Units.smallSpacing*2-1
					anchors.bottomMargin: 2
					font.italic: true
					//font.family: "Segoe UI, Italic"
					color: searchFieldPlaceholderColor
					text: i18n(" Search programs and files")
					verticalAlignment: Text.AlignVCenter
					visible: !searching
					style: Text.Outline
					styleColor: "transparent"
					opacity: 0.55
				}
                Kirigami.Icon {
                    source: "gtk-search"
					smooth: true
					visible: !searching
					width: Kirigami.Units.iconSizes.small;
					height: width
                    anchors {
						top: parent.top
						bottom: parent.bottom
						bottomMargin: 1
						right: parent.right
						rightMargin: Kirigami.Units.smallSpacing
					}
                }
			}
			inputMethodHints: Qt.ImhNoPredictiveText
            width: root.cellWidth - Kirigami.Units.smallSpacing * 4 - 2
            height: Kirigami.Units.smallSpacing * 7 - Kirigami.Units.smallSpacing
			clearButtonShown: false
            //placeholderText: i18n(" Search programs and files")
            text: ""
			color: "black"
			verticalAlignment: TextInput.AlignBottom
			font.italic: searchField.text == "" ? true : false

            onTextChanged: {
					searchView.onQueryChanged();
            }

			KeyNavigation.tab: {
				if(columnItems.visibleChildren.length === 2) return shutdown;
				return columnItems.visibleChildren[1];

			}
            Keys.priority: Keys.AfterItem
            Keys.onPressed: function(event){
				if (event.key == Qt.Key_Escape) {
					event.accepted = true;
					if (searching) {
						root.reset();
					} else if(showingAllPrograms) {
						showingAllPrograms = false;
						appsView.reset();
					} else {
						root.visible = false;
					}
					focus = true;
					return;
				}
                if (event.key == Qt.Key_Tab) {
                    faves.forceActiveFocus();
                    event.accepted = true;
                    return;
				}
				if ((event.key == Qt.Key_Up) && searching) {
					//searchView.itemGrid.focus = true;
					searchView.decrementCurrentIndex();
					event.accepted = true;
					return;
				}
				if ((event.key == Qt.Key_Down) && searching) {
					//searchView.itemGrid.focus = true;
					searchView.incrementCurrentIndex();
					event.accepted = true;
					return;
				}
				if((event.key == Qt.Key_Return) && searching) {
					searchView.activateCurrentIndex();
					event.accepted = true;
					return;
				}
				event.accepted = false;
            }


            function backspace() {
                if (!root.visible) {
                    return;
                }
                focus = true;
                text = text.slice(0, -1);
            }

            function appendText(newText) {
                if (!root.visible) {
                    return;
                }
                focus = true;
                text = text + newText;
            }
        }

        Column {
            id: sidePanel
            z: 7
            anchors{
                left: faves.right
                //right: parent.right
                top: parent.top
                bottom: leaveButtons.top
                bottomMargin: Kirigami.Units.largeSpacing
                leftMargin: 5
                //rightMargin: Kirigami.Units.smallSpacing
                topMargin: compositingEnabled ? Kirigami.Units.iconSizes.huge / 2 + Kirigami.Units.smallSpacing : 0
			}
			spacing: Kirigami.Units.smallSpacing

			FloatingIcon {
				id: nonCompositingIcon
				Layout.alignment: Qt.AlignTop | Qt.AlignHCenter
				visible: !compositingEnabled
				opacity: !searching

			}
            FileDialog {
                id: folderDialog
                visible: false
                currentFolder: ""//shortcuts.pictures

                function getPath(val){
					switch(val) {
						case 1:
							return StandardPaths.writableLocation(StandardPaths.HomeLocation);
						case 2:
							return StandardPaths.writableLocation(StandardPaths.DocumentsLocation);
						case 3:
							return StandardPaths.writableLocation(StandardPaths.PicturesLocation);
						case 4:
							return StandardPaths.writableLocation(StandardPaths.MusicLocation);
						case 5:
							return StandardPaths.writableLocation(StandardPaths.MoviesLocation);
						case 6:
							return StandardPaths.writableLocation(StandardPaths.HomeLocation) + "/Downloads";
						case 7:
							return "file:///.";
						case 8:
							return "remote:/";
						case 9:
							return "applications:///Games/";
						case 10:
							return "https://develop.kde.org/docs/"
						case 11:
							return "recentlyused:/";
						default:
							return "";
					}
                }
            }
			Timer {
				id: delayTimer
				interval: 250
				repeat: false
				onTriggered: {
					if(root.activeFocusItem) {
						if(root.activeFocusItem.objectName === "SidePanelItemDelegate") {
							compositingIcon.iconSource = root.activeFocusItem.itemIcon;
							nonCompositingIcon.iconSource = root.activeFocusItem.itemIcon;
						} else {
							compositingIcon.iconSource = "";
							nonCompositingIcon.iconSource = "";
						}
					}
				}
			}

			//Side panel items
            ColumnLayout {
                id: columnItems
                spacing: 3
				Layout.alignment: Qt.AlignTop
				//Layout.fillHeight: true
				//Layout.minimumWidth: cellWidthSide
				width: Math.max(cellWidthSide, columnItems.implicitWidth)
				Layout.leftMargin: Kirigami.Units.mediumSpacing/2
				//Layout.topMargin: compositingEnabled ? Kirigami.Units.largeSpacing : 0//-Kirigami.Units.gridUnit-Kirigami.Units.largeSpacing
                //anchors.top: compositingEnabled ? parent.top : nonCompositingIcon.bottom
                //anchors.topMargin: compositingEnabled ? Kirigami.Units.smallSpacing : Kirigami.Units.smallSpacing*2
                //anchors.left: parent.left
                Rectangle {
					id: testRect
					anchors.fill: columnItems
					color: "transparent"
				}

				property int currentIndex: -1
                Component.onCompleted: {
					separator1.updateVisibility();
					separator2.updateVisibility();
				}
				SidePanelItemDelegate {
					itemText: kuser.loginName
					itemIcon: "user-home"
					executableString: folderDialog.getPath(1)
					visible: Plasmoid.configuration.showHomeSidepanel
					onVisibleChanged: {
						separator1.updateVisibility();
						separator2.updateVisibility();
					}
					Layout.fillWidth: true
				}
				SidePanelItemDelegate {
					itemText: "Documents"
					itemIcon: "library-txt"
					executableString: folderDialog.getPath(2)
					visible: Plasmoid.configuration.showDocumentsSidepanel
					onVisibleChanged: {
						separator1.updateVisibility();
						separator2.updateVisibility();
					}
					Layout.fillWidth: true
				}
				SidePanelItemDelegate {
					itemText: "Pictures"
					itemIcon: "library-images"
					executableString: folderDialog.getPath(3)
					visible: Plasmoid.configuration.showPicturesSidepanel
					onVisibleChanged: {
						separator1.updateVisibility();
						separator2.updateVisibility();
					}
					Layout.fillWidth: true
				}
				SidePanelItemDelegate {
					itemText: "Music"
					itemIcon: "library-sound"
					executableString: folderDialog.getPath(4)
					visible: Plasmoid.configuration.showMusicSidepanel
					onVisibleChanged: {
						separator1.updateVisibility();
						separator2.updateVisibility();
					}
					Layout.fillWidth: true
				}
				SidePanelItemDelegate {
					itemText: "Videos"
					itemIcon: "library-video"
					executableString: folderDialog.getPath(5)
					visible: Plasmoid.configuration.showVideosSidepanel
					onVisibleChanged: {
						separator1.updateVisibility();
						separator2.updateVisibility();
					}
					Layout.fillWidth: true
				}
				SidePanelItemDelegate {
					itemText: "Downloads"
					itemIcon: "folder-download"
					executableString: folderDialog.getPath(6)
					visible: Plasmoid.configuration.showDownloadsSidepanel
					onVisibleChanged: {
						separator1.updateVisibility();
						separator2.updateVisibility();
					}
					Layout.fillWidth: true
				}
				SidePanelItemSeparator {
					id: separator1
					Layout.minimumWidth: 124
					Layout.maximumWidth: 124
					Layout.alignment: Qt.AlignHCenter
				}
				SidePanelItemDelegate {
					itemText: "Games"
					itemIcon: "applications-games"
					executableString: folderDialog.getPath(9)
					visible: Plasmoid.configuration.showGamesSidepanel
					onVisibleChanged: {
						separator1.updateVisibility();
						separator2.updateVisibility();
					}
					Layout.fillWidth: true
				}
				SidePanelItemDelegate {
					itemText: "Recent Items"
					itemIcon: "document-open-recent"
					executableString: folderDialog.getPath(11)
					visible: Plasmoid.configuration.showRecentItemsSidepanel
					onVisibleChanged: {
						separator1.updateVisibility();
						separator2.updateVisibility();
					}
					Layout.fillWidth: true
				}
				SidePanelItemDelegate {
					itemText: "Computer"
					itemIcon: "computer"
					executableString: folderDialog.getPath(7)
					visible: Plasmoid.configuration.showRootSidepanel
					onVisibleChanged: {
						separator1.updateVisibility();
						separator2.updateVisibility();
					}
					Layout.fillWidth: true
				}
				SidePanelItemDelegate {
					itemText: "Network"
					itemIcon: "folder-network"
					executableString: folderDialog.getPath(8)
					visible: Plasmoid.configuration.showNetworkSidepanel
					onVisibleChanged: {
						separator1.updateVisibility();
						separator2.updateVisibility();
					}
					Layout.fillWidth: true
				}
				SidePanelItemSeparator {
					id: separator2
					Layout.minimumWidth: 124
					Layout.maximumWidth: 124
					Layout.alignment: Qt.AlignHCenter
				}
				SidePanelItemDelegate {
					itemText: "Control Panel"
					itemIcon: "preferences-system"
					executableString: "systemsettings"
					executeProgram: true
					visible: Plasmoid.configuration.showSettingsSidepanel
					onVisibleChanged: {
						separator1.updateVisibility();
						separator2.updateVisibility();
					}
					Layout.fillWidth: true
				}
				SidePanelItemDelegate {
					itemText: "Devices and Printers"
					itemIcon: "input_devices_settings"
					executableString: "systemsettings kcm_printer_manager"
					executeProgram: true
					visible: Plasmoid.configuration.showDevicesSidepanel
					onVisibleChanged: {
						separator1.updateVisibility();
						separator2.updateVisibility();
					}
					Layout.fillWidth: true
				}
				SidePanelItemDelegate {
					itemText: "Default Programs"
					itemIcon: "preferences-desktop-default-applications"
					executableString: "systemsettings kcm_componentchooser"
					executeProgram: true
					visible: Plasmoid.configuration.showDefaultsSidepanel
					onVisibleChanged: {
						separator1.updateVisibility();
						separator2.updateVisibility();
					}
					Layout.fillWidth: true
				}
				SidePanelItemDelegate {
					itemText: "Help and Support"
					itemIcon: "help-browser"
					executableString: folderDialog.getPath(10);
					visible: Plasmoid.configuration.showHelpSidepanel
					onVisibleChanged: {
						separator1.updateVisibility();
						separator2.updateVisibility();
					}
					Layout.fillWidth: true
				}

				//Used to space out the rest of the side panel, so that the shutdown button is at the bottom of the plasmoid
                Item {
					objectName: "PaddingItem"
                    Layout.fillHeight: false
                    visible: true
                }
                Item {
                    height: Kirigami.Units.smallSpacing
                    visible: false
                }
            }
        }
        
        RowLayout {
			id: leaveButtons
			anchors{
				top: searchField.top
				topMargin: 1
				left: searchField.right
				leftMargin: Kirigami.Units.smallSpacing*4
			}
			spacing: 0
			z: 7
			function findUpItem() {
				if(searching) {
					return allButtonsArea;
				} else {
					if(columnItems.visibleChildren.length === 2) {
						return searchField;
					}
					return columnItems.visibleChildren[columnItems.visibleChildren.length-2];
				}
			}
			ListDelegate {
				id: shutdown
				objectName: "ShutdownButton"
				width: shutDownText.implicitWidth + (Kirigami.Units.largeSpacing-1)*2 + 1
				height: Kirigami.Units.smallSpacing * 6 - 2
				size: iconSizeSide

				KeyNavigation.tab: lockScreenDelegate
				KeyNavigation.backtab: leaveButtons.findUpItem();

				Keys.onPressed: event => {
					if(event.key == Qt.Key_Return) {
						ma.clicked(null);
					} else if(event.key == Qt.Key_Right) {
						lockScreenDelegate.focus = true;
					} else if(event.key == Qt.Key_Left) {
						searchField.focus = true;
					} else if(event.key == Qt.Key_Up) {
						leaveButtons.findUpItem().focus = true;
					}
				}

				Text {
					id: shutDownText
					text: i18nd("plasma_lookandfeel_org.kde.lookandfeel", "Shut down")

					font.pixelSize: 12
					color: searching ? shutdownTextColor : PlasmaCore.Theme.textColor
					anchors.horizontalCenter: parent.horizontalCenter
					anchors.verticalCenter: parent.verticalCenter
					anchors.verticalCenterOffset: -1

					style: Text.Outline
					styleColor: "transparent"
					z: 5
				}

                KSvg.FrameSvgItem {
					id: shutdownButton

					anchors.fill:parent
					anchors.left: parent.left
					imagePath: Qt.resolvedUrl("svgs/startmenu-buttons.svg")

					prefix: {
						if(ma.containsPress) return "pressed";
						else if(ma.containsMouse || lockma.containsMouse || shutdown.focus || lockScreenDelegate.focus || contextMenu.status == 1) return "hover";
						else return "normal";
					}
				}

				MouseArea {
					id: ma

					enabled: !root.hoverDisabled
					acceptedButtons: Qt.LeftButton
					hoverEnabled: true
					anchors.fill: parent
					onExited: {
						shutdown.focus = false;
					}
					onClicked: {
						root.visible = false;
						pmEngine.performOperation("requestShutDown");
					}
				}
			}

			ListDelegate {
				id: lockScreenDelegate
				Layout.leftMargin: -1
				width: height+1
				height: shutdown.height 
				KeyNavigation.tab: faves
				KeyNavigation.backtab: shutdown

				Keys.onPressed: event => {
					if(event.key == Qt.Key_Return) {
						lockma.clicked(null);
					} else if(event.key == Qt.Key_Left) {
						shutdown.focus = true;
					} else if(event.key == Qt.Key_Up) {
						leaveButtons.findUpItem().focus = true;
					}
				}
                KSvg.FrameSvgItem {
					id: lockButton

					anchors.fill: parent;
					anchors.left: parent.left
					imagePath: Qt.resolvedUrl("svgs/startmenu-buttons.svg")

					prefix: {
						if(contextMenu.status == 1 || ma.containsPress) return "rtl-pressed";
						else if((ma.containsMouse || lockma.containsMouse || shutdown.focus || lockScreenDelegate.focus)) return "rtl-hover";
						else return "rtl-normal";
					}
				}
				onFocusChanged: {
					if(lockScreenDelegate.focus)
						contextMenu.openRelative();
				}


				MouseArea {
					id: lockma
					enabled: !root.hoverDisabled
					acceptedButtons: Qt.LeftButton
					onClicked: {
						contextMenu.openRelative();
						//root.visible = false;
						//pmEngine.performOperation("lockScreen")
					}
					hoverEnabled: true
					anchors.fill: lockButton
				}

                KSvg.SvgItem {
					id: lsSvg
					svg: arrowsSvg

					anchors.centerIn: lockButton
					//anchors.verticalCenterOffset: -1
					anchors.horizontalCenterOffset: -1
					width: Kirigami.Units.iconSizes.smallMedium - Kirigami.Units.smallSpacing / 2
					height: Kirigami.Units.iconSizes.smallMedium - Kirigami.Units.smallSpacing / 2 +1
					elementId: searching ? "more-ltr-black" : "more-ltr-light";
					//elementId: searching ? "dark-lock" : "light-lock"
				}
				enabled: pmEngine.data["Sleep States"]["LockScreen"]
				size: iconSizeSide
			}
		}
		
		KeyNavigation.tab: faves;
		Keys.forwardTo: searchField

	}

	Component.onCompleted: {
		kicker.reset.connect(reset);
		reset();
		faves.listView.currentIndex = -1;
		
		var pos = popupPosition(width, height);
		x = pos.x;
		y = pos.y;
	}
}