import QtQuick
import QtQuick.Layouts
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

    implicitWidth: row.implicitWidth
    implicitHeight: row.implicitHeight
    color: "transparent"

    // Component.onCompleted: {
    //     console.log("battery widget width: " + root.implicitWidth)
    //     console.log("battery row width: " + row.implicitWidth)
    //     console.log("battery icon width: " + battery.implicitWidth)
    //     console.log("battery level width: " + p.implicitWidth)
    // }

    RowLayout {
        id: row
        anchors.fill: parent
        Material {
            id: battery

            text: BatteryService.getIcon()
            Layout.alignment: Qt.AlignCenter
            size: 26
            color: root.bColor
        }

        Text {
            font.pixelSize: 12
            id: p
            text: BatteryService.batteryLevel + "%"
            Layout.alignment: Qt.AlignRight | Qt.AlignVCenter
            color: root.bColor
        }
    }
}
