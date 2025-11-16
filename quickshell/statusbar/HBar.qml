import Quickshell
import QtQuick.Layouts
import QtQuick 
import Quickshell.Widgets
import QtQuick.Effects
import Quickshell.Services.Pipewire
import qs
import qs.services

Variants {
    model: Quickshell.screens
    delegate: PanelWindow {
        required property var modelData
        id: root

        screen: modelData
        anchors {
            top: true
            right: true
            left: true
        }

        implicitHeight: 64
        implicitWidth: screen.width
        color: "transparent"

        Rectangle {
            id: bar
            anchors.fill: parent
            color: Color.palette.surface_container_highest

            RowLayout {
                anchors.leftMargin: 16 
                anchors.rightMargin: 16
                anchors.fill: parent
                spacing: 24
                
                IconImage {
                    id: osLogo
                    Layout.alignment: Qt.AlignLeft
                    source: Quickshell.iconPath("nix-snowflake")
                    Layout.preferredWidth: 32 
                    Layout.preferredHeight: 32
                    asynchronous: true

                    transformOrigin: Item.Center

                    TapHandler {
                        cursorShape: Qt.PointingHandCursor
                        onTapped: {
                            rotationAnim.start()
                        }
                    }

                    MultiEffect {
                        anchors.fill: parent
                        source: osLogo
                        colorization: 1.0
                        colorizationColor: Color.palette.primary
                    }

                    RotationAnimator {
                        id: rotationAnim 
                        target: osLogo
                        from: 0 
                        to: 360 
                        duration: 300
                        easing.type: Easing.InOutQuad
                        onStopped: Quickshell.reload(true)
                    }
                }

                Text {
                    text: TimeService.currentTime
                    color: Color.palette.on_surface
                }
                
                Item { Layout.fillWidth: true }


                Rectangle {
                    implicitWidth: row.implicitWidth + 16
                    implicitHeight: row.implicitHeight + row.anchors.margins * 2
                    Layout.alignment: Qt.AlignRight
                    color: "transparent"
                    radius: 8
                    RowLayout {
                        spacing: 16
                        id: row
                        anchors.centerIn: parent
                        anchors.margins: 4
                        Audio {
                            node: Pipewire.defaultAudioSink
                            fgColor: Color.palette.primary
                            visible: !!node && !!node.audio
                        }
                        Bluetooth {
                            color: Color.palette.on_surface
                        }
                        Wifi {
                            fgColor: Color.palette.on_surface
                        }
                        Battery {
                            preferredColor: Color.palette.on_surface
                        }
                    }
                }
            }
        }
    }
}
