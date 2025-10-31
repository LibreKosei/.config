pragma ComponentBehavior: Bound
import QtQuick
import QtQuick.Layouts
import Quickshell.Services.Pipewire
import qs

Rectangle {
    id: root
    required property PwNode node;
    property string fgColor: Color.palette.primary
    implicitWidth: volIcon.implicitWidth + vol.implicitWidth
    height: row.implicitHeight
    color: "transparent"

    PwObjectTracker { objects: [ root.node] }

    Component.onCompleted: {
        console.log("width of audio indicator: " + root.implicitWidth)
        console.log("volIcon implicitWidth: " + volIcon.implicitWidth)
        console.log("vol implicitWidth: " + vol.implicitWidth)
        console.log("row implicitWidth: " + row.implicitWidth)
    }
    RowLayout {
        id: row
        anchors.fill: parent
        spacing: 4

        Material {
            id: volIcon
            text: {
                const audio = Math.floor(root.node?.audio.volume * 100)
                const icon = [
                    [101, "sound_detection_loud_sound"],
                    [67, "volume_up"],
                    [34, "volume_down"],
                    [1, "volume_mute"],
                    [0, "volume_off"]
                ].find( ([threshould]) => Number(threshould) <= audio)?.[1]
                if (root.node?.audio.muted) {
                    return "volume_off"
                } else {
                    return String(icon)
                }
            }
            size: 28
            color: root.fgColor
        }

        Text {
            id: vol
            text: Math.floor(root.node?.audio.volume * 100)
            color: root.fgColor
        }
    }
}
