pragma ComponentBehavior: Bound
import Quickshell
import QtQuick
import Quickshell.Services.Notifications
import Quickshell.Wayland
import QtQuick.Controls
import qs.config

// qmllint disable uncreatable-type
PanelWindow {
    id: root

    exclusionMode: ExclusionMode.Normal
    WlrLayershell.layer: WlrLayer.Overlay

    visible: server.trackedNotifications.values.length > 0
    color: "transparent"
    implicitHeight: notificationList.implicitHeight
    implicitWidth: notificationList.implicitWidth

    mask: Region {
        item: notificationList
    }

    anchors {
        right: true
        top: true
    }
    // qmllint disable missing-property unresolved-type unqualified
    margins.right: 50
    margins.top: 50
    // qmllint enable
    NotificationServer {
        id: server 

        imageSupported: true
        actionsSupported: true
        actionIconsSupported: true
        onNotification: notif => {
            notif.tracked = true
        }
    }

    ListView {
        id: notificationList

        model: server.trackedNotifications
        spacing: 12
        implicitWidth: Appearance.notification.width + 16
        implicitHeight: Appearance.notification.height * count + spacing * (count)
        clip: true
        visible: !Appearance.notification.dnd

        delegate: Widget {
            anchors.horizontalCenter: parent.horizontalCenter
            required property Notification modelData
            required property int index
            visible: index < 3
            n: modelData
        }
    }
}
