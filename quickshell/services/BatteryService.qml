pragma Singleton
import Quickshell
import Quickshell.Services.UPower

Singleton {
    id: root
    
    function getIconPath(name: string): string {
        return (Quickshell.shellPath("assets/bat/") + name)
    }

    readonly property string icon: {
        if (!device) {
            return "battery-warning"
        }
        if (isCharging) {
            return "battery-charging"
        }
        if (batteryLevel >= 80) {
            return "battery-full"
        }
        if (batteryLevel >= 33) {
            return "battery-medium"
        }
        if (batteryLevel >= 25) {
            return "battery-low"
        }
        if (batteryLevel >= 15) {
            return "battery-warning"
        }
        return "battery-warning"
    }

    readonly property UPowerDevice device: UPower.devices.values.find(device => device.isLaptopBattery) ?? null
    readonly property real batteryLevel: Math.round(device?.percentage * 100)
    readonly property bool isCharging: device?.state === UPowerDeviceState.Charging

    function getNativeIcon() {
        if (!device) {
            return "battery-missing-symbolic"
        }
        return device.iconName
    }

    function getSvg() {
        if (isCharging) {
            return "battery-charging-symbolic"
        }
        if (!isCharging) {
            if (batteryLevel >= 66) {
                return "battery-full-symbolic"
            }
            if (batteryLevel >= 33) {
                return "battery-medium-symbolic"
            }
            if (batteryLevel >= 10) {
                return "battery-low-symbolic"
            }
            return "battery-warning-symbolic"
        }
    }
    function getIcon() {
        if (isCharging) {
            if (batteryLevel >= 90) {
                return "battery_charging_full"
            }
            if (batteryLevel >= 80) {
                return "battery_charging_90"
            }
            if (batteryLevel >= 60) {
                return "battery_charging_80"
            }
            if (batteryLevel >= 50) {
                return "battery_charging_60"
            }
            if (batteryLevel >= 30) {
                return "battery_charging_50"
            }
            if (batteryLevel >= 20) {
                return "battery_charging_30"
            }
            return "battery_charging_20"
        }
        if (batteryLevel >= 95) {
            return "battery_full"
        }
        if (batteryLevel >= 85) {
            return "battery_6_bar"
        }
        if (batteryLevel >= 70) {
            return "battery_5_bar"
        }
        if (batteryLevel >= 55) {
            return "battery_4_bar"
        }
        if (batteryLevel >= 40) {
            return "battery_3_bar"
        }
        if (batteryLevel >= 25) {
            return "battery_2_bar"
        }
        return "battery_1_bar"
    }
}
