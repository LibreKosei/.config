import QtQuick
import QtQuick.Layouts
import qs

Rectangle {
    id: root
    property int size: 16
    radius: size / 2 
    required property bool expanded
    Layout.alignment: Qt.AlignTop
    Layout.fillHeight: false

    implicitWidth: size
    implicitHeight: size

    color: Color.palette.tertiary
    
    Material {
        anchors.centerIn: parent
        size: root.size
        text: "cancel"
        rotation: root.expanded ? 180 : 0
        color: Color.palette.on_tertiary
    }

    HoverHandler {
        cursorShape: Qt.OpenHandCursor
    }
}
