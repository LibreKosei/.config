pragma ComponentBehavior: Bound
pragma Singleton

import QtQuick
import Quickshell
import Quickshell.Networking

Singleton {
    id: root

    property WifiDevice currentWifiDevice: null

    WifiTracker {
        id: tracker 
        device: root.currentWifiDevice
    }

    property WifiNetwork currentWifi: tracker.connectedNetwork


    readonly property var wifiIconName: {
        if (!currentWifi) return "signal_disconnected"

        const s = Math.round(currentWifi.signalStrength * 100)
        if (75 <= s) return "android_wifi_3_bar_plus"
        if (50 <= s) return "wifi"
        if (25 <= s) return "wifi_2_bar"
        return "wifi_1_bar"
    }

    function updateCurrentWifi() {
        if (!currentWifiDevice) {
            currentWifi = null
            return
        }

        const connected =
            currentWifiDevice.networks.values.find(n => n.connected) ?? null

        currentWifi = connected
    }

    function attachNetwork(network) {
        network.connectedChanged.connect(updateCurrentWifi)
    }

    function detachNetwork(network) {
        network.connectedChanged.disconnect(updateCurrentWifi)
    }

    function attachAllNetworks() {
        if (!currentWifiDevice) return

        for (const n of currentWifiDevice.networks.values) {
            attachNetwork(n)
        }

        updateCurrentWifi()
    }

    function detachAllNetworks() {
        if (!currentWifiDevice) return

        for (const n of currentWifiDevice.networks.values) {
            detachNetwork(n)
        }
    }

    // Devices
    Connections {
        target: Networking.devices

        function onObjectInsertedPost(dev) {
            if (dev.type !== DeviceType.Wifi) return
            root.currentWifiDevice = dev
        }

        function onObjectRemovedPost(dev) {
            if (dev !== root.currentWifiDevice) return
            root.detachAllNetworks()
            root.currentWifiDevice = null
            root.currentWifi = null
        }
    }

    // Device change
    onCurrentWifiDeviceChanged: {
        detachAllNetworks()
        attachAllNetworks()
    }

    // Networks added / removed
    Connections {
        target: root.currentWifiDevice
            ? root.currentWifiDevice.networks
            : null

        function onObjectInsertedPost(network) {
            tracker.attach(network)
            tracker.update()
        }

        function onObjectRemovedPost(network) {
            tracker.detach(network)
            tracker.update()
        }
    }
}
