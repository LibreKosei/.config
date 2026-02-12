pragma Singleton
import Quickshell
import QtQuick

Singleton {
    id: root
    property alias persistent: persistent

    PersistentProperties {
        id: persistent 
        reloadableId: "persistentStates"
        property bool showLauncher: false
    }
}
