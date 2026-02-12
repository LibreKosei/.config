import QtQuick
import QtQuick.Layouts
Rectangle {
    id: root
    
    property real vertical_padding: 4
    property real horizontal_padding: 16
    property real spacing: 8
    default property alias content: row.children
    
    implicitWidth: row.implicitWidth + root.horizontal_padding
    implicitHeight: row.implicitHeight + root.vertical_padding
    radius: 16

    RowLayout {
        id: row

        spacing: root.spacing

        anchors.centerIn: parent
        anchors.verticalCenter: parent.verticalCenter
    }
}
