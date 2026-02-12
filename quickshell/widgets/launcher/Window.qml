import QtQuick
import Quickshell
import Quickshell.Wayland
import Quickshell.Io
import qs.config

// qmllint disable uncreatable-type
PanelWindow {
    // qmllint enable
    id: root

    required property ShellScreen targetScreen

    screen: targetScreen
    exclusionMode: ExclusionMode.Normal
    WlrLayershell.layer: WlrLayer.Overlay
    WlrLayershell.keyboardFocus: WlrKeyboardFocus.Exclusive

    visible: Configuration.persistent.showLauncher

    implicitWidth: 400 + 16
    implicitHeight: 500 + 16
    color: "transparent"

    anchors {
        top: true
        left: true
    }
    
    // qmllint disable missing-property unresolved-type unqualified
    margins.top: 50
    margins.left: 50
    // qmllint enable
    
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
