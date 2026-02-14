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
    Version = "4.0.0",
    Themes = {
        -- THEME CHỦ ĐẠO - TÍM NEON TƯƠNG LAI
        Nebula = {
            ["Color Hub 1"] = ColorSequence.new({
                ColorSequenceKeypoint.new(0.00, Color3.fromRGB(75, 0, 130)),
                ColorSequenceKeypoint.new(0.50, Color3.fromRGB(138, 43, 226)),
                ColorSequenceKeypoint.new(1.00, Color3.fromRGB(186, 85, 211))
            }),
            ["Color Hub 2"] = Color3.fromRGB(20, 5, 30),
            ["Color Stroke"] = Color3.fromRGB(255, 0, 255),
            ["Color Theme"] = Color3.fromRGB(147, 0, 255),
            ["Color Text"] = Color3.fromRGB(255, 255, 255),
            ["Color Dark Text"] = Color3.fromRGB(200, 180, 255),
            ["Color Accent"] = Color3.fromRGB(0, 255, 255),
            ["Color Glow"] = Color3.fromRGB(138, 43, 226),
            ["Color Shadow"] = Color3.fromRGB(25, 0, 50)
        },
        
        -- THEME XANH DƯƠNG BĂNG GIÁ
        Frost = {
            ["Color Hub 1"] = ColorSequence.new({
                ColorSequenceKeypoint.new(0.00, Color3.fromRGB(0, 191, 255)),
                ColorSequenceKeypoint.new(0.50, Color3.fromRGB(135, 206, 250)),
                ColorSequenceKeypoint.new(1.00, Color3.fromRGB(176, 224, 230))
            }),
            ["Color Hub 2"] = Color3.fromRGB(10, 25, 40),
            ["Color Stroke"] = Color3.fromRGB(0, 255, 255),
            ["Color Theme"] = Color3.fromRGB(64, 224, 208),
            ["Color Text"] = Color3.fromRGB(240, 255, 255),
            ["Color Dark Text"] = Color3.fromRGB(200, 240, 255),
            ["Color Accent"] = Color3.fromRGB(255, 255, 255),
            ["Color Glow"] = Color3.fromRGB(0, 255, 255),
            ["Color Shadow"] = Color3.fromRGB(0, 50, 100)
        },
        
        -- THEME ĐỎ HUYẾT DỤC
        Crimson = {
            ["Color Hub 1"] = ColorSequence.new({
                ColorSequenceKeypoint.new(0.00, Color3.fromRGB(139, 0, 0)),
                ColorSequenceKeypoint.new(0.50, Color3.fromRGB(178, 34, 34)),
                ColorSequenceKeypoint.new(1.00, Color3.fromRGB(220, 20, 60))
            }),
            ["Color Hub 2"] = Color3.fromRGB(30, 5, 10),
            ["Color Stroke"] = Color3.fromRGB(255, 215, 0),
            ["Color Theme"] = Color3.fromRGB(255, 69, 0),
            ["Color Text"] = Color3.fromRGB(255, 255, 255),
            ["Color Dark Text"] = Color3.fromRGB(255, 200, 200),
            ["Color Accent"] = Color3.fromRGB(255, 255, 0),
            ["Color Glow"] = Color3.fromRGB(255, 0, 0),
            ["Color Shadow"] = Color3.fromRGB(50, 0, 0)
        },
        
        -- THEME XANH LÁ CYBER
        NeonGreen = {
            ["Color Hub 1"] = ColorSequence.new({
                ColorSequenceKeypoint.new(0.00, Color3.fromRGB(0, 255, 0)),
                ColorSequenceKeypoint.new(0.50, Color3.fromRGB(50, 205, 50)),
                ColorSequenceKeypoint.new(1.00, Color3.fromRGB(34, 139, 34))
            }),
            ["Color Hub 2"] = Color3.fromRGB(0, 10, 0),
            ["Color Stroke"] = Color3.fromRGB(0, 255, 255),
            ["Color Theme"] = Color3.fromRGB(124, 252, 0),
            ["Color Text"] = Color3.fromRGB(240, 255, 240),
            ["Color Dark Text"] = Color3.fromRGB(200, 255, 200),
            ["Color Accent"] = Color3.fromRGB(255, 255, 255),
            ["Color Glow"] = Color3.fromRGB(0, 255, 127),
            ["Color Shadow"] = Color3.fromRGB(0, 30, 0)
        },
        
        -- THEME VÀNG KIM CƯƠNG
        Golden = {
            ["Color Hub 1"] = ColorSequence.new({
                ColorSequenceKeypoint.new(0.00, Color3.fromRGB(255, 215, 0)),
                ColorSequenceKeypoint.new(0.50, Color3.fromRGB(218, 165, 32)),
                ColorSequenceKeypoint.new(1.00, Color3.fromRGB(184, 134, 11))
            }),
            ["Color Hub 2"] = Color3.fromRGB(30, 20, 0),
            ["Color Stroke"] = Color3.fromRGB(255, 255, 255),
            ["Color Theme"] = Color3.fromRGB(255, 223, 0),
            ["Color Text"] = Color3.fromRGB(255, 250, 210),
            ["Color Dark Text"] = Color3.fromRGB(240, 230, 170),
            ["Color Accent"] = Color3.fromRGB(255, 255, 255),
            ["Color Glow"] = Color3.fromRGB(255, 215, 0),
            ["Color Shadow"] = Color3.fromRGB(60, 40, 0)
        }
    },
    
    Info = {
        Version = "4.0.0",
        Author = "BearLib Team",
        Build = "Nebula Edition"
    },
    
    Save = {
        UISize = {600, 450},
        TabSize = 180,
        Theme = "Nebula",
        Transparency = 0.1,
        GlowIntensity = 1,
        Animations = true
    },
    
    Settings = {},
    Connection = {},
    Instances = {},
    Elements = {},
    Options = {},
    Flags = {},
    Tabs = {},
    Particles = {},
    
    SaveEnabled = true,
    SaveFile = "bearlib_v4.json"
}

