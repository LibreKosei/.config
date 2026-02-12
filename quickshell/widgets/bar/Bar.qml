import Quickshell
import QtQuick
import QtQuick.Layouts
import qs.services
import qs.widgets.common

Rectangle {
    id: bar

    property real barMargin: 0
    property real itemSpace: 16

    required property ShellScreen screen 
    
    readonly property real barHeight: screen.height / 20
    readonly property real barWidth : screen.width - barMargin
    
    FlexboxLayout {
        id: barLayout

        anchors.fill: parent
        direction: FlexboxLayout.Row
        justifyContent: FlexboxLayout.JustifySpaceBetween
        
        IndicatorIcon {
            source: `${Quickshell.shellDir}/assets/${BatteryService.getSvg()}`
            size: 24
        }
    }
}
