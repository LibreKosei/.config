pragma ComponentBehavior: Bound
pragma Singleton

import QtQuick
import Quickshell
import Quickshell.Networking

Singleton {
    id: root

    // property WifiDevice currentWifiDevice: null
    // property WifiNetwork currentWifi: null

    readonly property string iconPath: Quickshell.shellPath("assets/wifi/")

    property WifiDevice wDev: [...Networking.devices.values].find(n => n.connected) ?? null 
    property WifiNetwork wifi: wDev ? [...wDev.networks.values].find(n => n.connected) ?? null : null
    readonly property real wSignalStrength: Math.round(wifi.signalStrength * 100)

    readonly property var wifiIconName: {
        if (!root.wifi) return "signal_disconnected"

        if (75 <= root.wSignalStrength) return "android_wifi_3_bar_plus"
        if (50 <= root.wSignalStrength) return "wifi"
        if (25 <= root.wSignalStrength) return "wifi_2_bar"
        return "wifi_1_bar"
    }

    readonly property var icon: {
        if (!root.wifi) return root.iconPath + "ds-wifi-off-symbolic"

        if (80 <= root.wSignalStrength) return root.iconPath + "ds-wifi-1-symbolic"
        if (60 <= root.wSignalStrength) return root.iconPath + "ds-wifi-2-symbolic"
        if (40 <= root.wSignalStrength) return root.iconPath + "ds-wifi-3-symbolic"
        if (20 <= root.wSignalStrength) return root.iconPath + "ds-wifi-4-symbolic"
        return root.iconPath + "ds-wifi-5-symbolic"
    }

}