-- ==================== UTILITY FUNCTIONS ====================
local function createGlow(parent, color, size, transparency)
    local glow = Instance.new("ImageLabel")
    glow.Name = "Glow"
    glow.BackgroundTransparency = 1
    glow.Image = "rbxassetid://5028857643"
    glow.ImageColor3 = color or Color3.new(1, 1, 1)
    glow.ImageTransparency = transparency or 0.7
    glow.Size = size or UDim2.fromScale(1.2, 1.2)
    glow.Position = UDim2.fromScale(-0.1, -0.1)
    glow.ZIndex = parent.ZIndex - 1
    glow.Parent = parent
    return glow
end

local function createParticle(parent, color, lifetime)
    local particle = Instance.new("Frame")
    particle.Size = UDim2.fromOffset(math.random(2, 5), math.random(2, 5))
    particle.Position = UDim2.fromScale(math.random(), math.random())
    particle.BackgroundColor3 = color or Color3.new(1, 1, 1)
    particle.BackgroundTransparency = 0.3
    particle.Parent = parent
    
    local corner = Instance.new("UICorner")
    corner.CornerRadius = UDim.new(1, 0)
    corner.Parent = particle
    
    local targetPos = UDim2.fromScale(particle.Position.X.Scale + (math.random(-50, 50)/100), 
                                      particle.Position.Y.Scale + (math.random(-50, 50)/100))
    
    local tween = TweenService:Create(particle, 
        TweenInfo.new(lifetime or 2, Enum.EasingStyle.Quad, Enum.EasingDirection.Out), 
        {Position = targetPos, BackgroundTransparency = 1}
    )
    tween:Play()
    tween.Completed:Connect(function()
        particle:Destroy()
    end)
    
    return particle
end

-- ==================== MAIN INTERFACE ====================
local ViewportSize = workspace.CurrentCamera.ViewportSize
local UIScale = ViewportSize.Y / 500

local ScreenGui = Instance.new("ScreenGui")
ScreenGui.Name = "BearLib_V4"
ScreenGui.Parent = CoreGui
ScreenGui.ZIndexBehavior = Enum.ZIndexBehavior.Sibling
ScreenGui.ResetOnSpawn = false

local UIScaleObj = Instance.new("UIScale")
UIScaleObj.Parent = ScreenGui

local ScreenFind = CoreGui:FindFirstChild(ScreenGui.Name)
if ScreenFind and ScreenFind ~= ScreenGui then
    ScreenFind:Destroy()
end

local Theme = bearlib.Themes[bearlib.Save.Theme]

function bearlib:SetTheme(themeName)
    if bearlib.Themes[themeName] then
        bearlib.Save.Theme = themeName
        Theme = bearlib.Themes[themeName]
        self:UpdateTheme()
    end
end

function bearlib:UpdateTheme()
    for _, instance in pairs(self.Instances) do
        if instance.Type == "Gradient" then
            instance.Instance.Color = Theme["Color Hub 1"]
        elseif instance.Type == "Frame" then
            instance.Instance.BackgroundColor3 = Theme["Color Hub 2"]
        elseif instance.Type == "Stroke" then
            instance.Instance.Color = Theme["Color Stroke"]
        elseif instance.Type == "Theme" then
            instance.Instance.BackgroundColor3 = Theme["Color Theme"]
        elseif instance.Type == "Text" then
            instance.Instance.TextColor3 = Theme["Color Text"]
        elseif instance.Type == "DarkText" then
            instance.Instance.TextColor3 = Theme["Color Dark Text"]
        elseif instance.Type == "Accent" then
            instance.Instance.BackgroundColor3 = Theme["Color Accent"]
        end
    end
