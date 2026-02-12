import QtQuick
import Quickshell.Networking

QtObject {
    id: tracker

    property WifiDevice device: null
    property WifiNetwork connectedNetwork: null

    onDeviceChanged: {
        if (!device) return
        update()
    }

    function update() {
        connectedNetwork = device ? device.networks.values.find(n => n.connected) : null
    }

    function attach(n) {
        n.connectedChanged.connect(update)
    }

    function detach(n) {
        n.connectedChanged.connect(update)
    }
}
