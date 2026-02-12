import Quickshell
import Quickshell.Hyprland
import QtQuick
import QtQuick.Controls
import qs.theme

Rectangle {
    id: root

    color: "transparent"

    implicitHeight: 48
    implicitWidth: listView.contentWidth

    ListView {
        id: listView
        anchors.fill: parent
        model: Hyprland.workspaces.values
        orientation: ListView.Horizontal

        delegate: Button {
            id: button
            implicitWidth: 48
            implicitHeight: 48

            HoverHandler {
                id: hover
            }

            onPressed: {
                modelData.activate()
            }

            required property HyprlandWorkspace modelData
            icon {
                source: Quickshell.shellPath("assets/workspace/") + ((modelData.id >= 0 && modelData.id < 7) ? "dice-" + `${modelData.id}` : "dices")
                width: 36
                height: 36
                color: modelData.id === Hyprland.focusedWorkspace.id ? Everblush.blue : Everblush.whiteForeground
            }
            background: Rectangle {
                anchors.fill: parent
                color: hover.hovered ? Everblush.background : "transparent"
                
            }
        }
    }
}
