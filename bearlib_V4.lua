local MarketplaceService = game:GetService("MarketplaceService")
local UserInputService = game:GetService("UserInputService")
local TweenService = game:GetService("TweenService")
local HttpService = game:GetService("HttpService")
local RunService = game:GetService("RunService")
local CoreGui = game:GetService("CoreGui")
local Players = game:GetService("Players")
local Player = Players.LocalPlayer
local PlayerMouse = Player:GetMouse()
local Lighting = game:GetService("Lighting")

local bearlib = {
    Themes = {
        -- THEME SIÊU VIP V4
        RoyalAmethyst = {
            ["Color Hub 1"] = ColorSequence.new({
                ColorSequenceKeypoint.new(0.00, Color3.fromRGB(155, 93, 229)),
                ColorSequenceKeypoint.new(0.50, Color3.fromRGB(103, 58, 183)),
                ColorSequenceKeypoint.new(1.00, Color3.fromRGB(63, 31, 118))
            }),
            ["Color Hub 2"] = Color3.fromRGB(26, 18, 38),
            ["Color Stroke"] = Color3.fromRGB(187, 134, 252),
            ["Color Theme"] = Color3.fromRGB(187, 134, 252),
            ["Color Text"] = Color3.fromRGB(255, 255, 255),
            ["Color Dark Text"] = Color3.fromRGB(200, 200, 255),
            ["Color Glow"] = Color3.fromRGB(155, 93, 229),
            ["Color Accent"] = Color3.fromRGB(255, 215, 0)
        },
        
        OceanPearl = {
            ["Color Hub 1"] = ColorSequence.new({
                ColorSequenceKeypoint.new(0.00, Color3.fromRGB(0, 184, 212)),
                ColorSequenceKeypoint.new(0.50, Color3.fromRGB(0, 131, 176)),
                ColorSequenceKeypoint.new(1.00, Color3.fromRGB(0, 77, 128))
            }),
            ["Color Hub 2"] = Color3.fromRGB(10, 25, 40),
            ["Color Stroke"] = Color3.fromRGB(0, 229, 255),
            ["Color Theme"] = Color3.fromRGB(0, 184, 212),
            ["Color Text"] = Color3.fromRGB(255, 255, 255),
            ["Color Dark Text"] = Color3.fromRGB(200, 230, 255),
            ["Color Glow"] = Color3.fromRGB(0, 229, 255),
            ["Color Accent"] = Color3.fromRGB(255, 255, 255)
        },
        
        EmeraldNight = {
            ["Color Hub 1"] = ColorSequence.new({
                ColorSequenceKeypoint.new(0.00, Color3.fromRGB(0, 200, 83)),
                ColorSequenceKeypoint.new(0.50, Color3.fromRGB(0, 150, 63)),
                ColorSequenceKeypoint.new(1.00, Color3.fromRGB(0, 100, 42))
            }),
            ["Color Hub 2"] = Color3.fromRGB(15, 30, 20),
            ["Color Stroke"] = Color3.fromRGB(105, 240, 174),
            ["Color Theme"] = Color3.fromRGB(0, 230, 118),
            ["Color Text"] = Color3.fromRGB(255, 255, 255),
            ["Color Dark Text"] = Color3.fromRGB(200, 255, 220),
            ["Color Glow"] = Color3.fromRGB(0, 255, 128),
            ["Color Accent"] = Color3.fromRGB(255, 215, 0)
        },
        
        RoseGold = {
            ["Color Hub 1"] = ColorSequence.new({
                ColorSequenceKeypoint.new(0.00, Color3.fromRGB(245, 158, 184)),
                ColorSequenceKeypoint.new(0.50, Color3.fromRGB(237, 100, 166)),
                ColorSequenceKeypoint.new(1.00, Color3.fromRGB(219, 48, 122))
            }),
            ["Color Hub 2"] = Color3.fromRGB(45, 20, 30),
            ["Color Stroke"] = Color3.fromRGB(255, 182, 193),
            ["Color Theme"] = Color3.fromRGB(255, 128, 171),
            ["Color Text"] = Color3.fromRGB(255, 255, 255),
            ["Color Dark Text"] = Color3.fromRGB(255, 220, 240),
            ["Color Glow"] = Color3.fromRGB(255, 182, 193),
            ["Color Accent"] = Color3.fromRGB(255, 215, 0)
        },
        
        CosmicPurple = {
            ["Color Hub 1"] = ColorSequence.new({
                ColorSequenceKeypoint.new(0.00, Color3.fromRGB(170, 0, 255)),
                ColorSequenceKeypoint.new(0.50, Color3.fromRGB(100, 0, 200)),
                ColorSequenceKeypoint.new(1.00, Color3.fromRGB(50, 0, 150))
            }),
            ["Color Hub 2"] = Color3.fromRGB(20, 10, 30),
            ["Color Stroke"] = Color3.fromRGB(200, 150, 255),
            ["Color Theme"] = Color3.fromRGB(170, 0, 255),
            ["Color Text"] = Color3.fromRGB(255, 255, 255),
            ["Color Dark Text"] = Color3.fromRGB(220, 200, 255),
            ["Color Glow"] = Color3.fromRGB(200, 0, 255),
            ["Color Accent"] = Color3.fromRGB(255, 215, 0)
        },
        
        -- Giữ lại các theme cũ nhưng cập nhật thêm
        QuangHuy = {
            ["Color Hub 1"] = ColorSequence.new({
                ColorSequenceKeypoint.new(0.00, Color3.fromRGB(220, 20, 20)),
                ColorSequenceKeypoint.new(0.50, Color3.fromRGB(180, 0, 0)),
                ColorSequenceKeypoint.new(1.00, Color3.fromRGB(120, 0, 0))
            }),
            ["Color Hub 2"] = Color3.fromRGB(40, 8, 8),
            ["Color Stroke"] = Color3.fromRGB(255, 215, 0),
            ["Color Theme"] = Color3.fromRGB(255, 80, 80),
            ["Color Text"] = Color3.fromRGB(255, 255, 255),
            ["Color Dark Text"] = Color3.fromRGB(255, 200, 200),
            ["Color Glow"] = Color3.fromRGB(255, 100, 100),
            ["Color Accent"] = Color3.fromRGB(255, 215, 0)
        }
    },
    Info = {
        Version = "4.0.0 VIP"
    },
    Save = {
        UISize = {600, 420},
        TabSize = 180,
        Theme = "RoyalAmethyst"
    },
    Settings = {},
    Connection = {},
    Instances = {},
    Elements = {},
    Options = {},
    Flags = {},
    Tabs = {},
    Icons = (function()
        return {}
    end)(),
    AllElements = {},
    Particles = {},
    
    SaveEnabled = true,
    SaveFile = "bear library V4 VIP.json"
}

local ViewportSize = workspace.CurrentCamera.ViewportSize
local UIScale = ViewportSize.Y / 450

local Settings = bearlib.Settings
local Flags = bearlib.Flags

-- ==================== HỆ THỐNG LƯU ====================
function bearlib:EnableSaving(enable)
    self.SaveEnabled = enable
    return self
end

function bearlib:SetSaveFile(filename)
    if type(filename) == "string" and #filename > 0 then
        self.SaveFile = filename
    end
    return self
end

local function SaveJson(FileName, save)
    if not bearlib.SaveEnabled then return false end
    if not writefile then return false end
    
    local success, json = pcall(function()
        return HttpService:JSONEncode(save)
    end)
    
    if success then
        local success, err = pcall(function()
            writefile(FileName, json)
            return true
        end)
        return success
    end
    return false
end

local function LoadJson(FileName)
    if not readfile or not isfile then return nil end
    
    local success, exists = pcall(isfile, FileName)
    if not success or not exists then return nil end
    
    local success, content = pcall(readfile, FileName)
    if not success then return nil end
    
    local success, decoded = pcall(function()
        return HttpService:JSONDecode(content)
    end)
    
    if success then return decoded end
    return nil
end

local SetProps, SetChildren, InsertTheme, Create do
    InsertTheme = function(Instance, Type)
        table.insert(bearlib.Instances, {
            Instance = Instance,
            Type = Type
        })
        return Instance
    end
    
    SetChildren = function(Instance, Children)
        if Children then
            table.foreach(Children, function(_,Child)
                Child.Parent = Instance
            end)
        end
        return Instance
    end
    
    SetProps = function(Instance, Props)
        if Props then
            table.foreach(Props, function(prop, value)
                Instance[prop] = value
            end)
        end
        return Instance
    end
    
    Create = function(...)
        local args = {...}
        if type(args) ~= "table" then return end
        local new = Instance.new(args[1])
        local Children = {}
        
        if type(args[2]) == "table" then
            SetProps(new, args[2])
            SetChildren(new, args[3])
            Children = args[3] or {}
        elseif typeof(args[2]) == "Instance" then
            new.Parent = args[2]
            SetProps(new, args[3])
            SetChildren(new, args[4])
            Children = args[4] or {}
        end
        return new
    end
    
    local function Save(file)
        if bearlib.SaveEnabled then
            local decoded = LoadJson(file)
            if type(decoded) == "table" then
                if rawget(decoded, "UISize") then bearlib.Save["UISize"] = decoded["UISize"] end
                if rawget(decoded, "TabSize") then bearlib.Save["TabSize"] = decoded["TabSize"] end
                if rawget(decoded, "Theme") and VerifyTheme(decoded["Theme"]) then bearlib.Save["Theme"] = decoded["Theme"] end
            end
        end
    end
    
    pcall(Save, bearlib.SaveFile)
end

local Funcs = {} do
    function Funcs:InsertCallback(tab, func)
        if type(func) == "function" then
            table.insert(tab, func)
        end
        return func
    end
    
    function Funcs:FireCallback(tab, ...)
        for _,v in ipairs(tab) do
            if type(v) == "function" then
                task.spawn(v, ...)
            end
        end
    end
    
    function Funcs:ToggleVisible(Obj, Bool)
        Obj.Visible = Bool ~= nil and Bool or Obj.Visible
    end
    
    function Funcs:ToggleParent(Obj, Parent)
        if Bool ~= nil then
            Obj.Parent = Bool
        else
            Obj.Parent = not Obj.Parent and Parent
        end
    end
    
    function Funcs:GetConnectionFunctions(ConnectedFuncs, func)
        local Connected = { Function = func, Connected = true }
        function Connected:Disconnect()
            if self.Connected then
                table.remove(ConnectedFuncs, table.find(ConnectedFuncs, self.Function))
                self.Connected = false
            end
        end
        
        function Connected:Fire(...)
            if self.Connected then
                task.spawn(self.Function, ...)
            end
        end
        
        return Connected
    end
    
    function Funcs:GetCallback(Configs, index)
        local func = Configs[index] or Configs.Callback or function()end
        if type(func) == "table" then
            return ({function(Value) func[1][func[2]] = Value end})
        end
        return {func}
    end
end

local Connections, Connection = {}, bearlib.Connection do
    local function NewConnectionList(List)
        if type(List) ~= "table" then return end
        
        for _,CoName in ipairs(List) do
            local ConnectedFuncs, Connect = {}, {}
            Connection[CoName] = Connect
            Connections[CoName] = ConnectedFuncs
            Connect.Name = CoName
            
            function Connect:Connect(func)
                if type(func) == "function" then
                    table.insert(ConnectedFuncs, func)
                    return Funcs:GetConnectionFunctions(ConnectedFuncs, func)
                end
            end
            
            function Connect:Once(func)
                if type(func) == "function" then
                    local Connected;local _NFunc;_NFunc = function(...)
                        task.spawn(func, ...)
                        Connected:Disconnect()
                    end
                    Connected = Funcs:GetConnectionFunctions(ConnectedFuncs, _NFunc)
                    return Connected
                end
            end
        end
    end
    
    function Connection:FireConnection(CoName, ...)
        local Connection = type(CoName) == "string" and Connections[CoName] or Connections[CoName.Name]
        for _,Func in pairs(Connection) do
            task.spawn(Func, ...)
        end
    end
    
    NewConnectionList({"FlagsChanged", "ThemeChanged", "FileSaved", "ThemeChanging", "OptionAdded"})
end

local GetFlag, SetFlag, CheckFlag do
    CheckFlag = function(Name)
        return type(Name) == "string" and Flags[Name] ~= nil
    end
    
    GetFlag = function(Name)
        return type(Name) == "string" and Flags[Name]
    end
    
    SetFlag = function(Flag, Value)
        if Flag and (Value ~= Flags[Flag] or type(Value) == "table") then
            Flags[Flag] = Value
            Connection:FireConnection("FlagsChanged", Flag, Value)
        end
    end
    
    local db
    Connection.FlagsChanged:Connect(function(Flag, Value)
        if not bearlib.SaveEnabled then return end
        
        local ScriptFile = Settings.ScriptFile
        if type(ScriptFile) ~= "string" then return end
        if not db and ScriptFile and writefile then
            db=true;task.wait(0.1);db=false
            
            local Success, Encoded = pcall(function()
                return HttpService:JSONEncode(Flags)
            end)
            
            if Success then
                local Success = pcall(writefile, ScriptFile, Encoded)
                if Success then
                    Connection:FireConnection("FileSaved", "Script-Flags", ScriptFile, Encoded)
                end
            end
        end
    end)
