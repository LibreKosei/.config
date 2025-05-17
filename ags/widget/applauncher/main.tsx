import { Variable } from "astal"
import { App, Astal, Gdk, Gtk } from "astal/gtk4"
import Apps from "gi://AstalApps"
import { PopupWindow } from "../PopupWindow"
import { FlowBox, Scrollable } from "../../util/astalified"
import Pango from "gi://Pango?version=1.0"

const LAUNCHER_NAME = "applauncher"
const MAX_ITEM = 5

function hide() {
    App.get_window(LAUNCHER_NAME)!.hide()
}

function AppButton({ app }: { app: Apps.Application}) {
    const { CENTER } = Gtk.Align

    return <button
        cssName="app-button"
        onClicked={() => {
            hide()
            app.launch()
        }}
        widthRequest={100}
    >
        <box vertical>
            <image 
                iconName={app.iconName} 
                iconSize={Gtk.IconSize.LARGE}
                valign={CENTER}
                halign={CENTER}
            />
            <label
                valign={CENTER}
                halign={CENTER}
                label={app.name}
                xalign={0.5}
                wrap
                maxWidthChars={10}
                ellipsize={Pango.EllipsizeMode.END}
            />
        </box>
    </button>
}

function chunkArray(array: Apps.Application[]): Apps.Application[][]{
    const result = []

    for (let i = 0; i < array.length; i += MAX_ITEM) {
        result.push(array.slice(i, i + MAX_ITEM))
    }

    return result
}

export const Launcher = () => {
    let apps = new Apps.Apps()

    const text = Variable("")
    const list = text(text => apps.fuzzy_query(text))
    const onEnter = () => {
        apps.fuzzy_query(text.get())?.[0].launch()
        hide()
    }

    const rows = list.as(chunkArray)

    return <PopupWindow
        name={LAUNCHER_NAME}
        exclusivity={Astal.Exclusivity.IGNORE}
        keymode={Astal.Keymode.ON_DEMAND}
        layer={Astal.Layer.OVERLAY}
        application={App}
        animation="slide down"
        onShow={() => {
            apps.reload()
            text.set("")
        }}
        onHide={() => {
            text.set("")
        }}
        onKeyPressed={(self, keyval) => {
            if (keyval == Gdk.KEY_Escape)
                self.hide()
                text.set("")
        }}>
            <box 
                heightRequest={250}
                widthRequest={300}
                vertical
            >
                <entry
                    halign={Gtk.Align.CENTER}
                    placeholderText="Search"
                    text={text.get()}
                    onChanged={self => text.set(self.text)}
                    onActivate={onEnter}
                    xalign={0.5}
                    hexpand={true}
                    setup={(self) => {
                        self.connect("map", () => {
                            self.grab_focus()
                            self.text = "" // This is needed to clear the entry, not sure how I can do this with its buffer
                        })
                    }}
                />
                <Scrollable
                    heightRequest={200}
                    widthRequest={300}
                    hscrollbar-policy={Gtk.PolicyType.NEVER}
                >
                <box vertical>
                    {rows.as(rows => rows.map(row => (
                        <box 
                            homogeneous 
                            halign={Gtk.Align.START} 
                            cssName="row"
                            spacing={5}
                        >
                        {row.map(item => <AppButton app={item} /> )}
                        </box>
                    )))}
                </box>
                </Scrollable>
            </box>
    </PopupWindow>
}
