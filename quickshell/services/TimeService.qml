pragma Singleton

import Quickshell
import QtQuick

Singleton {
    readonly property string currentTime: Qt.formatDateTime(clock.date, "hh:mm")

    SystemClock {
        id: clock 
        precision: SystemClock.Minutes
    }
}
