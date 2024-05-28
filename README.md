### MOON.LUA - 1.0a

## About us
This project offers a completely free and keyless script for Blade Ball. The estimated time of arrival (ETA) for its release is currently unknown. Our goal is to provide a high-quality script that brings satisfaction and enjoyment to our users.
## Goals
- Fully automatic spam
- Effective spam detection
- Keyless operation (for as long as possible)
- Completely free (boosts on the discord are still appreciated)
## discord
https://discord.gg/WTaFGBGyHA

## docs

### Library.CreateLib(options)
- `options`:
  - `bgt`: Background transparency (default: 0).

### window.Tab(options)
- `options`:
  - `name`: Name of the tab.
  - `icon`: Icon for the tab (Roblox asset id).

### tab.Button(options)
- `options`:
  - `name`: Name of the button.
  - `callback`: Function to call when the button is clicked.

### tab.Toggle(options)
- `options`:
  - `name`: Name of the toggle.
  - `callback`: Function to call when the toggle state changes. Receives a boolean parameter `state`.

### tab.Label(options)
- `options`:
  - `text`: Text to display in the label.

### tab.Dropdown(options)
- `options`:
  - `name`: Name of the dropdown.

### dropdown.Add(id, name)
- `id`: Identifier for the dropdown item.
- `name`: Name of the dropdown item.

### window.Notify(options)
- `options`:
  - `title`: Title of the notification.
  - `desc`: Description of the notification.
  - `icon`: Icon for the Notification (Roblox asset id).

## Example Usage
```lua
local window = Moon.CreateLib({
	bgt = 0, -- default
})
local tab = window.Tab({
	name = "Tab",
	icon = "rbxid thing"
})
local btn = tab.Button({
	name = "Button",
	callback = function() end
})
local tog = tab.Toggle({
	name = "Toggle",
	callback = function(b) end
})
local label = tab.Label({
	text = "Label"
})
local dropdown = tab.Dropdown({
	name = "Dropdown"
})
dropdown.Add(1, "name")
local notif = window.Notify({
	title = "Notification",
	desc = "Description",
})
```
