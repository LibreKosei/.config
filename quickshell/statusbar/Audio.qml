pragma ComponentBehavior: Bound
import QtQuick
import QtQuick.Layouts
import Quickshell.Services.Pipewire
import qs
import qs.services

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
            text: AudioService.getAudioIcon()
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
