import QtQuick
import qs

Rectangle {
    id: root
    property string icon_name: "hexagon"
    property real size: 24
    property string icon_color: ""
    property real icon_size: 16

    implicitHeight: size
    implicitWidth: size
    radius: 4

    Material {
        color: root.icon_color
        anchors.centerIn: parent
        text: root.icon_name
        size: root.icon_size
    }

    HoverHandler {
        cursorShape: Qt.OpenHandCursor
    }
}
