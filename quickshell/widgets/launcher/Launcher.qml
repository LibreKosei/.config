pragma ComponentBehavior: Bound
import Quickshell
import QtQuick
import qs.theme
import Quickshell.Widgets
import QtQuick.Effects
import qs.config
import QtQuick.Layouts
import QtQuick.Controls

Item {
    id: root 

    property var panel

    property int maximumItemCount: 5
        
    implicitWidth: 400
    implicitHeight: 500

    onVisibleChanged: {
        if (visible) {
            search.text = ""
            search.forceActiveFocus()
        }
    }

    function launch() {
        if (!main.model || main.model.length === 0) {
            return
        }

        const app  = main.model[0];
        if (app.name.runInTerminal) {
            return
        }
        app.execute()
        Configuration.persistent.showLauncher = false
    }
    
    Rectangle {
        id: background

        anchors.fill: parent
        color: Everblush.background
        radius: 16
        border.color: Qt.darker(color, 3.0)

        RectangularShadow {
            anchors.fill: background
            offset.x: 4
            offset.y: 6 
            radius: background.radius
            spread: 0
            color: Qt.darker(background.color, 1.3)
        }

        ColumnLayout {
            anchors.fill: parent
            
            TextField {
                id: search

                Layout.fillWidth: true
                Layout.preferredHeight: root.implicitWidth / 8
                Layout.margins: 16
                background: Rectangle {
                    radius: 8
                    color: Everblush.lighterBackground
                }
                placeholderText: "Search..."
                placeholderTextColor: Everblush.whiteForeground
                color: Everblush.whiteForeground

                onAccepted: {
                    console.info("Enter key event has been captured on the search widget!")
                    root.launch()
                }

                Keys.onPressed: (event) => {
                    if (event.key === Qt.Key_Down || event.key === Qt.Key_Up) {
                        main.forceActiveFocus()
                        main.Keys.onPressed(event)
                        event.accepted = true
                    }
                }
            }

            ListView {
                id: main

                clip: true
                Layout.fillWidth: true
                Layout.fillHeight: true
                Layout.margins: 16 
                spacing: 16
                keyNavigationEnabled: true
                focus: true
                currentIndex: 0
                highlightFollowsCurrentItem: true

                Keys.onPressed: (event) => {
                    if (event.key === Qt.Key_Down) {
                        currentIndex = Math.min(currentIndex + 1, count - 1)
                        event.accepted = true
                    } else if (event.key === Qt.Key_Up) {
                        currentIndex = Math.max(currentIndex - 1, 0)
                        event.accepted = true
                    } else if (event.key === Qt.Key_Return || event.key === Qt.Key_Enter) {
                        const app = model[currentIndex];
                        if (app) app.execute()
                        Configuration.persistent.showLauncher = false
                    } else {
                        search.forceActiveFocus()
                    }
                }

                model: DesktopEntries.applications.values.filter(a => {
                    const q = search.text.toLowerCase()
                    return (
                        a.name?.toLowerCase().includes(q) ||
                        a.genericName?.toLowerCase().includes(q) ||
                        a.comment?.toLowerCase().includes(q) &&
                        !a.noDisplay
                    )
                })
                highlight: Rectangle {
                    color: Everblush.lighterBackground
                    radius: 8
                }
                delegate: Item {
                    id: appContainer

                    required property DesktopEntry modelData
                    required property int index

                    implicitWidth: root.implicitWidth - 16 * 2
                    implicitHeight: (root.implicitHeight - main.spacing * (root.maximumItemCount + 1)) / root.maximumItemCount 
                    
                    Rectangle {
                        id: appBackground

                        anchors.fill:parent
                        color: "transparent"
                        radius: 8

                        MouseArea {
                            anchors.fill: parent
                            hoverEnabled: true

                            onEntered: { main.currentIndex = appContainer.index; }

                            onPressed: {
                                appContainer.modelData.execute()
                                Configuration.persistent.showLauncher = false
                            }
                        }

                        RowLayout {
                            anchors.fill: parent
                            anchors.margins: 16
                            spacing: 16

                            IconImage {
                                id: appIcon
                                implicitSize: appContainer.implicitHeight - 16 * 2
                                source: Quickshell.iconPath(appContainer.modelData.icon, "image-missing")
                            }
                            Column {
                                Layout.fillWidth: true
                                Layout.fillHeight: true
                                spacing: 12
                                clip: true
                                Text {
                                    id: appName
                                    font.pixelSize: 16 
                                    text: appContainer.modelData.name
                                    Layout.fillWidth: true
                                    font.weight: Font.Bold
                                    horizontalAlignment: Qt.AlignLeft
                                    color: Everblush.whiteForeground
                                }
                                Text {
                                    id: appDescription
                                    font.pixelSize: 14
                                    Layout.fillWidth: true
                                    text: appContainer.modelData.comment
                                    elide: Text.ElideRight
                                    color: Everblush.lightGray
                                }
                            }
                        }
                    }
                }
            }
        }
    }
}
