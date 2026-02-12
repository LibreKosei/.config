import QtQuick

ListView {
    id: root
    
    spacing: 12
    implicitWidth: 288 + 16
    implicitHeight: 180 * count + spacing * count
    clip: true

    delegate: Notification {
        required property var modelData
        required property int index
        anchors.horizontalCenter: parent.horizontalCenter
        n: modelData
        visible: index < 3
    }
}
