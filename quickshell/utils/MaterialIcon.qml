import Quickshell
import QtQuick
import Quickshell.Widgets

IconImage {
    required property string icon_name
    // source: `file://home/kosei/.config/quickshell/assets/${icon_name}`
    source: `file://${Quickshell.env("HOME")}/.config/quickshell/assets/${icon_name}`
    width: 24 
    height: 24
}
