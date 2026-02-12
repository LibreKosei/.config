pragma Singleton
import QtQuick
import Quickshell
import Quickshell.Networking

Singleton {
    id: root

    property WifiDevice wifi_device: Networking.devices.values.find(device => device.connected === true && device.type === DeviceType.Wifi)
    property list<WifiNetwork> wifi_networks: wifi_device.networks.values
    property WifiNetwork current_wifi: wifi_networks.find(network => network.connected === true)

    property real signal_strength: current_wifi.signalStrength * 100
    property bool wifi_enabled: Networking.wifiEnabled
    property bool is_wifi_connected: current_wifi === null ? false : true
    
    property string icon_name: {
        if (!wifi_enabled || !is_wifi_connected) {
            return "wifi_off"
        }
        if (signal_strength >= 50) {
            return "wifi"
        }
        if (signal_strength >= 25) {
            return "wifi_2_bar"
        }
        return "wifi_1_bar"
    }
}
