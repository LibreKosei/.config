import QtQuick
import QtQuick.Layouts
import qs 
import qs.services

Rectangle {
    id: root
    implicitWidth: row.implicitWidth
    implicitHeight: row.implicitHeight
    color: "transparent"
    property string fgColor: Color.palette.primary

    RowLayout {
        id: row
        anchors.fill: parent

        Material {
            id: wifiIcon
            text: NetworkService.wifiSignalIcon
            color: root.fgColor
        }

        // Text {
        //     id: wifiSsid
        //     text: NetworkService.currentWifiSSID
        //     Layout.alignment: Qt.AlignRight
        //     color: Color.palette.on_surface
        // }
    }
}
