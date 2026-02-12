pragma Singleton
import QtQuick
import Quickshell

Singleton {
    id: root

    property int basePixel: 16
    property real regular: 400
    
    function rem(count: int): real {
        return count * basePixel
    }

    readonly property real label01: rem(1)
    readonly property real label02: rem(1.2)
    readonly property real label03: rem(1.5)
}
