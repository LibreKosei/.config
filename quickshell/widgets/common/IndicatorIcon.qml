import QtQuick
import Quickshell
import Quickshell.Widgets

IconImage {
    id: root

    required property string source
    required property real size

    asynchronous: true
    source: root.source
    implicitSize: size

}