end

local ScreenGui = Create("ScreenGui", CoreGui, {
    Name = "bear Library V4 VIP UI",
    ZIndexBehavior = Enum.ZIndexBehavior.Sibling,
    DisplayOrder = 999
}, {
    Create("UIScale", {
        Scale = UIScale,
        Name = "Scale"
    })
})

local ScreenFind = CoreGui:FindFirstChild(ScreenGui.Name)
if ScreenFind and ScreenFind ~= ScreenGui then
    ScreenFind:Destroy()
end

local function GetStr(val)
    if type(val) == "function" then
        return val()
    end
    return val
end

local function ConnectSave(Instance, func)
    Instance.InputBegan:Connect(function(Input)
        if Input.UserInputType == Enum.UserInputType.MouseButton1 or Input.UserInputType == Enum.UserInputType.Touch then
            while UserInputService:IsMouseButtonPressed(Enum.UserInputType.MouseButton1) do task.wait()
            end
        end
        func()
    end)
end

local function CreateTween(Configs)
    local Instance = Configs[1] or Configs.Instance
    local Prop = Configs[2] or Configs.Prop
    local NewVal = Configs[3] or Configs.NewVal
    local Time = Configs[4] or Configs.Time or 0.5
    local TweenWait = Configs[5] or Configs.wait or false
    local TweenInfo = TweenInfo.new(Time, Enum.EasingStyle.Quint)
    
    local Tween = TweenService:Create(Instance, TweenInfo, {[Prop] = NewVal})
    Tween:Play()
    if TweenWait then
        Tween.Completed:Wait()
    end
    return Tween
end

local function CreateGlow(Instance, Color, Size)
    local Glow = Instance.new("ImageLabel")
    Glow.Name = "Glow"
    Glow.Size = UDim2.new(1, Size or 20, 1, Size or 20)
    Glow.Position = UDim2.new(0.5, -(Size or 10), 0.5, -(Size or 10))
    Glow.AnchorPoint = Vector2.new(0.5, 0.5)
    Glow.BackgroundTransparency = 1
    Glow.Image = "rbxassetid://5028857084"
    Glow.ImageColor3 = Color or Color3.new(1, 1, 1)
    Glow.ImageTransparency = 0.7
    Glow.ZIndex = Instance.ZIndex - 1
    Glow.Parent = Instance
    return Glow
end

local function MakeDrag(Instance)
    task.spawn(function()
        SetProps(Instance, {
            Active = true,
            AutoButtonColor = false
        })
        
        local DragStart, StartPos, InputOn
        
        local function Update(Input)
            local delta = Input.Position - DragStart
            local Position = UDim2.new(StartPos.X.Scale, StartPos.X.Offset + delta.X / UIScale, StartPos.Y.Scale, StartPos.Y.Offset + delta.Y / UIScale)
            Instance.Position = Position
            CreateTween({Instance, "Position", Position, 0.35})
        end
        
        Instance.MouseButton1Down:Connect(function()
            InputOn = true
        end)
        
        Instance.InputBegan:Connect(function(Input)
            if Input.UserInputType == Enum.UserInputType.MouseButton1 or Input.UserInputType == Enum.UserInputType.Touch then
                StartPos = Instance.Position
                DragStart = Input.Position
                
                while UserInputService:IsMouseButtonPressed(Enum.UserInputType.MouseButton1) do RunService.Heartbeat:Wait()
                    if InputOn then
                        Update(Input)
                    end
                end
                InputOn = false
            end
        end)
    end)
    return Instance
end

local function VerifyTheme(Theme)
    for name,_ in pairs(bearlib.Themes) do
        if name == Theme then
            return true
        end
    end
end

local Theme = bearlib.Themes[bearlib.Save.Theme]

local function AddEle(Name, Func)
    bearlib.Elements[Name] = Func
end

local function Make(Ele, Instance, props, ...)
    local Element = bearlib.Elements[Ele](Instance, props, ...)
    return Element
end

AddEle("Corner", function(parent, CornerRadius)
    local New = SetProps(Create("UICorner", parent, {
        CornerRadius = CornerRadius or UDim.new(0, 12)
    }), props)
    return New
end)

AddEle("Stroke", function(parent, props, ...)
    local args = {...}
    local New = InsertTheme(SetProps(Create("UIStroke", parent, {
        Color = args[1] or Theme["Color Stroke"],
        Thickness = args[2] or 1.5,
        ApplyStrokeMode = "Border",
        Transparency = 0.2
    }), props), "Stroke")
    return New
end)

AddEle("Button", function(parent, props, ...)
    local args = {...}
    local New = InsertTheme(SetProps(Create("TextButton", parent, {
        Text = "",
        Size = UDim2.fromScale(1, 1),
        BackgroundColor3 = Theme["Color Hub 2"],
        AutoButtonColor = false
    }), props), "Frame")
    
    New.MouseEnter:Connect(function()
        TweenService:Create(New, TweenInfo.new(0.2), {BackgroundTransparency = 0.3}):Play()
    end)
    New.MouseLeave:Connect(function()
        TweenService:Create(New, TweenInfo.new(0.2), {BackgroundTransparency = 0}):Play()
    end)
    if args[1] then
        New.Activated:Connect(args[1])
    end
    return New
end)

AddEle("Gradient", function(parent, props, ...)
    local args = {...}
    local New = InsertTheme(SetProps(Create("UIGradient", parent, {
        Color = Theme["Color Hub 1"]
    }), props), "Gradient")
    return New
end)

local function ButtonFrame(Instance, Title, Description, HolderSize)
    local TitleL = InsertTheme(Create("TextLabel", {
        Font = Enum.Font.GothamMedium,
        TextColor3 = Theme["Color Text"],
        Size = UDim2.new(1, -20),
        AutomaticSize = "Y",
        Position = UDim2.new(0, 0, 0.5),
        AnchorPoint = Vector2.new(0, 0.5),
        BackgroundTransparency = 1,
        TextTruncate = "AtEnd",
        TextSize = 12,
        TextXAlignment = "Left",
        Text = "",
        RichText = true
    }), "Text")
    
    local DescL = InsertTheme(Create("TextLabel", {
        Font = Enum.Font.Gotham,
        TextColor3 = Theme["Color Dark Text"],
        Size = UDim2.new(1, -20),
        AutomaticSize = "Y",
        Position = UDim2.new(0, 12, 0, 15),
        BackgroundTransparency = 1,
        TextWrapped = true,
        TextSize = 10,
        TextXAlignment = "Left",
        Text = "",
        RichText = true
    }), "DarkText")

    local Frame = Make("Button", Instance, {
        Size = UDim2.new(1, 0, 0, 28),
        AutomaticSize = "Y",
        Name = "Option"
    })Make("Corner", Frame, UDim.new(0, 10))
    
    LabelHolder = Create("Frame", Frame, {
        AutomaticSize = "Y",
        BackgroundTransparency = 1,
        Size = HolderSize,
        Position = UDim2.new(0, 12, 0),
        AnchorPoint = Vector2.new(0, 0)
    }, {
        Create("UIListLayout", {
            SortOrder = "LayoutOrder",
            VerticalAlignment = "Center",
            Padding = UDim.new(0, 3)
        }),
        Create("UIPadding", {
            PaddingBottom = UDim.new(0, 8),
            PaddingTop = UDim.new(0, 8)
        }),
        TitleL,
        DescL,
    })
    
    local Label = {}
    function Label:SetTitle(NewTitle)
        if type(NewTitle) == "string" and NewTitle:gsub(" ", ""):len() > 0 then
            TitleL.Text = NewTitle
        end
    end
    function Label:SetDesc(NewDesc)
        if type(NewDesc) == "string" and NewDesc:gsub(" ", ""):len() > 0 then
            DescL.Visible = true
            DescL.Text = NewDesc
            LabelHolder.Position = UDim2.new(0, 12, 0)
            LabelHolder.AnchorPoint = Vector2.new(0, 0)
        else
            DescL.Visible = false
            DescL.Text = ""
            LabelHolder.Position = UDim2.new(0, 12, 0.5)
            LabelHolder.AnchorPoint = Vector2.new(0, 0.5)
        end
    end
    
    Label:SetTitle(Title)
    Label:SetDesc(Description)
    return Frame, Label
end

local function GetColor(Instance)
    if Instance:IsA("Frame") then
        return "BackgroundColor3"
    elseif Instance:IsA("ImageLabel") then
        return "ImageColor3"
    elseif Instance:IsA("TextLabel") then
        return "TextColor3"
    elseif Instance:IsA("ScrollingFrame") then
        return "ScrollBarImageColor3"
    elseif Instance:IsA("UIStroke") then
        return "Color"
    end
    return ""
end

function bearlib:GetIcon(index)
    if type(index) ~= "string" or index:find("rbxassetid://") or #index == 0 then
        return index
    end
    
    local firstMatch = nil
    index = string.lower(index):gsub("lucide", ""):gsub("-", "")
    
    if self.Icons[index] then
        return self.Icons[index]
    end
    
    for Name, Icon in self.Icons do
        if Name == index then
            return Icon
        elseif not firstMatch and Name:find(index, 1, true) then
            firstMatch = Icon
        end
    end
    
    return firstMatch or index
end

function bearlib:SetTheme(NewTheme)
    if not VerifyTheme(NewTheme) then return end
    
    bearlib.Save.Theme = NewTheme
    
    if self.SaveEnabled then
        SaveJson(self.SaveFile, bearlib.Save)
    end
    
    Theme = bearlib.Themes[NewTheme]
    
    Connection:FireConnection("ThemeChanged", NewTheme)
    table.foreach(bearlib.Instances, function(_,Val)
        if Val.Type == "Gradient" then
            Val.Instance.Color = Theme["Color Hub 1"]
        elseif Val.Type == "Frame" then
            Val.Instance.BackgroundColor3 = Theme["Color Hub 2"]
        elseif Val.Type == "Stroke" then
            Val.Instance[GetColor(Val.Instance)] = Theme["Color Stroke"]
        elseif Val.Type == "Theme" then
            Val.Instance[GetColor(Val.Instance)] = Theme["Color Theme"]
        elseif Val.Type == "Text" then
            Val.Instance[GetColor(Val.Instance)] = Theme["Color Text"]
        elseif Val.Type == "DarkText" then
            Val.Instance[GetColor(Val.Instance)] = Theme["Color Dark Text"]
        elseif Val.Type == "ScrollBar" then
            Val.Instance[GetColor(Val.Instance)] = Theme["Color Theme"]
        end
    end)
end

function bearlib:SetScale(NewScale)
    NewScale = ViewportSize.Y / math.clamp(NewScale, 300, 2000)
    UIScale, ScreenGui.Scale.Scale = NewScale, NewScale
end

