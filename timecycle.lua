--- MenuV Menu
---@type Menu
local menu = MenuV:CreateMenu(false, 'Timecycle Modifiers', 'topright', 255, 0, 0, 'size-125', 'example', 'menuv', 'timecycle_home')
local menu2 = MenuV:CreateMenu(false, 'Timecycle Modifiers', 'topright', 255, 0, 0, 'size-125', 'example', 'menuv', 'timecycle_list')

local menu_button = menu:AddButton({ icon = '🔆', label = 'View Timecycles', value = menu2, description = 'Opens a list of available timecycles to test.' })
local default_button = menu:AddButton({ icon = '↩️', label = 'Reset to Default', value = default_button, description = 'Resets timecycle to default.' })
local slider = menu2:AddSlider({
    icon = '🔆',
    label = 'Timecycle',
    value = 'demo',
    values = {}
})

menu:On('select', function()
    for _, v in pairs(timecycles) do
        slider.AddValue(slider, { label = v, value = v, description = v })
    end
end)

--- Events
slider:On('change', function(item, value)
    SetTimecycleModifier(timecycles[value])
end)

default_button:On('select', function(item)
    SetTimecycleModifier('default')
end)

RegisterCommand("timecycle", function()
    MenuV:OpenMenu(menu)
end, true)
