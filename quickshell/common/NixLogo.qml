import QtQuick
import QtQuick.Layouts
import Quickshell.Widgets
import Quickshell
import QtQuick.Effects
import qs
IconImage {
    id: root
    property string color: Color.palette.primary
    Layout.alignment: Qt.AlignLeft
    source: Quickshell.iconPath("nix-snowflake")
    Layout.preferredWidth: 32 
    Layout.preferredHeight: 32
    asynchronous: true

    transformOrigin: Item.Center

    TapHandler {
        cursorShape: Qt.PointingHandCursor
        onTapped: {
            rotationAnim.start()
        }
    }

    MultiEffect {
        anchors.fill: parent
        source: root
        colorization: 1.0
        colorizationColor: root.color
    }

    RotationAnimator {
        id: rotationAnim 
        target: root
        from: 0 
        to: 360 
        duration: 300
        easing.type: Easing.InOutQuad
        onStopped: Quickshell.reload(true)
    }
}