-- ==================== MAIN WINDOW V4 VIP ====================
function bearlib:MakeWindow(Configs)
    local WTitle = Configs[1] or Configs.Name or Configs.Title or "Bear Hub V4"
    local WMiniText = Configs[2] or Configs.SubTitle or "VIP Edition"
    
    local SaveFolder = Configs[3] or Configs.SaveFolder or false
    
    if type(SaveFolder) == "string" then
        Settings.ScriptFile = SaveFolder
        self:SetSaveFile(SaveFolder)
        self:EnableSaving(true)
    elseif SaveFolder == false then
        self:EnableSaving(false)
        Settings.ScriptFile = nil
    end
    
    local function LoadFile()
        if not self.SaveEnabled then return end
        
        local File = Settings.ScriptFile or self.SaveFile
        if type(File) ~= "string" then return end
        
        local decoded = LoadJson(File)
        if type(decoded) == "table" then
            Flags = decoded
        end
    end
    LoadFile()
    
    local UISizeX, UISizeY = unpack(bearlib.Save.UISize)
    
    -- MAIN FRAME SIÊU VIP
    local MainFrame = InsertTheme(Create("ImageButton", ScreenGui, {
        Size = UDim2.fromOffset(UISizeX, UISizeY),
        Position = UDim2.new(0.5, -UISizeX/2, 0.5, -UISizeY/2),
        BackgroundTransparency = 0,
        Name = "HubV4",
        ClipsDescendants = true,
        ZIndex = 1
    }), "Main")
    
    -- Background Gradient
    local BackgroundGradient = Instance.new("UIGradient")
    BackgroundGradient.Color = Theme["Color Hub 1"]
    BackgroundGradient.Rotation = 45
    BackgroundGradient.Parent = MainFrame
    
    Make("Corner", MainFrame, UDim.new(0, 20))
    CreateGlow(MainFrame, Theme["Color Glow"], 40)
    MakeDrag(MainFrame)
    
    -- Glassmorphism Effect
    local GlassFrame = Create("Frame", MainFrame, {
        Size = UDim2.new(1, 0, 1, 0),
        BackgroundColor3 = Color3.new(1, 1, 1),
        BackgroundTransparency = 0.85,
        ZIndex = 2
    })
    Make("Corner", GlassFrame, UDim.new(0, 20))
    
    -- Animated Particles
    local ParticleFolder = Create("Folder", MainFrame, {Name = "Particles"})
    
    for i = 1, 30 do
        local Particle = Create("Frame", ParticleFolder, {
            Size = UDim2.fromOffset(2, 2),
            Position = UDim2.fromScale(math.random(), math.random()),
            BackgroundColor3 = Theme["Color Accent"],
            BackgroundTransparency = 0.5,
            ZIndex = 1
        })
        Make("Corner", Particle, UDim.new(0.5, 0))
        
        task.spawn(function()
            while Particle and Particle.Parent do
                local X = math.random() * 0.02 - 0.01
                local Y = math.random() * 0.02 - 0.01
                local NewPos = Particle.Position + UDim2.fromOffset(X, Y)
                if NewPos.X.Scale > 1 then NewPos = UDim2.fromScale(0, NewPos.Y.Scale) end
                if NewPos.X.Scale < 0 then NewPos = UDim2.fromScale(1, NewPos.Y.Scale) end
                if NewPos.Y.Scale > 1 then NewPos = UDim2.fromScale(NewPos.X.Scale, 0) end
                if NewPos.Y.Scale < 0 then NewPos = UDim2.fromScale(NewPos.X.Scale, 1) end
                
                TweenService:Create(Particle, TweenInfo.new(math.random(3, 6)), {Position = NewPos}):Play()
                task.wait(math.random(3, 6))
            end
        end)
    end
    
    -- 3D Border Effect
    local BorderTop = Create("Frame", MainFrame, {
        Size = UDim2.new(1, 0, 0, 2),
        BackgroundColor3 = Theme["Color Stroke"],
        BorderSizePixel = 0,
        ZIndex = 10
    })
    local BorderBottom = Create("Frame", MainFrame, {
        Size = UDim2.new(1, 0, 0, 2),
        Position = UDim2.new(0, 0, 1, -2),
        BackgroundColor3 = Theme["Color Stroke"],
        BorderSizePixel = 0,
        ZIndex = 10
    })
    local BorderLeft = Create("Frame", MainFrame, {
        Size = UDim2.new(0, 2, 1, 0),
        BackgroundColor3 = Theme["Color Stroke"],
        BorderSizePixel = 0,
        ZIndex = 10
    })
    local BorderRight = Create("Frame", MainFrame, {
        Size = UDim2.new(0, 2, 1, 0),
        Position = UDim2.new(1, -2, 0, 0),
        BackgroundColor3 = Theme["Color Stroke"],
        BorderSizePixel = 0,
        ZIndex = 10
    })
    
    -- Components Folder
    local Components = Create("Folder", MainFrame, {Name = "Components"})
    local DropdownHolder = Create("Folder", ScreenGui, {Name = "Dropdown"})
    
    -- TOPBAR SIÊU SANG
    local TopBar = Create("Frame", Components, {
        Size = UDim2.new(1, 0, 0, 45),
        BackgroundTransparency = 0.2,
        BackgroundColor3 = Theme["Color Hub 2"],
        Name = "Top Bar",
        ZIndex = 20
    })
    Make("Corner", TopBar, UDim.new(0, 20))
    Make("Stroke", TopBar, {Color = Theme["Color Stroke"], Thickness = 1.5})
    
    -- Title với hiệu ứng
    local Title = InsertTheme(Create("TextLabel", TopBar, {
        Position = UDim2.new(0, 20, 0.5),
        AnchorPoint = Vector2.new(0, 0.5),
        AutomaticSize = "XY",
        Text = WTitle,
        TextXAlignment = "Left",
        TextSize = 18,
        TextColor3 = Theme["Color Text"],
        BackgroundTransparency = 1,
        Font = Enum.Font.FredokaOne,
        Name = "Title",
        ZIndex = 21
    }), "Text")
    
    local TitleGlow = Instance.new("ImageLabel")
    TitleGlow.Name = "TitleGlow"
    TitleGlow.Size = UDim2.new(1, 20, 1, 10)
    TitleGlow.Position = UDim2.new(0.5, -10, 0.5, -5)
    TitleGlow.AnchorPoint = Vector2.new(0.5, 0.5)
    TitleGlow.BackgroundTransparency = 1
    TitleGlow.Image = "rbxassetid://5028857084"
    TitleGlow.ImageColor3 = Theme["Color Glow"]
    TitleGlow.ImageTransparency = 0.8
    TitleGlow.ZIndex = Title.ZIndex - 1
    TitleGlow.Parent = Title
    
    local SubTitle = InsertTheme(Create("TextLabel", Title, {
        Size = UDim2.fromScale(0, 1),
        AutomaticSize = "X",
        AnchorPoint = Vector2.new(0, 1),
        Position = UDim2.new(1, 8, 0.9),
        Text = WMiniText,
        TextColor3 = Theme["Color Dark Text"],
        BackgroundTransparency = 1,
        TextXAlignment = "Left",
        TextYAlignment = "Bottom",
        TextSize = 11,
        Font = Enum.Font.Gotham,
        Name = "SubTitle",
        ZIndex = 21
    }), "DarkText")
    
    -- TAB SCROLL
    local MainScroll = InsertTheme(Create("ScrollingFrame", Components, {
        Size = UDim2.new(0, bearlib.Save.TabSize, 1, -TopBar.Size.Y.Offset),
        ScrollBarImageColor3 = Theme["Color Theme"],
        Position = UDim2.new(0, 0, 1, 0),
        AnchorPoint = Vector2.new(0, 1),
        ScrollBarThickness = 3,
        BackgroundTransparency = 1,
        ScrollBarImageTransparency = 0.2,
        CanvasSize = UDim2.new(),
        AutomaticCanvasSize = "Y",
        ScrollingDirection = "Y",
        BorderSizePixel = 0,
        Name = "Tab Scroll",
        ZIndex = 20
    }, {
        Create("UIPadding", {
            PaddingLeft = UDim.new(0, 15),
            PaddingRight = UDim.new(0, 15),
            PaddingTop = UDim.new(0, 15),
            PaddingBottom = UDim.new(0, 15)
        }),
        Create("UIListLayout", {Padding = UDim.new(0, 8)})
    }), "ScrollBar")
    
    -- Main Container
    local Containers = Create("Frame", Components, {
        Size = UDim2.new(1, -MainScroll.Size.X.Offset - 5, 1, -TopBar.Size.Y.Offset - 5),
        AnchorPoint = Vector2.new(1, 1),
        Position = UDim2.new(1, -5, 1, -5),
        BackgroundTransparency = 1,
        ClipsDescendants = true,
        Name = "Containers",
        ZIndex = 20
    })
    
    -- Search Container
    local SearchContainer = InsertTheme(Create("ScrollingFrame", Components, {
        Size = UDim2.new(1, -MainScroll.Size.X.Offset - 5, 1, -TopBar.Size.Y.Offset - 5),
        AnchorPoint = Vector2.new(1, 1),
        Position = UDim2.new(1, -5, 1, -5),
        BackgroundTransparency = 1,
        Visible = false,
        ScrollBarThickness = 3,
        ScrollBarImageTransparency = 0.2,
        ScrollBarImageColor3 = Theme["Color Theme"],
        AutomaticCanvasSize = "Y",
        ScrollingDirection = "Y",
        BorderSizePixel = 0,
        Name = "SearchContainer",
        ZIndex = 25
    }, {
        Create("UIPadding", {
            PaddingLeft = UDim.new(0, 15),
            PaddingRight = UDim.new(0, 15),
            PaddingTop = UDim.new(0, 15),
            PaddingBottom = UDim.new(0, 15)
        }),
        Create("UIListLayout", {
            SortOrder = "LayoutOrder",
            Padding = UDim.new(0, 8)
        })
    }), "ScrollBar")
    
    -- Buttons Folder
    local ButtonsFolder = Create("Frame", TopBar, {
        Name = "Buttons",
        Size = UDim2.new(0, 130, 1, 0),
        Position = UDim2.new(1, -15, 0),
        AnchorPoint = Vector2.new(1, 0),
        BackgroundTransparency = 1,
        ZIndex = 25
    })
    
    local UIListButtons = Create("UIListLayout", ButtonsFolder, {
        FillDirection = "Horizontal",
        HorizontalAlignment = "Right",
        VerticalAlignment = "Center",
        Padding = UDim.new(0, 12),
        SortOrder = "LayoutOrder"
    })
    
    -- Search Button
    local SearchButton = Create("ImageButton", ButtonsFolder, {
        Size = UDim2.new(0, 20, 0, 20),
        BackgroundTransparency = 1,
        Image = "rbxassetid://6031154871",
        ImageColor3 = Theme["Color Text"],
        Name = "Search",
        LayoutOrder = 1,
        ZIndex = 25
    })
    
    -- Minimize Button
    local MinimizeButton = Create("ImageButton", ButtonsFolder, {
        Size = UDim2.new(0, 18, 0, 18),
        BackgroundTransparency = 1,
        Image = "rbxassetid://10734896206",
        ImageColor3 = Theme["Color Text"],
        Name = "Minimize",
        LayoutOrder = 2,
        ZIndex = 25
    })
    
    -- Close Button
    local CloseButton = Create("ImageButton", ButtonsFolder, {
        Size = UDim2.new(0, 18, 0, 18),
        BackgroundTransparency = 1,
        Image = "rbxassetid://10747384394",
        ImageColor3 = Theme["Color Text"],
        Name = "Close",
        LayoutOrder = 3,
        ZIndex = 25
    })
    
    -- Search Input
    local SearchInputFrame = InsertTheme(Create("Frame", TopBar, {
        Size = UDim2.new(0, 0, 0, 28),
        Position = UDim2.new(1, -120, 0.5),
        AnchorPoint = Vector2.new(1, 0.5),
        BackgroundColor3 = Theme["Color Hub 2"],
        ClipsDescendants = true,
        ZIndex = 30
    }), "Frame")
    Make("Corner", SearchInputFrame, UDim.new(0, 10))
    Make("Stroke", SearchInputFrame, {Color = Theme["Color Stroke"], Thickness = 1.5})
    
    local SearchInput = InsertTheme(Create("TextBox", SearchInputFrame, {
        Size = UDim2.new(1, -10, 1, 0),
        Position = UDim2.new(0, 8, 0, 0),
        BackgroundTransparency = 1,
        Font = Enum.Font.Gotham,
        PlaceholderText = "Search...",
        TextColor3 = Theme["Color Text"],
        TextSize = 12,
        TextXAlignment = "Left",
        Text = "",
        ZIndex = 31
    }), "Text")
    
    -- Search Logic
    local SearchActive = false
    
    local function UpdateSearch(Query)
        Query = string.lower(Query)
        
        for _, ElementData in pairs(bearlib.AllElements) do
            if ElementData.Instance and ElementData.OriginalParent then
                if ElementData.Instance.Parent == SearchContainer then
                    ElementData.Instance.Parent = ElementData.OriginalParent
                    ElementData.Instance.Visible = true
                end
            end
        end
        
        if Query == "" then return end
        
        for _, ElementData in pairs(bearlib.AllElements) do
            local Name = string.lower(ElementData.Name)
            local SectionName = ElementData.SectionName and string.lower(ElementData.SectionName) or ""
            local MatchName = string.find(Name, Query)
            local MatchSection = (SectionName ~= "" and string.find(SectionName, Query))
            
            if MatchName or MatchSection then
                if ElementData.Instance then
                    ElementData.Instance.Parent = SearchContainer
                    ElementData.Instance.Visible = true
                end
            end
        end
    end
    
    SearchButton.Activated:Connect(function()
        SearchActive = not SearchActive
        if SearchActive then
            CreateTween({SearchInputFrame, "Size", UDim2.new(0, 180, 0, 28), 0.3})
            SearchContainer.Visible = true
            Containers.Visible = false
            SearchInput:CaptureFocus()
        else
            CreateTween({SearchInputFrame, "Size", UDim2.new(0, 0, 0, 28), 0.3})
            SearchInput.Text = ""
            UpdateSearch("")
            SearchContainer.Visible = false
            Containers.Visible = true
        end
    end)
    
    SearchInput:GetPropertyChangedSignal("Text"):Connect(function()
        if SearchActive then
            UpdateSearch(SearchInput.Text)
        end
    end)
    
    -- Size Controls
    local ControlSize1 = MakeDrag(Create("ImageButton", MainFrame, {
        Size = UDim2.new(0, 45, 0, 45),
        Position = MainFrame.Size,
        Active = true,
        AnchorPoint = Vector2.new(0.8, 0.8),
        BackgroundTransparency = 1,
        Image = "rbxassetid://10747384394",
        ImageColor3 = Theme["Color Stroke"],
        Name = "Control Hub Size",
        ZIndex = 30
    }))
    CreateGlow(ControlSize1, Theme["Color Glow"], 25)
    
    local ControlSize2 = MakeDrag(Create("ImageButton", MainFrame, {
        Size = UDim2.new(0, 30, 1, -45),
        Position = UDim2.new(0, MainScroll.Size.X.Offset, 1, 0),
        AnchorPoint = Vector2.new(0.5, 1),
        Active = true,
        BackgroundTransparency = 1,
        Image = "rbxassetid://10734924532",
        ImageColor3 = Theme["Color Stroke"],
        Name = "Control Tab Size",
        ZIndex = 30
    }))
    CreateGlow(ControlSize2, Theme["Color Glow"], 25)
    
    local function ControlSize()
        local Pos1, Pos2 = ControlSize1.Position, ControlSize2.Position
        ControlSize1.Position = UDim2.fromOffset(math.clamp(Pos1.X.Offset, 450, 1100), math.clamp(Pos1.Y.Offset, 250, 600))
        ControlSize2.Position = UDim2.new(0, math.clamp(Pos2.X.Offset, 150, 280), 1, 0)
        
        MainScroll.Size = UDim2.new(0, ControlSize2.Position.X.Offset, 1, -TopBar.Size.Y.Offset)
        Containers.Size = UDim2.new(1, -MainScroll.Size.X.Offset - 5, 1, -TopBar.Size.Y.Offset - 5)
        MainFrame.Size = ControlSize1.Position
        SearchContainer.Size = Containers.Size
    end
    
    ControlSize1:GetPropertyChangedSignal("Position"):Connect(ControlSize)
    ControlSize2:GetPropertyChangedSignal("Position"):Connect(ControlSize)
    
    ConnectSave(ControlSize1, function()
        if not Minimized then
            bearlib.Save.UISize = {MainFrame.Size.X.Offset, MainFrame.Size.Y.Offset}
            if bearlib.SaveEnabled then
                SaveJson(bearlib.SaveFile, bearlib.Save)
            end
        end
    end)
    
    ConnectSave(ControlSize2, function()
        bearlib.Save.TabSize = MainScroll.Size.X.Offset
        if bearlib.SaveEnabled then
            SaveJson(bearlib.SaveFile, bearlib.Save)
        end
    end)
    
    -- Window Object
    local Minimized, SaveSize, WaitClick
    local Window, FirstTab = {}, false
    
    function Window:CloseBtn()
        local Dialog = Window:Dialog({
            Title = "Exit",
            Text = "Do you want to close the menu?",
            Options = {
                {"Close", function()
                    ScreenGui:Destroy()
                    local Toggle = game:GetService("CoreGui"):FindFirstChild("BearHub_Toggle_V4")
                    if Toggle then Toggle:Destroy() end
                end},
                {"Cancel"}
            }
        })
    end
    
    function Window:MinimizeBtn()
        if WaitClick then return end
        WaitClick = true
        
        if Minimized then
            MinimizeButton.Image = "rbxassetid://10734896206"
            CreateTween({MainFrame, "Size", SaveSize, 0.25, true})
            ControlSize1.Visible = true
            ControlSize2.Visible = true
            Minimized = false
        else
            MinimizeButton.Image = "rbxassetid://10734924532"
            SaveSize = MainFrame.Size
            ControlSize1.Visible = false
            ControlSize2.Visible = false
            CreateTween({MainFrame, "Size", UDim2.fromOffset(MainFrame.Size.X.Offset, 45), 0.25, true})
            Minimized = true
        end
        WaitClick = false
    end
    
    function Window:Minimize()
        MainFrame.Visible = not MainFrame.Visible
    end
    
    function Window:AddMinimizeButton(Configs)
        local Button = MakeDrag(Create("ImageButton", ScreenGui, {
            Size = UDim2.fromOffset(45, 45),
            Position = UDim2.fromScale(0.15, 0.15),
            BackgroundTransparency = 0.2,
            BackgroundColor3 = Theme["Color Hub 2"],
            AutoButtonColor = false,
            ZIndex = 50
        }))
        Make("Corner", Button, UDim.new(0.25, 0))
        Make("Stroke", Button, {Color = Theme["Color Stroke"], Thickness = 1.5})
        CreateGlow(Button, Theme["Color Glow"], 30)
        
        if Configs and Configs.Button then
            SetProps(Button, Configs.Button)
        end
        
        Button.Activated:Connect(Window.Minimize)
        return {Button = Button}
    end
    
    function Window:Set(Val1, Val2)
        if type(Val1) == "string" and type(Val2) == "string" then
            Title.Text = Val1
            Title.SubTitle.Text = Val2
        elseif type(Val1) == "string" then
            Title.Text = Val1
        end
    end
    
    function Window:Dialog(Configs)
        if MainFrame:FindFirstChild("Dialog") then return end
        if Minimized then Window:MinimizeBtn() end
        
        local DTitle = Configs[1] or Configs.Title or "Dialog"
        local DText = Configs[2] or Configs.Text or "Notification"
        local DOptions = Configs[3] or Configs.Options or {}
        
        local Frame = Create("Frame", {
            Active = true,
            Size = UDim2.fromOffset(300, 180),
            Position = UDim2.fromScale(0.5, 0.5),
            AnchorPoint = Vector2.new(0.5, 0.5),
            BackgroundColor3 = Theme["Color Hub 2"],
            ZIndex = 50
        }, {
            InsertTheme(Create("TextLabel", {
                Font = Enum.Font.GothamBold,
                Size = UDim2.new(1, 0, 0, 30),
                Text = DTitle,
                TextXAlignment = "Left",
                TextColor3 = Theme["Color Text"],
                TextSize = 18,
                Position = UDim2.fromOffset(20, 8),
                BackgroundTransparency = 1,
                ZIndex = 51
            }), "Text"),
            InsertTheme(Create("TextLabel", {
                Font = Enum.Font.Gotham,
                Size = UDim2.new(1, -40),
                AutomaticSize = "Y",
                Text = DText,
                TextXAlignment = "Left",
                TextColor3 = Theme["Color Dark Text"],
                TextSize = 13,
                Position = UDim2.fromOffset(20, 40),
                BackgroundTransparency = 1,
                TextWrapped = true,
                ZIndex = 51
            }), "DarkText")
        })
        Make("Gradient", Frame, {Rotation = 45})
        Make("Corner", Frame, UDim.new(0, 15))
        Make("Stroke", Frame, {Color = Theme["Color Stroke"], Thickness = 2})
        CreateGlow(Frame, Theme["Color Glow"], 40)
        
        local ButtonsHolder = Create("Frame", Frame, {
            Size = UDim2.fromScale(1, 0.3),
            Position = UDim2.fromScale(0, 1),
            AnchorPoint = Vector2.new(0, 1),
            BackgroundTransparency = 1,
            ZIndex = 51
        }, {
            Create("UIListLayout", {
                Padding = UDim.new(0, 15),
                VerticalAlignment = "Center",
                FillDirection = "Horizontal",
                HorizontalAlignment = "Center"
            })
        })
        
        local Screen = Create("Frame", MainFrame, {
            BackgroundTransparency = 0.8,
            Active = true,
            BackgroundColor3 = Color3.fromRGB(0, 0, 0),
            Size = UDim2.new(1, 0, 1, 0),
            Name = "Dialog",
            ZIndex = 49
        })
        
        Make("Corner", Screen, UDim.new(0, 20))
        Frame.Parent = Screen
        CreateTween({Frame, "Size", UDim2.fromOffset(280, 160), 0.2})
        CreateTween({Frame, "Transparency", 0, 0.15})
        CreateTween({Screen, "Transparency", 0.7, 0.15})
        
        local ButtonCount, Dialog = 1, {}
        function Dialog:Button(Configs)
            local Name = Configs[1] or Configs.Name or Configs.Title or ""
            local Callback = Configs[2] or Configs.Callback or function() end
            
            ButtonCount = ButtonCount + 1
            local Button = Make("Button", ButtonsHolder, {Text = Name})
            Make("Corner", Button, UDim.new(0, 8))
            SetProps(Button, {
                Font = Enum.Font.GothamBold,
                TextColor3 = Theme["Color Text"],
                TextSize = 13,
                BackgroundColor3 = Theme["Color Theme"],
                ZIndex = 52
            })
            
            for _, Btn in pairs(ButtonsHolder:GetChildren()) do
                if Btn:IsA("TextButton") then
                    Btn.Size = UDim2.new(1 / ButtonCount, -(((ButtonCount - 1) * 25) / ButtonCount), 0, 35)
                end
            end
            Button.Activated:Connect(Dialog.Close)
            Button.Activated:Connect(Callback)
        end
        
        function Dialog:Close()
            CreateTween({Frame, "Size", UDim2.fromOffset(300, 180), 0.2})
            CreateTween({Screen, "Transparency", 1, 0.15})
            CreateTween({Frame, "Transparency", 1, 0.15, true})
            Screen:Destroy()
        end
        
        table.foreach(DOptions, function(_, Button)
            Dialog:Button(Button)
        end)
        return Dialog
    end
    
    CloseButton.Activated:Connect(Window.CloseBtn)
    MinimizeButton.Activated:Connect(Window.MinimizeBtn)
    
    -- Tab Handling
    function Window:SelectTab(TabSelect)
        if type(TabSelect) == "number" then
            bearlib.Tabs[TabSelect].func:Enable()
        else
            for _, Tab in pairs(bearlib.Tabs) do
                if Tab.Cont == TabSelect.Cont then
                    Tab.func:Enable()
                end
            end
        end
    end
    
    local ContainerList = {}
    
    function Window:MakeTab(Configs)
        if type(Configs) ~= "table" then Configs = {} end
        local TName = Configs[1] or Configs.Title or "Tab"
        local TIcon = Configs[2] or Configs.Icon or ""
        
        TIcon = bearlib:GetIcon(TIcon)
        if not TIcon:find("rbxassetid://") or TIcon:gsub("rbxassetid://", ""):len() < 6 then
            TIcon = false
        end
        
        -- Tab Button
        local TabSelect = Make("Button", MainScroll, {
            Size = UDim2.new(1, 0, 0, 32),
            ZIndex = 25
        })
        Make("Corner", TabSelect, UDim.new(0, 10))
        
        local LabelTitle = InsertTheme(Create("TextLabel", TabSelect, {
            Size = UDim2.new(1, TIcon and -35 or -25, 1),
            Position = UDim2.fromOffset(TIcon and 35 or 25),
            BackgroundTransparency = 1,
            Font = Enum.Font.GothamBold,
            Text = TName,
            TextColor3 = Theme["Color Text"],
            TextSize = 13,
            TextXAlignment = Enum.TextXAlignment.Left,
            TextTransparency = (FirstTab and 0.3) or 0,
            TextTruncate = "AtEnd",
            ZIndex = 26
        }), "Text")
        
        local LabelIcon = InsertTheme(Create("ImageLabel", TabSelect, {
            Position = UDim2.new(0, 12, 0.5),
            Size = UDim2.new(0, 18, 0, 18),
            AnchorPoint = Vector2.new(0, 0.5),
            Image = TIcon or "",
            BackgroundTransparency = 1,
            ImageTransparency = (FirstTab and 0.3) or 0,
            ZIndex = 26
        }), "Text")
        
        local Selected = InsertTheme(Create("Frame", TabSelect, {
            Size = FirstTab and UDim2.new(0, 4, 0, 4) or UDim2.new(0, 4, 0, 22),
            Position = UDim2.new(0, 4, 0.5),
            AnchorPoint = Vector2.new(0, 0.5),
            BackgroundColor3 = Theme["Color Theme"],
            BackgroundTransparency = FirstTab and 1 or 0,
            ZIndex = 26
        }), "Theme")
        Make("Corner", Selected, UDim.new(0.5, 0))
        
        local Container = InsertTheme(Create("ScrollingFrame", {
            Size = UDim2.new(1, 0, 1, 0),
            Position = UDim2.new(0, 0, 1),
            AnchorPoint = Vector2.new(0, 1),
            ScrollBarThickness = 3,
            BackgroundTransparency = 1,
            ScrollBarImageTransparency = 0.2,
            ScrollBarImageColor3 = Theme["Color Theme"],
            AutomaticCanvasSize = "Y",
            ScrollingDirection = "Y",
            BorderSizePixel = 0,
            CanvasSize = UDim2.new(),
            Name = ("Container %i [%s]"):format(#ContainerList + 1, TName),
            ZIndex = 20
        }, {
            Create("UIPadding", {
                PaddingLeft = UDim.new(0, 15),
                PaddingRight = UDim.new(0, 15),
                PaddingTop = UDim.new(0, 15),
                PaddingBottom = UDim.new(0, 15)
            }),
            Create("UIListLayout", {
                SortOrder = "LayoutOrder",
                Padding = UDim.new(0, 8)
            })
        }), "ScrollBar")
        
        table.insert(ContainerList, Container)
        if not FirstTab then Container.Parent = Containers end
        
        local function Tabs()
            if Container.Parent then return end
            for _, Frame in pairs(ContainerList) do
                if Frame:IsA("ScrollingFrame") and Frame ~= Container then
                    Frame.Parent = nil
                end
            end
            Container.Parent = Containers
            Container.Size = UDim2.new(1, 0, 1, 150)
            table.foreach(bearlib.Tabs, function(_, Tab)
                if Tab.Cont ~= Container then
                    Tab.func:Disable()
                end
            end)
            CreateTween({Container, "Size", UDim2.new(1, 0, 1, 0), 0.3})
            CreateTween({LabelTitle, "TextTransparency", 0, 0.35})
            CreateTween({LabelIcon, "ImageTransparency", 0, 0.35})
            CreateTween({Selected, "Size", UDim2.new(0, 4, 0, 22), 0.35})
            CreateTween({Selected, "BackgroundTransparency", 0, 0.35})
        end
        TabSelect.Activated:Connect(Tabs)
        
        FirstTab = true
        local Tab = {}
        table.insert(bearlib.Tabs, {TabInfo = {Name = TName, Icon = TIcon}, func = Tab, Cont = Container})
        Tab.Cont = Container
        
        local ElementCount = 0
        local function GetOrder()
            ElementCount = ElementCount + 1
            return ElementCount
        end
        
        function Tab:Disable()
            Container.Parent = nil
            CreateTween({LabelTitle, "TextTransparency", 0.3, 0.35})
            CreateTween({LabelIcon, "ImageTransparency", 0.3, 0.35})
            CreateTween({Selected, "Size", UDim2.new(0, 4, 0, 4), 0.35})
            CreateTween({Selected, "BackgroundTransparency", 1, 0.35})
        end
        
        function Tab:Enable()
            Tabs()
        end
        
        function Tab:Visible(Bool)
            Funcs:ToggleVisible(TabSelect, Bool)
            Funcs:ToggleParent(Container, Bool, Containers)
        end
        
        function Tab:Destroy()
            TabSelect:Destroy()
            Container:Destroy()
        end
        
        local CurrentSectionName = nil
        
        function Tab:AddSection(Configs)
            local SectionName = type(Configs) == "string" and Configs or Configs[1] or Configs.Name or Configs.Title or Configs.Section
            CurrentSectionName = SectionName
            
            local SectionFrame = Create("Frame", Container, {
                Size = UDim2.new(1, 0, 0, 28),
                BackgroundTransparency = 1,
                Name = "Option",
                LayoutOrder = GetOrder(),
                ZIndex = 25
            })
            
            local SectionLabel = InsertTheme(Create("TextLabel", SectionFrame, {
                Font = Enum.Font.GothamBold,
                Text = SectionName,
                TextColor3 = Theme["Color Text"],
                Size = UDim2.new(1, -30, 1, 0),
                Position = UDim2.new(0, 10),
                BackgroundTransparency = 1,
                TextTruncate = "AtEnd",
                TextSize = 17,
                TextXAlignment = "Left",
                ZIndex = 26
            }), "Text")
            
            local Underline = Create("Frame", SectionFrame, {
                Size = UDim2.new(1, -20, 0, 2),
                Position = UDim2.new(0, 10, 1, -4),
                BackgroundColor3 = Theme["Color Stroke"],
                BackgroundTransparency = 0.3,
                ZIndex = 26
            })
            Make("Corner", Underline, UDim.new(0.5, 0))
            
            table.insert(bearlib.AllElements, {
                Name = SectionName,
                Instance = SectionFrame,
                OriginalParent = Container,
                SectionName = SectionName
            })
            
            local Section = {}
            table.insert(bearlib.Options, {type = "Section", Name = SectionName, func = Section})
            function Section:Visible(Bool)
                if Bool == nil then
                    SectionFrame.Visible = not SectionFrame.Visible
                else
                    SectionFrame.Visible = Bool
                end
            end
            function Section:Destroy()
                SectionFrame:Destroy()
            end
            function Section:Set(New)
                if New then
                    SectionLabel.Text = GetStr(New)
                end
            end
            return Section
        end
        
        function Tab:AddParagraph(Configs)
            local PName = Configs[1] or Configs.Title or "Paragraph"
            local PDesc = Configs[2] or Configs.Text or ""
            
            local Frame, LabelFunc = ButtonFrame(Container, PName, PDesc, UDim2.new(1, -20))
            Frame.LayoutOrder = GetOrder()
            
            table.insert(bearlib.AllElements, {
                Name = PName,
                Instance = Frame,
                OriginalParent = Container,
                SectionName = CurrentSectionName
            })
            
            local Paragraph = {}
            function Paragraph:Visible(...) Funcs:ToggleVisible(Frame, ...) end
            function Paragraph:Destroy() Frame:Destroy() end
            function Paragraph:SetTitle(Val) LabelFunc:SetTitle(GetStr(Val)) end
            function Paragraph:SetDesc(Val) LabelFunc:SetDesc(GetStr(Val)) end
            function Paragraph:Set(Val1, Val2)
                if Val1 and Val2 then
                    LabelFunc:SetTitle(GetStr(Val1))
                    LabelFunc:SetDesc(GetStr(Val2))
                elseif Val1 then
                    LabelFunc:SetDesc(GetStr(Val1))
                end
            end
            return Paragraph
        end
        
        function Tab:AddButton(Configs)
            local BName = Configs[1] or Configs.Name or Configs.Title or "Button"
            local BDescription = Configs.Desc or Configs.Description or ""
            local Callback = Funcs:GetCallback(Configs, 2)
            
            local FButton, LabelFunc = ButtonFrame(Container, BName, BDescription, UDim2.new(1, -20))
            FButton.LayoutOrder = GetOrder()
            
            local ButtonIcon = Create("ImageLabel", FButton, {
                Size = UDim2.new(0, 18, 0, 18),
                Position = UDim2.new(1, -15, 0.5),
                AnchorPoint = Vector2.new(1, 0.5),
                BackgroundTransparency = 1,
                Image = "rbxassetid://10709791437",
                ImageColor3 = Theme["Color Stroke"],
                ZIndex = 26
            })
            
            FButton.Activated:Connect(function()
                Funcs:FireCallback(Callback)
            end)
            
            table.insert(bearlib.AllElements, {
                Name = BName,
                Instance = FButton,
                OriginalParent = Container,
                SectionName = CurrentSectionName
            })
            
            local Button = {}
            function Button:Visible(...) Funcs:ToggleVisible(FButton, ...) end
            function Button:Destroy() FButton:Destroy() end
            function Button:Callback(...) Funcs:InsertCallback(Callback, ...) end
            function Button:Set(Val1, Val2)
                if type(Val1) == "string" and type(Val2) == "string" then
                    LabelFunc:SetTitle(Val1)
                    LabelFunc:SetDesc(Val2)
                elseif type(Val1) == "string" then
                    LabelFunc:SetTitle(Val1)
                elseif type(Val1) == "function" then
                    Callback = Val1
                end
            end
            return Button
        end
        
        function Tab:AddToggle(Configs)
            local TName = Configs[1] or Configs.Name or Configs.Title or "Toggle"
            local TDesc = Configs.Desc or Configs.Description or ""
            local Callback = Funcs:GetCallback(Configs, 3)
            local Flag = Configs[4] or Configs.Flag or false
            local Default = Configs[2] or Configs.Default or false
            if CheckFlag(Flag) then Default = GetFlag(Flag) end
            
            local Button, LabelFunc = ButtonFrame(Container, TName, TDesc, UDim2.new(1, -45))
            Button.LayoutOrder = GetOrder()
            
            local ToggleHolder = InsertTheme(Create("Frame", Button, {
                Size = UDim2.new(0, 45, 0, 24),
                Position = UDim2.new(1, -15, 0.5),
                AnchorPoint = Vector2.new(1, 0.5),
                BackgroundColor3 = Theme["Color Stroke"],
                ZIndex = 26
            }), "Stroke")
            Make("Corner", ToggleHolder, UDim.new(0.5, 0))
            
            local Slider = Create("Frame", ToggleHolder, {
                BackgroundTransparency = 1,
                Size = UDim2.new(0.85, 0, 0.85, 0),
                Position = UDim2.new(0.5, 0, 0.5, 0),
                AnchorPoint = Vector2.new(0.5, 0.5),
                ZIndex = 27
            })
            
            local Toggle = InsertTheme(Create("Frame", Slider, {
                Size = UDim2.new(0, 18, 0, 18),
                Position = UDim2.new(0, 0, 0.5),
                AnchorPoint = Vector2.new(0, 0.5),
                BackgroundColor3 = Theme["Color Theme"],
                ZIndex = 28
            }), "Theme")
            Make("Corner", Toggle, UDim.new(0.5, 0))
            CreateGlow(Toggle, Theme["Color Glow"], 15)
            
            local WaitClick
            local function SetToggle(Val)
                if WaitClick then return end
                WaitClick, Default = true, Val
                SetFlag(Flag, Default)
                Funcs:FireCallback(Callback, Default)
                if Default then
                    CreateTween({Toggle, "Position", UDim2.new(1, 0, 0.5), 0.25})
                    CreateTween({Toggle, "BackgroundTransparency", 0, 0.25})
                    CreateTween({Toggle, "AnchorPoint", Vector2.new(1, 0.5), 0.25})
                else
                    CreateTween({Toggle, "Position", UDim2.new(0, 0, 0.5), 0.25})
                    CreateTween({Toggle, "BackgroundTransparency", 0.8, 0.25})
                    CreateTween({Toggle, "AnchorPoint", Vector2.new(0, 0.5), 0.25})
                end
                WaitClick = false
            end
            task.spawn(SetToggle, Default)
            
            Button.Activated:Connect(function()
                SetToggle(not Default)
            end)
            
            table.insert(bearlib.AllElements, {
                Name = TName,
                Instance = Button,
                OriginalParent = Container,
                SectionName = CurrentSectionName
            })
            
            local Toggle = {}
            function Toggle:Visible(...) Funcs:ToggleVisible(Button, ...) end
            function Toggle:Destroy() Button:Destroy() end
            function Toggle:Callback(...) Funcs:InsertCallback(Callback, ...)() end
            function Toggle:Set(Val1, Val2)
                if type(Val1) == "string" and type(Val2) == "string" then
                    LabelFunc:SetTitle(Val1)
                    LabelFunc:SetDesc(Val2)
                elseif type(Val1) == "string" then
                    LabelFunc:SetTitle(Val1)
                elseif type(Val1) == "boolean" then
                    if WaitClick and Val2 then
                        repeat task.wait() until not WaitClick
                    end
                    task.spawn(SetToggle, Val1)
                elseif type(Val1) == "function" then
                    Callback = Val1
                end
            end
            return Toggle
        end
        
        function Tab:AddDropdown(Configs)
            local DName = Configs[1] or Configs.Name or Configs.Title or "Dropdown"
            local DDesc = Configs.Desc or Configs.Description or ""
            local DOptions = Configs[2] or Configs.Options or {}
            local OpDefault = Configs[3] or Configs.Default or {}
            local Flag = Configs[5] or Configs.Flag or false
            local DMultiSelect = Configs.MultiSelect or false
            local Callback = Funcs:GetCallback(Configs, 4)
            
            local Button, LabelFunc = ButtonFrame(Container, DName, DDesc, UDim2.new(1, -200))
            Button.LayoutOrder = GetOrder()
            
            local SelectedFrame = InsertTheme(Create("Frame", Button, {
                Size = UDim2.new(0, 180, 0, 24),
                Position = UDim2.new(1, -15, 0.5),
                AnchorPoint = Vector2.new(1, 0.5),
                BackgroundColor3 = Theme["Color Stroke"],
                ZIndex = 26
            }), "Stroke")
            Make("Corner", SelectedFrame, UDim.new(0, 8))
            
            local ActiveLabel = InsertTheme(Create("TextLabel", SelectedFrame, {
                Size = UDim2.new(0.85, 0, 0.85, 0),
                AnchorPoint = Vector2.new(0.5, 0.5),
                Position = UDim2.new(0.5, 0, 0.5, 0),
                BackgroundTransparency = 1,
                Font = Enum.Font.GothamBold,
                TextScaled = true,
                TextColor3 = Theme["Color Text"],
                Text = "...",
                ZIndex = 27
            }), "Text")
            
            local Arrow = Create("ImageLabel", SelectedFrame, {
                Size = UDim2.new(0, 18, 0, 18),
                Position = UDim2.new(0, -8, 0.5),
                AnchorPoint = Vector2.new(1, 0.5),
                Image = "rbxassetid://10709791523",
                ImageColor3 = Theme["Color Text"],
                BackgroundTransparency = 1,
                ZIndex = 27
            })
            
            local NoClickFrame = Create("TextButton", DropdownHolder, {
                Name = "AntiClick",
                Size = UDim2.new(1, 0, 1, 0),
                BackgroundTransparency = 1,
                Visible = false,
                Text = "",
                ZIndex = 45
            })
            
            local DropFrame = Create("Frame", NoClickFrame, {
                Size = UDim2.new(SelectedFrame.Size.X, 0, 0),
                BackgroundTransparency = 0.1,
                BackgroundColor3 = Color3.fromRGB(30, 30, 40),
                AnchorPoint = Vector2.new(0, 1),
                Name = "DropdownFrame",
                ClipsDescendants = true,
                Active = true,
                ZIndex = 50
            })
            Make("Corner", DropFrame, UDim.new(0, 10))
            Make("Stroke", DropFrame, {Color = Theme["Color Stroke"], Thickness = 1.5})
            Make("Gradient", DropFrame, {Rotation = 60})
            CreateGlow(DropFrame, Theme["Color Glow"], 25)
            
            local ScrollFrame = InsertTheme(Create("ScrollingFrame", DropFrame, {
                ScrollBarImageColor3 = Theme["Color Theme"],
                Size = UDim2.new(1, 0, 1, 0),
                ScrollBarThickness = 2,
                BackgroundTransparency = 1,
                BorderSizePixel = 0,
                CanvasSize = UDim2.new(),
                ScrollingDirection = "Y",
                AutomaticCanvasSize = "Y",
                Active = true,
                ZIndex = 51
            }, {
                Create("UIPadding", {
                    PaddingLeft = UDim.new(0, 10),
                    PaddingRight = UDim.new(0, 10),
                    PaddingTop = UDim.new(0, 8),
                    PaddingBottom = UDim.new(0, 8)
                }),
                Create("UIListLayout", {Padding = UDim.new(0, 6)})
            }), "ScrollBar")
            
            local ScrollSize, WaitClick = 5
            local function Disable()
                WaitClick = true
                CreateTween({Arrow, "Rotation", 0, 0.2})
                CreateTween({DropFrame, "Size", UDim2.new(0, 182, 0, 0), 0.2, true})
                CreateTween({Arrow, "ImageColor3", Theme["Color Text"], 0.2})
                Arrow.Image = "rbxassetid://10709791523"
                NoClickFrame.Visible = false
                WaitClick = false
            end
            
            local function GetFrameSize()
                return UDim2.fromOffset(182, ScrollSize)
            end
            
            local function CalculateSize()
                local Count = 0
                for _, Frame in pairs(ScrollFrame:GetChildren()) do
                    if Frame:IsA("Frame") or Frame.Name == "Option" then
                        Count = Count + 1
                    end
                end
                ScrollSize = (math.clamp(Count, 0, 10) * 28) + 16
                if NoClickFrame.Visible then
                    NoClickFrame.Visible = true
                    CreateTween({DropFrame, "Size", GetFrameSize(), 0.2, true})
                end
            end
            
            local function Minimize()
                if WaitClick then return end
                WaitClick = true
                if NoClickFrame.Visible then
                    Arrow.Image = "rbxassetid://10709791523"
                    CreateTween({Arrow, "ImageColor3", Theme["Color Text"], 0.2})
                    CreateTween({DropFrame, "Size", UDim2.new(0, 182, 0, 0), 0.2, true})
                    NoClickFrame.Visible = false
                else
                    NoClickFrame.Visible = true
                    Arrow.Image = "rbxassetid://10709790948"
                    CreateTween({Arrow, "ImageColor3", Theme["Color Theme"], 0.2})
                    CreateTween({DropFrame, "Size", GetFrameSize(), 0.2, true})
                end
                WaitClick = false
            end
            
            local function CalculatePos()
                local FramePos = SelectedFrame.AbsolutePosition
                local ScreenSize = ScreenGui.AbsoluteSize
                local ClampX = math.clamp((FramePos.X / UIScale), 0, ScreenSize.X / UIScale - DropFrame.Size.X.Offset)
                local ClampY = math.clamp((FramePos.Y / UIScale), 0, ScreenSize.Y / UIScale)
                
                local NewPos = UDim2.fromOffset(ClampX, ClampY)
                local AnchorPoint = FramePos.Y > ScreenSize.Y / 1.4 and 1 or ScrollSize > 80 and 0.5 or 0
                DropFrame.AnchorPoint = Vector2.new(0, AnchorPoint)
                CreateTween({DropFrame, "Position", NewPos, 0.1})
            end
            
            local AddNewOptions, GetOptions, AddOption, RemoveOption, Selected do
                local Default = type(OpDefault) ~= "table" and {OpDefault} or OpDefault
                local MultiSelect = DMultiSelect
                local Options = {}
                Selected = MultiSelect and {} or CheckFlag(Flag) and GetFlag(Flag) or Default[1]
                
                if MultiSelect then
                    for index, Value in pairs(CheckFlag(Flag) and GetFlag(Flag) or Default) do
                        if type(index) == "string" and (DOptions[index] or table.find(DOptions, index)) then
                            Selected[index] = Value
                        elseif DOptions[Value] then
                            Selected[Value] = true
                        end
                    end
                end
                
                local function CallbackSelected()
                    SetFlag(Flag, MultiSelect and Selected or tostring(Selected))
                    Funcs:FireCallback(Callback, Selected)
                end
                
                local function UpdateLabel()
                    if MultiSelect then
                        local list = {}
                        for index, Value in pairs(Selected) do
                            if Value then
                                table.insert(list, index)
                            end
                        end
                        ActiveLabel.Text = #list > 0 and table.concat(list, ", ") or "..."
                    else
                        ActiveLabel.Text = tostring(Selected or "...")
                    end
                end
                
                local function UpdateSelected()
                    if MultiSelect then
                        for _, v in pairs(Options) do
                            local nodes, Stats = v.nodes, v.Stats
                            CreateTween({nodes[2], "BackgroundTransparency", Stats and 0 or 0.8, 0.35})
                            CreateTween({nodes[2], "Size", Stats and UDim2.fromOffset(4, 15) or UDim2.fromOffset(4, 6), 0.35})
                            CreateTween({nodes[3], "TextTransparency", Stats and 0 or 0.4, 0.35})
                        end
                    else
                        for _, v in pairs(Options) do
                            local Slt = v.Value == Selected
                            local nodes = v.nodes
                            CreateTween({nodes[2], "BackgroundTransparency", Slt and 0 or 1, 0.35})
                            CreateTween({nodes[2], "Size", Slt and UDim2.fromOffset(4, 16) or UDim2.fromOffset(4, 6), 0.35})
                            CreateTween({nodes[3], "TextTransparency", Slt and 0 or 0.4, 0.35})
                        end
                    end
                    UpdateLabel()
                end
                
                local function Select(Option)
                    if MultiSelect then
                        Option.Stats = not Option.Stats
                        Option.LastCB = tick()
                        Selected[Option.Name] = Option.Stats
                        CallbackSelected()
                    else
                        Option.LastCB = tick()
                        Selected = Option.Value
                        CallbackSelected()
                    end
                    UpdateSelected()
                end
                
                AddOption = function(index, Value)
                    local Name = tostring(type(index) == "string" and index or Value)
                    if Options[Name] then return end
                    Options[Name] = {
                        index = index,
                        Value = Value,
                        Name = Name,
                        Stats = false,
                        LastCB = 0
                    }
                    
                    if MultiSelect then
                        local Stats = Selected[Name]
                        Selected[Name] = Stats or false
                        Options[Name].Stats = Stats
                    end
                    
                    local Button = Make("Button", ScrollFrame, {
                        Name = "Option",
                        Size = UDim2.new(1, 0, 0, 28),
                        Position = UDim2.new(0, 0, 0.5),
                        AnchorPoint = Vector2.new(0, 0.5),
                        ZIndex = 52
                    })
                    Make("Corner", Button, UDim.new(0, 8))
                    
                    local IsSelected = InsertTheme(Create("Frame", Button, {
                        Position = UDim2.new(0, 4, 0.5),
                        Size = UDim2.new(0, 4, 0, 6),
                        BackgroundColor3 = Theme["Color Theme"],
                        BackgroundTransparency = 1,
                        AnchorPoint = Vector2.new(0, 0.5),
                        ZIndex = 53
                    }), "Theme")
                    Make("Corner", IsSelected, UDim.new(0.5, 0))
                    
                    local OptionName = InsertTheme(Create("TextLabel", Button, {
                        Size = UDim2.new(1, -15, 1),
                        Position = UDim2.new(0, 15),
                        Text = Name,
                        TextColor3 = Theme["Color Text"],
                        Font = Enum.Font.Gotham,
                        TextXAlignment = "Left",
                        BackgroundTransparency = 1,
                        TextTransparency = 0.4,
                        TextSize = 12,
                        ZIndex = 53
                    }), "Text")
                    
                    Button.Activated:Connect(function()
                        Select(Options[Name])
                    end)
                    
                    Options[Name].nodes = {Button, IsSelected, OptionName}
                end
                
                RemoveOption = function(index, Value)
                    local Name = tostring(type(index) == "string" and index or Value)
                    if Options[Name] then
                        if MultiSelect then Selected[Name] = nil else Selected = nil end
                        Options[Name].nodes[1]:Destroy()
                        table.clear(Options[Name])
                        Options[Name] = nil
                    end
                end
                
                GetOptions = function()
                    return Options
                end
                
                AddNewOptions = function(List, Clear)
                    if Clear then
                        table.foreach(Options, RemoveOption)
                    end
                    table.foreach(List, AddOption)
                    CallbackSelected()
                    UpdateSelected()
                end
                
                table.foreach(DOptions, AddOption)
                CallbackSelected()
                UpdateSelected()
            end
            
            Button.Activated:Connect(Minimize)
            NoClickFrame.MouseButton1Down:Connect(Disable)
            NoClickFrame.MouseButton1Click:Connect(Disable)
            MainFrame:GetPropertyChangedSignal("Visible"):Connect(Disable)
            SelectedFrame:GetPropertyChangedSignal("AbsolutePosition"):Connect(CalculatePos)
            Button.Activated:Connect(CalculateSize)
            ScrollFrame.ChildAdded:Connect(CalculateSize)
            ScrollFrame.ChildRemoved:Connect(CalculateSize)
            CalculatePos()
            CalculateSize()
            
            table.insert(bearlib.AllElements, {
                Name = DName,
                Instance = Button,
                OriginalParent = Container,
                SectionName = CurrentSectionName
            })
            
            local Dropdown = {}
            function Dropdown:Visible(...) Funcs:ToggleVisible(Button, ...) end
            function Dropdown:Destroy() Button:Destroy() end
            function Dropdown:Callback(...) Funcs:InsertCallback(Callback, ...)(Selected) end
            function Dropdown:Add(...)
                local NewOptions = {...}
                if type(NewOptions[1]) == "table" then
                    table.foreach(NewOptions[1], function(_, Name)
                        AddOption(Name)
                    end)
                else
                    table.foreach(NewOptions, function(_, Name)
                        AddOption(Name)
                    end)
                end
            end
            function Dropdown:Remove(Option)
                for index, Value in pairs(GetOptions()) do
                    if type(Option) == "number" and index == Option or Value.Name == Option then
                        RemoveOption(index, Value.Value)
                    end
                end
            end
            function Dropdown:Select(Option)
                if type(Option) == "string" then
                    for _, Val in pairs(Options) do
                        if Val.Name == Option then
                            Select(Val)
                        end
                    end
                elseif type(Option) == "number" then
                    local count = 0
                    for _, Val in pairs(Options) do
                        count = count + 1
                        if count == Option then
                            Select(Val)
                        end
                    end
                end
            end
            function Dropdown:Set(Val1, Clear)
                if type(Val1) == "table" then
                    AddNewOptions(Val1, Clear)
                elseif type(Val1) == "function" then
                    Callback = Val1
                end
            end
            return Dropdown
        end
        
        function Tab:AddSlider(Configs)
            local SName = Configs[1] or Configs.Name or Configs.Title or "Slider"
            local SDesc = Configs.Desc or Configs.Description or ""
            local Min = Configs[2] or Configs.MinValue or Configs.Min or 10
            local Max = Configs[3] or Configs.MaxValue or Configs.Max or 100
            local Increase = Configs[4] or Configs.Increase or 1
            local Callback = Funcs:GetCallback(Configs, 6)
            local Flag = Configs[7] or Configs.Flag or false
            local Default = Configs[5] or Configs.Default or 25
            if CheckFlag(Flag) then Default = GetFlag(Flag) end
            local MinVal, MaxVal = Min, Max
            Min, Max = Min / Increase, Max / Increase
            
            local Button, LabelFunc = ButtonFrame(Container, SName, SDesc, UDim2.new(1, -200))
            Button.LayoutOrder = GetOrder()
            
            local SliderHolder = Create("TextButton", Button, {
                Size = UDim2.new(0.5, 0, 1),
                Position = UDim2.new(1),
                AnchorPoint = Vector2.new(1, 0),
                AutoButtonColor = false,
                Text = "",
                BackgroundTransparency = 1,
                ZIndex = 26
            })
            
            local SliderBar = InsertTheme(Create("Frame", SliderHolder, {
                BackgroundColor3 = Theme["Color Stroke"],
                Size = UDim2.new(1, -20, 0, 6),
                Position = UDim2.new(0.5, 0, 0.5),
                AnchorPoint = Vector2.new(0.5, 0.5),
                ZIndex = 27
            }), "Stroke")
            Make("Corner", SliderBar)
            
            local Indicator = InsertTheme(Create("Frame", SliderBar, {
                BackgroundColor3 = Theme["Color Theme"],
                Size = UDim2.fromScale(0.3, 1),
                BorderSizePixel = 0,
                ZIndex = 28
            }), "Theme")
            Make("Corner", Indicator)
            
            local SliderIcon = Create("Frame", SliderBar, {
                Size = UDim2.new(0, 10, 0, 18),
                BackgroundColor3 = Color3.fromRGB(255, 255, 255),
                Position = UDim2.fromScale(0.3, 0.5),
                AnchorPoint = Vector2.new(0.5, 0.5),
                BackgroundTransparency = 0,
                ZIndex = 29
            })
            Make("Corner", SliderIcon, UDim.new(0.5, 0))
            Make("Stroke", SliderIcon, {Color = Theme["Color Stroke"], Thickness = 1.5})
            CreateGlow(SliderIcon, Theme["Color Glow"], 15)
            
            local LabelVal = InsertTheme(Create("TextLabel", SliderHolder, {
                Size = UDim2.new(0, 30, 0, 18),
                AnchorPoint = Vector2.new(1, 0.5),
                Position = UDim2.new(0, -8, 0.5),
                BackgroundTransparency = 1,
                TextColor3 = Theme["Color Text"],
                Font = Enum.Font.FredokaOne,
                TextSize = 14,
                ZIndex = 27
            }), "Text")
            
            local UIScale = Create("UIScale", LabelVal)
            local BaseMousePos = Create("Frame", SliderBar, {
                Position = UDim2.new(0, 0, 0.5, 0),
                Visible = false
            })
            
            local function UpdateLabel(NewValue)
                local Number = tonumber(NewValue * Increase)
                Number = math.floor(Number * 100) / 100
                Default, LabelVal.Text = Number, tostring(Number)
                Funcs:FireCallback(Callback, Default)
            end
            
            local function ControlPos()
                local MousePos = Player:GetMouse()
                local APos = MousePos.X - BaseMousePos.AbsolutePosition.X
                local ConfigureDpiPos = APos / SliderBar.AbsoluteSize.X
                SliderIcon.Position = UDim2.new(math.clamp(ConfigureDpiPos, 0, 1), 0, 0.5, 0)
            end
            
            local function UpdateValues()
                Indicator.Size = UDim2.new(SliderIcon.Position.X.Scale, 0, 1, 0)
                local SliderPos = SliderIcon.Position.X.Scale
                local NewValue = math.floor(((SliderPos * Max) / Max) * (Max - Min) + Min)
                UpdateLabel(NewValue)
            end
            
            SliderHolder.MouseButton1Down:Connect(function()
                CreateTween({SliderIcon, "Transparency", 0, 0.3})
                Container.ScrollingEnabled = false
                while UserInputService:IsMouseButtonPressed(Enum.UserInputType.MouseButton1) do
                    task.wait()
                    ControlPos()
                end
                CreateTween({SliderIcon, "Transparency", 0, 0.3})
                Container.ScrollingEnabled = true
                SetFlag(Flag, Default)
            end)
            
            LabelVal:GetPropertyChangedSignal("Text"):Connect(function()
                UIScale.Scale = 0.4
                CreateTween({UIScale, "Scale", 1.3, 0.1})
                CreateTween({LabelVal, "Rotation", math.random(-2, 2) * 5, 0.15, true})
                CreateTween({UIScale, "Scale", 1, 0.2})
                CreateTween({LabelVal, "Rotation", 0, 0.1})
            end)
            
            function SetSlider(NewValue)
                if type(NewValue) ~= "number" then return end
                local SliderPos = (NewValue - MinVal) / (MaxVal - MinVal)
                SetFlag(Flag, NewValue)
                CreateTween({SliderIcon, "Position", UDim2.fromScale(math.clamp(SliderPos, 0, 1), 0.5), 0.3, true})
            end
            SetSlider(Default)
            
            SliderIcon:GetPropertyChangedSignal("Position"):Connect(UpdateValues)
            UpdateValues()
            
            table.insert(bearlib.AllElements, {
                Name = SName,
                Instance = Button,
                OriginalParent = Container,
                SectionName = CurrentSectionName
            })
            
            local Slider = {}
            function Slider:Set(NewVal1, NewVal2)
                if NewVal1 and NewVal2 then
                    LabelFunc:SetTitle(NewVal1)
                    LabelFunc:SetDesc(NewVal2)
                elseif type(NewVal1) == "string" then
                    LabelFunc:SetTitle(NewVal1)
                elseif type(NewVal1) == "function" then
                    Callback = NewVal1
                elseif type(NewVal1) == "number" then
                    SetSlider(NewVal1)
                end
            end
            function Slider:Callback(...) Funcs:InsertCallback(Callback, ...)(tonumber(Default)) end
            function Slider:Visible(...) Funcs:ToggleVisible(Button, ...) end
            function Slider:Destroy() Button:Destroy() end
            return Slider
        end
        
        function Tab:AddTextBox(Configs)
            local TName = Configs[1] or Configs.Name or Configs.Title or "Text Box"
            local TDesc = Configs.Desc or Configs.Description or ""
            local TDefault = Configs[2] or Configs.Default or ""
            local TPlaceholderText = Configs[5] or Configs.PlaceholderText or "Input"
            local TClearText = Configs[3] or Configs.ClearText or false
            local Callback = Funcs:GetCallback(Configs, 4)
            
            if type(TDefault) ~= "string" or TDefault:gsub(" ", ""):len() < 1 then
                TDefault = false
            end
            
            local Button, LabelFunc = ButtonFrame(Container, TName, TDesc, UDim2.new(1, -45))
            Button.LayoutOrder = GetOrder()
            
            local SelectedFrame = InsertTheme(Create("Frame", Button, {
                Size = UDim2.new(0, 180, 0, 24),
                Position = UDim2.new(1, -15, 0.5),
                AnchorPoint = Vector2.new(1, 0.5),
                BackgroundColor3 = Theme["Color Stroke"],
                ZIndex = 26
            }), "Stroke")
            Make("Corner", SelectedFrame, UDim.new(0, 8))
            
            local TextBoxInput = InsertTheme(Create("TextBox", SelectedFrame, {
                Size = UDim2.new(0.85, 0, 0.85, 0),
                AnchorPoint = Vector2.new(0.5, 0.5),
                Position = UDim2.new(0.5, 0, 0.5, 0),
                BackgroundTransparency = 1,
                Font = Enum.Font.Gotham,
                TextScaled = true,
                TextColor3 = Theme["Color Text"],
                ClearTextOnFocus = TClearText,
                PlaceholderText = TPlaceholderText,
                Text = TDefault or "",
                ZIndex = 27
            }), "Text")
            
            local Pencil = Create("ImageLabel", SelectedFrame, {
                Size = UDim2.new(0, 16, 0, 16),
                Position = UDim2.new(0, -8, 0.5),
                AnchorPoint = Vector2.new(1, 0.5),
                Image = "rbxassetid://15637081879",
                ImageColor3 = Theme["Color Text"],
                BackgroundTransparency = 1,
                ZIndex = 27
            })
            
            local TextBox = {}
            local function Input()
                local Text = TextBoxInput.Text
                if Text:gsub(" ", ""):len() > 0 then
                    if TextBox.OnChanging then
                        Text = TextBox.OnChanging(Text) or Text
                    end
                    Funcs:FireCallback(Callback, Text)
                    TextBoxInput.Text = Text
                end
            end
            
            TextBoxInput.FocusLost:Connect(Input)
            Input()
            
            TextBoxInput.FocusLost:Connect(function()
                CreateTween({Pencil, "ImageColor3", Theme["Color Text"], 0.2})
            end)
            TextBoxInput.Focused:Connect(function()
                CreateTween({Pencil, "ImageColor3", Theme["Color Theme"], 0.2})
            end)
            
            table.insert(bearlib.AllElements, {
                Name = TName,
                Instance = Button,
                OriginalParent = Container,
                SectionName = CurrentSectionName
            })
            
            TextBox.OnChanging = false
            function TextBox:Visible(...) Funcs:ToggleVisible(Button, ...) end
            function TextBox:Destroy() Button:Destroy() end
            function TextBox:Set(Val)
                if type(Val) == "string" then
                    TextBoxInput.Text = Val
                    Input()
                elseif type(Val) == "function" then
                    TextBox.OnChanging = Val
                end
            end
            return TextBox
        end
        
        function Tab:AddDiscordInvite(Configs)
            local ContainerFrame = Create("Frame", Container, {
                BackgroundTransparency = 1,
                Size = UDim2.new(1, 0, 0, 170),
                LayoutOrder = GetOrder(),
                Name = "DiscordInviteContainer"
            })
            
            local ListLayout = Create("UIListLayout", ContainerFrame, {
                FillDirection = Enum.FillDirection.Horizontal,
                HorizontalAlignment = Enum.HorizontalAlignment.Left,
                VerticalAlignment = Enum.VerticalAlignment.Center,
                Padding = UDim.new(0, 15),
                SortOrder = "LayoutOrder"
            })
            
            local function createDiscordCard(cardConfigs, layoutOrder)
                local BName = cardConfigs[1] or cardConfigs.Name or cardConfigs.Title or "Discord Server"
                local BDescription = cardConfigs[2] or cardConfigs.Description or cardConfigs.Desc or ""
                local Logo = cardConfigs[3] or cardConfigs.Icon or cardConfigs.Logo or cardConfigs.Image or ""
                local BannerColor = cardConfigs[4] or cardConfigs.Banner or cardConfigs.BannerColor or Color3.fromRGB(88, 101, 242)
                local Online = cardConfigs[5] or cardConfigs.Online or cardConfigs.MembersOnline
                local TotalMembers = cardConfigs[6] or cardConfigs.Members or cardConfigs.TotalMembers
                local InviteLink = cardConfigs[7] or cardConfigs.Invite or cardConfigs.Link or "https://discord.gg/example"
                
                assert(type(InviteLink) == "string", "\"Tab.AddDiscordInvite.Invite\". 'string' expected, got " .. typeof(InviteLink))
                
                local CardFrame = Create("Frame", ContainerFrame, {
                    BackgroundTransparency = 1,
                    Size = UDim2.new(0.5, -8, 1, -15),
                    LayoutOrder = layoutOrder,
                    Name = "DiscordCard_" .. layoutOrder
                })
                
                local Card = InsertTheme(Create("CanvasGroup", CardFrame, {
                    Size = UDim2.new(1, 0, 1, 0),
                    ClipsDescendants = true,
                    BackgroundColor3 = Theme["Color Hub 2"]
                }), "Frame")
                Make("Corner", Card, UDim.new(0, 15))
                Make("Stroke", Card, {Color = Theme["Color Stroke"], Thickness = 1.5})
                Make("Gradient", Card, {Rotation = 45})
                CreateGlow(Card, Theme["Color Glow"], 30)
                
                local BannerImage = Create("ImageLabel", Card, {
                    BackgroundColor3 = Color3.new(1, 1, 1),
                    Size = UDim2.fromScale(1, 0.3),
                    BackgroundTransparency = 1
                })
                
                local ServerIcon = Create("ImageLabel", Card, {
                    Size = UDim2.fromOffset(40, 40),
                    Position = UDim2.new(0, 15, 0.3, 0),
                    AnchorPoint = Vector2.new(0, 0.5),
                    Image = Logo,
                    BackgroundColor3 = Theme["Color Hub 2"]
                })
                Make("Corner", ServerIcon, UDim.new(0, 10))
                Make("Stroke", ServerIcon, {
                    Thickness = 2,
                    ApplyStrokeMode = Enum.ApplyStrokeMode.Border,
                    Color = Theme["Color Stroke"]
                })
                
                local ServerName = InsertTheme(Create("TextLabel", Card, {
                    Size = UDim2.new(1, -20, 0, 15),
                    Position = UDim2.new(0, 15, 0.46, 0),
                    TextXAlignment = Enum.TextXAlignment.Left,
                    BackgroundTransparency = 1,
                    TextSize = 14,
                    Text = BName,
                    Font = Enum.Font.GothamBold,
                    TextColor3 = Theme["Color Discord Text"]
                }), "Text")
                
                local StatsFrame
                if Online or TotalMembers then
                    StatsFrame = Create("Frame", Card, {
                        Size = UDim2.new(1, -20, 0, 12),
                        Position = UDim2.new(0, 0, 0.54, 0),
                        BackgroundTransparency = 1
                    })
                    
                    local StatsLayout = Create("UIListLayout", StatsFrame, {
                        HorizontalAlignment = Enum.HorizontalAlignment.Left,
                        VerticalAlignment = Enum.VerticalAlignment.Center,
                        FillDirection = Enum.FillDirection.Horizontal,
                        Padding = UDim.new(0, 8)
                    })
                    
                    local StatsPadding = Create("UIPadding", StatsFrame, {
                        PaddingLeft = UDim.new(0, 10),
                        PaddingRight = UDim.new(0, 10)
                    })
                    
                    local function AddStat(Color, Text)
                        local Stat = Create("Frame", StatsFrame, {
                            Size = UDim2.fromScale(0, 1),
                            AutomaticSize = Enum.AutomaticSize.X,
                            BackgroundTransparency = 1
                        })
                        
                        local Dot = Create("Frame", Stat, {
                            Size = UDim2.fromOffset(6, 6),
                            Position = UDim2.new(0, 6, 0.5, 0),
                            AnchorPoint = Vector2.new(0, 0.5),
                            BackgroundColor3 = Color,
                            BackgroundTransparency = 0
                        })
                        Make("Corner", Dot, UDim.new(1, 0))
                        
                        InsertTheme(Create("TextLabel", Stat, {
                            Size = UDim2.new(0, 0, 1, 0),
                            Position = UDim2.new(0, 16, 0.5, 0),
                            AnchorPoint = Vector2.new(0, 0.5),
                            AutomaticSize = Enum.AutomaticSize.X,
                            BackgroundTransparency = 1,
                            TextSize = 10,
                            Text = Text,
                            Font = Enum.Font.Gotham,
                            TextColor3 = Theme["Color Discord Stats"]
                        }), "DarkText")
                    end
                    
                    if Online ~= nil then
                        AddStat(Color3.fromRGB(0, 255, 0), tostring(Online) .. " Online")
                    end
                    if TotalMembers ~= nil then
                        AddStat(Color3.fromRGB(88, 101, 242), tostring(TotalMembers) .. " Members")
                    end
                end
                
                local Description = InsertTheme(Create("TextLabel", Card, {
                    Size = UDim2.new(1, -50, 0, 12),
                    Position = UDim2.new(0, 15, StatsFrame and 0.62 or 0.58, 0),
                    TextXAlignment = Enum.TextXAlignment.Left,
                    AutomaticSize = Enum.AutomaticSize.Y,
                    BackgroundTransparency = 1,
                    TextSize = 10,
                    Text = BDescription or "",
                    TextWrapped = true,
                    Font = Enum.Font.Gotham,
                    TextColor3 = Theme["Color Dark Text"]
                }), "Text")
                
                local ButtonContainer = Create("Frame", Card, {
                    Size = UDim2.new(1, 0, 0.3, 0),
                    Position = UDim2.fromScale(0, 1),
                    AnchorPoint = Vector2.new(0, 1),
                    BorderSizePixel = 0,
                    BackgroundColor3 = Theme["Color Hub 2"]
                })
                
                if #Description.Text > 0 then
                    ButtonContainer.Size = UDim2.new(1, 0, 0.4, 0)
                    Create("UIGradient", ButtonContainer, {
                        Rotation = -90,
                        Transparency = NumberSequence.new{
                            NumberSequenceKeypoint.new(0.00, 0.00),
                            NumberSequenceKeypoint.new(0.60, 0.00),
                            NumberSequenceKeypoint.new(1.00, 1.00)
                        }
                    })
                end
                
                local JoinButton = InsertTheme(Create("TextButton", ButtonContainer, {
                    Position = UDim2.new(0.5, 0, 1, -12),
                    Size = UDim2.new(1, -20, 0, 25),
                    AnchorPoint = Vector2.new(0.5, 1),
                    Text = "Join",
                    Font = Enum.Font.GothamBold,
                    TextSize = 13,
                    BackgroundColor3 = Color3.fromRGB(37, 128, 69),
                    TextColor3 = Color3.fromRGB(255, 255, 255)
                }), "Text")
                Make("Corner", JoinButton, UDim.new(0.5, 0))
                
                local LastClick = 0
                JoinButton.Activated:Connect(function()
                    if tick() - LastClick < 5 then return end
                    LastClick = tick()
                    local OriginalText = JoinButton.Text
                    JoinButton.Text = "Copied!"
                    setclipboard(InviteLink)
                    task.wait(2)
                    JoinButton.Text = OriginalText
                end)
                
                if type(BannerColor) == "string" then
                    BannerImage.ScaleType = Enum.ScaleType.Crop
                    BannerImage.Image = BannerColor
                elseif typeof(BannerColor) == "Color3" then
                    BannerImage.BackgroundTransparency = 0
                    Create("UIGradient", BannerImage, {
                        Rotation = -15,
                        Color = ColorSequence.new{
                            ColorSequenceKeypoint.new(0, BannerColor),
                            ColorSequenceKeypoint.new(1, BannerColor:Lerp(Color3.new(1, 1, 1), 0.2))
                        }
                    })
                end
                
                return {
                    Frame = CardFrame,
                    Card = Card,
                    Name = ServerName,
                    Description = Description,
                    JoinButton = JoinButton,
                    Configs = cardConfigs
                }
            end
            
            local card1, card2
            
            if Configs[1] and type(Configs[1]) == "table" then
                card1 = createDiscordCard(Configs[1], 1)
                card2 = createDiscordCard(Configs[2], 2)
            else
                card1 = createDiscordCard(Configs, 1)
                card2 = createDiscordCard({
                    "Empty Server",
                    "Add your second Discord server here",
                    "",
                    Color3.fromRGB(50, 50, 50),
                    0,
                    0,
                    "https://discord.gg/example"
                }, 2)
            end
            
            table.insert(bearlib.AllElements, {
                Name = "Discord Invite Container",
                Instance = ContainerFrame,
                OriginalParent = Container,
                SectionName = CurrentSectionName
            })
            
            local DiscordInviteContainer = {}
            function DiscordInviteContainer:Visible(Bool)
                if Bool == nil then
                    ContainerFrame.Visible = not ContainerFrame.Visible
                else
                    ContainerFrame.Visible = Bool
                end
            end
            function DiscordInviteContainer:Destroy()
                ContainerFrame:Destroy()
            end
            function DiscordInviteContainer:UpdateCard1(NewConfigs)
                if card1 then
                    card1.Frame:Destroy()
                    card1 = createDiscordCard(NewConfigs, 1)
                end
            end
            function DiscordInviteContainer:UpdateCard2(NewConfigs)
                if card2 then
                    card2.Frame:Destroy()
                    card2 = createDiscordCard(NewConfigs, 2)
                end
            end
            function DiscordInviteContainer:GetCard1()
                return card1
            end
            function DiscordInviteContainer:GetCard2()
                return card2
            end
            return DiscordInviteContainer
        end
        
        function Tab:AddProfile(Configs)
            local PName = Configs[1] or Configs.Name or "User Name"
            local PBio = Configs[2] or Configs.Bio or "No bio yet."
            local PAvatar = Configs.Avatar or "rbxassetid://0"
            local PCover = Configs.Cover or "rbxassetid://0"
            local PVerified = Configs.Verified or false
            
            local ProfileHolder = Create("Frame", Container, {
                Size = UDim2.new(1, 0, 0, 130),
                BackgroundTransparency = 1,
                LayoutOrder = GetOrder(),
                Name = "Profile",
                ZIndex = 26
            })
            
            local Card = InsertTheme(Create("Frame", ProfileHolder, {
                Size = UDim2.new(1, 0, 1, 0),
                BackgroundColor3 = Theme["Color Hub 2"],
                ZIndex = 26
            }), "Frame")
            Make("Corner", Card, UDim.new(0, 15))
            Make("Stroke", Card, {Color = Theme["Color Stroke"], Thickness = 1.5})
            CreateGlow(Card, Theme["Color Glow"], 30)
            
            local CoverImg = Create("ImageLabel", Card, {
                Size = UDim2.new(1, 0, 0, 65),
                Image = PCover,
                ScaleType = Enum.ScaleType.Crop,
                BackgroundTransparency = 1,
                ZIndex = 27
            })
            Make("Corner", CoverImg, UDim.new(0, 15))
            
            local CoverFix = InsertTheme(Create("Frame", CoverImg, {
                Size = UDim2.new(1, 0, 0, 15),
                Position = UDim2.new(0, 0, 1, -8),
                BorderSizePixel = 0,
                BackgroundColor3 = Theme["Color Hub 2"],
                ZIndex = 26
            }), "Frame")
            
            local AvatarImg = Create("ImageLabel", Card, {
                Size = UDim2.fromOffset(60, 60),
                Position = UDim2.new(0, 15, 0, 35),
                Image = PAvatar,
                BackgroundColor3 = Theme["Color Hub 2"],
                ZIndex = 28
            })
            Make("Corner", AvatarImg, UDim.new(1, 0))
            
            local AvatarStroke = InsertTheme(Create("UIStroke", AvatarImg, {
                Thickness = 3,
                Color = Theme["Color Stroke"]
            }), "Frame")
            
            local NameLabel = InsertTheme(Create("TextLabel", Card, {
                Position = UDim2.new(0, 85, 0, 65),
                Size = UDim2.new(1, -100, 0, 24),
                Text = PName,
                Font = Enum.Font.GothamBold,
                TextColor3 = Theme["Color Text"],
                TextSize = 17,
                TextXAlignment = "Left",
                BackgroundTransparency = 1,
                ZIndex = 28
            }), "Text")
            
            if PVerified then
                local VerifyIcon = Create("ImageLabel", Card, {
                    Size = UDim2.fromOffset(18, 18),
                    Position = UDim2.new(0, 85 + NameLabel.TextBounds.X + 8, 0, 68),
                    Image = "rbxassetid://10709752907",
                    ImageColor3 = Color3.fromRGB(60, 140, 255),
                    BackgroundTransparency = 1,
                    ZIndex = 29
                })
                NameLabel:GetPropertyChangedSignal("TextBounds"):Connect(function()
                    VerifyIcon.Position = UDim2.new(0, 85 + NameLabel.TextBounds.X + 8, 0, 68)
                end)
            end
            
            local BioLabel = InsertTheme(Create("TextLabel", Card, {
                Position = UDim2.new(0, 15, 0, 105),
                Size = UDim2.new(1, -30, 0, 20),
                Text = PBio,
                Font = Enum.Font.Gotham,
                TextColor3 = Theme["Color Dark Text"],
                TextSize = 12,
                TextXAlignment = "Left",
                BackgroundTransparency = 1,
                TextTruncate = Enum.TextTruncate.AtEnd,
                ZIndex = 28
            }), "DarkText")
            
            table.insert(bearlib.AllElements, {
                Name = PName .. " Profile",
                Instance = ProfileHolder,
                OriginalParent = Container,
                SectionName = CurrentSectionName
            })
            
            local Profile = {}
            function Profile:Visible(...) Funcs:ToggleVisible(ProfileHolder, ...) end
            function Profile:Destroy() ProfileHolder:Destroy() end
            function Profile:SetBio(NewBio) BioLabel.Text = NewBio end
            return Profile
        end
        
        return Tab
    end
    
    -- Toggle Button V4
    local ToggleGui = Instance.new("ScreenGui")
    ToggleGui.Name = "BearHub_Toggle_V4"
    ToggleGui.Parent = game.CoreGui
    ToggleGui.ZIndexBehavior = Enum.ZIndexBehavior.Sibling
    
    local ToggleBtn = Instance.new("ImageButton")
    ToggleBtn.Name = "ToggleButton"
    ToggleBtn.Size = UDim2.new(0, 40, 0, 40)
    ToggleBtn.Position = UDim2.new(0.12, 0, 0.12, 0)
    ToggleBtn.Image = "rbxassetid://134852113716171"
    ToggleBtn.BackgroundColor3 = Theme["Color Hub 2"]
    ToggleBtn.BackgroundTransparency = 0.2
    ToggleBtn.Active = true
    ToggleBtn.Draggable = true
    ToggleBtn.Parent = ToggleGui
    
    local UICorner = Instance.new("UICorner")
    UICorner.CornerRadius = UDim.new(0.25, 0)
    UICorner.Parent = ToggleBtn
    
    local UIStroke = Instance.new("UIStroke")
    UIStroke.Thickness = 2
    UIStroke.ApplyStrokeMode = Enum.ApplyStrokeMode.Border
    UIStroke.Color = Theme["Color Stroke"]
    UIStroke.Parent = ToggleBtn
    
    -- Glow Effect
    local ToggleGlow = Instance.new("ImageLabel")
    ToggleGlow.Name = "Glow"
    ToggleGlow.Size = UDim2.new(1, 15, 1, 15)
    ToggleGlow.Position = UDim2.new(0.5, -7, 0.5, -7)
    ToggleGlow.AnchorPoint = Vector2.new(0.5, 0.5)
    ToggleGlow.BackgroundTransparency = 1
    ToggleGlow.Image = "rbxassetid://5028857084"
    ToggleGlow.ImageColor3 = Theme["Color Glow"]
    ToggleGlow.ImageTransparency = 0.7
    ToggleGlow.ZIndex = ToggleBtn.ZIndex - 1
    ToggleGlow.Parent = ToggleBtn
    
    task.spawn(function()
        while task.wait(0.1) do
            if ToggleBtn and ToggleBtn.Parent then
                local hue = tick() % 5 / 5
                local color = Color3.fromHSV(hue, 1, 1)
                TweenService:Create(UIStroke, TweenInfo.new(0.5), {Color = color}):Play()
                TweenService:Create(ToggleGlow, TweenInfo.new(0.5), {ImageColor3 = color}):Play()
                task.wait(0.5)
            end
        end
    end)
    
    ToggleBtn.MouseButton1Click:Connect(function()
        MainFrame.Visible = not MainFrame.Visible
    end)
    
    -- Vietnam Flag Icon
    local Flag = Instance.new("ImageLabel")
    Flag.Name = "VNFlagIcon"
    Flag.Parent = ToggleBtn
    Flag.BackgroundTransparency = 1
    Flag.Image = "rbxassetid://90723031696932"
    Flag.Size = UDim2.fromOffset(24, 16)
    Flag.AnchorPoint = Vector2.new(0.5, 0.5)
    Flag.Position = UDim2.new(1, 0, 0, 0)
    Flag.ZIndex = 100
    Flag.Rotation = 12
    
    return Window
end

return bearlib