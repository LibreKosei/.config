pragma Singleton

import Quickshell
import QtQuick

Singleton {
    id: config 

    property alias Wallpaper: wallpapaper

    QtObject {
        id: wallpapaper
        property string name: "kiwi_chocolate"
        property string storage: ""
        function getPath(): url {
            if (storage === "") {
                return `${Quickshell.shellDir}/assets/wallpapers/${name}`
            }
            else return `${storage}/name`
        }
    }
    
}
