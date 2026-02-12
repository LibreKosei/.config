import Quickshell
import QtQuick
import Quickshell.Wayland
import Quickshell.Services.Notifications
// qmllint disable uncreatable-type 
PanelWindow {
    id: root

    exclusionMode: ExclusionMode.Normal
    WlrLayershell.layer: WlrLayer.Overlay

    anchors {
        top: true
        right: true
    }

    // qmllint disable missing-property unresolved-type unqualified
    margins.right: 50
    margins.top: 50
    // qmllint enable

    color: "transparent"
    visible: server.trackedNotifications.values.length > 0
    implicitHeight: list.implicitHeight
    implicitWidth: list.implicitWidth

    mask: Region {
        item: list
    }

    NotificationServer {
        id: server 

        imageSupported: true
        actionsSupported: true
        actionIconsSupported: true
        onNotification: notif => {
            notif.tracked = true
        }
    }

    List { 
        id: list
        model: server.trackedNotifications.values
    }
}
