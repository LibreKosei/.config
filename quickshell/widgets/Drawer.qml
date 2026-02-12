import Quickshell
import QtQuick
import QtQuick.Layouts
import Quickshell.Io
import Quickshell.Wayland
import qs.services
import qs.widgets.bar
import qs.widgets.launcher
import qs.config
import qs.widgets.notification as NotificationWindow

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
        // qmllint disable uncreatable-type
        PanelWindow {
            // qmllint enable
            id: bar
            screen: shell.modelData
            anchors {
                    top: true
                    left: true
                    right: true
                }
            color: "transparent"
            implicitHeight: Config.bar.height + 16
            implicitWidth: Config.bar.width
            Bar {
                screen: shell.modelData
            }
        }

        NotificationWindow.Window {}

        // qmllint disable uncreatable-type
        PanelWindow {
            // qmllint enable
            id: launcherPanel
            screen: shell.modelData
            anchors {
                left: true
                top: true
            }
            margins.left: 50
            margins.top: 50
            exclusionMode: ExclusionMode.Normal
            WlrLayershell.layer: WlrLayer.Overlay
            WlrLayershell.keyboardFocus: WlrKeyboardFocus.Exclusive
            implicitWidth: 400 + 16
            implicitHeight: 500 + 16
            visible: Configuration.persistent.showLauncher
            color: "transparent"

            Launcher {
                id: launcher
                Keys.onPressed: (event) => {
                    if (event.key === Qt.Key_Escape) {
                        event.accepted = true
                        console.log("Escape key captured!")
                        Configuration.persistent.showLauncher = false
                    }
                }
                
                IpcHandler {
                    id: handler
                    target: "launcher-panel"
                    function toggle() {
                        Configuration.persistent.showLauncher = !(Configuration.persistent.showLauncher)
                    }
                }
            }
        }
    }
}
