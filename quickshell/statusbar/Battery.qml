import QtQuick
import QtQuick.Layouts
import Quickshell.Services.UPower
import qs
import qs.services

Rectangle {
    id: root
    property string bgColor: Color.palette.surface
    property string preferredColor: Color.palette.primary
    property string bColor: {
        if (BatteryService.batteryLevel < 25) {
            return Color.palette.error
        }
        return root.preferredColor
    }

    implicitWidth: battery.width + p.width
    implicitHeight: row.implicitHeight
    color: "transparent"


    RowLayout {
        id: row
        anchors.fill: parent
        Material {
            id: battery

            text: BatteryService.getIcon()
            Layout.alignment: Qt.AlignCenter
            size: 24
            color: root.bColor
        }

        Text {
            id: p
            text: BatteryService.batteryLevel + "%"
            Layout.alignment: Qt.AlignRight | Qt.AlignVCenter
            color: root.bColor
        }
    }
}
