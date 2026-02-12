import Quickshell
import QtQuick
import QtQuick.Layouts
import QtQuick.Effects
import qs.services
import qs.widgets.common
import qs.theme

Rectangle {
    id: bar

    property real barMargin: 0
    property real itemSpace: 16

    required property ShellScreen screen 
    
    implicitWidth: screen.width
    implicitHeight: 80
    color: Everblush.background

    RectangularShadow {
        anchors.fill: bar
        offset.x: 0
        offset.y: 6 
        spread: 0
        color: Qt.darker(bar.color, 1.3)
    }

    Item {
        id: barLayout

        anchors.leftMargin: 80
        anchors.rightMargin: 80
        anchors.fill: parent

        WorkspaceIndicator {
            anchors.left: parent.left
            anchors.verticalCenter: parent.verticalCenter
            color: Everblush.lighterBackground
            radius: 8
        }

        Rectangle {
            anchors.centerIn: parent
            implicitWidth: timeText.implicitWidth + 24
            implicitHeight: 48
            radius: 8
            color: Everblush.lighterBackground

            Text {
                anchors.centerIn: parent
                id: timeText
                text: TimeService.currentTime
                color: Everblush.whiteForeground
                font.pixelSize: 14
            }
        }

        Rectangle {
            anchors.right: parent.right
            anchors.verticalCenter: parent.verticalCenter
            implicitWidth: layout.implicitWidth

            FlexboxLayout {
                id: layout
                anchors.fill: parent
                direction: FlexboxLayout.Row
                justifyContent: FlexboxLayout.JustifySpaceAround
                alignItems: FlexboxLayout.AlignCenter
                gap: 36

                RowGroup {
                    color: Everblush.lighterBackground
                    StyledIcon {
                        width: 36
                        height: 36
                        source: [NMService.icon]
                        iconColor: Everblush.whiteForeground
                    }
                    StyledIcon {
                        width: 36
                        height: 36
                        source: [BluetoothService.icon]
                        iconColor: Everblush.whiteForeground
                    }
                }

                RowGroup {
                    color: Everblush.lighterBackground
                    StyledIcon {
                        id: volIcon
                        width: 36 
                        height: 36
                        source: [AudioService.icon]
                        iconColor: Everblush.cyan
                    }
                    StyledText {
                        color: Everblush.cyan
                        text: {
                            return `${AudioService.volume}`
                        }
                        Layout.preferredWidth: width
                    }
                }

                RowGroup {
                    color: Everblush.lighterBackground
                    StyledIcon {
                        id: batIcon
                        width: 36
                        height: 36
                        source: [BatteryService.icon]
                        iconColor: BatteryService.batteryLevel <= 20 ? Everblush.red : 
                           BatteryService.batteryLevel <= 50 ? Everblush.yellow : Everblush.green
                    }
                    StyledText {
                        color: batIcon.iconColor
                        text: {
                            if (BatteryService.batteryLevel >= 99) {
                                return "max"
                            }
                            return `${BatteryService.batteryLevel}%`
                        }
                    }
                }
            }
        }
    }
}
