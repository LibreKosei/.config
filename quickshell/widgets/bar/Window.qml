import Quickshell
import QtQuick

// qmllint disable uncreatable-type
PanelWindow {
    // qmllint enable
    id: root 
    
    required property ShellScreen targetScreen
    
    screen: targetScreen

    anchors {
        top: true
        right: true
        left: true
    }

    color: "transparent"

    implicitWidth: bar.implicitWidth 
    implicitHeight: bar.implicitHeight + 16

    Bar {
        id: bar 
        screen: root.targetScreen
    }
}
