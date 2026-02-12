pragma Singleton

import Quickshell
import QtQuick
import qs

Singleton {
    id: config 

    property alias wallpaper: wallpapaper
    property alias bar: bar

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
    
    QtObject {
        id: bar 
        property real height: 80
        property real width: 1920
        property string bgColor: Color.palette.surface_variant
        property string containerColor: Color.palette.primary_container
        property string onContainerColor: Color.palette.on_primary_container
        property real containerTextSize: 16
        property real iconSize: 36
    }
}
