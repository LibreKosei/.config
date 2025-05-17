import { monitorFile, timeout } from "astal"
import { current_wallpaper } from "../config/paths"
import { cat, matugen } from "../config/executables"

const DELAY = 300

export function initTheme() {
    cat(current_wallpaper).then(out => {
        timeout(DELAY, () => matugen(out))
    })        
}
export function monitorSwww() {

    monitorFile(
        current_wallpaper,
        (file, _) => {
            timeout(DELAY, () => {
                cat(file).then(out => {
                    print(out)
                    timeout(DELAY, () => matugen(out))
                })
            })
        }
    )
}
