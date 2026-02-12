pragma Singleton
pragma ComponentBehavior: Bound

import Quickshell
import Quickshell.Io

Singleton {
    id: root
    property alias palette: jsonColorContent

    FileView {
        id: themeFile
        path: Quickshell.shellPath("/settings/colours.json")

        watchChanges: true
        onFileChanged: reload()
        onAdapterUpdated: writeAdapter()

        onLoadFailed: function (error) {
            console.log(error)
        }

        // onLoaded: console.log(root.palette.primary)
        adapter: jsonColorContent
    }

    JsonAdapter {
        id: jsonColorContent
        property string background: "#0f1417"
        property string error: "#ffb4ab"
        property string error_container: "#93000a"
        property string inverse_on_surface: "#2c3134"
        property string inverse_primary: "#1e6586"
        property string inverse_surface: "#dfe3e7"
        property string on_background: "#dfe3e7"
        property string on_error: "#690005"
        property string on_error_container: "#ffdad6"
        property string on_primary: "#00344a"
        property string on_primary_container: "#c5e7ff"
        property string on_primary_fixed: "#001e2d"
        property string on_primary_fixed_variant: "#004c6a"
        property string on_secondary: "#20333e"
        property string on_secondary_container: "#d1e5f4"
        property string on_secondary_fixed: "#0a1e28"
        property string on_secondary_fixed_variant: "#374955"
        property string on_surface: "#dfe3e7"
        property string on_surface_variant: "#c1c7ce"
        property string on_tertiary: "#322c4c"
        property string on_tertiary_container: "#e7deff"
        property string on_tertiary_fixed: "#1d1735"
        property string on_tertiary_fixed_variant: "#494263"
        property string outline: "#8b9297"
        property string outline_variant: "#41484d"
        property string primary: "#90cef4"
        property string primary_container: "#004c6a"
        property string primary_fixed: "#c5e7ff"
        property string primary_fixed_dim: "#90cef4"
        property string scrim: "#000000"
        property string secondary: "#b6c9d8"
        property string secondary_container: "#374955"
        property string secondary_fixed: "#d1e5f4"
        property string secondary_fixed_dim: "#b6c9d8"
        property string shadow: "#000000"
        property string source_color: "#e0e6ec"
        property string surface: "#0f1417"
        property string surface_bright: "#353a3d"
        property string surface_container: "#1c2023"
        property string surface_container_high: "#262b2e"
        property string surface_container_highest: "#313539"
        property string surface_container_low: "#181c1f"
        property string surface_container_lowest: "#0a0f12"
        property string surface_dim: "#0f1417"
        property string surface_tint: "#90cef4"
        property string surface_variant: "#41484d"
        property string tertiary: "#cbc1e9"
        property string tertiary_container: "#494263"
        property string tertiary_fixed: "#e7deff"
        property string tertiary_fixed_dim: "#cbc1e9"
        property string useless: ""

        // onPrimaryChanged: console.log("Primary property changed!")
    }
}
