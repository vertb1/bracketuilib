-- by verb1
local startTime = tick()


local function getExecutor()
    local executor = identifyexecutor and identifyexecutor() or getexecutorname and getexecutorname() or "Unknown"
    
    
    if executor:find("Wave") then
        return "Wave"
    elseif executor:find("AWP") then
        return "AWP"
    elseif executor:find("Xeno") then
        return "Xeno"
    elseif executor:find("Solar") then
        return "Solar"
    elseif executor:find("Luna") then
        return "Luna"
    else
        return executor
    end
end

local executorName = getExecutor()
local Bracket = loadstring(game:HttpGet("https://raw.githubusercontent.com/vertb1/bracketuilib/refs/heads/main/lib.lua"))()

local Window = Bracket:Window({
    Name = "Ethrin Hub | v1.0.00.0 | " .. executorName,
    Enabled = true, 
    Color = Color3.fromRGB(0, 52, 131),
    Size = UDim2.new(0,496,0,696),
    Position = UDim2.new(0.5,-248,0.5,-348)
}) do
    -- Watermark with hub name, version and executor
    local Watermark = Window:Watermark({
        Title = "Ethrin Hub | v1.0.00.0 | " .. executorName,
        Flag = "UI/Watermark/Position",
        Enabled = true,
    })

    -- Keybind List with increased width
    local KeybindList = Window:KeybindList({
        Title = "Keybinds",
        Enabled = false,
        Position = UDim2.new(0, 10, 0.5, -123),
        Size = UDim2.new(0, 150, 0, 246)  -- Increased width from 121 to 150
    })

    -- Main Tab 
    local MainTab = Window:Tab({Name = "Main"}) do
        -- Empty tab
    end
    
    -- Visuals Tab 
    local VisualsTab = Window:Tab({Name = "Visuals"}) do
        -- Empty tab
    end
    
    -- Misc Tab 
    local MiscTab = Window:Tab({Name = "Misc"}) do
        -- Empty tab
    end
    -- Configuration Tab --
    local ConfigTab = Window:Tab({Name = "Configuration"}) do
        local MenuSection = ConfigTab:Section({Name = "Menu", Side = "Left"}) do
            local UIToggle = MenuSection:Toggle({
                Name = "UI Enabled", 
                Flag = "UI/Enabled", 
                IgnoreFlag = true,
                Value = Window.Enabled, 
                Callback = function(Bool) 
                    Window.Enabled = Bool 
                end
            })
            
            UIToggle:Keybind({
                Value = "RightShift", 
                Flag = "UI/Keybind", 
                DoNotClear = true
            })
            
            UIToggle:Colorpicker({
                Flag = "UI/Color", 
                Value = {0.6,0.6,0.5,0,false},
                Callback = function(HSVAR, Color) 
                    Window.Color = Color 
                end
            })
            
            MenuSection:Toggle({
                Name = "Open On Load", 
                Flag = "UI/OOL", 
                Value = true
            })
            
            MenuSection:Toggle({
                Name = "Blur Gameplay", 
                Flag = "UI/Blur", 
                Value = false,
                Callback = function(Bool) 
                    Window.Blur = Bool 
                end
            })
            
            MenuSection:Toggle({
                Name = "Watermark", 
                Flag = "UI/Watermark/Enabled", 
                Value = true,
                Callback = function(Bool) 
                    Window.Watermark.Enabled = Bool 
                end
            }):Keybind({Flag = "UI/Watermark/Keybind"})
            
            MenuSection:Toggle({
                Name = "Keybind List", 
                Flag = "UI/KeybindList/Enabled", 
                Value = false,
                Callback = function(Bool) 
                    KeybindList.Enabled = Bool 
                end
            }):Keybind({Flag = "UI/KeybindList/Keybind"})
        end
        
        ConfigTab:AddConfigSection("Bracket_Example", "Left")
        
        local BackgroundSection = ConfigTab:Section({Name = "Background", Side = "Right"}) do
            BackgroundSection:Colorpicker({
                Name = "Color", 
                Flag = "Background/Color", 
                Value = {1,1,0,0,false},
                Callback = function(HSVAR, Color) 
                    Window.Background.ImageColor3 = Color 
                    Window.Background.ImageTransparency = HSVAR[4] 
                end
            })
            
            BackgroundSection:Textbox({
                HideName = true, 
                Flag = "Background/CustomImage", 
                Placeholder = "rbxassetid://ImageId",
                Callback = function(String, EnterPressed) 
                    if EnterPressed then 
                        Window.Background.Image = String 
                    end 
                end
            })
            
            BackgroundSection:Dropdown({
                HideName = true, 
                Flag = "Background/Image", 
                List = {
                    {Name = "Legacy", Mode = "Button", Callback = function()
                        Window.Background.Image = "rbxassetid://2151741365"
                        Window.Flags["Background/CustomImage"] = ""
                    end},
                    {Name = "Hearts", Mode = "Button", Callback = function()
                        Window.Background.Image = "rbxassetid://6073763717"
                        Window.Flags["Background/CustomImage"] = ""
                    end},
                    {Name = "Abstract", Mode = "Button", Callback = function()
                        Window.Background.Image = "rbxassetid://6073743871"
                        Window.Flags["Background/CustomImage"] = ""
                    end},
                    {Name = "Hexagon", Mode = "Button", Callback = function()
                        Window.Background.Image = "rbxassetid://6073628839"
                        Window.Flags["Background/CustomImage"] = ""
                    end},
                    {Name = "Circles", Mode = "Button", Callback = function()
                        Window.Background.Image = "rbxassetid://6071579801"
                        Window.Flags["Background/CustomImage"] = ""
                    end},
                    {Name = "Lace With Flowers", Mode = "Button", Callback = function()
                        Window.Background.Image = "rbxassetid://6071575925"
                        Window.Flags["Background/CustomImage"] = ""
                    end},
                    {Name = "Floral", Mode = "Button", Callback = function()
                        Window.Background.Image = "rbxassetid://5553946656"
                        Window.Flags["Background/CustomImage"] = ""
                    end},
                    {Name = "Halloween", Mode = "Button", Callback = function()
                        Window.Background.Image = "rbxassetid://11113209821"
                        Window.Flags["Background/CustomImage"] = ""
                    end},
                    {Name = "Christmas", Mode = "Button", Callback = function()
                        Window.Background.Image = "rbxassetid://11711560928"
                        Window.Flags["Background/CustomImage"] = ""
                    end}
                }
            })
            
            BackgroundSection:Divider({Text = "Background Settings"})
            
            -- Dropdown for tile modes
            BackgroundSection:Dropdown({
                Name = "Tile Mode",
                Flag = "Background/TileMode",
                List = {
                    {Name = "Normal Tile", Mode = "Button", Callback = function()
                        -- Set the scale type to Tile
                        Window.Background.ScaleType = Enum.ScaleType.Tile
                        
                        -- Clear any stretch-specific properties
                        Window.Background.ImageRectSize = Vector2.new(0, 0)
                        Window.Background.ImageRectOffset = Vector2.new(0, 0)
                        
                        -- Update scale based on current value
                        local currentScale = Window.Flags["Background/Scale"] or 204
                        Window.Background.TileSize = UDim2.fromOffset(currentScale, currentScale)
                    end, Value = true},
                    {Name = "Stretch Tile", Mode = "Button", Callback = function()
                        -- Set the scale type to Stretch
                        Window.Background.ScaleType = Enum.ScaleType.Stretch
                        
                        -- Update scale based on current value
                        local currentScale = Window.Flags["Background/Scale"] or 204
                        local aspectRatio = Window.Background.AbsoluteSize.X / Window.Background.AbsoluteSize.Y
                        local width = currentScale * aspectRatio
                        local height = currentScale
                        
                        Window.Background.ImageRectSize = Vector2.new(width, height)
                    end}
                }
            })
            
            BackgroundSection:Slider({
                Name = "Background Scale", 
                Flag = "Background/Scale", 
                Wide = true, 
                Min = 50, 
                Max = 2000,
                Value = 204,
                Callback = function(Number) 
                    -- Apply scale based on current tile mode
                    if Window.Background.ScaleType == Enum.ScaleType.Tile then
                        -- Normal Tile mode - only set TileSize
                        Window.Background.TileSize = UDim2.fromOffset(Number, Number)
                    else
                        -- Stretch Tile mode
                        local aspectRatio = Window.Background.AbsoluteSize.X / Window.Background.AbsoluteSize.Y
                        local width = Number * aspectRatio
                        local height = Number
                        
                        Window.Background.ImageRectSize = Vector2.new(width, height)
                        Window.Background.TileSize = UDim2.fromOffset(Number, Number)
                    end
                end
            })
            
            -- Server Options Section
            BackgroundSection:Divider({Text = "Server Options"})
            
            BackgroundSection:Button({
                Name = "Rejoin Server", 
                Callback = function() 
                    Bracket:Push({Title = "Server", Description = "Rejoining the current server...", Duration = 3})
                    local ts = game:GetService("TeleportService")
                    local p = game:GetService("Players").LocalPlayer
                    ts:Teleport(game.PlaceId, p)
                end
            })
            
            BackgroundSection:Button({
                Name = "Server Hop", 
                Callback = function() 
                    Bracket:Push({Title = "Server", Description = "Finding a new server...", Duration = 3})
                    local ts = game:GetService("TeleportService")
                    local p = game:GetService("Players").LocalPlayer
                    local servers = {}
                    local req = game:HttpGet("https://games.roblox.com/v1/games/" .. game.PlaceId .. "/servers/Public?sortOrder=Desc&limit=100")
                    local data = game:GetService("HttpService"):JSONDecode(req)
                    
                    for i, v in pairs(data.data) do
                        if v.playing ~= v.maxPlayers and v.id ~= game.JobId then
                            table.insert(servers, v.id)
                        end
                    end
                    
                    if #servers > 0 then
                        ts:TeleportToPlaceInstance(game.PlaceId, servers[math.random(1, #servers)], p)
                    else
                        Bracket:Push({Title = "Server", Description = "No available servers found", Duration = 3})
                    end
                end
            })
            
            BackgroundSection:Button({
                Name = "Join Lowest Server", 
                Callback = function() 
                    Bracket:Push({Title = "Server", Description = "Finding lowest population server...", Duration = 3})
                    local ts = game:GetService("TeleportService")
                    local p = game:GetService("Players").LocalPlayer
                    local servers = {}
                    local req = game:HttpGet("https://games.roblox.com/v1/games/" .. game.PlaceId .. "/servers/Public?sortOrder=Asc&limit=100")
                    local data = game:GetService("HttpService"):JSONDecode(req)
                    
                    local lowestServer = nil
                    local lowestPlayers = math.huge
                    
                    for i, v in pairs(data.data) do
                        if v.playing < lowestPlayers and v.id ~= game.JobId then
                            lowestPlayers = v.playing
                            lowestServer = v.id
                        end
                    end
                    
                    if lowestServer then
                        Bracket:Push({Title = "Server", Description = "Joining server with " .. lowestPlayers .. " players", Duration = 3})
                        ts:TeleportToPlaceInstance(game.PlaceId, lowestServer, p)
                    else
                        Bracket:Push({Title = "Server", Description = "No available servers found", Duration = 3})
                    end
                end
            })
        end
    end
end


Window.Background.ScaleType = Enum.ScaleType.Tile
Window.Background.ImageRectSize = Vector2.new(0, 0)
Window.Background.ImageRectOffset = Vector2.new(0, 0)

Window:SetValue("Background/Scale", 204)
Window.Background.TileSize = UDim2.fromOffset(204, 204)

Window:AutoLoadConfig("Bracket_Example")
Window:SetValue("UI/Enabled", Window.Flags["UI/OOL"])


local loadTime = tick() - startTime
local loadTimeFormatted = string.format("%.2f", loadTime)
Bracket:Push({
    Title = "Ethrin Hub Loaded", 
    Description = "Successfully loaded in " .. loadTimeFormatted .. " seconds", 
    Duration = 10
})
