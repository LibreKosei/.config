import QtQuick

Text {
    id: root

    readonly property alias metric: metric

    property string fontFamily: "JetBrains Nerd Mono"
    property string maximumString: "100"

    font.pixelSize: 14
    font.features: { "tnum": 1 }
    color: "white"
    width: metric.width
    horizontalAlignment: Text.AlignRight

    TextMetrics {
        id: metric 
        font.family: root.fontFamily
        font.features: { "tnum": 1 }
        text: root.maximumString
    }
}
