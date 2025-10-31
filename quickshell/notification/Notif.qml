pragma ComponentBehavior: Bound
import Quickshell
import QtQuick
import Quickshell.Services.Notifications
import Quickshell.Wayland
import QtQuick.Controls

PanelWindow {
    id: root

    property bool expanded: false

    exclusionMode: ExclusionMode.Normal
    WlrLayershell.layer: WlrLayer.Overlay

    visible: server.trackedNotifications.values.length > 0
    color: "transparent"
    implicitHeight: notificationList.implicitHeight
    implicitWidth: notificationList.implicitWidth
    Behavior on implicitHeight {
        NumberAnimation { duration: 150; easing.type: Easing.Linear }
    }

    mask: Region {
        item: notificationList
    }

    anchors {
        top: true
        right: true
    }

    NotificationServer {
        id: server 

        imageSupported: true
        actionsSupported: true
        onNotification: notif => {
            console.log(notif.appName)
            notif.tracked = true
        }
    }

    ListView {
        id: notificationList

        model: server.trackedNotifications
        spacing: 12
        implicitWidth: 400
        implicitHeight: 600
        clip: true

        delegate: Widget {
            required property Notification modelData
            n: modelData
        }
        add: Transition {
            NumberAnimation { properties: "opacity"; from: 0; to: 1; duration: 200 }
            NumberAnimation { properties: "x"; from: width; to: 0; duration: 200; easing.type: Easing.OutCubic }
        }

        remove: Transition {
            ParallelAnimation {
                NumberAnimation { properties: "opacity"; to: 0; duration: 150 }
                NumberAnimation { properties: "x"; to: width; duration: 200; easing.type: Easing.InCubic }
            }
        }

        displaced: Transition {
            NumberAnimation { properties: "y"; duration: 200; easing.type: Easing.OutQuad }
        }       
    }
}
