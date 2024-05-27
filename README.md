# Moon.lua
Moon-UI 99% Complete

===== Docs =====

Importing the library
```lua
local Library = loadstring(game:HttpGet(('https://raw.githubusercontent.com/ImNotACoderAi/Moon.lua/main/Main.lua')))()
```

Creating a window

```lua
local window = Library.CreateLib()
# args
<
none
>
```

Creating a Tab

```lua
local tab = window.Tab()
# args
<
name - name of the tab
icon - the icon show beside the tab
>
```

Creating a Button

```lua
local button = tab.Button()
# args
<
name - name of the Button
callback - takes a function for example "function() print("button was clicked") end"
>
```

Creating a Toggle

```lua
local Toggle = tab.Toggle()
# args
<
name - name of the Toggle
callback - takes a function for example "function(b)
  if b == true then
    print("on")
  else
    print("off")
  end
end"
>
```

Creating a Slider

```lua
local Slider = tab.Slider()
# args
<
name - name of the Slider
callback - takes a function for example "function(v)
  if v == 100 then
    print("max")
  elseif v == 0 then
    print("min")
end"
>
# methods
<
SetValue - sets the text call this by Label:SetValue(0 - 100)
>
```

Creating a Label

```lua
local Label = tab.Label()
# args
<
text - text inside the label
>
# methods
<
SetText - sets the text call this by Label:SetText("text")
>
```

Creating a Dropdown

```lua
local Dropdown = tab.Dropdown()
# args
<
name - name of the dropdown
>
# methods
<
Dropdown.Add(id, value) - adds a option to the dropdown for example dropdown.add(1, "option 1")
Dropdown.Remove(id)
Dropdown.Clear()
>
```
