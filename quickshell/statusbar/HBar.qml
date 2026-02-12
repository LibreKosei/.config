import Quickshell
import Quickshell.Networking
import QtQuick.Layouts
import QtQuick 
import qs
import qs.services
import qs.common

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
        color: "transparent"

        RoundCorner {
            corner: cornerEnum.topLeft
            anchors.left: bar.right
            color: bar.color
            size: 24
        }

        RoundCorner {
            corner: cornerEnum.topRight
            anchors.right: bar.left
            color: bar.color
            size: 24
        }

        Rectangle {
            id: bar

            anchors.fill: parent
            anchors.leftMargin: root.screen.width / 8
            anchors.rightMargin: root.screen.width / 8
            bottomLeftRadius: 16
            bottomRightRadius: 16

            color: Color.palette.surface_container_highest
            RowLayout {
                anchors.leftMargin: 16 
                anchors.rightMargin: 16
                anchors.fill: parent
                spacing: 24
                
                NixLogo {
                    color: Color.palette.primary
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
                            fgColor: Color.palette.primary
                        }
                        Bluetooth {
                            color: Color.palette.on_surface
                        }
                        WifiIcon {

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
