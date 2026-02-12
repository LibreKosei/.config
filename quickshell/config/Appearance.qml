pragma Singleton
import Quickshell
import QtQuick
import qs.theme 

Singleton {
    id: root

    property alias notification: notification
    property alias launcher: launcher

    QtObject {
        id: notification
        property real width: height * 1.6
        property real height: 180
        property bool dnd: false

        property var title: QtObject {
            property color color: Everblush.whiteForeground
            property real pixelSize: 24
        } 
    }

    QtObject {
        id: launcher
        property real width: 400
        property real height: 500
    }
}
