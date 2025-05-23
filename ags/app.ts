import { App } from "astal/gtk4"
import style from "./style.scss"
import { Bar } from "./widget/bar/main"
import { execAsync, monitorFile } from "astal"
import { NotificationPopup } from "./widget/notification/notifPopups"
import { windowAnimation } from "./util/hyprland"
import { Menu } from "./widget/menu/main"
import { initTheme, monitorSwww } from "./util/theme"
import { exec } from "astal/process"
import { Launcher } from "./widget/applauncher/main"

const scss = "./style/style.scss"
const css = "/tmp/gtkstyle.css"

execAsync(`sass ${scss} ${css}`)

App.start({
    iconTheme: "Papirus",
    css: style,
    main() {
        exec(`sass ${scss} ${css}`)
        App.apply_css(css)
        App.get_monitors().map(Bar)
        App.get_monitors().map(NotificationPopup)
        App.get_monitors().map(Menu)
        App.get_monitors().map(Launcher)

        windowAnimation()
        monitorFile("./style/", () => {
            exec(`sass ${scss} ${css}`)
            App.reset_css()
            App.apply_css(css)
            windowAnimation()
        })
        
        monitorSwww()
    },
})
