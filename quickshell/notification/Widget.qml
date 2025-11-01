import Quickshell
import QtQuick.Effects
import Quickshell.Services.Notifications
import Quickshell.Widgets
import QtQuick
import QtQuick.Layouts
import qs
import qs.common

Rectangle {
    id: root

    implicitWidth: 320
    implicitHeight: rootLayout.implicitHeight + rootLayout.anchors.margins * 2

    color: Color.palette.surface_container_highest
    radius: 24
    border.color: n.urgency === NotificationUrgency.Critical ? Color.palette.error : Color.palette.outline_variant
    border.width: 1.5

    property int iconSize: 12
    property real imageSize: implicitHeight / 3

    required property Notification n

    Component.onCompleted: {
        console.log("image path: " + n.image)
        console.log("app icon: " + n.appIcon)
        console.log("app name: " + n.appName)
    }

    ColumnLayout {
        id: rootLayout
        anchors.fill: parent 
        anchors.margins: 16
        spacing: 8

        RowLayout {
            id: header
            Layout.maximumHeight: root.height / 10
            Layout.fillHeight: false
            Layout.fillWidth: true
            Layout.alignment: Qt.AlignTop

            IconImage {
                id: sender
                source: Quickshell.iconPath(root.n.appIcon)
                implicitSize: 24
                asynchronous: true
                visible: root.n.appIcon != ""
            }
            
            Text {
                text: root.n.appName
                color: Color.palette.primary
                Layout.alignment: Qt.AlignLeft
                font.pixelSize: 14
            }

            Item { Layout.fillWidth: true }

            IconButton {
                icon_name: "close"
                size: 24
                icon_size: root.iconSize
                color: Color.palette.secondary_container
                icon_color: Color.palette.on_secondary_container
                radius: size / 2
                Layout.alignment: Qt.AlignRight
                
                TapHandler {
                    onTapped: root.n.dismiss()
                }
            }
        }

        Rectangle {
            Layout.topMargin: 4
            id: separator
            Layout.fillWidth: true
            Layout.preferredHeight: 1
            color: Color.palette.outline_variant
        }

        RowLayout {
            id: content

            Layout.fillWidth: true

            Image {
                id: image 
                Layout.alignment: Qt.AlignLeft
                source: root.n.image
                fillMode: Image.PreserveAspectCrop
                Layout.preferredHeight: root.imageSize
                Layout.preferredWidth: root.imageSize
                asynchronous: true
                visible: root.n.image != "" 
            }
            
            ColumnLayout {
                id: title_body

                Layout.fillWidth: true
                spacing: 8

                Text {
                    text: root.n.summary
                    color: Color.palette.on_surface
                    font.pixelSize: 16
                    elide: Text.ElideRight
                    Layout.fillWidth: true
                }

                Text {
                    text: root.n.body
                    color: Color.palette.outline
                    wrapMode: Text.WordWrap
                    maximumLineCount: 6 
                    elide: Text.ElideRight
                    Layout.fillWidth: true
                }
            }
        }

        RowLayout {
            Layout.fillWidth: true
            spacing: 16
            Repeater {
                id: actions

                model: root.n.actions
                delegate: Rectangle {
                    required property NotificationAction modelData
                    id: action 
    
                    Layout.fillWidth: true

                    color: Color.palette.secondary_container
                    implicitHeight: 24
                    radius: 8 

                    Text {
                        id: actionText
                        text: action.modelData.text
                        anchors.centerIn: parent
                        color: Color.palette.on_secondary_container
                    }

                    TapHandler {
                        onTapped: action.modelData.invoke()
                    }
                }
            }
        }
    }
}
