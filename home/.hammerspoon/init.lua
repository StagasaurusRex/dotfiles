-- Change padding between windows here
xPadding = 5
yPadding = 5

mash    = {"alt", "ctrl", "cmd"}
ctrlAlt = {"alt", "ctrl" }
cmdAlt  = {"cmd", "alt"}

function bindSwitchFocus(mods)
    hs.hotkey.bind(mods, "I", hs.window.filter.focusNorth)
    hs.hotkey.bind(mods, "K", hs.window.filter.focusSouth)
    hs.hotkey.bind(mods, "J", hs.window.filter.focusWest)
    hs.hotkey.bind(mods, "L", hs.window.filter.focusEast)
end

function bindSendToBack(mods)
    hs.hotkey.bind(mods, "O", function()
        hs.window.focusedWindow():sendToBack()
    end)
end

function bindSwitchMonitor(mods)
    hs.hotkey.bind(mods, "I", function()
        hs.window.focusedWindow():moveOneScreenNorth()
    end)
    hs.hotkey.bind(mods, "K", function()
        hs.window.focusedWindow():moveOneScreenSouth()
    end)
    hs.hotkey.bind(mods, "J", function() 
        hs.window.focusedWindow():moveOneScreenWest()
    end)
    hs.hotkey.bind(mods, "L", function()
        hs.window.focusedWindow():moveOneScreenEast()
    end)
end

function bindWindowPosition() 
    -- Left Half
    hs.hotkey.bind(ctrlAlt, "J", function()
        local win = hs.window.focusedWindow()
        local f = win:frame()
        local screen = win:screen()
        local max = screen:frame()

        f.x = max.x
        f.y = max.y
        f.w = max.w / 2 - xPadding
        f.h = max.h
        win:setFrame(f)
    end)

    -- Right Half
    hs.hotkey.bind(ctrlAlt, "L", function()
        local win = hs.window.focusedWindow()
        local f = win:frame()
        local screen = win:screen()
        local max = screen:frame()

        f.x = max.x + (max.w / 2) + xPadding
        f.y = max.y
        f.w = max.w / 2
        f.h = max.h
        win:setFrame(f)
    end)

    -- Right Two Thirds
    hs.hotkey.bind(ctrlAlt, ";", function()
        local win = hs.window.focusedWindow()
        local f = win:frame()
        local screen = win:screen()
        local max = screen:frame()

        f.x = max.x + (max.w / 3) + xPadding
        f.y = max.y
        f.w = max.w / 3 * 2
        f.h = max.h
        win:setFrame(f)  
    end)

    -- Left Two Thirds
    hs.hotkey.bind(ctrlAlt, "H", function()
        local win = hs.window.focusedWindow()
        local f = win:frame()
        local screen = win:screen()
        local max = screen:frame()

        f.x = max.x
        f.y = max.y
        f.w = max.w / 3 * 2 - xPadding
        f.h = max.h
        win:setFrame(f)
    end)

    -- Left Third
    hs.hotkey.bind(ctrlAlt, "7", function()
        local win = hs.window.focusedWindow()
        local f = win:frame()
        local screen = win:screen()
        local max = screen:frame()

        f.x = max.x
        f.y = max.y
        f.w = max.w / 3 - xPadding
        f.h = max.h
        win:setFrame(f)
    end)

    -- Middle Third
    hs.hotkey.bind(ctrlAlt, "8", function()
        local win = hs.window.focusedWindow()
        local f = win:frame()
        local screen = win:screen()
        local max = screen:frame()

        f.x = max.x + max.w / 3 + xPadding
        f.y = max.y
        f.w = max.w / 3 - 2 * xPadding
        f.h = max.h
        win:setFrame(f)
    end)

    -- Right Third
    hs.hotkey.bind(ctrlAlt, "9", function()
        local win = hs.window.focusedWindow()
        local f = win:frame()
        local screen = win:screen()
        local max = screen:frame()

        f.x = max.x + 2 * max.w / 3 + xPadding
        f.y = max.y
        f.w = max.w / 3 - xPadding
        f.h = max.h
        win:setFrame(f)
    end)

    -- Top Left Third
    hs.hotkey.bind(ctrlAlt, "Y", function()
        local win = hs.window.focusedWindow()
        local f = win:frame()
        local screen = win:screen()
        local max = screen:frame()

        f.x = max.x
        f.y = max.y
        f.w = max.w / 3 - xPadding
        f.h = max.h / 2 - yPadding
        win:setFrame(f)
    end)

    -- Bottom Left Third
    hs.hotkey.bind(ctrlAlt, "N", function()
        local win = hs.window.focusedWindow()
        local f = win:frame()
        local screen = win:screen()
        local max = screen:frame()

        f.x = max.x
        f.y = max.y + max.h / 2 + yPadding
        f.w = max.w / 3 - xPadding
        f.h = max.h / 2
        win:setFrame(f)
    end)

    -- Top Right Third
    hs.hotkey.bind(ctrlAlt, "P", function()
        local win = hs.window.focusedWindow()
        local f = win:frame()
        local screen = win:screen()
        local max = screen:frame()

        f.x = max.x + max.w * 2 / 3 + xPadding
        f.y = max.y
        f.w = max.w / 3 - xPadding
        f.h = max.h / 2 - yPadding
        win:setFrame(f)
    end)

    -- Bottom Right Third
    hs.hotkey.bind(ctrlAlt, "/", function()
        local win = hs.window.focusedWindow()
        local f = win:frame()
        local screen = win:screen()
        local max = screen:frame()

        f.x = max.x + max.w * 2 / 3 + xPadding
        f.y = max.y + max.h / 2 + yPadding
        f.w = max.w / 3 - xPadding
        f.h = max.h / 2
        win:setFrame(f)      
    end)

    -- Top Half
    hs.hotkey.bind(ctrlAlt, "I", function()
        local win = hs.window.focusedWindow()
        local f = win:frame()
        local screen = win:screen()
        local max = screen:frame()

        f.x = max.x
        f.y = max.y
        f.w = max.w
        f.h = max.h / 2 - yPadding
        win:setFrame(f)
    end)

    -- Top Middle
    -- hs.hotkey.bind(ctrlAlt, "I", function()
    --     local win = hs.window.focusedWindow()
    --     local f = win:frame()
    --     local screen = win:screen()
    --     local max = screen:frame()

    --     f.x = max.x + max.w / 3 + xPadding
    --     f.y = max.y
    --     f.w = max.w / 3 - 2 * xPadding
    --     f.h = max.h / 2 - yPadding
    --     win:setFrame(f)
    -- end)

    -- Bottom Half
    hs.hotkey.bind(ctrlAlt, "K", function()
        local win = hs.window.focusedWindow()
        local f = win:frame()
        local screen = win:screen()
        local max = screen:frame()

        f.x = max.x
        f.y = max.y + max.h / 2 + yPadding
        f.w = max.w
        f.h = max.h / 2
        win:setFrame(f)
    end)

    -- Bottom Middle
    -- hs.hotkey.bind(ctrlAlt, "K", function()
    --     local win = hs.window.focusedWindow()
    --     local f = win:frame()
    --     local screen = win:screen()
    --     local max = screen:frame()

    --     f.x = max.x + max.w / 3 + xPadding
    --     f.y = max.y + max.h / 2 + yPadding
    --     f.w = max.w / 3 - 2 * xPadding
    --     f.h = max.h / 2
    --     win:setFrame(f)
    -- end)

    -- Top Left Corner
    hs.hotkey.bind(ctrlAlt, "U", function()
        local win = hs.window.focusedWindow()
        local f = win:frame()
        local screen = win:screen()
        local max = screen:frame()

        f.x = max.x
        f.y = max.y
        f.w = max.w / 2 - xPadding
        f.h = max.h / 2 - yPadding
        win:setFrame(f)
    end)

    -- Bottom Left Corner
    hs.hotkey.bind(ctrlAlt, "M", function()
        local win = hs.window.focusedWindow()
        local f = win:frame()
        local screen = win:screen()
        local max = screen:frame()

        f.x = max.x
        f.y = max.y + max.h / 2 + yPadding
        f.w = max.w / 2 - xPadding
        f.h = max.h / 2
        win:setFrame(f)
    end)

    -- Top Right Corner
    hs.hotkey.bind(ctrlAlt, "O", function()
        local win = hs.window.focusedWindow()
        local f = win:frame()
        local screen = win:screen()
        local max = screen:frame()

        f.x = max.x + max.w / 2 + xPadding
        f.y = max.y
        f.w = max.w / 2 - xPadding
        f.h = max.h / 2 - yPadding
        win:setFrame(f)
    end)

    -- Bottom Right Corner
    hs.hotkey.bind(ctrlAlt, ".", function()
        local win = hs.window.focusedWindow()
        local f = win:frame()
        local screen = win:screen()
        local max = screen:frame()

        f.x = max.x + max.w / 2 + xPadding
        f.y = max.y + max.h / 2 + yPadding
        f.w = max.w / 2 - xPadding
        f.h = max.h / 2
        win:setFrame(f)
    end)

    -- Full Screen
    hs.hotkey.bind({"alt", "ctrl"}, "return", function()
        local win = hs.window.focusedWindow()
        local f = win:frame()
        local screen = win:screen()
        local max = screen:frame()

        f.x = max.x
        f.y = max.y
        f.w = max.w
        f.h = max.h
        win:setFrame(f)
    end)
