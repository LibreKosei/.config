pragma ComponentBehavior: Bound
pragma Singleton

import QtQuick
import Quickshell
import Quickshell.Networking

Singleton {
    id: root

    // property WifiDevice currentWifiDevice: null
    // property WifiNetwork currentWifi: null

    property WifiDevice wDev: [...Networking.devices.values].find(n => n.connected) ?? null 
    property WifiNetwork wifi: wDev ? [...wDev.networks.values].find(n => n.connected) ?? null : null
    property real wSignalStrength: Math.round(wifi.signalStrength * 100)

    readonly property var wifiIconName: {
        if (!root.wifi) return "signal_disconnected"

        if (75 <= root.wSignalStrength) return "android_wifi_3_bar_plus"
        if (50 <= root.wSignalStrength) return "wifi"
        if (25 <= root.wSignalStrength) return "wifi_2_bar"
        return "wifi_1_bar"
    }

    // function updateCurrentWifi() {
    //     if (!currentWifiDevice) {
    //         currentWifi = null
    //         return
    //     }
    //
    //     const connected =
    //         currentWifiDevice.networks.values.find(n => n.connected) ?? null
    //
    //     currentWifi = connected
    // }
    //
    // function attachNetwork(network) {
    //     network.connectedChanged.connect(updateCurrentWifi)
    // }
    //
    // function detachNetwork(network) {
    //     network.connectedChanged.disconnect(updateCurrentWifi)
    // }
    //
    // function attachAllNetworks() {
    //     if (!currentWifiDevice) return
    //
    //     for (const n of currentWifiDevice.networks.values) {
    //         attachNetwork(n)
    //     }
    //
    //     updateCurrentWifi()
    // }
    //
    // function detachAllNetworks() {
    //     if (!currentWifiDevice) return
    //
    //     for (const n of currentWifiDevice.networks.values) {
    //         detachNetwork(n)
    //     }
    // }
    //
    // // Devices
    // Connections {
    //     target: Networking.devices
    //
    //     function onObjectInsertedPost(dev) {
    //         if (dev.type !== DeviceType.Wifi) return
    //         root.currentWifiDevice = dev
    //     }
    //
    //     function onObjectRemovedPost(dev) {
    //         if (dev !== root.currentWifiDevice) return
    //         root.detachAllNetworks()
    //         root.currentWifiDevice = null
    //         root.currentWifi = null
    //     }
    // }
    //
    // // Device change
    // onCurrentWifiDeviceChanged: {
    //     detachAllNetworks()
    //     attachAllNetworks()
    // }
    //
    // // Networks added / removed
    // Connections {
    //     target: root.currentWifiDevice
    //         ? root.currentWifiDevice.networks
    //         : null
    //
    //     function onObjectInsertedPost(network) {
    //         root.attachNetwork(network)
    //         root.updateCurrentWifi()
    //     }
    //
    //     function onObjectRemovedPost(network) {
    //         root.detachNetwork(network)
    //         root.updateCurrentWifi()
    //     }
    // }
}
