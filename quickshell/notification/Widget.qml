import Quickshell
import Quickshell.Services.Notifications
import QtQuick
import QtQuick.Layouts
import qs.theme
import qs.utils
import qs.config
import org.kde.kirigami as Kirigami
import QtQuick.Effects


Rectangle {
    id: root

    implicitWidth: Configuration.notification.width
    implicitHeight: n.actions.length > 0 ? Configuration.notification.height : rootLayout.implicitHeight + 16
    radius: propagatedRadius
    color: Configuration.notification.color
    border.color: Qt.darker(Everblush.background, 3.0)

    property int iconSize: 36
    property real imageSize: implicitHeight / 3
    property real propagatedRadius: 16

    required property Notification n
    
    RectangularShadow {
        anchors.fill: root
        offset.x: 4
        offset.y: 6 
        radius: root.propagatedRadius
        spread: 0
        color: Qt.darker(root.color, 1.3)
    }

    ColumnLayout {
        id: rootLayout
        anchors.fill: parent 
        anchors.bottomMargin: 8
        spacing: 16
        anchors.margins: root.border.width

        Rectangle {
            id: header

            color: Everblush.lighterBackground
            Layout.preferredHeight: 40
            Layout.fillWidth: true
            Layout.alignment: Qt.AlignTop
            topLeftRadius: root.propagatedRadius
            topRightRadius: root.propagatedRadius

            RowLayout {
                anchors.fill: parent
                anchors.margins: 8
                spacing: 16

                Rectangle {
                    Layout.fillHeight: true
                    Layout.preferredWidth: 40
                    color: "transparent"
                    Kirigami.Icon {
                        anchors.fill: parent
                        source: Quickshell.shellPath("assets/desktop_entry/") + Icons.getCategoryIcon(root.n.appName)
                        // source: Quickshell.iconPath(root.n.appIcon, "image-missing")
                        Layout.preferredWidth: 36
                        Layout.preferredHeight: 36
                        isMask: true
                        color: Everblush.blue
                    }
                }


                Text {
                    text: root.n.appName
                    color: Everblush.whiteForeground
                    Layout.alignment: Qt.AlignLeft
                    font.pixelSize: 14
                }

                Item { Layout.fillWidth: true }

                Rectangle {
                    id: closeButton
                    Layout.fillHeight: true
                    Layout.preferredWidth: 24
                    color: hoverHandler.hovered ? Qt.darker(Everblush.lighterBackground, 3) : "transparent"
                    Kirigami.Icon {
                        anchors.fill: parent
                        source: Quickshell.shellPath("assets/notification/") + "x"
                        isMask: true
                        color: Everblush.red
                    }
                    MouseArea {
                        anchors.fill: parent
                        onClicked: root.n.dismiss()
                    }
                    HoverHandler {
                        target: parent
                        id: hoverHandler
                    }
                }
            }
        }

        // Rectangle {
        //     Layout.topMargin: 4
        //     id: separator
        //     Layout.fillWidth: true
        //     Layout.preferredHeight: 1
        //     color: Color.palette.outline_variant
        // }

        RowLayout {
            id: content

            Layout.fillWidth: true
            Layout.leftMargin: 8 
            Layout.rightMargin: 8
            spacing: 8

            Image {
                id: image 
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
                Layout.alignment: Qt.AlignTop
                spacing: 8

                Text {
                    text: root.n.summary
                    color: Everblush.green
                    font.pixelSize: 16
                    elide: Text.ElideRight
                    Layout.fillWidth: true
                    font.weight: Font.Medium
                }

                Text {
                    text: root.n.body
                    color: Qt.alpha(Everblush.whiteForeground, 0.7)
                    wrapMode: Text.WordWrap
                    maximumLineCount: 6 
                    elide: Text.ElideRight
                    Layout.fillWidth: true
                    font.pixelSize: 14
                }
            }
        }

        RowLayout {
            Layout.fillWidth: true
            Layout.leftMargin: 16 
            Layout.rightMargin: 16
            spacing: 16
            Repeater {
                id: actions
                model: root.n.actions
                delegate: Rectangle {
                    required property NotificationAction modelData
                    id: action 
    
                    Layout.fillWidth: true

                    color: hover.hovered ? Everblush.lighterBackground : "transparent"
                    implicitHeight: 36
                    radius: 8

                    Text {
                        id: actionText
                        text: action.modelData.text
                        anchors.centerIn: parent
                        color: Everblush.lightGray
                        font.weight: Font.Medium
                        font.pixelSize: 14
                    }

                    TapHandler {
                        onTapped: action.modelData.invoke()
                    }

                    HoverHandler {
                        id: hover
                    }
                }
            }
        }
    }
}
