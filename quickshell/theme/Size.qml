pragma Singleton
import QtQuick
import Quickshell

Singleton {
    id: root

    readonly property int miniUnit: 8 

    function miniUnits(count: int): int {
        return count * root.miniUnit
    }

    readonly property real container01: miniUnits(3)
    readonly property real container02: miniUnits(4)
    readonly property real container03: miniUnits(5)
    readonly property real container04: miniUnits(6)
    readonly property real container05: miniUnits(8)

    readonly property int panel01: miniUnits(15)
    readonly property int panel02: miniUnits(20)
    readonly property int panel03: miniUnits(25)
    readonly property int panel04: miniUnits(30)
    readonly property int panel05: miniUnits(40)

}
