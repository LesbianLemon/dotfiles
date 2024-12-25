import PanelButton from "../PanelButton"
import options from "options"
import nix from "service/nix"

const { icon, label, action } = options.bar.launcher

function DistroIcon() {
    const child = Widget.Icon({
        icon: icon.icon.bind(),
        class_name: icon.colored.bind(),
    })

    return Widget.Revealer({
        transition: "slide_left",
        child,
        reveal_child: icon.icon.bind(),
    })
}

export default () => PanelButton({
    window: "launcher",
    on_clicked: action.bind(),
    child: Widget.Box([
        DistroIcon(),
        Widget.Label({
            class_name: label.colored.bind().as(c => c ? "colored" : ""),
            visible: label.label.bind().as(v => !!v),
            label: label.label.bind(),
        }),
    ]),
})