end


bindSendToBack(cmdAlt)
bindSwitchFocus(cmdAlt)
bindSwitchMonitor(mash)
bindWindowPosition()

-- Paste clipboard contents
hs.hotkey.bind(cmdAlt, "V", function() 
    hs.eventtap.keyStrokes(hs.pasteboard.getContents()) 
end)

-- Reload Config
hs.hotkey.bind(mash, "R", function()
    hs.reload()
end)

-- Microphone Switch
-- https://www.dermitch.de/post/macos-force-microphone-when-using-airpods/
local MICROPHONE_DEVICE_NAME = "MacBook Pro Microphone"

local log = hs.logger.new('init','debug')

function audioDeviceCallback(event)
    log.f('audioDeviceCallback: "%s"', event)
    if (event == "dIn ") then -- That trailing space is not a mistake
        local defaultInputDevice = hs.audiodevice.defaultInputDevice()
        log.f("Input device has changed to %s", defaultInputDevice)

        local microphone = hs.audiodevice.findDeviceByName(MICROPHONE_DEVICE_NAME)


        local devices = hs.audiodevice.allDevices()

        for _, device in ipairs(devices) do
            log.i(string.format("Name: %s", 
                device:name()
            ))
        end

        if (microphone ~= nil) then
            log.i("Setting microphone to be the default again")
            microphone:setDefaultInputDevice()

            local sound = hs.sound.getByName("Funk")
            sound:play()
        else
            log.w("Microphone is not connected!")
        end
    end
end

hs.audiodevice.watcher.setCallback(audioDeviceCallback)
hs.audiodevice.watcher.start()

hs.alert.show("Config loaded")

-- https://news.ycombinator.com/item?id=38473942 