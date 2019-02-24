function CreateText()
    -- Construct new Text object
    local helloText = Text:new()

    -- Set String to display
    helloText.text = "Hello, World!"

    -- Set font and text color
    helloText:SetFont(cache:GetResource("Font", "Fonts/Anonymous Pro.ttf"), 30)
    helloText.color = Color(0.0, 1.0, 0.0)

    -- Align Text center-screen
    helloText.horizontalAlignment = HA_CENTER
    helloText.verticalAlignment = VA_CENTER

    -- Add Text instance to the UI root element
    ui.root:AddChild(helloText)
end

function SubscribeToEvents()
    -- Subscribe HandleUpdate() function for processing update events
    SubscribeToEvent("Update", "HandleUpdate")
    -- Subscribe key up event
    SubscribeToEvent("KeyUp", "HandleKeyUp")
end

function SetWindowTitleAndIcon()
    local icon = cache:GetResource("Image", "Textures/UrhoIcon.png")
    graphics:SetWindowIcon(icon)
    graphics.windowTitle = "Urho3D Example"
end

function HandleKeyUp(eventType, eventData)
    local key = eventData["Key"]:GetInt()
    -- Close console (if open) or exit when ESC is pressed
    if key == KEY_ESCAPE then
        if GetPlatform() == "Web" then
            input.mouseVisible = true
            if (useMouseMode_ ~= MM_ABSOLUTE) then
                input.mouseMode = MM_FREE
            end
        else
            engine:Exit()
        end
    end
end

function HandleSceneUpdate(eventType, eventData)
end

function Start()
    -- some basics
    SetWindowTitleAndIcon()

    -- Create "Hello World" Text
    CreateText()

    -- Finally, hook-up this HelloWorld instance to handle update events
    SubscribeToEvents()

    input.mouseVisible = true
end

function HandleUpdate(eventType, eventData)
    -- Do nothing for now, could be extended to eg. animate the display
end