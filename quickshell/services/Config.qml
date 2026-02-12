pragma Singleton
import Quickshell
import QtQuick

Singleton {
    id: config 

    property alias wallpaper: wallpapaper

    QtObject {
        id: wallpapaper
        property string name: "Mountain"
        property string storage: ""
        function getPath(): string {
            if (storage === "") {
                return `${Quickshell.shellDir}/assets/wallpapers/${name}`
            }
            else return `${storage}/name`
        }
    }
}
