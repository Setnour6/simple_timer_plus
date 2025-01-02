local function AutoComplete( cmd, args, ... )
    local possibleArgs = { ... }
    local autoCompletes = {}

    local arg = string.Split( args:TrimLeft(), " " )

    local lastItem = nil
    for i, str in pairs( arg ) do
        if ( str == "" and ( lastItem and lastItem == "" ) ) then table.remove( arg, i ) end
        lastItem = str
    end

    local numArgs = #arg
    local lastArg = table.remove( arg, numArgs )
    local prevArgs = table.concat( arg, " " )
    if ( #prevArgs > 0 ) then prevArgs = " " .. prevArgs end

    local possibilities = possibleArgs[ numArgs ] or { lastArg }
    for _, acStr in pairs( possibilities ) do
        if ( !acStr:StartsWith( lastArg ) ) then continue end
        table.insert( autoCompletes, cmd .. prevArgs .. ' "' .. acStr .. '"' )
    end

    return autoCompletes
end

concommand.Add("simpletimerplus_getinfo", function(ply, cmd, args)
    for _, ent in pairs(ents.FindByClass("sent_simpletimerplus")) do
        if IsValid(ent) then
            local timerName = ent:GetST_Name()
            local color = ent:GetST_Color()  local r = math.floor(color.x * 255)  local g = math.floor(color.y * 255)  local b = math.floor(color.z * 255)
            local secondColor = ent:GetST_SecondColor()  local r2 = math.floor(secondColor.x * 255)  local g2 = math.floor(secondColor.y * 255)  local b2 = math.floor(secondColor.z * 255)
            local timerTime = ent:GetST_Time()
            local currentTimerTime = ent:GetST_CurTime()
            local currentTimerPosX = ent:GetST_PosX()
            local currentTimerPosY = ent:GetST_PosY()
            local currentTimerTimePosX = ent:GetST_TimePosX()
            local currentTimerTimePosY = ent:GetST_TimePosY()
            local currentTimerPosXYSync = ent:GetST_PosXYSync()

            local currentTBCornerRadius = ent:GetST_TBCornerRadius()
            local currentTBPosX = ent:GetST_TBPosX()
            local currentTBPosY = ent:GetST_TBPosY()
            local currentTBWidth = ent:GetST_TBWidth()
            local currentTBHeight = ent:GetST_TBHeight()
            local tbColor = ent:GetST_TBColor()  local rtb = math.floor(tbColor.x * 255)  local gtb = math.floor(tbColor.y * 255)  local btb = math.floor(tbColor.z * 255)
            local currentTBColorAlpha = ent:GetST_TBColorAlpha()

            local currentVisibility = ent:GetST_HHud()
            local currentVisibilitySound = ent:GetST_HSnd()
            local currentVisibilityChatText = ent:GetST_HNot()
            local currentStartEvent = ent:GetST_EStart()
            local currentStopEvent = ent:GetST_EStop()
            local currentEndEvent = ent:GetST_EEnd()
            local currentMission = ent:GetST_Mission()
            local currentMissionEvent = ent:GetST_MEvent()
            local currentAfterMission = ent:GetST_AMission()
            local currentAfterTimer = ent:GetST_ATimer()

            local timerState = ent:GetST_ATimer()
            local timerFont = ent:GetST_CustomFont()
            local currentVisibilityTimerText = ent:GetST_HideTimer()
            local timerStartSound = ent:GetST_StartSound()
            local timerSecondStartSound = ent:GetST_SecondStartSound()
            local timerStopSound = ent:GetST_StopSound()
            local timerEndSound = ent:GetST_EndSound()
            local timerFadeInTime = ent:GetST_FadeInTime()
            local timerFadeOutTime = ent:GetST_FadeOutTime()
            local currentJustification = ent:GetST_JustifyText()
            local currentVisibilityEntity = ent:GetST_EntityHidden()
            local currentGradientTextEffect = ent:GetST_GradientTextEffect()
            local timerGradientSpeed = ent:GetST_GradientSpeed()
            local timerGradientFrequency = ent:GetST_GradientFrequency()
            local currentGlitchTextEffect = ent:GetST_GlitchTextEffect()
            local currentGlitchFrequency = ent:GetST_GlitchFrequency()
            print("Name: " .. timerName .. " \nColor: RGB(" .. r .. ", " .. g .. ", " .. b .. ")\nSecondary Color: RGB(" .. r2 .. ", " .. g2 .. ", " .. b2
            .. ")\nTime: " .. timerTime .. "\nCurrent Time: " .. math.Round(currentTimerTime, 2) .. "\nTimer Position Offset X: " .. currentTimerPosX .. "\nTimer Position Offset Y: " .. currentTimerPosY
            .. "\nTimer Time Position Offset X: " .. currentTimerTimePosX .. "\nTimer Time Position Offset Y: " .. currentTimerTimePosY .. "\nTimer Position X-Y Sync: " .. tostring(currentTimerPosXYSync)
            .. "\nTextbox Corner Radius: " .. currentTBCornerRadius .. "\nTextbox Position Offset X: " .. currentTBPosX .. "\nTexbox Position Offset Y: " .. currentTBPosY
            .. "\nTextbox Width: " .. currentTBWidth .. "\nTextbox Height: " .. currentTBHeight .. "\nTextbox Color: RGB(" .. rtb .. ", " .. gtb .. ", " .. btb .. ")\nTextbox Alpha: " .. currentTBColorAlpha
            .. "\nHUD Visibility: " .. tostring(currentVisibility) .. "\nSound Toggle: " .. tostring(currentVisibilitySound) .. "\nChat Message: " .. tostring(currentVisibilityChatText)
            .. "\nStart Event: " .. currentStartEvent .. "\nStop Event: " .. currentStopEvent
            .. "\nEnd Event: " .. currentEndEvent .. "\nMission: " .. tostring(currentMission) .. "\nMission Event: " .. currentMissionEvent .. "\nAfter Mission: " .. currentAfterMission
            .. "\nAftermath: " .. currentAfterTimer .. "\nState: " .. timerState .. "\nFont: " .. timerFont .. "\nHidden Text: " .. tostring(currentVisibilityTimerText)
            .. "\nStart Sound: " .. timerStartSound .. "\nSecond Start Sound: " .. timerSecondStartSound .. "\nStop Sound: " .. timerStopSound .. "\nEnd Sound: " .. timerEndSound
            .. "\nFade-in Time: " .. math.Round(timerFadeInTime, 2) .. "\nFade-out Time: " .. math.Round(timerFadeOutTime, 2) .. "\nText Realignment: " .. tostring(currentJustification) .. "\nEntity Hidden: " .. tostring(currentVisibilityEntity)
            .. "\nGradient Text Effect: " .. currentGradientTextEffect .. "\nGradient Text Speed: " .. math.Round(timerGradientSpeed, 2) .. "\nGradient Text Frequency: " .. math.Round(timerGradientFrequency, 1)
            .. "\nGlitch Text Effect: " .. tostring(currentGlitchTextEffect) .. "\nGlitch Frequency: " .. math.Round(currentGlitchFrequency, 3))
        else
            print("Timer entity not found.")
        end
    end
end)


concommand.Add("simpletimerplus_getname", function(ply, cmd, args)
    for _, ent in pairs(ents.FindByClass("sent_simpletimerplus")) do
        if IsValid(ent) then
            local timerName = ent:GetST_Name()
            print("Timer name is: " .. timerName)
        else
            print("Timer entity not found.")
        end
    end
    return timerName
end)

concommand.Add("simpletimerplus_setname", function(ply, cmd, args)
    if #args == 1 then
        local newName = args[1]
        for _, ent in pairs(ents.FindByClass("sent_simpletimerplus")) do
            if IsValid(ent) then
                ent:SetST_Name(newName)
                print("Timer name set to: " .. newName)
            else
                print("Timer entity not found.")
            end
        end
    else
        print("Usage: simpletimerplus_setname <new_simpletimerplus_timername>")
    end
end)

concommand.Add("simpletimerplus_getcolor", function(ply, cmd, args)
    for _, ent in pairs(ents.FindByClass("sent_simpletimerplus")) do
        if IsValid(ent) then
            local color = ent:GetST_Color()
            local r = math.Round(color.x * 255)
            local g = math.Round(color.y * 255)
            local b = math.Round(color.z * 255)

            print("Timer color is: RGB(" .. r .. ", " .. g .. ", " .. b .. ")")
        else
            print("Timer entity not found.")
        end
    end
    return color
end)

concommand.Add("simpletimerplus_setcolor", function(ply, cmd, args)
    if #args == 3 then
        local r = tonumber(args[1])
        local g = tonumber(args[2])
        local b = tonumber(args[3])

        if r >= 0 and r <= 255 and g >= 0 and g <= 255 and b >= 0 and b <= 255 then
            for _, ent in pairs(ents.FindByClass("sent_simpletimerplus")) do
                if IsValid(ent) then
                    ent:SetST_Color(Vector(r / 255, g / 255, b / 255))
                    print("Timer color set to: RGB(" .. r .. ", " .. g .. ", " .. b .. ")")
                else
                    print("Timer entity not found.")
                end
            end
        else
            print("Invalid color values. Please provide RGB values (0-255).")
        end
    else
        print("Usage: simpletimerplus_setcolor <r> <g> <b>")
    end
end)

concommand.Add("simpletimerplus_getsecondcolor", function(ply, cmd, args)
    for _, ent in pairs(ents.FindByClass("sent_simpletimerplus")) do
        if IsValid(ent) then
            local secondColor = ent:GetST_SecondColor()
            local r2 = math.Round(secondColor.x * 255)
            local g2 = math.Round(secondColor.y * 255)
            local b2 = math.Round(secondColor.z * 255)

            print("Timer secondary color is: RGB(" .. r2 .. ", " .. g2 .. ", " .. b2 .. ")")
        else
            print("Timer entity not found.")
        end
    end
    return secondColor
end)

concommand.Add("simpletimerplus_setsecondcolor", function(ply, cmd, args)
    if #args == 3 then
        local r2 = tonumber(args[1])
        local g2 = tonumber(args[2])
        local b2 = tonumber(args[3])

        if r2 >= 0 and r2 <= 255 and g2 >= 0 and g2 <= 255 and b2 >= 0 and b2 <= 255 then
            for _, ent in pairs(ents.FindByClass("sent_simpletimerplus")) do
                if IsValid(ent) then
                    ent:SetST_SecondColor(Vector(r2 / 255, g2 / 255, b2 / 255))
                    print("Timer secondary color set to: RGB(" .. r2 .. ", " .. g2 .. ", " .. b2 .. ")")
                else
                    print("Timer entity not found.")
                end
            end
        else
            print("Invalid secondary color values. Please provide RGB values (0-255).")
        end
    else
        print("Usage: simpletimerplus_setsecondcolor <r> <g> <b>")
    end
end)

concommand.Add("simpletimerplus_gettime", function(ply, cmd, args)
    for _, ent in pairs(ents.FindByClass("sent_simpletimerplus")) do
        if IsValid(ent) then
            local timerTime = ent:GetST_Time()
            print("Timer's set time is: " .. timerTime)
        else
            print("Timer entity not found.")
        end
    end
    return timerTime
end)

concommand.Add("simpletimerplus_settime", function(ply, cmd, args)
    if #args == 1 then
        local newTime = tonumber(args[1])
        if newTime and newTime >= 1 and newTime <= 3600 then
            for _, ent in pairs(ents.FindByClass("sent_simpletimerplus")) do
                if IsValid(ent) then
                    ent:SetST_Time(newTime)
                    print("Timer time set to: " .. newTime)
                else
                    print("Timer entity not found.")
                end
            end
        else
            print("Invalid time. Please provide a number between 1 and 3600.")
        end
    else
        print("Usage: simpletimerplus_settime <new_time_in_seconds>")
    end
end)

concommand.Add("simpletimerplus_getcurrenttime", function(ply, cmd, args)
    for _, ent in pairs(ents.FindByClass("sent_simpletimerplus")) do
        if IsValid(ent) then
            if ent:GetST_State() == 1 then
                local remainingTime = math.max(ent:GetST_CurTime(), math.max(0, ent:GetST_Timer() - CurTime())) -- math.Round(math.max(0, ent:GetST_Timer() - CurTime()), 2)??
                print("Timer's current running time is: " .. remainingTime)
            else
                print("Timer's current running time is: 0 (Timer is not currently running)")
            end
        else
            print("Timer entity not found.")
        end
    end
    return remainingTime
end)

concommand.Add("simpletimerplus_setcurrenttime", function(ply, cmd, args)
    if #args == 1 then
        local newCurrentTime = tonumber(args[1])
        if newCurrentTime and newCurrentTime >= 0 and newCurrentTime <= 3600 then
            for _, ent in pairs(ents.FindByClass("sent_simpletimerplus")) do
                if IsValid(ent) then
                    if ent:GetST_State() == 1 then
                        local newTimerEnd = CurTime() + newCurrentTime
                        ent:SetST_Timer(newTimerEnd)
                        print("Timer's current running time has been set to: " .. newCurrentTime .. " seconds.")
                    else
                        print("Timer is not currently running. Cannot set time.")
                    end
                else
                    print("Timer entity not found.")
                end
            end
        else
            print("Invalid time. Please provide a number between 0 and 3600.")
        end
    else
        print("Usage: simpletimerplus_setcurrenttime <new_current_time_in_seconds>")
    end
end)

concommand.Add("simpletimerplus_getposx", function(ply, cmd, args)
    for _, ent in pairs(ents.FindByClass("sent_simpletimerplus")) do
        if IsValid(ent) then
            local timerPosX = ent:GetST_PosX()
            print("Timer's set position offset X is: " .. timerPosX)
        else
            print("Timer entity not found.")
        end
    end
    return timerPosX
end)

concommand.Add("simpletimerplus_setposx", function(ply, cmd, args)
    if #args == 1 then
        local newPosX = tonumber(args[1])
        if newPosX and newPosX >= -1920 and newPosX <= 1920 then
            for _, ent in pairs(ents.FindByClass("sent_simpletimerplus")) do
                if IsValid(ent) then
                    ent:SetST_PosX(newPosX)
                    print("Timer position offset X set to: " .. newPosX)
                else
                    print("Timer entity not found.")
                end
            end
        else
            print("Invalid position offset X. Please provide a number between -1920 and 1920.")
        end
    else
        print("Usage: simpletimerplus_setposx <new_position_offset_x>")
    end
end)

concommand.Add("simpletimerplus_getposy", function(ply, cmd, args)
    for _, ent in pairs(ents.FindByClass("sent_simpletimerplus")) do
        if IsValid(ent) then
            local timerPosY = ent:GetST_PosY()
            print("Timer's set position offset Y is: " .. timerPosY)
        else
            print("Timer entity not found.")
        end
    end
    return timerPosY
end)

concommand.Add("simpletimerplus_setposy", function(ply, cmd, args)
    if #args == 1 then
        local newPosY = tonumber(args[1])
        if newPosY and newPosY >= -1080 and newPosY <= 1080 then
            for _, ent in pairs(ents.FindByClass("sent_simpletimerplus")) do
                if IsValid(ent) then
                    ent:SetST_PosY(newPosY)
                    print("Timer position offset Y set to: " .. newPosY)
                else
                    print("Timer entity not found.")
                end
            end
        else
            print("Invalid position offset Y. Please provide a number between -1080 and 1080.")
        end
    else
        print("Usage: simpletimerplus_setposy <new_position_offset_y>")
    end
end)

concommand.Add("simpletimerplus_gettimeposx", function(ply, cmd, args)
    for _, ent in pairs(ents.FindByClass("sent_simpletimerplus")) do
        if IsValid(ent) then
            local timerTimePosX = ent:GetST_TimePosX()
            print("Timer's time set position offset X is: " .. timerTimePosX)
        else
            print("Timer entity not found.")
        end
    end
    return timerTimePosX
end)

concommand.Add("simpletimerplus_settimeposx", function(ply, cmd, args)
    if #args == 1 then
        local newTimePosX = tonumber(args[1])
        if newTimePosX and newTimePosX >= -1920 and newTimePosX <= 1920 then
            for _, ent in pairs(ents.FindByClass("sent_simpletimerplus")) do
                if IsValid(ent) then
                    ent:SetST_TimePosX(newTimePosX)
                    print("Timer time position offset X set to: " .. newTimePosX)
                else
                    print("Timer entity not found.")
                end
            end
        else
            print("Invalid position offset X. Please provide a number between -1920 and 1920.")
        end
    else
        print("Usage: simpletimerplus_settimeposx <new_time_position_offset_x>")
    end
end)

concommand.Add("simpletimerplus_gettimeposy", function(ply, cmd, args)
    for _, ent in pairs(ents.FindByClass("sent_simpletimerplus")) do
        if IsValid(ent) then
            local timerTimePosY = ent:GetST_TimePosY()
            print("Timer's time set position offset Y is: " .. timerTimePosY)
        else
            print("Timer entity not found.")
        end
    end
    return timerTimePosY
end)

concommand.Add("simpletimerplus_settimeposy", function(ply, cmd, args)
    if #args == 1 then
        local newTimePosY = tonumber(args[1])
        if newTimePosY and newTimePosY >= -1080 and newTimePosY <= 1080 then
            for _, ent in pairs(ents.FindByClass("sent_simpletimerplus")) do
                if IsValid(ent) then
                    ent:SetST_PosY(newTimePosY)
                    print("Timer time position offset Y set to: " .. newTimePosY)
                else
                    print("Timer entity not found.")
                end
            end
        else
            print("Invalid position offset Y. Please provide a number between -1080 and 1080.")
        end
    else
        print("Usage: simpletimerplus_settimeposy <new_time_position_offset_y>")
    end
end)

concommand.Add("simpletimerplus_posxysync", function(ply, cmd, args)
    for _, ent in pairs(ents.FindByClass("sent_simpletimerplus")) do
        if IsValid(ent) then
            local currentPosXYSync = ent:GetST_PosXYSync()
            ent:SetST_PosXYSync(not currentPosXYSync)
            print("Timer Position Sync toggled to: " .. (not currentPosXYSync and "Enabled" or "Disabled"))
        else
            print("Timer entity not found.")
        end
    end
end)

concommand.Add("simpletimerplus_gettbcornerradius", function(ply, cmd, args)
    for _, ent in pairs(ents.FindByClass("sent_simpletimerplus")) do
        if IsValid(ent) then
            local timerTBCornerRadius = ent:GetST_TBCornerRadius()
            print("Timer's set textbox corner radius is: " .. timerTBCornerRadius)
        else
            print("Timer entity not found.")
        end
    end
    return timerTBCornerRadius
end)

concommand.Add("simpletimerplus_settbcornerradius", function(ply, cmd, args)
    if #args == 1 then
        local newTBCornerRadius = tonumber(args[1])
        if newTBCornerRadius and newTBCornerRadius >= 0 and newTBCornerRadius <= 200 then
            for _, ent in pairs(ents.FindByClass("sent_simpletimerplus")) do
                if IsValid(ent) then
                    ent:SetST_TBCornerRadius(newTBCornerRadius)
                    print("Timer textbox corner radius set to: " .. newTBCornerRadius)
                else
                    print("Timer entity not found.")
                end
            end
        else
            print("Invalid textbox corner radius. Please provide a number between 0 and 200.")
        end
    else
        print("Usage: simpletimerplus_settbcornerradius <new_textbox_corner_radius>")
    end
end)

concommand.Add("simpletimerplus_gettbposx", function(ply, cmd, args)
    for _, ent in pairs(ents.FindByClass("sent_simpletimerplus")) do
        if IsValid(ent) then
            local timerTBPosX = ent:GetST_TBPosX()
            print("Timer's set textbox position offset X is: " .. timerTBPosX)
        else
            print("Timer entity not found.")
        end
    end
    return timerTBPosX
end)

concommand.Add("simpletimerplus_settbposx", function(ply, cmd, args)
    if #args == 1 then
        local newTBPosX = tonumber(args[1])
        if newTBPosX and newTBPosX >= -1920 and newTBPosX <= 1920 then
            for _, ent in pairs(ents.FindByClass("sent_simpletimerplus")) do
                if IsValid(ent) then
                    ent:SetST_TBPosX(newTBPosX)
                    print("Timer textbox position offset X set to: " .. newTBPosX)
                else
                    print("Timer entity not found.")
                end
            end
        else
            print("Invalid textbox position offset X. Please provide a number between -1920 and 1920.")
        end
    else
        print("Usage: simpletimerplus_settbposx <new_textbox_position_offset_x>")
    end
end)

concommand.Add("simpletimerplus_gettbposy", function(ply, cmd, args)
    for _, ent in pairs(ents.FindByClass("sent_simpletimerplus")) do
        if IsValid(ent) then
            local timerTBPosY = ent:GetST_TBPosY()
            print("Timer's set textbox position offset Y is: " .. timerTBPosY)
        else
            print("Timer entity not found.")
        end
    end
    return timerTBPosY
end)

concommand.Add("simpletimerplus_settbposy", function(ply, cmd, args)
    if #args == 1 then
        local newTBPosY = tonumber(args[1])
        if newTBPosY and newTBPosY >= -1080 and newTBPosY <= 1080 then
            for _, ent in pairs(ents.FindByClass("sent_simpletimerplus")) do
                if IsValid(ent) then
                    ent:SetST_TBPosY(newTBPosY)
                    print("Timer textbox position offset Y set to: " .. newTBPosY)
                else
                    print("Timer entity not found.")
                end
            end
        else
            print("Invalid textbox position offset Y. Please provide a number between -1080 and 1080.")
        end
    else
        print("Usage: simpletimerplus_settbposy <new_textbox_position_offset_y>")
    end
end)

concommand.Add("simpletimerplus_gettbwidth", function(ply, cmd, args)
    for _, ent in pairs(ents.FindByClass("sent_simpletimerplus")) do
        if IsValid(ent) then
            local timerTBWidth = ent:GetST_TBWidth()
            print("Timer's set textbox width is: " .. timerTBWidth)
        else
            print("Timer entity not found.")
        end
    end
    return timerTBWidth
end)

concommand.Add("simpletimerplus_settbwidth", function(ply, cmd, args)
    if #args == 1 then
        local newTBWidth = tonumber(args[1])
        if newTBWidth and newTBWidth >= 0 and newTBWidth <= 1920 then
            for _, ent in pairs(ents.FindByClass("sent_simpletimerplus")) do
                if IsValid(ent) then
                    ent:SetST_TBWidth(newTBWidth)
                    print("Timer textbox width set to: " .. newTBWidth)
                else
                    print("Timer entity not found.")
                end
            end
        else
            print("Invalid textbox width. Please provide a number between 0 and 1920.")
        end
    else
        print("Usage: simpletimerplus_settbwidth <new_textbox_width>")
    end
end)

concommand.Add("simpletimerplus_gettbheight", function(ply, cmd, args)
    for _, ent in pairs(ents.FindByClass("sent_simpletimerplus")) do
        if IsValid(ent) then
            local timerTBHeight = ent:GetST_TBHeight()
            print("Timer's set texbox height is: " .. timerTBHeight)
        else
            print("Timer entity not found.")
        end
    end
    return timerTBHeight
end)

concommand.Add("simpletimerplus_settbheight", function(ply, cmd, args)
    if #args == 1 then
        local newTBHeight = tonumber(args[1])
        if newTBHeight and newTBHeight >= 0 and newTBHeight <= 1080 then
            for _, ent in pairs(ents.FindByClass("sent_simpletimerplus")) do
                if IsValid(ent) then
                    ent:SetST_TBHeight(newTBHeight)
                    print("Timer textbox height set to: " .. newTBHeight)
                else
                    print("Timer entity not found.")
                end
            end
        else
            print("Invalid textbox height. Please provide a number between 0 and 1080.")
        end
    else
        print("Usage: simpletimerplus_settbheight <new_textbox_height>")
    end
end)

concommand.Add("simpletimerplus_gettbcolor", function(ply, cmd, args)
    for _, ent in pairs(ents.FindByClass("sent_simpletimerplus")) do
        if IsValid(ent) then
            local tbColor = ent:GetST_TBColor()
            local rtb = math.Round(tbColor.x * 255)
            local gtb = math.Round(tbColor.y * 255)
            local btb = math.Round(tbColor.z * 255)

            print("Timer textbox color is: RGB(" .. rtb .. ", " .. gtb .. ", " .. btb .. ")")
        else
            print("Timer entity not found.")
        end
    end
    return tbColor
end)

concommand.Add("simpletimerplus_settbcolor", function(ply, cmd, args)
    if #args == 3 then
        local rtb = tonumber(args[1])
        local gtb = tonumber(args[2])
        local btb = tonumber(args[3])

        if rtb >= 0 and rtb <= 255 and gtb >= 0 and gtb <= 255 and btb >= 0 and btb <= 255 then
            for _, ent in pairs(ents.FindByClass("sent_simpletimerplus")) do
                if IsValid(ent) then
                    ent:SetST_TBColor(Vector(rtb / 255, gtb / 255, btb / 255))
                    print("Timer textbox color set to: RGB(" .. rtb .. ", " .. gtb .. ", " .. btb .. ")")
                else
                    print("Timer entity not found.")
                end
            end
        else
            print("Invalid textbox color values. Please provide RGB values (0-255).")
        end
    else
        print("Usage: simpletimerplus_settbcolor <r> <g> <b>")
    end
end)

concommand.Add("simpletimerplus_gettbcoloralpha", function(ply, cmd, args)
    for _, ent in pairs(ents.FindByClass("sent_simpletimerplus")) do
        if IsValid(ent) then
            local timerTBColorAlpha = ent:GetST_TBColorAlpha()
            print("Timer's set texbox color alpha is: " .. timerTBColorAlpha)
        else
            print("Timer entity not found.")
        end
    end
    return timerTBColorAlpha
end)

concommand.Add("simpletimerplus_settbcoloralpha", function(ply, cmd, args)
    if #args == 1 then
        local newTBColorAlpha = tonumber(args[1])
        if newTBColorAlpha and newTBColorAlpha >= 0 and newTBColorAlpha <= 255 then
            for _, ent in pairs(ents.FindByClass("sent_simpletimerplus")) do
                if IsValid(ent) then
                    ent:SetST_TBColorAlpha(newTBColorAlpha)
                    print("Timer textbox color alpha set to: " .. newTBColorAlpha)
                else
                    print("Timer entity not found.")
                end
            end
        else
            print("Invalid textbox color alpha. Please provide a number between 0 and 255.")
        end
    else
        print("Usage: simpletimerplus_settbcoloralpha <new_textbox_color_alpha>")
    end
end)

concommand.Add("simpletimerplus_nohud", function(ply, cmd, args)
    for _, ent in pairs(ents.FindByClass("sent_simpletimerplus")) do
        if IsValid(ent) then
            local currentVisibility = ent:GetST_HHud()
            ent:SetST_HHud(not currentVisibility)
            print("HUD visibility toggled to: " .. (not currentVisibility and "Hidden" or "Visible"))
        else
            print("Timer entity not found.")
        end
    end
end)

concommand.Add("simpletimerplus_nosound", function(ply, cmd, args)
    for _, ent in pairs(ents.FindByClass("sent_simpletimerplus")) do
        if IsValid(ent) then
            local currentVisibility = ent:GetST_HSnd()
            ent:SetST_HSnd(not currentVisibility)
            print("Sound: " .. (not currentVisibility and "Disabled" or "Enabled"))
        else
            print("Timer entity not found.")
        end
    end
end)

concommand.Add("simpletimerplus_notext", function(ply, cmd, args)
    for _, ent in pairs(ents.FindByClass("sent_simpletimerplus")) do
        if IsValid(ent) then
            local currentVisibility = ent:GetST_HNot()
            ent:SetST_HNot(not currentVisibility)
            print("Text visibility toggled to: " .. (not currentVisibility and "Hidden" or "Visible"))
        else
            print("Timer entity not found.")
        end
    end
end)

concommand.Add("simpletimerplus_getstartevent", function(ply, cmd, args)
    for _, ent in pairs(ents.FindByClass("sent_simpletimerplus")) do
        if IsValid(ent) then
            local currentStartEvent = ent:GetST_EStart()
            print("Timer start event is: " .. currentStartEvent)
        else
            print("Timer entity not found.")
        end
    end
    return currentStartEvent
end)

concommand.Add("simpletimerplus_setstartevent", function(ply, cmd, args)
    if #args == 1 then
        local startEvent = tonumber(args[1])
        if startEvent then
            for _, ent in pairs(ents.FindByClass("sent_simpletimerplus")) do
                if IsValid(ent) then
                    ent:SetST_EStart(startEvent)
                    print("Timer Start Event set to: " .. startEvent)
                else
                    print("Timer entity not found.")
                end
            end
        else
            print("Invalid start event. Please provide a valid event number.")
        end
    else
        print("Usage: simpletimerplus_setstartevent <new_start_event> (0 = No Event, 1 = Kill Everyone, 2 = Kill NPCs/Nextbots, 3 = Kill Players, 4 = Clean Up Everything, 5 = Disable AI, 6 = Enable AI, 7 = Disable Ignore Players, 8 = Enable Ignore Players, 9 = Ignite NPCs/Nextbots, 10 = Ignite Players, 11 = Enable PVP, 12 = Disable PVP)")
    end
end)

concommand.Add("simpletimerplus_getstopevent", function(ply, cmd, args)
    for _, ent in pairs(ents.FindByClass("sent_simpletimerplus")) do
        if IsValid(ent) then
            local currentStopEvent = ent:GetST_EStop()
            print("Timer stop event is: " .. currentStopEvent)
        else
            print("Timer entity not found.")
        end
    end
    return currentStopEvent
end)

concommand.Add("simpletimerplus_setstopevent", function(ply, cmd, args)
    if #args == 1 then
        local stopEvent = tonumber(args[1])
        if stopEvent then
            for _, ent in pairs(ents.FindByClass("sent_simpletimerplus")) do
                if IsValid(ent) then
                    ent:SetST_EStop(stopEvent)
                    print("Timer Stop Event set to: " .. stopEvent)
                else
                    print("Timer entity not found.")
                end
            end
        else
            print("Invalid stop event. Please provide a valid event number.")
        end
    else
        print("Usage: simpletimerplus_setstopevent <new_stop_event> (0 = No Event, 1 = Kill Everyone, 2 = Kill NPCs/Nextbots, 3 = Kill Players, 4 = Clean Up Everything, 5 = Disable AI, 6 = Enable AI, 7 = Disable Ignore Players, 8 = Enable Ignore Players, 9 = Ignite NPCs/Nextbots, 10 = Ignite Players, 11 = Enable PVP, 12 = Disable PVP)")
    end
end)

concommand.Add("simpletimerplus_getendevent", function(ply, cmd, args)
    for _, ent in pairs(ents.FindByClass("sent_simpletimerplus")) do
        if IsValid(ent) then
            local currentEndEvent = ent:GetST_EEnd()
            print("Timer end event is: " .. currentEndEvent)
        else
            print("Timer entity not found.")
        end
    end
    return currentEndEvent
end)

concommand.Add("simpletimerplus_setendevent", function(ply, cmd, args)
    if #args == 1 then
        local endEvent = tonumber(args[1])
        if endEvent then
            for _, ent in pairs(ents.FindByClass("sent_simpletimerplus")) do
                if IsValid(ent) then
                    ent:SetST_EEnd(endEvent)
                    print("Timer End Event set to: " .. endEvent)
                else
                    print("Timer entity not found.")
                end
            end
        else
            print("Invalid end event. Please provide a valid event number.")
        end
    else
        print("Usage: simpletimerplus_setendevent <new_end_event> (0 = No Event, 1 = Kill Everyone, 2 = Kill NPCs/Nextbots, 3 = Kill Players, 4 = Clean Up Everything, 5 = Disable AI, 6 = Enable AI, 7 = Disable Ignore Players, 8 = Enable Ignore Players, 9 = Ignite NPCs/Nextbots, 10 = Ignite Players, 11 = Enable PVP, 12 = Disable PVP)")
    end
end)

concommand.Add("simpletimerplus_getmission", function(ply, cmd, args)
    for _, ent in pairs(ents.FindByClass("sent_simpletimerplus")) do
        if IsValid(ent) then
            local currentMission = ent:GetST_Mission()
            print("Timer mission is: " .. currentMission)
        else
            print("Timer entity not found.")
        end
    end
    return currentMission
end)

concommand.Add("simpletimerplus_setmission", function(ply, cmd, args)
    if #args == 1 then
        local mission = tonumber(args[1])
        if mission then
            for _, ent in pairs(ents.FindByClass("sent_simpletimerplus")) do
                if IsValid(ent) then
                    ent:SetST_Mission(mission)
                    print("Timer Mission set to: " .. mission)
                else
                    print("Timer entity not found.")
                end
            end
        else
            print("Invalid mission. Please provide a valid mission number.")
        end
    else
        print("Usage: simpletimerplus_setmission <new_mission> (0 = No Mission, 1 = A Player has died, 2 All players have died, 3 = An NPC/Nextbot has been killed, 4 = All NPCs/Nextbots have been killed, 5 = A Player has entered a vehicle, 6 = All Players have entered vehicles)")
    end
end)

concommand.Add("simpletimerplus_getmissionevent", function(ply, cmd, args)
    for _, ent in pairs(ents.FindByClass("sent_simpletimerplus")) do
        if IsValid(ent) then
            local currentMissionEvent = ent:GetST_MEvent()
            print("Timer mission event is: " .. currentMissionEvent)
        else
            print("Timer entity not found.")
        end
    end
    return currentMissionEvent
end)

concommand.Add("simpletimerplus_setmissionevent", function(ply, cmd, args)
    if #args == 1 then
        local missionEvent = tonumber(args[1])
        if missionEvent then
            for _, ent in pairs(ents.FindByClass("sent_simpletimerplus")) do
                if IsValid(ent) then
                    ent:SetST_MEvent(missionEvent)
                    print("Timer Mission Event set to: " .. missionEvent)
                else
                    print("Timer entity not found.")
                end
            end
        else
            print("Invalid mission event. Please provide a valid mission event number.")
        end
    else
        print("Usage: simpletimerplus_setmissionevent <new_missionevent> (0 = No Event, 1 = Kill Everyone, 2 = Kill NPCs/Nextbots, 3 = Kill Players, 4 = Clean Up Everything, 5 = Disable AI, 6 = Enable AI, 7 = Disable Ignore Players, 8 = Enable Ignore Players, 9 = Ignite NPCs/Nextbots, 10 = Ignite Players, 11 = Enable PVP, 12 = Disable PVP)")
    end
end)

concommand.Add("simpletimerplus_getaftermission", function(ply, cmd, args)
    for _, ent in pairs(ents.FindByClass("sent_simpletimerplus")) do
        if IsValid(ent) then
            local currentAfterMission = ent:GetST_AMission()
            print("Timer after mission is: " .. currentAfterMission)
        else
            print("Timer entity not found.")
        end
    end
    return currentAfterMission
end)

concommand.Add("simpletimerplus_setaftermission", function(ply, cmd, args)
    if #args == 1 then
        local afterMission = tonumber(args[1])
        if afterMission then
            for _, ent in pairs(ents.FindByClass("sent_simpletimerplus")) do
                if IsValid(ent) then
                    ent:SetST_AMission(afterMission)
                    print("Timer Aftermission set to: " .. afterMission)
                else
                    print("Timer entity not found.")
                end
            end
        else
            print("Invalid after mission event. Please provide a valid after mission number.")
        end
    else
        print("Usage: simpletimerplus_setaftermission <new_aftermission> (0 = Stop Timer, 1 = Reset Timer, 2 = End Timer, 3 = Continue Timer)")
    end
end)

concommand.Add("simpletimerplus_getaftertimer", function(ply, cmd, args)
    for _, ent in pairs(ents.FindByClass("sent_simpletimerplus")) do
        if IsValid(ent) then
            local currentAfterTimer = ent:GetST_ATimer()
            print("Timer aftermath is: " .. currentAfterTimer)
        else
            print("Timer entity not found.")
        end
    end
    return currentAfterTimer
end)

concommand.Add("simpletimerplus_setaftertimer", function(ply, cmd, args)
    if #args == 1 then
        local afterTimer = tonumber(args[1])
        if afterTimer then
            for _, ent in pairs(ents.FindByClass("sent_simpletimerplus")) do
                if IsValid(ent) then
                    ent:SetST_ATimer(afterTimer)
                    print("Timer Aftermath set to: " .. afterTimer)
                else
                    print("Timer entity not found.")
                end
            end
        else
            print("Invalid timer aftermath. Please provide a valid timer aftermath number.")
        end
    else
        print("Usage: simpletimerplus_setaftertimer <new_aftertimer> (0 = Stop Timer, 1 = Reset Timer, 2 = End Timer)")
    end
end)

concommand.Add("simpletimerplus_getstate", function(ply, cmd, args)
    for _, ent in pairs(ents.FindByClass("sent_simpletimerplus")) do
        if IsValid(ent) then
            local timerState = ent:GetST_ATimer()
            print("Timer state is: " .. timerState)
        else
            print("Timer entity not found.")
        end
    end
    return timerState
end)

concommand.Add("simpletimerplus_setstate", function(ply, cmd, args)
    if #args == 1 then
        local newState = tonumber(args[1])
        if newState then
            for _, ent in pairs(ents.FindByClass("sent_simpletimerplus")) do
                if IsValid(ent) then
                    ent:SetST_State(newState)
                    print("Timer state set to: " .. newState)
                else
                    print("Timer entity not found.")
                end
            end
        else
            print("Invalid state. Please provide a valid state number.")
        end
    else
        print("Usage: simpletimerplus_setstate <new_state> (0 = Reset, 1 = Start, 2 = End, 3 = Stop)")
    end
end)

concommand.Add("simpletimerplus_getfont", function(ply, cmd, args)
    for _, ent in pairs(ents.FindByClass("sent_simpletimerplus")) do
        if IsValid(ent) then
            local timerFont = ent:GetST_CustomFont()
            print("Timer font is: " .. timerFont)
        else
            print("Timer entity not found.")
        end
    end
    return timerFont
end)

concommand.Add("simpletimerplus_setfont", function(ply, cmd, args)
    if #args == 1 then
        local newFont = args[1]
        for _, ent in pairs(ents.FindByClass("sent_simpletimerplus")) do
            if IsValid(ent) then
                ent:SetST_CustomFont(newFont)
                print("Timer font set to: " .. newFont)
            else
                print("Timer entity not found.")
            end
        end
    else
        print("Usage: simpletimerplus_setfont <new_font_name> (Arial, Chiller, ComicSansMS, CourierNew, Darkmode, HelpMe, Impact, Misery, Papyrus, Tahoma) (CASE SENSITIVE. Courier New is to be written here as \"CourierNew\". Comic Sans MS is to be written here as \"ComicSansMS\")")
    end
end, function(cmd, args)
    return AutoComplete( cmd, args, { "Arial", "Chiller", "ComicSansMS", "CourierNew", "Darkmode", "HelpMe", "Impact", "Misery", "Papyrus", "Tahoma" } )
end)

concommand.Add("simpletimerplus_hidetimer", function(ply, cmd, args)
    for _, ent in pairs(ents.FindByClass("sent_simpletimerplus")) do
        if IsValid(ent) then
            local currentVisibility = ent:GetST_HideTimer()
            ent:SetST_HideTimer(not currentVisibility)
            print("Timer text visibility toggled to: " .. (not currentVisibility and "Hidden" or "Visible"))
        else
            print("Timer entity not found.")
        end
    end
end)

concommand.Add("simpletimerplus_getstartsound", function(ply, cmd, args)
    for _, ent in pairs(ents.FindByClass("sent_simpletimerplus")) do
        if IsValid(ent) then
            local timerStartSound = ent:GetST_StartSound()
            print("Timer start sound is: " .. timerStartSound)
        else
            print("Timer entity not found.")
        end
    end
    return timerStartSound
end)

concommand.Add("simpletimerplus_setstartsound", function(ply, cmd, args)
    if #args == 1 then
        local newSound = args[1]
        for _, ent in pairs(ents.FindByClass("sent_simpletimerplus")) do
            if IsValid(ent) then
                ent:SetST_StartSound(newSound)
                print("Timer start sound set to: " .. newSound)
            else
                print("Timer entity not found.")
            end
        end
    else
        print("Usage: simpletimerplus_setstartsound <new_start_sound> (0 = No Sound, 1 = Default Start, 2 = Default Stop, 3 = Default End, 4 = FNAF 3 Night Start, 5 = PPHNS Round Start, 6 = PPHNS Round End (1st type), 7 = PPHNS Round End (2nd type), 8 = PPHNS Round End (3rd type), 9 = PPHNS Round End (4th type))")
    end
end)

concommand.Add("simpletimerplus_getsecondstartsound", function(ply, cmd, args)
    for _, ent in pairs(ents.FindByClass("sent_simpletimerplus")) do
        if IsValid(ent) then
            local timerSecondStartSound = ent:GetST_SecondStartSound()
            print("Timer secondary start sound is: " .. timerSecondStartSound)
        else
            print("Timer entity not found.")
        end
    end
    return timerSecondStartSound
end)

concommand.Add("simpletimerplus_setsecondstartsound", function(ply, cmd, args)
    if #args == 1 then
        local newSecondSound = args[1]
        for _, ent in pairs(ents.FindByClass("sent_simpletimerplus")) do
            if IsValid(ent) then
                ent:SetST_SecondStartSound(newSecondSound)
                print("Timer secondary start sound set to: " .. newSecondSound)
            else
                print("Timer entity not found.")
            end
        end
    else
        print("Usage: simpletimerplus_setsecondstartsound <new_start_sound> (0 = No Sound, 1 = Tattletail Round Start)")
    end
end)

concommand.Add("simpletimerplus_getstopsound", function(ply, cmd, args)
    for _, ent in pairs(ents.FindByClass("sent_simpletimerplus")) do
        if IsValid(ent) then
            local timerStopSound = ent:GetST_StopSound()
            print("Timer stop sound is: " .. timerStopSound)
        else
            print("Timer entity not found.")
        end
    end
    return timerStopSound
end)

concommand.Add("simpletimerplus_setstopsound", function(ply, cmd, args)
    if #args == 1 then
        local newSound = args[1]
        for _, ent in pairs(ents.FindByClass("sent_simpletimerplus")) do
            if IsValid(ent) then
                ent:SetST_StopSound(newSound)
                print("Timer stop sound set to: " .. newSound)
            else
                print("Timer entity not found.")
            end
        end
    else
        print("Usage: simpletimerplus_setstopsound <new_stop_sound>  (0 = No Sound, 1 = Default Start, 2 = Default Stop, 3 = Default End, 4 = FNAF 3 Night Start, 5 = PPHNS Round Start, 6 = PPHNS Round End (1st type), 7 = PPHNS Round End (2nd type), 8 = PPHNS Round End (3rd type), 9 = PPHNS Round End (4th type))")
    end
end)

concommand.Add("simpletimerplus_getendsound", function(ply, cmd, args)
    for _, ent in pairs(ents.FindByClass("sent_simpletimerplus")) do
        if IsValid(ent) then
            local timerEndSound = ent:GetST_EndSound()
            print("Timer end sound is: " .. timerEndSound)
        else
            print("Timer entity not found.")
        end
    end
    return timerEndSound
end)

concommand.Add("simpletimerplus_setendsound", function(ply, cmd, args)
    if #args == 1 then
        local newSound = args[1]
        for _, ent in pairs(ents.FindByClass("sent_simpletimerplus")) do
            if IsValid(ent) then
                ent:SetST_EndSound(newSound)
                print("Timer end sound set to: " .. newSound)
            else
                print("Timer entity not found.")
            end
        end
    else
        print("Usage: simpletimerplus_setendsound <new_end_sound>  (0 = No Sound, 1 = Default Start, 2 = Default Stop, 3 = Default End, 4 = FNAF 3 Night Start, 5 = PPHNS Round Start, 6 = PPHNS Round End (1st type), 7 = PPHNS Round End (2nd type), 8 = PPHNS Round End (3rd type), 9 = PPHNS Round End (4th type))")
    end
end)

concommand.Add("simpletimerplus_getfadeintime", function(ply, cmd, args)
    for _, ent in pairs(ents.FindByClass("sent_simpletimerplus")) do
        if IsValid(ent) then
            local timerFadeInTime = ent:GetST_FadeInTime()
            print("Timer fade-in time is: " .. math.Round(timerFadeInTime, 2))
        else
            print("Timer entity not found.")
        end
    end
    return timerFadeInTime
end)

concommand.Add("simpletimerplus_setfadeintime", function(ply, cmd, args)
    if #args == 1 then
        local fadeInTime = tonumber(args[1])
        if fadeInTime and fadeInTime >= 0 and fadeInTime <= 1 then
            for _, ent in pairs(ents.FindByClass("sent_simpletimerplus")) do
                if IsValid(ent) then
                    ent:SetST_FadeInTime(fadeInTime)
                    print("Timer fade-in time set to: " .. fadeInTime)
                else
                    print("Timer entity not found.")
                end
            end
        else
            print("Invalid fade-in time multiplier. Please provide a number between 0 and 1.")
        end
    else
        print("Usage: simpletimerplus_setfadeintime <new_fade_in_time_multiplier>")
    end
end)

concommand.Add("simpletimerplus_getfadeouttime", function(ply, cmd, args)
    for _, ent in pairs(ents.FindByClass("sent_simpletimerplus")) do
        if IsValid(ent) then
            local timerFadeOutTime = ent:GetST_FadeOutTime()
            print("Timer fade-out time is: " .. math.Round(timerFadeOutTime, 2))
        else
            print("Timer entity not found.")
        end
    end
    return timerFadeOutTime
end)

concommand.Add("simpletimerplus_setfadeouttime", function(ply, cmd, args)
    if #args == 1 then
        local fadeOutTime = tonumber(args[1])
        if fadeOutTime and fadeOutTime >= 0 and fadeOutTime <= 1 then
            for _, ent in pairs(ents.FindByClass("sent_simpletimerplus")) do
                if IsValid(ent) then
                    ent:SetST_FadeOutTime(fadeOutTime)
                    print("Timer fade-out time set to: " .. fadeOutTime)
                else
                    print("Timer entity not found.")
                end
            end
        else
            print("Invalid fade-out time multiplier. Please provide a number between 0 and 1.")
        end
    else
        print("Usage: simpletimerplus_setfadeouttime <new_fade_out_time_multiplier>")
    end
end)

concommand.Add("simpletimerplus_justifytext", function(ply, cmd, args)
    for _, ent in pairs(ents.FindByClass("sent_simpletimerplus")) do
        if IsValid(ent) then
            local currentJustification = ent:GetST_JustifyText()
            ent:SetST_JustifyText(not currentJustification)
            print("Timer text justification: " .. (not currentJustification and "Enabled" or "Disabled"))
        else
            print("Timer entity not found.")
        end
    end
end)

concommand.Add("simpletimerplus_hideentity", function(ply, cmd, args)
    for _, ent in pairs(ents.FindByClass("sent_simpletimerplus")) do
        if IsValid(ent) then
            local currentVisibility = ent:GetST_EntityHidden()
            ent:SetST_EntityHidden(not currentVisibility)
            print("Timer visibility toggled to: " .. (not currentVisibility and "Hidden" or "Visible"))
        else
            print("Timer entity not found.")
        end
    end
end)

concommand.Add("simpletimerplus_getgradienttexteffect", function(ply, cmd, args)
    for _, ent in pairs(ents.FindByClass("sent_simpletimerplus")) do
        if IsValid(ent) then
            local timerGradientTextEffect = ent:GetST_GradientTextEffect()
            print("Timer gradient text effect is: " .. timerGradientTextEffect)
        else
            print("Timer entity not found.")
        end
    end
    return timerGradientTextEffect
end)

concommand.Add("simpletimerplus_setgradienttexteffect", function(ply, cmd, args)
    if #args == 1 then
        local newGradientTextEffect = args[1]
        for _, ent in pairs(ents.FindByClass("sent_simpletimerplus")) do
            if IsValid(ent) then
                ent:SetST_GradientTextEffect(newGradientTextEffect)
                print("Timer end sound set to: " .. newGradientTextEffect)
            else
                print("Timer entity not found.")
            end
        end
    else
        print("Usage: simpletimerplus_setgradienttexteffect <new_gradient_text_effect>  (0 = None, 1 = Duo-Gradient, 2 = Duo-Gradient Left to Right)")
    end
end)

concommand.Add("simpletimerplus_getgradientspeed", function(ply, cmd, args)
    for _, ent in pairs(ents.FindByClass("sent_simpletimerplus")) do
        if IsValid(ent) then
            local timerGradientSpeed = ent:GetST_GradientSpeed()
            print("Timer gradient speed is: " .. math.Round(timerGradientSpeed, 2))
        else
            print("Timer entity not found.")
        end
    end
    return timerGradientSpeed
end)

concommand.Add("simpletimerplus_setgradientspeed", function(ply, cmd, args)
    if #args == 1 then
        local gradientSpeed = tonumber(args[1])
        if gradientSpeed and gradientSpeed >= 0.1 and gradientSpeed <= 3 then
            for _, ent in pairs(ents.FindByClass("sent_simpletimerplus")) do
                if IsValid(ent) then
                    ent:SetST_GradientSpeed(gradientSpeed)
                    print("Timer gradient speed set to: " .. gradientSpeed)
                else
                    print("Timer entity not found.")
                end
            end
        else
            print("Invalid gradient speed multiplier. Please provide a number between 0.1 and 3.")
        end
    else
        print("Usage: simpletimerplus_setgradientspeed <new_gradient_speed_multiplier>")
    end
end)

concommand.Add("simpletimerplus_getgradientfrequency", function(ply, cmd, args)
    for _, ent in pairs(ents.FindByClass("sent_simpletimerplus")) do
        if IsValid(ent) then
            local timerGradientFrequency = ent:GetST_GradientFrequency()
            print("Timer gradient frequency is: " .. math.Round(timerGradientFrequency, 1))
        else
            print("Timer entity not found.")
        end
    end
    return timerGradientFrequency
end)

concommand.Add("simpletimerplus_setgradientfrequency", function(ply, cmd, args)
    if #args == 1 then
        local gradientFrequency = tonumber(args[1])
        if gradientFrequency and gradientFrequency >= 1 and gradientFrequency <= 10 then
            for _, ent in pairs(ents.FindByClass("sent_simpletimerplus")) do
                if IsValid(ent) then
                    ent:SetST_GradientFrequency(gradientFrequency)
                    print("Timer gradient frequency set to: " .. gradientFrequency)
                else
                    print("Timer entity not found.")
                end
            end
        else
            print("Invalid gradient frequency multiplier. Please provide a number between 1 and 10.")
        end
    else
        print("Usage: simpletimerplus_setgradientfrequency <new_gradient_frequency_multiplier>")
    end
end)

concommand.Add("simpletimerplus_glitchtexteffect", function(ply, cmd, args)
    for _, ent in pairs(ents.FindByClass("sent_simpletimerplus")) do
        if IsValid(ent) then
            local glitchTextEffect = ent:GetST_GlitchTextEffect()
            ent:SetST_GlitchTextEffect(not glitchTextEffect)
            print("Timer glitch text effect toggled to be: " .. (not glitchTextEffect and "Enabled" or "Disabled"))
        else
            print("Timer entity not found.")
        end
    end
end)

concommand.Add("simpletimerplus_getglitchfrequency", function(ply, cmd, args)
    for _, ent in pairs(ents.FindByClass("sent_simpletimerplus")) do
        if IsValid(ent) then
            local timerGlitchFrequency = ent:GetST_GlitchFrequency()
            print("Timer glitch frequency is: " .. math.Round(timerGlitchFrequency, 3))
        else
            print("Timer entity not found.")
        end
    end
    return timerGlitchFrequency
end)

concommand.Add("simpletimerplus_setglitchfrequency", function(ply, cmd, args)
    if #args == 1 then
        local glitchFrequency = tonumber(args[1])
        if glitchFrequency and glitchFrequency >= 0.001 and glitchFrequency <= 0.1 then
            for _, ent in pairs(ents.FindByClass("sent_simpletimerplus")) do
                if IsValid(ent) then
                    ent:SetST_GlitchFrequency(glitchFrequency)
                    print("Timer glitch frequency set to: " .. glitchFrequency)
                else
                    print("Timer entity not found.")
                end
            end
        else
            print("Invalid glitch frequency multiplier. Please provide a number between 0.001 and 0.1")
        end
    else
        print("Usage: simpletimerplus_setglitchfrequency <new_glitch_frequency_multiplier>")
    end
end)

concommand.Add("simpletimerplus_getpresets", function(ply, cmd, args)
    if IsValid(ent) then
        print("Timer presets available: Default, PPHNS Start")
    else
        print("Timer entity not found.")
    end
    return timerFadeOutTime
end)

if SERVER then
    concommand.Add("simpletimerplus_setpreset", function(ply, cmd, args)
        if #args == 1 then
            local presetType = args[1]
            if not ply:IsAdmin() then
                print("You must be an admin to use this command.")
                return
            end
            if presetType and presetType == "PPHNS Start" then
                for _, ent in pairs(ents.FindByClass("sent_simpletimerplus")) do
                    if IsValid(ent) then
                        ent:SetST_Name("Hide and Seek")
                        ent:SetST_Color(Vector(1, 0, 0))
                        ent:SetST_SecondColor(Vector(1, 0.22, 0.22))
                        ent:SetST_Time(600)
                        ent:SetST_PosX(0)
                        ent:SetST_PosY(0)
                        ent:SetST_TimePosX(0)
                        ent:SetST_TimePosY(0)
                        ent:SetST_PosXYSync(false)
                        ent:SetST_TBCornerRadius(0)
                        ent:SetST_TBPosX(0)
                        ent:SetST_TBPosY(-50)
                        ent:SetST_TBWidth(400)
                        ent:SetST_TBHeight(150)
                        ent:SetST_TBColor(Vector(0, 0, 0))
                        ent:SetST_TBColorAlpha(150)
                        ent:SetST_HHud(false)
                        ent:SetST_HSnd(false)
                        ent:SetST_HNot(true)
                        ent:SetST_CustomFont("Misery")
                        ent:SetST_FadeInTime(1)
                        ent:SetST_FadeOutTime(0)
                        ent:SetST_JustifyText(true)
                        ent:SetST_StartSound(5)
                        ent:SetST_SecondStartSound(0)
                        ent:SetST_StopSound(4)
                        ent:SetST_EndSound(math.random(6, 9))
                        ent:SetST_GradientTextEffect(2)
                        ent:SetST_GradientSpeed( 1 )
                        ent:SetST_GradientFrequency( 2 )
                        ent:SetST_GlitchTextEffect( false )
                        print("Timer values have been set successfully.")
                    else
                        print("Timer entity not found.")
                    end
                end
            elseif presetType and presetType == "Default" then
                for _, ent in pairs(ents.FindByClass("sent_simpletimerplus")) do
                    if IsValid(ent) then
                        ent:SetST_Name("Simple Timer Plus")
                        ent:SetST_Color(Vector(0, 1, 1))
                        ent:SetST_SecondColor(Vector(0, 1, 0))
                        ent:SetST_Time(60)
                        ent:SetST_PosX(0)
                        ent:SetST_PosY(0)
                        ent:SetST_TimePosX(0)
                        ent:SetST_TimePosY(0)
                        ent:SetST_PosXYSync(false)
                        ent:SetST_TBCornerRadius(8)
                        ent:SetST_TBPosX(0)
                        ent:SetST_TBPosY(0)
                        ent:SetST_TBWidth(400)
                        ent:SetST_TBHeight(100)
                        ent:SetST_TBColor(Vector(0, 0, 0))
                        ent:SetST_TBColorAlpha(150)
                        ent:SetST_HHud(false)
                        ent:SetST_HSnd(false)
                        ent:SetST_HNot(true)
                        ent:SetST_CustomFont("Tahoma")
                        ent:SetST_FadeInTime(0.025)
                        ent:SetST_FadeOutTime(0.05)
                        ent:SetST_JustifyText(false)
                        ent:SetST_StartSound(1)
                        ent:SetST_SecondStartSound(0)
                        ent:SetST_StopSound(2)
                        ent:SetST_EndSound(3)
                        ent:SetST_EStart(0)
                        ent:SetST_EStop(0)
                        ent:SetST_EEnd(0)
                        ent:SetST_Mission(0)
                        ent:SetST_AMission(0)
                        ent:SetST_ATimer(2)
                        ent:SetST_HideTimer(false)
                        ent:SetST_EntityHidden(false)
                        ent:SetST_GradientTextEffect( 0 )
                        ent:SetST_GradientSpeed( 0.65 )
                        ent:SetST_GradientFrequency( 2 )
                        ent:SetST_GlitchFrequency( 0.005 )
                        ent:SetST_GlitchTextEffect( false )
                        print("Timer values have been set successfully.")
                    else
                        print("Timer entity not found.")
                    end
                end
            end
        else
            print("Usage: simpletimerplus_setpreset <name_of_preset> (Available Presets: Default, PPHNS Start) (CASE SENSTITIVE)")
        end
    end, function(cmd, args)
        return AutoComplete( cmd, args, { "PPHNS Start", "Default" } )
    end)
end