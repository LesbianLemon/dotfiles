import { type Stream } from "types/service/audio"
import { Arrow, Menu } from "../ToggleButton"
import { dependencies, icon, sh } from "lib/utils"
import icons from "lib/icons.js"
const audio = await Service.import("audio")

type Type = "microphone" | "speaker"

const type_icon = (type: Type, muted: boolean = false) => icons.audio[type === "speaker" ? "volume" : "mic"][muted ? "muted" : "high"]	

const VolumeIndicator = (type: Type = "speaker") => Widget.Button({
    vpack: "center",
    on_clicked: () => audio[type].is_muted = !audio[type].is_muted,
	child: Widget.Icon().hook(audio[type], self => {
		const vol = audio[type].volume
		const is_muted = audio[type].is_muted || audio[type].stream?.is_muted

		self.icon = type_icon(type, (vol === 0) || is_muted)
	}),
    tooltipText: audio[type].bind("volume")
        .as(vol => `${type === "microphone" ? "Microphone " : ""}Volume: ${Math.floor(vol * 100)}%`),
})

const VolumeSlider = (type: Type = "speaker") => Widget.Slider({
	draw_value: false,
    hexpand: true,
	value: audio[type].bind("volume"),
    on_change: ({ value, dragging }) => dragging && (audio[type].volume = value),
})

export const Volume = () => Widget.Box({
    class_name: "volume",
    children: [
        VolumeIndicator("speaker"),
        VolumeSlider("speaker"),
        Widget.Box({
            vpack: "center",
            child: Arrow("sink-selector-speaker"),
        }),
        Widget.Box({
            vpack: "center",
            child: Arrow("app-mixer"),
            visible: audio.bind("apps").as(a => a.length > 0),
        }),
    ],
})

export const Microphone = () => Widget.Box({
    class_name: "microphone",
    //visible: audio.bind("recorders").as(a => a.length > 0),
    children: [
        VolumeIndicator("microphone"),
        VolumeSlider("microphone"),
		Widget.Box({
            vpack: "center",
            child: Arrow("sink-selector-microphone"),
        }),
	],
})

const MixerItem = (stream: Stream) => Widget.Box(
    {
        hexpand: true,
        class_name: "mixer-item horizontal",
    },
    Widget.Icon({
        tooltip_text: stream.bind("name").as(n => n || ""),
        icon: stream.bind("name").as(n => {
            return Utils.lookUpIcon(n || "")
                ? (n || "")
                : icons.fallback.audio
        }),
    }),
    Widget.Box(
        { vertical: true },
        Widget.Label({
            xalign: 0,
            truncate: "end",
            max_width_chars: 28,
            label: stream.bind("description").as(d => d || ""),
        }),
        Widget.Slider({
            hexpand: true,
            draw_value: false,
            value: stream.bind("volume"),
            on_change: ({ value }) => stream.volume = value,
        }),
    ),
)

const AudioItem = (stream: Stream, type: Type) => Widget.Button({
    hexpand: true,
    on_clicked: () => audio[type] = stream,
    child: Widget.Box({
        children: [
            Widget.Icon({
                icon: icon(stream.icon_name || "", icons.fallback.audio),
                tooltip_text: stream.icon_name || "",
            }),
            Widget.Label((stream.description || "").split(" ").slice(0, 4).join(" ")),
            Widget.Icon({
                icon: icons.ui.tick,
                hexpand: true,
                hpack: "end",
                visible: audio[type].bind("stream").as(s => s === stream.stream),
            }),
        ],
    }),
})

const SettingsButton = () => Widget.Button({
    on_clicked: () => {
        if (dependencies("pavucontrol"))
            sh("pavucontrol")
    },
    hexpand: true,
    child: Widget.Box({
        children: [
            Widget.Icon(icons.ui.settings),
            Widget.Label("Settings"),
        ],
    }),
})

export const AppMixer = () => Menu({
    name: "app-mixer",
    icon: icons.audio.mixer,
    title: "App Mixer",
    content: [
        Widget.Box({
            vertical: true,
            class_name: "vertical mixer-item-box",
            children: audio.bind("apps").as(a => a.map(MixerItem)),
        }),
        Widget.Separator(),
        SettingsButton(),
    ],
})

const AudioSelector = (type: Type = "speaker") => Menu({
    name: `sink-selector-${type}`,
    icon: type_icon(type, false),
    title: `${type === "speaker" ? "Sink" : "Source"} Selector`,
    content: [
        Widget.Box({
            vertical: true,
            children: audio.bind(type.concat("s")).as(a => a.map(i => AudioItem(i, type))),
        }),
        Widget.Separator(),
        SettingsButton(),
    ],
})

export const SinkSelector = () => AudioSelector("speaker")
export const SourceSelector = () => AudioSelector("microphone")
