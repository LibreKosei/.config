pragma Singleton

import QtQuick
import Quickshell
import Quickshell.Bluetooth

Singleton {
    id: root

    readonly property BluetoothAdapter currentAdapter: Bluetooth.defaultAdapter
    readonly property var devices: [...currentAdapter.devices.values].filter(d => d.connected === true)
    
    function getIconPath(name: string): string {
        return Quickshell.shellPath("assets/bluetooth/") + name
    }

    readonly property string icon: {
        if (!currentAdapter.enabled) {
            return getIconPath("bluetooth-off")
        }
        if (currentAdapter.enabled) {
            if (currentAdapter.discovering) {
                return getIconPath("bluetooth-searching")
            }
            if (currentAdapter.state === BluetoothAdapterState.Blocked) {
                return getIconPath("bluetooth-x")
            }
            if (devices.length > 0) {
                return getIconPath("bluetooth-connected")
            }
            return getIconPath("bluetooth")
        }
    }
}
