import Quickshell
import org.kde.kirigami as Kirigami
import Quickshell.Hyprland
import QtQuick
import qs.utils
import qs.theme

Row {
    spacing: 16
    layoutDirection: Qt.RightToLeft
    Repeater {
        model: Hyprland.focusedWorkspace.toplevels.values
        delegate: Kirigami.Icon {
            required property HyprlandToplevel modelData
            source: Quickshell.shellPath("assets/desktop_entry/") + Icons.getCategoryIcon(modelData.wayland?.appId)
            isMask: true
            color: Everblush.magenta
            // source: Quickshell.iconPath(modelData.wayland?.appId, true)
            // fallback: "image-missing-symbolic"
            Component.onCompleted: console.log("Icon name: ", source, " And the fallback: ", fallback)
        }
    }
}
