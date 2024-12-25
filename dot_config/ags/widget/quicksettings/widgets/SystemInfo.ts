import icons from "lib/icons.js"

const divide = ([total, free]) => free / total

type Type = "cpu" | "ram" | "disk"

const CpuUsage = Variable(0, {
    poll: [2000, "top -b -n 1", out => divide([100, out.split("\n")
        .find(line => line.includes("Cpu(s)"))
        .split(/\s+/)[1]
        .replace(",", ".")])],
})

const RamUsage = Variable(0, {
    poll: [2000, "free", out => divide(out.split("\n")
        .find(line => line.includes("Mem:"))
        .split(/\s+/)
        .splice(1, 2))],
})

const DiskUsage = Variable(0, {
	poll: [2000, "df -hl --output=pcent,target", out => divide([100, out.split("\n")
		.find(line => /\/$/.test(line))
		.trim()
		.split(/\s+/)[0]
		.replace("%", "")])]
})

const UsageCircular = (usage: Variable, type: Type) => Widget.CircularProgress({
	class_name: "usage-circular-progress",
	hpack: "center",
	vpack: "fill",
	hexpand: true,
	value: usage.bind(),
	rounded: true,
	startAt: 0.75,
	child: Widget.Icon({
		icon: icons.system[type],
		tooltip_text: `${type.charAt(0).toUpperCase() + type.slice(1)} usage: ${usage.value}`,
	}),
})

export const Cpu = () => Widget.Box({
	class_name: "system-info cpu",
	hpack: "fill",
	children: [
		UsageCircular(CpuUsage, "cpu"),
	],
})

export const Ram = () => Widget.Box({
	class_name: "system-info ram",
	hpack: "fill",
	children: [
		UsageCircular(RamUsage, "ram"),
	],
})

export const Disk = () => Widget.Box({
	class_name: "system-info disk",
	hpack: "fill",
	children: [
		UsageCircular(DiskUsage, "disk")
	],
})
