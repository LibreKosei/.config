import QtQuick
import QtQuick.Layouts

Rectangle {
    id: root 

    default property alias contentData: layout.data

    property real space: 8
    property real margin: 8

    implicitWidth: layout.implicitWidth + margin * 2
    implicitHeight: 48
    color: "transparent"
    radius: 8

    RowLayout {
        id: layout
        anchors.centerIn: parent
        spacing: root.space
    }
}
