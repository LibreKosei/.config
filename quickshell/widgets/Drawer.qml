import Quickshell
import QtQuick
import QtQuick.Layouts
import qs.services

Variants {
    model: Quickshell.screens
    delegate: PanelWindow {
        id: shell
        required property ShellScreen modelData

        implicitWidth: modelData.width 
        implicitHeight: modelData.height
        color: "transparent"

        RowLayout {
            anchors.fill: parent

            Image {
                id: wallpaper
                asynchronous: true
                cache: true
                Layout.fillHeight: true
                Layout.fillWidth: true
                source: Config.Wallpaper.getPath()
            }
        }
    }
}
