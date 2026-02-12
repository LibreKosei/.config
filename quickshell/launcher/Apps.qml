import Quickshell
import QtQuick
import Quickshell.Wayland
import qs

PanelWindow {
    id: root

    property real MIN_HEIGHT: 500
    property real MIN_WIDTH: 300

    exclusionMode: ExclusionMode.Normal
    WlrLayershell.layer: WlrLayer.Overlay
    
    visible: false
    color: Color.palette.surface


    ListView {
        id: apps

        implicitWidth: root.MIN_WIDTH
        implicitHeight: root.MIN_HEIGHT
    }
}
