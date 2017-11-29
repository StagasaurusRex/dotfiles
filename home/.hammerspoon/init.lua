-- Change padding between windows here
xPadding = 5
yPadding = 5

topLeft      = 1
topMiddle    = 2
topRight     = 3
bottomRight  = 4
bottomMiddle = 5
bottomLeft   = 6

backWindowIds = {}
windowIds     = {}
timers        = {}

mash    = {"alt", "ctrl", "cmd"}
ctrlAlt = {"alt", "ctrl" }
cmdAlt  = {"cmd", "alt"}

function bindSwitchFocus(mods, keys)
    for i=1, #keys do
        hs.hotkey.bind(mods, keys[i], function()
            switchFocus(i)
        end)
    end
end

function bindWindowSwap(mods, keys)
    for i = 1, #keys do
        hs.hotkey.bind(mods, keys[i], function() 
            swapFocus(i)
        end)
    end
end

function switchFocus(position)
    local id = windowIds[position]
    if id ~= nil then
        hs.window.get(id):focus()        
    end
end

function swapFocus(position)
    local id = backWindowIds[position]
    if id ~= nil then
        hs.window.get(id):focus()
        local temp = windowIds[position]
        windowIds[position] = backWindowIds[position]
        backWindowIds[position] = temp
    end
end

function recordWindowPosition(id, positions)
    local timer = timers[id]
    if (timer ~= nil) then
        timer:stop()
    end

    timer = hs.timer.doAfter(1, function()
        for i = 1, #positions do
            backWindowIds[positions[i]] = windowIds[positions[i]]
            windowIds[positions[i]] = id
        end
    end)
    timers[id] = timer
end

function bindWindowPosition() 
    -- Left Half
    hs.hotkey.bind(ctrlAlt, "J", function()
        local win = hs.window.focusedWindow()
        local f = win:frame()
        local oldFrame = win:frame()
        local screen = win:screen()
        local max = screen:frame()

        f.x = max.x
        f.y = max.y
        f.w = max.w / 2 - xPadding
        f.h = max.h
        win:setFrame(f)

        local id = win:id()
        recordWindowPosition(id, {topLeft, bottomLeft})
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

        local id = win:id()
        recordWindowPosition(id, {topRight, bottomRight})
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

        local id = win:id()
        recordWindowPosition(id, {topMiddle, topRight, bottomRight, bottomMiddle})    
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

        local id = win:id()    
        recordWindowPosition(id, {topMiddle, topLeft, bottomLeft, bottomMiddle})
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

        local id = win:id()    
        recordWindowPosition(id, {topLeft, bottomLeft})
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

        local id = win:id()    
        recordWindowPosition(id, {topMiddle, bottomMiddle})
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

        local id = win:id()    
        recordWindowPosition(id, {topRight, bottomRight})
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

        local id = win:id()    
        recordWindowPosition(id, {topLeft})
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

        local id = win:id()
        recordWindowPosition(id, {bottomLeft})    
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

        local id = win:id()    
        recordWindowPosition(id, {topRight})    
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

        local id = win:id()
        recordWindowPosition(id, {bottomRight})            
    end)

    -- Top Half
    -- hs.hotkey.bind(ctrlAlt, "I", function()
    --     local win = hs.window.focusedWindow()
    --     local f = win:frame()
    --     local screen = win:screen()
    --     local max = screen:frame()

    --     f.x = max.x
    --     f.y = max.y
    --     f.w = max.w
    --     f.h = max.h / 2 - yPadding
    --     win:setFrame(f)

    --     local id = win:id()
    --     recordWindowPosition(id, {topLeft, topMiddle, topRight})
    -- end)

    -- Top Middle
    hs.hotkey.bind(ctrlAlt, "I", function()
        local win = hs.window.focusedWindow()
        local f = win:frame()
        local screen = win:screen()
        local max = screen:frame()

        f.x = max.x + max.w / 3 + xPadding
        f.y = max.y
        f.w = max.w / 3 - 2 * xPadding
        f.h = max.h / 2 - yPadding
        win:setFrame(f)

        local id = win:id()
        recordWindowPosition(id, {topMiddle})
    end)

    -- Bottom Half
    -- hs.hotkey.bind(ctrlAlt, "K", function()
    --     local win = hs.window.focusedWindow()
    --     local f = win:frame()
    --     local screen = win:screen()
    --     local max = screen:frame()

    --     f.x = max.x
    --     f.y = max.y + max.h / 2 + yPadding
    --     f.w = max.w
    --     f.h = max.h / 2
    --     win:setFrame(f)

    --     local id = win:id()
    --     recordWindowPosition(id, {bottomLeft, bottomMiddle, bottomRight})
    -- end)

    -- Bottom Middle
    hs.hotkey.bind(ctrlAlt, "K", function()
        local win = hs.window.focusedWindow()
        local f = win:frame()
        local screen = win:screen()
        local max = screen:frame()

        f.x = max.x + max.w / 3 + xPadding
        f.y = max.y + max.h / 2 + yPadding
        f.w = max.w / 3 - 2 * xPadding
        f.h = max.h / 2
        win:setFrame(f)

        local id = win:id()
        recordWindowPosition(id, {bottomMiddle})
    end)

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

        local id = win:id()
        recordWindowPosition(id, {topLeft})
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

        local id = win:id()    
        recordWindowPosition(id, {bottomLeft})
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

        local id = win:id()    
        recordWindowPosition(id, {topRight})
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

        local id = win:id()
        recordWindowPosition(id, {bottomRight})    
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

        local id = win:id()
        recordWindowPosition(id, {topLeft,topMiddle,topRight,bottomLeft,bottomMiddle,bottomRight})
    end)
end

bindSwitchFocus(cmdAlt, {"U", "I", "O", "L", "K", "J"})
bindWindowSwap(mash,    {"U", "I", "O", "L", "K", "J"})
bindWindowPosition()

-- Paste clipboard contents
hs.hotkey.bind(ctrlAlt, "V", function() 
    hs.eventtap.keyStrokes(hs.pasteboard.getContents()) 
end)

-- Reload Config
hs.hotkey.bind(mash, "R", function()
    hs.reload()
end)

hs.alert.show("Config loaded")