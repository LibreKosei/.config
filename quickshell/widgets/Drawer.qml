import Quickshell
import QtQuick
import Quickshell.Io
import Quickshell.Wayland
import qs.services
import qs.widgets.launcher
import qs.config
import qs.widgets.notification as NotificationWindow
import qs.widgets.bar as BarWindow
import qs.widgets.launcher as LauncherWindow

Variants {
    model: Quickshell.screens
    delegate: PanelWindow {
        id: shell
        required property ShellScreen modelData

        implicitWidth: modelData.width 
        implicitHeight: modelData.height
        color: "transparent"
        WlrLayershell.layer: WlrLayer.Background

        Image {
            id: wallpaper
            asynchronous: false
            anchors.fill: parent
            cache: true
            source: Config.wallpaper.getPath()
        }

        BarWindow.Window {
            targetScreen: shell.modelData
        }

        NotificationWindow.Window {
            screen: shell.modelData
        }

        LauncherWindow.Window {
            targetScreen: shell.modelData
        }

    }
}
