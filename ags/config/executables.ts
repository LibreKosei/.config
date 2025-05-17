import { exec, execAsync, GLib } from "astal";

export const matugen = (path: string) => {
    execAsync(`matugen image ${path}`)
}

export const cat = (path: string) => {
    return execAsync(`cat ${path}`)
}
