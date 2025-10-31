pragma Singleton
import Quickshell
import Quickshell.Services.UPower

Singleton {
    id: root

    readonly property UPowerDevice device: UPower.devices.values.find(device => device.isLaptopBattery) ?? null
    readonly property real batteryLevel: Math.round(device?.percentage * 100)
    readonly property bool isCharging: device?.state === UPowerDeviceState.Charging

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
