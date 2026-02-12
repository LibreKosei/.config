import QtQuick
import qs.theme
Rectangle {
    id: revealer

    property bool revealed: false

    default property alias contentData: content.data
    // property Component delegate 

    implicitHeight: 48
    implicitWidth: row.implicitWidth + 16
    border.color: revealed ? Everblush.whiteForeground : "transparent"
    color: "transparent"
    Row {
        id: row 
        spacing: 12
        anchors.centerIn: parent
        layoutDirection: Qt.LeftToRight
        
        MouseArea {
            id: toggleBtn
            width: 32
            height: 32
            onClicked: revealer.revealed = !revealer.revealed
            anchors.verticalCenter: parent.verticalCenter

            Image {
                id: chevron 
                source: "../../assets/panel-left-close"
                anchors.fill: parent
                
                rotation: revealer.revealed ? 180 : 0

                Behavior on rotation {
                    NumberAnimation {
                        duration: 180
                        easing.type: Easing.Linear
                    }
                }
            }
        }

        Item {
            id: container
            clip: true

            width: revealer.revealed ? content.implicitWidth : 0
            implicitHeight: 32
            anchors.verticalCenter: parent.verticalCenter

            Behavior on width {
                NumberAnimation {
                    duration: 180
                    easing.type: Easing.Linear
                }
            }

            Row {
                id: content
                spacing: 12
                anchors.verticalCenter: parent.verticalCenter
            }
        }
    }
}
