import QtQuick
import Quickshell.Bluetooth
import qs

Material {
    size: 24
    readonly property BluetoothAdapter default_adapter: Bluetooth.defaultAdapter
    text: default_adapter?.enabled ? "bluetooth" : "bluetooth_disabled"
    color: Color.palette.primary
}
