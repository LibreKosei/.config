import QtQuick
import QtQuick.Layouts
import qs 
import qs.services
import qs.common
Rectangle {
    id: root
    implicitWidth: row.implicitWidth
    implicitHeight: row.implicitHeight
    color: "transparent"
    property string fgColor: Color.palette.primary

    RowLayout {
        id: row
        anchors.fill: parent

        MaterialIcon {
            id: wifiIcon
            text: NetworkService.wifiSignalIcon
            color: root.fgColor
        }
    }
}