end

function bearlib:MakeWindow(config)
    config = config or {}
    local windowTitle = config.Title or "BearLib V4"
    local windowSubtitle = config.Subtitle or "Nebula Edition"
    local saveFile = config.SaveFolder or self.SaveFile
    
    -- Main Container
    local mainFrame = Instance.new("Frame")
    mainFrame.Name = "MainFrame"
    mainFrame.Size = UDim2.fromOffset(unpack(self.Save.UISize))
    mainFrame.Position = UDim2.new(0.5, -self.Save.UISize[1]/2, 0.5, -self.Save.UISize[2]/2)
    mainFrame.BackgroundColor3 = Theme["Color Hub 2"]
    mainFrame.BackgroundTransparency = self.Save.Transparency
    mainFrame.ClipsDescendants = true
    mainFrame.Parent = ScreenGui
    
    table.insert(self.Instances, {Instance = mainFrame, Type = "Frame"})
    
    -- Glassmorphism Effect
    local blur = Instance.new("Frame")
    blur.Size = UDim2.fromScale(1, 1)
    blur.BackgroundColor3 = Color3.new(1, 1, 1)
    blur.BackgroundTransparency = 0.95
    blur.Parent = mainFrame
    
    local gradient = Instance.new("UIGradient")
    gradient.Color = Theme["Color Hub 1"]
    gradient.Rotation = 45
    gradient.Parent = mainFrame
    table.insert(self.Instances, {Instance = gradient, Type = "Gradient"})
    
    -- Corner Radius
    local corner = Instance.new("UICorner")
    corner.CornerRadius = UDim.new(0, 20)
    corner.Parent = mainFrame
    
    -- Stroke with glow
    local stroke = Instance.new("UIStroke")
    stroke.Thickness = 2
    stroke.Color = Theme["Color Stroke"]
    stroke.Parent = mainFrame
    table.insert(self.Instances, {Instance = stroke, Type = "Stroke"})
    
    createGlow(mainFrame, Theme["Color Glow"], UDim2.fromScale(1.1, 1.1), 0.8)
    
    -- Animated particles background
    local particleContainer = Instance.new("Frame")
    particleContainer.Size = UDim2.fromScale(1, 1)
    particleContainer.BackgroundTransparency = 1
    particleContainer.Parent = mainFrame
    
    for i = 1, 30 do
        task.spawn(function()
            while particleContainer.Parent do
                task.wait(math.random(1, 3))
                createParticle(particleContainer, Theme["Color Accent"], math.random(3, 6))
            end
        end)
    end
    
    -- Top Bar
    local topBar = Instance.new("Frame")
    topBar.Name = "TopBar"
    topBar.Size = UDim2.new(1, 0, 0, 50)
    topBar.BackgroundTransparency = 1
    topBar.Parent = mainFrame
    
    -- Title
    local title = Instance.new("TextLabel")
    title.Name = "Title"
    title.Size = UDim2.new(0, 200, 1, 0)
    title.Position = UDim2.new(0, 20, 0, 0)
    title.BackgroundTransparency = 1
    title.Text = windowTitle
    title.TextColor3 = Theme["Color Text"]
    title.TextSize = 24
    title.Font = Enum.Font.GothamBold
    title.TextXAlignment = Enum.TextXAlignment.Left
    title.Parent = topBar
    table.insert(self.Instances, {Instance = title, Type = "Text"})
    
    -- Subtitle
    local subtitle = Instance.new("TextLabel")
    subtitle.Name = "Subtitle"
    subtitle.Size = UDim2.new(0, 150, 0, 20)
    subtitle.Position = UDim2.new(0, 25, 1, -25)
    subtitle.BackgroundTransparency = 1
    subtitle.Text = windowSubtitle
    subtitle.TextColor3 = Theme["Color Dark Text"]
    subtitle.TextSize = 14
    subtitle.Font = Enum.Font.Gotham
    subtitle.TextXAlignment = Enum.TextXAlignment.Left
    subtitle.Parent = topBar
    table.insert(self.Instances, {Instance = subtitle, Type = "DarkText"})
    
    -- Window Controls
    local controlFrame = Instance.new("Frame")
    controlFrame.Name = "Controls"
    controlFrame.Size = UDim2.new(0, 120, 1, 0)
    controlFrame.Position = UDim2.new(1, -130, 0, 0)
    controlFrame.BackgroundTransparency = 1
    controlFrame.Parent = topBar
    
    local function createControlButton(icon, callback)
        local btn = Instance.new("ImageButton")
        btn.Size = UDim2.new(0, 30, 0, 30)
        btn.Position = UDim2.new(0, 0, 0.5, -15)
        btn.BackgroundTransparency = 1
        btn.Image = icon
        btn.ImageColor3 = Theme["Color Text"]
        btn.Parent = controlFrame
        
        btn.MouseEnter:Connect(function()
            TweenService:Create(btn, TweenInfo.new(0.2), {ImageColor3 = Theme["Color Theme"]}):Play()
        end)
        
        btn.MouseLeave:Connect(function()
            TweenService:Create(btn, TweenInfo.new(0.2), {ImageColor3 = Theme["Color Text"]}):Play()
        end)
        
        btn.MouseButton1Click:Connect(callback)
        return btn
    end
    
    -- Create control buttons
    local minimizeBtn = createControlButton("rbxassetid://10734896206", function()
        if minimized then
            TweenService:Create(mainFrame, TweenInfo.new(0.3), {Size = savedSize}):Play()
            minimized = false
        else
            savedSize = mainFrame.Size
            TweenService:Create(mainFrame, TweenInfo.new(0.3), {Size = UDim2.fromOffset(savedSize.X.Offset, 50)}):Play()
            minimized = true
        end
    end)
    minimizeBtn.Position = UDim2.new(0, 0, 0.5, -15)
    
    local closeBtn = createControlButton("rbxassetid://10747384394", function()
        mainFrame.Visible = false
    end)
    closeBtn.Position = UDim2.new(0, 90, 0.5, -15)
    
    -- Tab Bar
    local tabBar = Instance.new("Frame")
    tabBar.Name = "TabBar"
    tabBar.Size = UDim2.new(0, self.Save.TabSize, 1, -50)
    tabBar.Position = UDim2.new(0, 0, 0, 50)
    tabBar.BackgroundTransparency = 1
    tabBar.Parent = mainFrame
    
    local tabList = Instance.new("ScrollingFrame")
    tabList.Name = "TabList"
    tabList.Size = UDim2.new(1, -20, 1, -20)
    tabList.Position = UDim2.new(0, 10, 0, 10)
    tabList.BackgroundTransparency = 1
    tabList.ScrollBarThickness = 4
    tabList.ScrollBarImageColor3 = Theme["Color Theme"]
    tabList.CanvasSize = UDim2.new(0, 0, 0, 0)
    tabList.AutomaticCanvasSize = Enum.AutomaticSize.Y
    tabList.Parent = tabBar
    table.insert(self.Instances, {Instance = tabList, Type = "ScrollBar"})
    
    local tabListLayout = Instance.new("UIListLayout")
    tabListLayout.Padding = UDim.new(0, 8)
    tabListLayout.SortOrder = Enum.SortOrder.LayoutOrder
    tabListLayout.Parent = tabList
    
    -- Content Area
    local contentArea = Instance.new("Frame")
    contentArea.Name = "ContentArea"
    contentArea.Size = UDim2.new(1, -(self.Save.TabSize + 20), 1, -60)
    contentArea.Position = UDim2.new(0, self.Save.TabSize + 10, 0, 55)
    contentArea.BackgroundTransparency = 1
    contentArea.Parent = mainFrame
    
    local contentContainer = Instance.new("Frame")
    contentContainer.Name = "ContentContainer"
    contentContainer.Size = UDim2.fromScale(1, 1)
    contentContainer.BackgroundTransparency = 1
    contentContainer.Parent = contentArea
    
    -- Drag functionality
    local dragging, dragStart, startPos
    
    topBar.InputBegan:Connect(function(input)
        if input.UserInputType == Enum.UserInputType.MouseButton1 then
            dragging = true
            dragStart = input.Position
            startPos = mainFrame.Position
            input.Changed:Connect(function()
                if input.UserInputState == Enum.UserInputState.End then
                    dragging = false
                end
            end)
        end
    end)
    
    topBar.InputChanged:Connect(function(input)
        if dragging and input.UserInputType == Enum.UserInputType.MouseMovement then
            local delta = input.Position - dragStart
            mainFrame.Position = UDim2.new(
                startPos.X.Scale, startPos.X.Offset + delta.X,
                startPos.Y.Scale, startPos.Y.Offset + delta.Y
            )
        end
    end)
    
    -- Window object
    local window = {}
    local minimized = false
    local savedSize = mainFrame.Size
    
    function window:Minimize()
        mainFrame.Visible = not mainFrame.Visible
    end
    
    function window:SetTitle(newTitle, newSubtitle)
        if newTitle then title.Text = newTitle end
        if newSubtitle then subtitle.Text = newSubtitle end
    end
    
    function window:Toggle()
        mainFrame.Visible = not mainFrame.Visible
    end
    
    function window:Destroy()
        ScreenGui:Destroy()
    end
    
    -- Toggle button
    local toggleBtn = Instance.new("ImageButton")
    toggleBtn.Name = "ToggleButton"
    toggleBtn.Size = UDim2.fromOffset(40, 40)
    toggleBtn.Position = UDim2.new(0.02, 0, 0.5, 0)
    toggleBtn.AnchorPoint = Vector2.new(0, 0.5)
    toggleBtn.BackgroundColor3 = Theme["Color Hub 2"]
    toggleBtn.BackgroundTransparency = 0.2
    toggleBtn.Image = "rbxassetid://134852113716171"
    toggleBtn.Parent = ScreenGui
    
    local toggleCorner = Instance.new("UICorner")
    toggleCorner.CornerRadius = UDim.new(0.3, 0)
    toggleCorner.Parent = toggleBtn
    
    local toggleStroke = Instance.new("UIStroke")
    toggleStroke.Thickness = 2
    toggleStroke.Color = Theme["Color Stroke"]
    toggleStroke.Parent = toggleBtn
    
    createGlow(toggleBtn, Theme["Color Glow"], UDim2.fromScale(1.2, 1.2), 0.7)
    
    toggleBtn.MouseButton1Click:Connect(function()
        mainFrame.Visible = not mainFrame.Visible
    end)
    
    -- Tab creation function
    function window:MakeTab(config)
        config = config or {}
        local tabName = config.Name or config.Title or "Tab"
        local tabIcon = config.Icon or ""
        
        -- Tab button
        local tabBtn = Instance.new("ImageButton")
        tabBtn.Name = tabName .. "Tab"
        tabBtn.Size = UDim2.new(1, 0, 0, 40)
        tabBtn.BackgroundColor3 = Theme["Color Hub 2"]
        tabBtn.BackgroundTransparency = 0.3
        tabBtn.Parent = tabList
        table.insert(self.Instances, {Instance = tabBtn, Type = "Frame"})
        
        local btnCorner = Instance.new("UICorner")
        btnCorner.CornerRadius = UDim.new(0, 10)
        btnCorner.Parent = tabBtn
        
        local btnStroke = Instance.new("UIStroke")
        btnStroke.Thickness = 1.5
        btnStroke.Color = Theme["Color Stroke"]
        btnStroke.Parent = tabBtn
        table.insert(self.Instances, {Instance = btnStroke, Type = "Stroke"})
        
        -- Icon
        if tabIcon ~= "" then
            local icon = Instance.new("ImageLabel")
            icon.Size = UDim2.fromOffset(20, 20)
            icon.Position = UDim2.new(0, 10, 0.5, -10)
            icon.BackgroundTransparency = 1
            icon.Image = tabIcon
            icon.ImageColor3 = Theme["Color Text"]
            icon.Parent = tabBtn
            table.insert(self.Instances, {Instance = icon, Type = "Text"})
        end
        
        -- Label
        local label = Instance.new("TextLabel")
        label.Size = UDim2.new(1, tabIcon ~= "" and -40 or -20, 1, 0)
        label.Position = UDim2.new(0, tabIcon ~= "" and 35 or 10, 0, 0)
        label.BackgroundTransparency = 1
        label.Text = tabName
        label.TextColor3 = Theme["Color Text"]
        label.TextSize = 14
        label.Font = Enum.Font.Gotham
        label.TextXAlignment = Enum.TextXAlignment.Left
        label.Parent = tabBtn
        table.insert(self.Instances, {Instance = label, Type = "Text"})
        
        -- Indicator
        local indicator = Instance.new("Frame")
        indicator.Size = UDim2.new(0, 4, 0, 0)
        indicator.Position = UDim2.new(0, -2, 0.5, 0)
        indicator.AnchorPoint = Vector2.new(0, 0.5)
        indicator.BackgroundColor3 = Theme["Color Theme"]
        indicator.Parent = tabBtn
        table.insert(self.Instances, {Instance = indicator, Type = "Theme"})
        
        local indicatorCorner = Instance.new("UICorner")
        indicatorCorner.CornerRadius = UDim.new(0.5, 0)
        indicatorCorner.Parent = indicator
        
        -- Content page
        local page = Instance.new("ScrollingFrame")
        page.Name = tabName .. "Page"
        page.Size = UDim2.fromScale(1, 1)
        page.BackgroundTransparency = 1
        page.ScrollBarThickness = 4
        page.ScrollBarImageColor3 = Theme["Color Theme"]
        page.CanvasSize = UDim2.new(0, 0, 0, 0)
        page.AutomaticCanvasSize = Enum.AutomaticSize.Y
        page.Visible = false
        page.Parent = contentContainer
        table.insert(self.Instances, {Instance = page, Type = "ScrollBar"})
        
        local pagePadding = Instance.new("UIPadding")
        pagePadding.PaddingLeft = UDim.new(0, 15)
        pagePadding.PaddingRight = UDim.new(0, 15)
        pagePadding.PaddingTop = UDim.new(0, 15)
        pagePadding.PaddingBottom = UDim.new(0, 15)
        pagePadding.Parent = page
        
        local pageLayout = Instance.new("UIListLayout")
        pageLayout.Padding = UDim.new(0, 10)
        pageLayout.SortOrder = Enum.SortOrder.LayoutOrder
        pageLayout.Parent = page
        
        -- Tab selection
        local isActive = false
        
        local function selectTab()
            for _, child in pairs(contentContainer:GetChildren()) do
                if child:IsA("ScrollingFrame") then
                    child.Visible = false
                end
            end
            page.Visible = true
            
            TweenService:Create(indicator, TweenInfo.new(0.3), {Size = UDim2.new(0, 4, 0, 30)}):Play()
            TweenService:Create(tabBtn, TweenInfo.new(0.3), {BackgroundTransparency = 0.1}):Play()
        end
        
        local function deselectTab()
            TweenService:Create(indicator, TweenInfo.new(0.3), {Size = UDim2.new(0, 4, 0, 0)}):Play()
            TweenService:Create(tabBtn, TweenInfo.new(0.3), {BackgroundTransparency = 0.3}):Play()
        end
        
        tabBtn.MouseButton1Click:Connect(function()
            if isActive then return end
            for _, tab in pairs(bearlib.Tabs) do
                if tab.Page and tab.Deselect then
                    tab:Deselect()
                end
            end
            selectTab()
            isActive = true
        end)
        
        -- Tab object
        local tab = {}
        tab.Page = page
        tab.ElementCount = 0
        
        function tab:Select()
            selectTab()
        end
        
        function tab:Deselect()
            deselectTab()
            isActive = false
        end
        
        function tab:AddSection(config)
            config = config or {}
            local sectionName = config.Name or config.Title or "Section"
            
            local section = Instance.new("Frame")
            section.Name = sectionName .. "Section"
            section.Size = UDim2.new(1, 0, 0, 40)
            section.BackgroundTransparency = 1
            section.Parent = page
            tab.ElementCount = tab.ElementCount + 1
            section.LayoutOrder = tab.ElementCount
            
            local sectionTitle = Instance.new("TextLabel")
            sectionTitle.Size = UDim2.new(1, -20, 0, 30)
            sectionTitle.Position = UDim2.new(0, 10, 0, 5)
            sectionTitle.BackgroundTransparency = 1
            sectionTitle.Text = sectionName
            sectionTitle.TextColor3 = Theme["Color Text"]
            sectionTitle.TextSize = 18
            sectionTitle.Font = Enum.Font.GothamBold
            sectionTitle.TextXAlignment = Enum.TextXAlignment.Left
            sectionTitle.Parent = section
            table.insert(self.Instances, {Instance = sectionTitle, Type = "Text"})
            
            local underline = Instance.new("Frame")
            underline.Size = UDim2.new(1, -20, 0, 2)
            underline.Position = UDim2.new(0, 10, 1, -5)
            underline.BackgroundColor3 = Theme["Color Theme"]
            underline.Parent = section
            table.insert(self.Instances, {Instance = underline, Type = "Theme"})
            
            local underlineCorner = Instance.new("UICorner")
            underlineCorner.CornerRadius = UDim.new(1, 0)
            underlineCorner.Parent = underline
            
            createGlow(underline, Theme["Color Glow"], UDim2.fromScale(1.1, 1.5), 0.9)
            
            local sectionObj = {}
            function sectionObj:SetTitle(newTitle)
                if newTitle then sectionTitle.Text = newTitle end
            end
            return sectionObj
        end
        
        function tab:AddButton(config)
            config = config or {}
            local btnName = config.Name or config.Title or "Button"
            local btnDesc = config.Desc or config.Description or ""
            local callback = config.Callback or config[2] or function() end
            
            local btnFrame = Instance.new("ImageButton")
            btnFrame.Name = btnName .. "Button"
            btnFrame.Size = UDim2.new(1, 0, 0, 50)
            btnFrame.BackgroundColor3 = Theme["Color Hub 2"]
            btnFrame.BackgroundTransparency = 0.2
            btnFrame.Parent = page
            tab.ElementCount = tab.ElementCount + 1
            btnFrame.LayoutOrder = tab.ElementCount
            table.insert(self.Instances, {Instance = btnFrame, Type = "Frame"})
            
            local btnCorner = Instance.new("UICorner")
            btnCorner.CornerRadius = UDim.new(0, 12)
            btnCorner.Parent = btnFrame
            
            local btnStroke = Instance.new("UIStroke")
            btnStroke.Thickness = 1.5
            btnStroke.Color = Theme["Color Stroke"]
            btnStroke.Parent = btnFrame
            table.insert(self.Instances, {Instance = btnStroke, Type = "Stroke"})
            
            local title = Instance.new("TextLabel")
            title.Size = UDim2.new(1, -50, 0, 25)
            title.Position = UDim2.new(0, 15, 0, 5)
            title.BackgroundTransparency = 1
            title.Text = btnName
            title.TextColor3 = Theme["Color Text"]
            title.TextSize = 16
            title.Font = Enum.Font.GothamBold
            title.TextXAlignment = Enum.TextXAlignment.Left
            title.Parent = btnFrame
            table.insert(self.Instances, {Instance = title, Type = "Text"})
            
            if btnDesc ~= "" then
                local desc = Instance.new("TextLabel")
                desc.Size = UDim2.new(1, -50, 0, 20)
                desc.Position = UDim2.new(0, 15, 0, 25)
                desc.BackgroundTransparency = 1
                desc.Text = btnDesc
                desc.TextColor3 = Theme["Color Dark Text"]
                desc.TextSize = 12
                desc.Font = Enum.Font.Gotham
                desc.TextXAlignment = Enum.TextXAlignment.Left
                desc.Parent = btnFrame
                table.insert(self.Instances, {Instance = desc, Type = "DarkText"})
            end
            
            local icon = Instance.new("ImageLabel")
            icon.Size = UDim2.fromOffset(20, 20)
            icon.Position = UDim2.new(1, -35, 0.5, -10)
            icon.BackgroundTransparency = 1
            icon.Image = "rbxassetid://10709791437"
            icon.ImageColor3 = Theme["Color Stroke"]
            icon.Parent = btnFrame
            
            btnFrame.MouseButton1Click:Connect(callback)
            
            local glow = createGlow(btnFrame, Theme["Color Glow"], UDim2.fromScale(1.05, 1.1), 0.8)
            
            local btnObj = {}
            function btnObj:SetCallback(newCallback)
                callback = newCallback
            end
            return btnObj
        end
        
        function tab:AddToggle(config)
            config = config or {}
            local toggleName = config.Name or config.Title or "Toggle"
            local toggleDesc = config.Desc or config.Description or ""
            local default = config.Default or false
            local callback = config.Callback or config[3] or function() end
            
            local toggleFrame = Instance.new("ImageButton")
            toggleFrame.Name = toggleName .. "Toggle"
            toggleFrame.Size = UDim2.new(1, 0, 0, 50)
            toggleFrame.BackgroundColor3 = Theme["Color Hub 2"]
            toggleFrame.BackgroundTransparency = 0.2
            toggleFrame.Parent = page
            tab.ElementCount = tab.ElementCount + 1
            toggleFrame.LayoutOrder = tab.ElementCount
            table.insert(self.Instances, {Instance = toggleFrame, Type = "Frame"})
            
            local toggleCorner = Instance.new("UICorner")
            toggleCorner.CornerRadius = UDim.new(0, 12)
            toggleCorner.Parent = toggleFrame
            
            local toggleStroke = Instance.new("UIStroke")
            toggleStroke.Thickness = 1.5
            toggleStroke.Color = Theme["Color Stroke"]
            toggleStroke.Parent = toggleFrame
            table.insert(self.Instances, {Instance = toggleStroke, Type = "Stroke"})
            
            local title = Instance.new("TextLabel")
            title.Size = UDim2.new(1, -80, 0, 25)
            title.Position = UDim2.new(0, 15, 0, 5)
            title.BackgroundTransparency = 1
            title.Text = toggleName
            title.TextColor3 = Theme["Color Text"]
            title.TextSize = 16
            title.Font = Enum.Font.GothamBold
            title.TextXAlignment = Enum.TextXAlignment.Left
            title.Parent = toggleFrame
            table.insert(self.Instances, {Instance = title, Type = "Text"})
            
            if toggleDesc ~= "" then
                local desc = Instance.new("TextLabel")
                desc.Size = UDim2.new(1, -80, 0, 20)
                desc.Position = UDim2.new(0, 15, 0, 25)
                desc.BackgroundTransparency = 1
                desc.Text = toggleDesc
                desc.TextColor3 = Theme["Color Dark Text"]
                desc.TextSize = 12
                desc.Font = Enum.Font.Gotham
                desc.TextXAlignment = Enum.TextXAlignment.Left
                desc.Parent = toggleFrame
                table.insert(self.Instances, {Instance = desc, Type = "DarkText"})
            end
            
            local toggleSwitch = Instance.new("Frame")
            toggleSwitch.Size = UDim2.fromOffset(50, 24)
            toggleSwitch.Position = UDim2.new(1, -65, 0.5, -12)
            toggleSwitch.BackgroundColor3 = Theme["Color Stroke"]
            toggleSwitch.Parent = toggleFrame
            table.insert(self.Instances, {Instance = toggleSwitch, Type = "Stroke"})
            
            local switchCorner = Instance.new("UICorner")
            switchCorner.CornerRadius = UDim.new(0.5, 0)
            switchCorner.Parent = toggleSwitch
            
            local toggleIndicator = Instance.new("Frame")
            toggleIndicator.Size = UDim2.fromOffset(20, 20)
            toggleIndicator.Position = UDim2.new(0, 2, 0.5, -10)
            toggleIndicator.BackgroundColor3 = Theme["Color Theme"]
            toggleIndicator.Parent = toggleSwitch
            table.insert(self.Instances, {Instance = toggleIndicator, Type = "Theme"})
            
            local indicatorCorner = Instance.new("UICorner")
            indicatorCorner.CornerRadius = UDim.new(0.5, 0)
            indicatorCorner.Parent = toggleIndicator
            
            local state = default
            if state then
                toggleIndicator.Position = UDim2.new(1, -22, 0.5, -10)
            end
            
            toggleFrame.MouseButton1Click:Connect(function()
                state = not state
                if state then
                    TweenService:Create(toggleIndicator, TweenInfo.new(0.3), {Position = UDim2.new(1, -22, 0.5, -10)}):Play()
                else
                    TweenService:Create(toggleIndicator, TweenInfo.new(0.3), {Position = UDim2.new(0, 2, 0.5, -10)}):Play()
                end
                callback(state)
            end)
            
            local glow = createGlow(toggleFrame, Theme["Color Glow"], UDim2.fromScale(1.05, 1.1), 0.8)
            
            local toggleObj = {}
            function toggleObj:Set(newState)
                state = newState
                if state then
                    TweenService:Create(toggleIndicator, TweenInfo.new(0.3), {Position = UDim2.new(1, -22, 0.5, -10)}):Play()
                else
                    TweenService:Create(toggleIndicator, TweenInfo.new(0.3), {Position = UDim2.new(0, 2, 0.5, -10)}):Play()
                end
                callback(state)
            end
            return toggleObj
        end
        
        function tab:AddLabel(config)
            config = config or {}
            local labelText = config.Text or config.Title or "Label"
            local labelDesc = config.Desc or config.Description or ""
            
            local labelFrame = Instance.new("Frame")
            labelFrame.Size = UDim2.new(1, 0, 0, labelDesc ~= "" and 50 or 30)
            labelFrame.BackgroundTransparency = 1
            labelFrame.Parent = page
            tab.ElementCount = tab.ElementCount + 1
            labelFrame.LayoutOrder = tab.ElementCount
            
            local title = Instance.new("TextLabel")
            title.Size = UDim2.new(1, -30, 0, labelDesc ~= "" and 25 or 30)
            title.Position = UDim2.new(0, 15, 0, 0)
            title.BackgroundTransparency = 1
            title.Text = labelText
            title.TextColor3 = Theme["Color Text"]
            title.TextSize = 16
            title.Font = Enum.Font.GothamBold
            title.TextXAlignment = Enum.TextXAlignment.Left
            title.Parent = labelFrame
            table.insert(self.Instances, {Instance = title, Type = "Text"})
            
            if labelDesc ~= "" then
                local desc = Instance.new("TextLabel")
                desc.Size = UDim2.new(1, -30, 0, 20)
                desc.Position = UDim2.new(0, 15, 0, 25)
                desc.BackgroundTransparency = 1
                desc.Text = labelDesc
                desc.TextColor3 = Theme["Color Dark Text"]
                desc.TextSize = 12
                desc.Font = Enum.Font.Gotham
                desc.TextXAlignment = Enum.TextXAlignment.Left
                desc.Parent = labelFrame
                table.insert(self.Instances, {Instance = desc, Type = "DarkText"})
            end
        end
        
        table.insert(bearlib.Tabs, tab)
        return tab
    end
    
    return window
end

return bearlib