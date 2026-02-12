pragma ComponentBehavior: Bound
import org.kde.kirigami as Kirigami 
import QtQuick

Item {
    id: root
    property color background: "transparent"
    property real borderWidth
    property color borderColor: "transparent"
    property color iconColor
    property list<string> source

    Rectangle {
        anchors.fill: parent
        color: root.background
        border.color: root.borderColor
        border.width: root.borderWidth
    }

    Repeater {
        anchors.fill: parent
        model: root.source
        delegate: Kirigami.Icon {
            anchors.fill: parent
            required property string modelData
            source: modelData
            isMask: root.iconColor !== ""
            color: root.iconColor
        }
    }
}
