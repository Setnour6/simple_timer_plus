AddCSLuaFile()

STIMER_ENTS = {}
STIMER_ACTIVE = nil

STIMER_EVENTS = {
	[ "No Event" ] = 0,
	[ "Kill Everyone" ] = 1,
	[ "Kill NPCs/Nextbots" ] = 2,
	[ "Kill Players" ] = 3,
	[ "Clean Up Everything" ] = 4,
	[ "Disable AI" ] = 5,
	[ "Enable AI" ] = 6,
	[ "Disable Ignore Players" ] = 7,
	[ "Enable Ignore Players" ] = 8,
	[ "Ignite NPCs/Nextbots" ] = 9,
	[ "Ignite Players" ] = 10,
	[ "Enable PVP" ] = 11,
	[ "Disable PVP" ] = 12,
}
STIMER_EVENT2 = {
	[ "No Mission" ] = 0,
	[ "A Player has died" ] = 1,
	[ "All players have died" ] = 2,
	[ "An NPC/Nextbot has been killed" ] = 3,
	[ "All NPCs/Nextbots have been killed" ] = 4,
	[ "A Player has entered a vehicle" ] = 5,
	[ "All Players have entered vehicles" ] = 6,
}
STIMER_EVENT3 = {
	[ "Stop Timer" ] = 0,
	[ "Reset Timer" ] = 1,
	[ "End Timer" ] = 2,
	[ "Continue Timer" ] = 3,
}
STIMER_EVENT4 = {
	[ "Stop Timer" ] = 0,
	[ "Reset Timer" ] = 1,
	[ "End Timer" ] = 2,
}
STIMER_FONTS = {
	[ "Courier New" ] = "CourierNew",
	[ "Tahoma" ] = "Tahoma",
	[ "Arial" ] = "Arial",
	[ "Misery" ] = "Misery",
	[ "Impact" ] = "Impact",
	[ "Comic Sans MS" ] = "ComicSansMS",
	[ "Papyrus" ] = "Papyrus",
	[ "Chiller" ] = "Chiller",
	[ "Darkmode" ] = "Darkmode",
	[ "Help Me" ] = "HelpMe",
}
STIMER_SOUNDS = {
	[ "No Sound" ] = 0,
	[ "Default Start (ambient/alarms/warningbell1.wav)" ] = 1,
	[ "Default Stop (ambient/levels/canals/windchime2.wav)" ] = 2,
	[ "Default End (physics/metal/metal_grate_impact_hard1.wav)" ] = 3,
	[ "FNAF 3 Night Start" ] = 4,
	[ "PPHNS Round Start" ] = 5,
	[ "PPHNS Round End (1st type)" ] = 6,
	[ "PPHNS Round End (2nd type)" ] = 7,
	[ "PPHNS Round End (3rd type)" ] = 8,
	[ "PPHNS Round End (4th type)" ] = 9,
}
STIMER_SOUNDS2 = {
	[ "No Sound" ] = 0,
	[ "Tattletail Round Start" ] = 1,
}
STIMER_TEXT_EFFECTS = {
	[ "None" ] = 0,
	[ "Right to Left" ] = 1,
	[ "Left to Right" ] = 2,
	[ "Right to Left Per-Character" ] = 3,
	[ "Left to Right Per-Character" ] = 4,
}

if CLIENT then
	STIMER_ = {
		Name = "",
		Time = 0,
		Timer = 0,
		State = 0,
		Color = Vector( 0, 0, 0 ),
		SecondColor = Vector( 0, 0, 0 ),
		TBColor = Vector( 0, 0, 0 ),
		Start = false,
		LerpAlp = 0,
		Static = "",
		CustomFont = "Tahoma",
		HideTimer = false,
		StartSound = "",
		SecondStartSound = "",
		StopSound = "",
		EndSound = "",
		FadeInTime = 0.05,
		FadeOutTime = 0.025,
		EntityHidden = false,
		GlitchTextEffect = false,
		GradientTextEffect = false,
	}
	resource.AddFile("resource/fonts/Misery.ttf")
	resource.AddFile("resource/fonts/CHILLER.TTF")
	surface.CreateFont( "CourierNew_Font1", { font = "Courier New", size = 40, weight = 1000, antialias = true } )
	surface.CreateFont( "CourierNew_Font2", { font = "Courier New", size = 65, weight = 1000, antialias = true } )
	surface.CreateFont( "Tahoma_Font1", { font = "Tahoma", size = 30, weight = 1000, antialias = true } )
	surface.CreateFont( "Tahoma_Font2", { font = "Tahoma", size = 60, weight = 1000, antialias = true } )
	surface.CreateFont( "Arial_Font1", { font = "Arial", size = 30, weight = 1000, antialias = true })
	surface.CreateFont( "Arial_Font2", { font = "Arial", size = 60, weight = 1000, antialias = true })
	surface.CreateFont( "Misery_Font1", { font = "Misery", size = 30, weight = 500, antialias = true })
	surface.CreateFont( "Misery_Font2", { font = "Misery", size = 60, weight = 500, antialias = true })
	surface.CreateFont( "Impact_Font1", { font = "Impact", size = 30, weight = 1000, antialias = true })
	surface.CreateFont( "Impact_Font2", { font = "Impact", size = 60, weight = 1000, antialias = true })
	surface.CreateFont( "ComicSansMS_Font1", { font = "Comic Sans MS", size = 35, weight = 1000, antialias = true })
	surface.CreateFont( "ComicSansMS_Font2", { font = "Comic Sans MS", size = 60, weight = 1000, antialias = true })
	surface.CreateFont( "Papyrus_Font1", { font = "Papyrus", size = 45, weight = 1000, antialias = true })
	surface.CreateFont( "Papyrus_Font2", { font = "Papyrus", size = 80, weight = 1000, antialias = true })
	surface.CreateFont( "Chiller_Font1", { font = "Chiller", size = 45, weight = 1000, antialias = true })
	surface.CreateFont( "Chiller_Font2", { font = "Chiller", size = 60, weight = 1000, antialias = true })
	surface.CreateFont( "Darkmode_Font1", { font = "Darkmode", size = 35, weight = 1000, antialias = true })
	surface.CreateFont( "Darkmode_Font2", { font = "Darkmode", size = 60, weight = 1000, antialias = true })
	surface.CreateFont( "HelpMe_Font1", { font = "Help Me", size = 28, weight = 1000, antialias = true })
	surface.CreateFont( "HelpMe_Font2", { font = "Help Me", size = 54, weight = 500, antialias = true })
	language.Add( "sent_simpletimerplus", "Simple Timer Plus" )
	killicon.Add( "sent_simpletimerplus", "HUD/killicons/default", Color( 0, 255, 255, 255 ) )
	hook.Add("HUDPaint", "SimpleTimerHUD", function() local tim, ply = STIMER_ENT, LocalPlayer()
		if STIMER_.LerpAlp > 0 and STIMER_.Timer > 0 then local sta = STIMER_.State
			local ww, hh = ScrW() / 2, ScrH() / 2
			local col = Color(STIMER_.Color.r * 255, STIMER_.Color.g * 255, STIMER_.Color.b * 255, STIMER_.LerpAlp * 255)
			local secondCol = Color(STIMER_.SecondColor.r * 255, STIMER_.SecondColor.g * 255, STIMER_.SecondColor.b * 255, STIMER_.LerpAlp * 255)
			local tbCol = Color(STIMER_.TBColor.r * 255, STIMER_.TBColor.g * 255, STIMER_.TBColor.b * 255, STIMER_.LerpAlp * STIMER_.TBColorAlpha)
			draw.RoundedBox(STIMER_.TBCornerRadius, ww - 200 + STIMER_.TBPosX, 20 + STIMER_.TBPosY, STIMER_.TBWidth /*400*/, STIMER_.TBHeight /*100*/, tbCol /*Color(0, 0, 0, 150 * STIMER_.LerpAlp)*/)

			local function DrawGradientText(text, pos, font, color1, color2, xalign)
				surface.SetFont(font)

				local textWidth, _ = surface.GetTextSize(text)
				local startX
				if xalign == TEXT_ALIGN_CENTER then
					startX = pos[1] - textWidth / 2
				elseif xalign == TEXT_ALIGN_LEFT then
					startX = pos[1]
				else
					startX = pos[1] - textWidth
				end

				local gradientOffset = (CurTime() * STIMER_.GradientSpeed) % 1
				if STIMER_.GradientTextEffect == 2 or STIMER_.GradientTextEffect == 4 then
					gradientOffset = (-CurTime() * STIMER_.GradientSpeed) % 1
				end

				local currentX = startX
				for i = 1, #text do
					local char = string.sub(text, i, i)
					local charWidth, _ = surface.GetTextSize(char)

					local lerpFactor = ((currentX + charWidth / 2 - startX) / textWidth + gradientOffset) % 1
					local sineFactor = (math.sin(lerpFactor * math.pi * STIMER_.GradientFrequency) + 1) / 2

					if STIMER_.GradientTextEffect == 3 or STIMER_.GradientTextEffect == 4 then
						sineFactor = math.sin(math.floor(lerpFactor * math.pi * STIMER_.GradientFrequency))
					end

					local currentColor = Color(
						Lerp(sineFactor, color1.r, color2.r),
						Lerp(sineFactor, color1.g, color2.g),
						Lerp(sineFactor, color1.b, color2.b),
						color1.a
					)

					draw.TextShadow({
						text = char,
						pos = { currentX, pos[2] },
						font = font,
						xalign = TEXT_ALIGN_LEFT,
						yalign = TEXT_ALIGN_TOP,
						color = currentColor
					}, 1, color1.a)

					currentX = currentX + charWidth
				end
			end

			local function AddGlitchEffect(text, intensity)
				local charPool = string.char(math.random(33, 126))
				local maxGlitches = math.ceil(#text * intensity)
				local glitchedText = ""

				for i = 1, #text do
					if math.random() < STIMER_.GlitchFrequency and maxGlitches > 0 then
						local randomChar = string.sub(charPool, math.random(1, #charPool), math.random(1, #charPool))
						glitchedText = glitchedText .. randomChar
						maxGlitches = maxGlitches - 1
					else
						glitchedText = glitchedText .. string.sub(text, i, i)
					end
				end

				return glitchedText
			end

			if STIMER_.GlitchTextEffect then
				STIMER_.Name = AddGlitchEffect(STIMER_.Name, STIMER_.GlitchFrequency) or STIMER_.Name
			end

			local fontHeights = { Chiller = 22, Papyrus = 20, HelpMe = 26, Misery = 24, Default = 24 }
			local hh_cf = fontHeights[STIMER_.CustomFont] or fontHeights.Default

			local fontOffsets = {
				Misery = { x = 130, y = 55, justify = TEXT_ALIGN_LEFT },
				Chiller = { x = 84, y = 60, justify = TEXT_ALIGN_LEFT },
				Impact = { x = 88, y = 55, justify = TEXT_ALIGN_LEFT },
				Papyrus = { x = 102, y = 45, justify = TEXT_ALIGN_LEFT },
				Darkmode = { x = 104, y = 60, justify = TEXT_ALIGN_LEFT },
				HelpMe = { x = 88, y = 60, justify = TEXT_ALIGN_LEFT },
				Default = { x = 0, y = 55, justify = TEXT_ALIGN_CENTER }
			}
			local offset = fontOffsets[STIMER_.CustomFont] or fontOffsets.Default

			if STIMER_.GradientTextEffect != 0 then
				DrawGradientText(STIMER_.Name, {ww + STIMER_.PosX, hh_cf + STIMER_.PosY}, STIMER_.CustomFont ~= "" and STIMER_.CustomFont .. "_Font1" or "CourierNew_Font1", col, secondCol, TEXT_ALIGN_CENTER)
			else
				draw.TextShadow({ text = STIMER_.Name, pos = { ww + STIMER_.PosX, hh_cf + STIMER_.PosY },
					font = STIMER_.CustomFont ~= "" and STIMER_.CustomFont .. "_Font1" or "CourierNew_Font1", xalign = TEXT_ALIGN_CENTER,
					yalign = TEXT_ALIGN_DOWN, color = col }, 1, STIMER_.LerpAlp * 255)
			end

			if not STIMER_.HideTimer then
				local t1, tx = math.max( 0, STIMER_.Timer -CurTime() ), ""
				local mi = math.floor( t1/60 )  t1 = t1 -mi*60
				local se = math.Round( math.floor( t1 ) )  t1 = math.Round( t1 -se, 2 )
				if mi >= 10 then tx = tx..mi else tx = tx.."0"..mi end tx = tx..":"
				if se >= 10 then tx = tx..se else tx = tx.."0"..se end tx = tx..":"

				t1 = t1 * 100  if t1 >= 100 then t1 = "00" elseif t1 < 10 then t1 = "0" .. t1 end
				tx = tx .. t1  if sta == 1 then STIMER_.Static = tx else tx = STIMER_.Static end

				if STIMER_.GlitchTextEffect then
					tx = AddGlitchEffect(tx, STIMER_.GlitchFrequency)
				end

				if not STIMER_.JustifyText then
					offset.x = 0
					offset.justify = TEXT_ALIGN_CENTER
				end

				if STIMER_.GradientTextEffect != 0 then
					DrawGradientText(tx, {ww + (offset.justify == TEXT_ALIGN_CENTER and 0 or -offset.x) + STIMER_.PosX, offset.y + STIMER_.PosY }, STIMER_.CustomFont ~= "" and STIMER_.CustomFont .. "_Font2" or "CourierNew_Font2", col, secondCol, offset.justify)
				else
					draw.TextShadow({ text = tx, pos = { ww + (offset.justify == TEXT_ALIGN_CENTER and 0 or -offset.x) + STIMER_.PosX, offset.y + STIMER_.PosY },
						font = STIMER_.CustomFont ~= "" and STIMER_.CustomFont .. "_Font2" or "CourierNew_Font2", xalign = offset.justify,
						yalign = TEXT_ALIGN_DOWN, color = col }, 1, STIMER_.LerpAlp * 255)
				end
			end
		end
	end)
	hook.Add( "Think", "SimpleTimerPlusThink", function()
		if !IsValid( STIMER_ENT ) then
			if STIMER_.LerpAlp > 0 then STIMER_.LerpAlp = Lerp( STIMER_.FadeOutTime, STIMER_.LerpAlp, 0 ) end
		end
	end )
else
	hook.Add( "PlayerDeathThink", "SimpleTimerPlusDeath", function( ply )
		if IsValid( STIMER_ENT ) and ( STIMER_ENT:GetST_State() == 1 or STIMER_ENT:GetST_State() == 4 ) then
			if STIMER_ENT:GetST_MEvent() == 1 or STIMER_ENT:GetST_MEvent() == 2 then return false end
		end
	end )
	hook.Add( "PlayerDeath", "SimpleTimerPlusEvent", function( vic, inf, atk )
		if IsValid( STIMER_ENT ) and ( STIMER_ENT:GetST_State() == 1 or STIMER_ENT:GetST_State() == 4 ) then
			local mis, mev, maf = STIMER_ENT:GetST_Mission(), STIMER_ENT:GetST_MEvent(), STIMER_ENT:GetST_AMission()
			if mis == 1 then STIMER_ENT:STimer_Event( mev ) STIMER_ENT:STimer_After( maf )
			elseif mis == 2 then local alo = false
				for k, v in pairs( player.GetAll() ) do
					if IsValid( v ) and v:Alive() then alo = true break end
				end if !alo then STIMER_ENT:STimer_Event( mev ) STIMER_ENT:STimer_After( maf ) end
			end
		end
	end )
	hook.Add( "OnNPCKilled", "SimpleTimerPlusMission", function( vic, atk, inf )
		if IsValid( STIMER_ENT ) and ( STIMER_ENT:GetST_State() == 1 or STIMER_ENT:GetST_State() == 4 ) then
			local mis, mev, maf = STIMER_ENT:GetST_Mission(), STIMER_ENT:GetST_MEvent(), STIMER_ENT:GetST_AMission()
			if mis == 3 then STIMER_ENT:STimer_Event( mev ) STIMER_ENT:STimer_After( maf ) end
		end
	end )
end

ENT.PrintName 				= "Simple Timer Plus"
ENT.Author 					= "LemonCola3424, edited by Setnour6"
ENT.Category 				= "Fun + Games"
ENT.Base 					= "base_gmodentity"
ENT.RenderGroup 			= RENDERGROUP_BOTH
ENT.Spawnable 				= true
ENT.Editable				= true
ENT.AdminOnly 				= true
ENT.SecondTick 				= 0
ENT.WireDebugName			= "Simple Timer Plus"

function ENT:STimer_Event( num ) if CLIENT or !isnumber( num ) then return end
	if num == 1 then
		for k, v in pairs( ents.GetAll() ) do
			if ( v:IsPlayer() and v:Alive() ) or ( v:IsNPC() and v:GetNPCState() != NPC_STATE_DEAD ) or v:IsNextBot() then
				v:SetHealth( 0 ) v:SetMaxHealth( 0 ) v:TakeDamage( 2147483647 ) if !v:IsPlayer() then v:Remove() end
			end
		end
	elseif num == 2 then
		for k, v in pairs( ents.GetAll() ) do
			if ( v:IsNPC() and v:GetNPCState() != NPC_STATE_DEAD ) or v:IsNextBot() then
				v:SetHealth( 0 ) v:SetMaxHealth( 0 ) v:TakeDamage( 2147483647 ) v:Remove()
			end
		end
	elseif num == 3 then
		for k, v in pairs( ents.GetAll() ) do
			if v:IsPlayer() and v:Alive() then
				v:SetHealth( 0 ) v:SetMaxHealth( 0 ) v:TakeDamage( 2147483647 ) v:Kill() v:KillSilent()
			end
		end
	elseif num == 4 then game.CleanUpMap( false, { "sent_simpletimerplus" } )
	elseif num == 5 then game.ConsoleCommand("ai_disabled 1\n")
	elseif num == 6 then game.ConsoleCommand("ai_disabled 0\n")
	elseif num == 7 then game.ConsoleCommand("ai_ignoreplayers 0\n")
	elseif num == 8 then game.ConsoleCommand("ai_ignoreplayers 1\n")
	elseif num == 9 then
		for k, v in pairs( ents.GetAll() ) do
			if ( v:IsNPC() and v:GetNPCState() != NPC_STATE_DEAD ) or v:IsNextBot() then v:Ignite( 360 ) end
		end
	elseif num == 10 then
		for k, v in pairs( ents.GetAll() ) do
			if v:IsPlayer() and v:Alive() then v:Ignite( 360 ) end
		end
	elseif num == 11 then game.ConsoleCommand("sbox_playershurtplayers 1\n")
	elseif num == 12 then game.ConsoleCommand("sbox_playershurtplayers 0\n") end
end
function ENT:STimer_After( num ) if CLIENT or !isnumber( num ) then return end
	if num == 0 then self:SetST_State( 3 )
	elseif num == 1 then self:SetST_Timer( self:GetST_Time() +CurTime() ) self:SetST_State( 1 )
	elseif num == 2 then self:SetST_State( 2 ) elseif num == 3 then self:SetST_State( 1 ) end
end

function ENT:GetOverlayText()
	local txt, sta = ( self:GetST_Name().."\n" ), self:GetST_State()
	if sta == 0 then txt = txt.."[ Ready ]" elseif sta == 1 then txt = txt.."[ Activated ]"
	elseif sta == 2 then txt = txt.."[ Expired ]" elseif sta == 3 then txt = txt.."[ Stopped ]" end return txt
end
function ENT:SpawnFunction( ply, tr, ClassName )
	if !tr.Hit then return end local ent = ents.Create( ClassName )
	ent:SetPos( tr.HitPos +Vector( 0, 0, 32 ) )
	ent:SetAngles( Angle( 0, 0, 0 ) ) ent:Spawn() ent:Activate()
	ent:SetST_Name( "Simple Timer Plus" ) ent:SetST_Color( Vector( 0, 1, 1 ) ) ent:SetST_SecondColor( Vector( 0, 1, 0 ) ) ent:SetST_Time( 60 )
	ent:SetST_HHud( false ) ent:SetST_HSnd( false ) ent:SetST_HNot( true )
	ent:SetST_CustomFont( "Tahoma" ) ent:SetST_FadeInTime ( 0.025 ) ent:SetST_FadeOutTime ( 0.05 )
	ent:SetST_StartSound( 1 ) ent:SetST_SecondStartSound( 0 ) ent:SetST_StopSound( 2 ) ent:SetST_EndSound ( 3 )
	ent:SetST_EStart( 0 ) ent:SetST_EStop( 0 ) ent:SetST_EEnd( 0 ) ent:SetST_Mission( 0 )
	ent:SetST_AMission( 0 ) ent:SetST_ATimer( 2 ) ent:SetST_GlitchTextEffect( false )
	ent:SetST_GlitchFrequency( 0.005 ) ent:SetST_GradientTextEffect( 0 ) ent:SetST_GradientSpeed( 0.65 )
	ent:SetST_GradientFrequency( 2 )
	ent:SetST_JustifyText( false ) ent:SetST_TBCornerRadius( 8 ) ent:SetST_TBPosX( 0 ) ent:SetST_TBPosY( 0 )
	ent:SetST_TBWidth( 400 ) ent:SetST_TBHeight( 100 ) ent:SetST_TBColor( Vector(0, 0, 0) ) ent:SetST_TBColorAlpha( 150 )
	ent:SetST_PosX ( 0 ) ent:SetST_PosY( 0 )
	table.insert(STIMER_ENTS, ent) return ent
end
function ENT:SetupDataTables()
	-- main
	self:NetworkVar( "String", 0, "ST_Name", { KeyName = "stname", Edit = { title = "Timer Name", category = "Main", type = "String", order = 0 } } )
	self:NetworkVar( "Vector", 0, "ST_Color", { KeyName = "stcolor", Edit = { title = "Timer Color", category = "Main", type = "VectorColor", order = 1 } } )
	self:NetworkVar( "Vector", 1, "ST_SecondColor", { KeyName = "stsecondcolor", Edit = { title = "Timer Secondary Color (For Text Effects)", category = "Main", type = "VectorColor", order = 2 } })
	self:NetworkVar( "Int", 0, "ST_Time", { KeyName = "sttime", Edit = { title = "Time", category = "Main", type = "Int", min = 1, max = 3600, order = 3 } } )
	self:NetworkVar( "Int", 14, "ST_PosX", { KeyName = "stposx", Edit = { title = "Timer Position Offset X", category = "Main", type = "Int", min = -1920, max = 1920, order = 4 } })
	self:NetworkVar( "Int", 15, "ST_PosY", { KeyName = "stposy", Edit = { title = "Timer Position Offset Y", category = "Main", type = "Int", min = -1080, max = 1080, order = 5 } })
	-- text box
	self:NetworkVar( "Int", 16, "ST_TBCornerRadius", { KeyName = "sttbcornereadius", Edit = { title = "Textbox Corner Radius", category = "Text Box", type = "Int", min = 0, max = 200, order = 6 } })
	self:NetworkVar( "Int", 17, "ST_TBPosX", { KeyName = "sttbposx", Edit = { title = "Textbox Position Offset X", category = "Text Box", type = "Int", min = -1920, max = /*ScrW()*/1920, order = 7 } })
	self:NetworkVar( "Int", 18, "ST_TBPosY", { KeyName = "sttbposy", Edit = { title = "Textbox Position Offset Y", category = "Text Box", type = "Int", min = -1080, max = /*ScrH()*/1080, order = 8 } })
	self:NetworkVar( "Int", 19, "ST_TBWidth", { KeyName = "sttbwidth", Edit = { title = "Textbox Width", category = "Text Box", type = "Int", min = 0, max = 1920, order = 9 } })
	self:NetworkVar( "Int", 20, "ST_TBHeight", { KeyName = "sttbheight", Edit = { title = "Textbox Height", category = "Text Box", type = "Int", min = 0, max = 1080, order = 10 } })
	self:NetworkVar( "Vector", 2, "ST_TBColor", { KeyName = "sttbcolor", Edit = { title = "Textbox Color", category = "Text Box", type = "VectorColor", order = 11 } })
	self:NetworkVar( "Int", 21, "ST_TBColorAlpha", { KeyName = "sttbcoloralpha", Edit = { title = "Textbox Color Alpha", category = "Text Box", type = "Int", min = 0, max = 255, order = 12 } })
	-- hiding
	self:NetworkVar( "Bool", 0, "ST_HHud", { KeyName = "sthhud", Edit = { title = "No HUD (Hide All UI)", category = "Hide", type = "Bool", order = 13 } } )
	self:NetworkVar( "Bool", 1, "ST_HSnd", { KeyName = "sthsnd", Edit = { title = "No Sound", category = "Hide", type = "Bool", order = 14 } } )
	self:NetworkVar( "Bool", 2, "ST_HNot", { KeyName = "sthnot", Edit = { title = "No Text", category = "Hide", type = "Bool", order = 15 } } )
	self:NetworkVar( "Bool", 3, "ST_HideTimer", { KeyName = "sthidetimer", Edit = { title = "No Timer", category = "Hide", type = "Bool", order = 16 } } )
	self:NetworkVar( "Bool", 4, "ST_EntityHidden", { KeyName = "stentityhidden", Edit = { title = "Hide Entity", category = "Hide", type = "Bool", order = 17 } })
	-- events & mission
	self:NetworkVar( "Int", 1, "ST_EStart", { KeyName = "stestart", Edit = { title = "Start Event", category = "Events", type = "Combo", values = STIMER_EVENTS, order = 18 } } )
	self:NetworkVar( "Int", 2, "ST_EStop", { KeyName = "stestop", Edit = { title = "Stop Event", category = "Events", type = "Combo", values = STIMER_EVENTS, order = 19 } } )
	self:NetworkVar( "Int", 3, "ST_EEnd", { KeyName = "steend", Edit = { title = "End Event", category = "Events", type = "Combo", values = STIMER_EVENTS, order = 20 } } )
	self:NetworkVar( "Int", 4, "ST_Mission", { KeyName = "stmission", Edit = { title = "Mission", category = "Mission", type = "Combo", values = STIMER_EVENT2, order = 21 } } )
	self:NetworkVar( "Int", 5, "ST_MEvent", { KeyName = "stmevent", Edit = { title = "Mission Event", category = "Mission", type = "Combo", values = STIMER_EVENTS, order = 22 } } )
	self:NetworkVar( "Int", 6, "ST_AMission", { KeyName = "stamission", Edit = { title = "After Mission", category = "Aftermath", type = "Combo", values = STIMER_EVENT3, order = 23 } } )
	self:NetworkVar( "Int", 7, "ST_ATimer", { KeyName = "statimer", Edit = { title = "After Timer", category = "Aftermath", type = "Combo", values = STIMER_EVENT4, order = 24 } } )
	self:NetworkVar( "Int", 8, "ST_State" ) self:NetworkVar( "Float", 0, "ST_Timer" ) self:NetworkVar( "Float", 1, "ST_NextUse" )
	-- etc
	self:NetworkVar( "String", 1, "ST_CustomFont", { KeyName = "stcustomfont", Edit = { title = "Custom Font", category = "Main", type = "Combo", values = STIMER_FONTS, order = 25 } })
	self:NetworkVar( "Int", 9, "ST_StartSound", { KeyName = "ststartsound", Edit = { title = "Start Sound", category = "Sound", type = "Combo", values = STIMER_SOUNDS, order = 26 } } )
	self:NetworkVar( "Int", 10, "ST_SecondStartSound", { KeyName = "stsecondstartsound", Edit = { title = "Secondary Start Sound", category = "Sound", type = "Combo", values = STIMER_SOUNDS2, order = 27 } } )
	self:NetworkVar( "Int", 11, "ST_StopSound", { KeyName = "ststopsound", Edit = { title = "Stop Sound", category = "Sound", type = "Combo", values = STIMER_SOUNDS, order = 28 } } )
	self:NetworkVar( "Int", 12, "ST_EndSound", { KeyName = "stendsound", Edit = { title = "End Sound", category = "Sound", type = "Combo", values = STIMER_SOUNDS, order = 29 } } )
	self:NetworkVar( "Float", 2, "ST_FadeInTime", { KeyName = "stfadeintime", Edit = { title = "Fade In Time", category = "Main", type = "Float", min = 0, max = 1, order = 30 } } )
	self:NetworkVar( "Float", 3, "ST_FadeOutTime", { KeyName = "stfadeouttime", Edit = { title = "Fade Out Time", category = "Main", type = "Float", min = 0, max = 1, order = 31 } } )
	self:NetworkVar( "Bool", 5, "ST_JustifyText", { KeyName = "stjustifytext", Edit = { title = "Realign Timer (Some Fonts Only)", category = "Main", type = "Bool", order = 32 } })
	self:NetworkVar( "Int", 13, "ST_GradientTextEffect", { KeyName = "stgradienttexteffect", Edit = { title = "Gradient Text Effect", category = "Text Effects", type = "Combo", values = STIMER_TEXT_EFFECTS, order = 33 } })
	self:NetworkVar( "Float", 4, "ST_GradientSpeed", { KeyName = "stgradientspeed", Edit = { title = "Gradient Speed", category = "Text Effects", type = "Float", min = 0.1, max = 3, order = 34 } })
	self:NetworkVar( "Float", 5, "ST_GradientFrequency", { KeyName = "stgradientfrequency", Edit = { title = "Gradient Frequency", category = "Text Effects", type = "Float", min = 1, max = 10, order = 35 } })
	self:NetworkVar( "Bool", 6, "ST_GlitchTextEffect", { KeyName = "stglitchtexteffect", Edit = { title = "Glitch Text Effect", category = "Text Effects", type = "Bool", order = 36 } } )
	self:NetworkVar( "Float", 6, "ST_GlitchFrequency", { KeyName = "stglitchfrequency", Edit = { title = "Glitch Frequency", category = "Text Effects", type = "Float", min = 0.001, max = 0.10, order = 37 } } )
	self:NetworkVar( "Float", 12, "ST_CurTime" )
	self:SetST_State( 0 ) self:SetST_Timer( 0 ) self:SetST_NextUse( 0 ) self:SetST_CurTime(math.Round(math.max(0, self:GetST_Timer() - CurTime()), 2))
	if SERVER then
		self:NetworkVarNotify( "ST_State", function( self, var, old, new )
			if old == new then return false end
			if WireLib then Wire_TriggerOutput( self, "State", new ) end
			if new == 0 then self:SetColor( Color( 255, 255, 255 ) )
			elseif new == 1 then
				self:SetColor( Color( 255, 255, 0 ) )
				self:STimer_Event( self:GetST_EStart() )
				self:SetST_Timer( CurTime() + self:GetST_Time() )
				if self:GetST_StartSound() ~= "" then self:EmitSound( self:GetST_StartSound() ) end
				if self:GetST_SecondStartSound() ~= "" then self:EmitSound( self:GetST_SecondStartSound() ) end
			elseif new == 2 then
				self:SetColor( Color( 255, 0, 0 ) )
				self:STimer_Event( self:GetST_EEnd() )
				if self:GetST_EndSound() ~= "" then self:EmitSound( self:GetST_EndSound() ) end
			elseif new == 3 then
				self:SetColor( Color( 0, 255, 0 ) )
				self:STimer_Event( self:GetST_EStop() )
				if self:GetST_StopSound() ~= "" then self:EmitSound( self:GetST_StopSound() ) end
			else return false end
		end )
	else
	end
end
function ENT:OnDuplicated() self:SetST_State( 0 ) self:SetST_Timer( 0 ) self:SetST_NextUse( 0 ) end
function ENT:Initialize()
	if !SERVER then return end
	self:SetSolid( SOLID_VPHYSICS )
	self:SetMoveType( MOVETYPE_NONE )
	self:SetModel( "models/Combine_Helicopter/helicopter_bomb01.mdl" )
	self:SetCollisionGroup( COLLISION_GROUP_WORLD )
	self:DrawShadow( false )
	self:SetST_State( 0 )
	self:SetST_Timer( 0 )
	self:NetworkVar( "Float", 0, "ST_Timer" )
	if IsValid( STIMER_ENT ) then STIMER_ENT:Remove() end
	STIMER_ENT = self
	table.insert(STIMER_ENTS, self)
	self:SetUseType( SIMPLE_USE )
	self:SetST_NextUse( CurTime() + 0.5 )
	self.SecondTick = 0
	if WireLib then Wire_TriggerOutput( self, "Time", self.SecondTick ) end
	if WireLib and isfunction( Wire_CreateOutputs ) and isfunction( Wire_CreateOutputs ) then
		self.Inputs = WireLib.CreateSpecialInputs( self, {
			"Activate (Active/Stop the timer and call the event.)",
			"Reset (Reset the timer.)",
			"Expire (End the timer and call the event.)",
			"Mission (Call mission complete event.)",
		} )
		self.Outputs = WireLib.CreateOutputs( self, { 
			"State (0~4: Ready, Start, Expired, Stopped.)", 
			"Time (Time of the timer.)",
		} )
	end
end
function ENT:TriggerInput( id, val ) local sta = self:GetST_State()
	if id == "Activate" then if val > 0 then self:SetST_State( 1 ) else self:SetST_State( sta == 1 and 3 or 0 ) end end
	if id == "Reset" and val > 0 then self:SetST_Timer( self:GetST_Time() +CurTime() ) end
	if id == "Expire" and val > 0 and sta == 1 then self:SetST_State( 2 ) end
	if id == "Mission" and val > 0 and sta == 1 then local mev, maf = STIMER_ENT:GetST_MEvent(), STIMER_ENT:GetST_AMission()
		self:STimer_Event( mev ) self:STimer_After( maf )
	end
end
function ENT:Think()
	if SERVER then local sta, ati, alo = self:GetST_State(), self:GetST_ATimer(), false
		if sta == 1 and self.SecondTick != math.Round( self:GetST_Timer()-CurTime() ) then self.SecondTick = math.Round( self:GetST_Timer()-CurTime() )
			if WireLib then Wire_TriggerOutput( self, "Time", self.SecondTick ) end
			local mis, mev, maf = STIMER_ENT:GetST_Mission(), STIMER_ENT:GetST_MEvent(), STIMER_ENT:GetST_AMission()
			if mis == 4 then alo = true
				for k, v in pairs( ents.GetAll() ) do if IsValid( v ) and ( v:IsNPC() or v:IsNextBot() ) and v:Health() > 0 then alo = false break end end
			elseif mis == 5 or mis == 6 then local al2 = false
				for k, v in pairs( player.GetAll() ) do if !IsValid( v ) then continue end
					if mis == 5 and v:InVehicle() then alo = true end
					if mis == 6 and !v:InVehicle() then al2 = true end
				end if mis == 6 and !al2 then alo = true end
			end if alo then STIMER_ENT:STimer_Event( mev ) STIMER_ENT:STimer_After( maf ) end return
		end if sta == 1 and self:GetST_Timer() <= CurTime() then self:SetST_State( 2 ) self:STimer_After( ati ) end
	else if !IsValid( STIMER_ENT ) or STIMER_ENT != self then STIMER_ENT = self  STIMER_.State = self:GetST_State() return end
		STIMER_.Name = self:GetST_Name()  STIMER_.Time = self:GetST_Time()
		STIMER_.Color = self:GetST_Color()  STIMER_.SecondColor = self:GetST_SecondColor()
		STIMER_.Timer = self:GetST_Timer() STIMER_.CustomFont = self:GetST_CustomFont()
		STIMER_.HideTimer = self:GetST_HideTimer()  STIMER_.StartSound = self:GetST_StartSound() STIMER_.SecondStartSound = self:GetST_SecondStartSound()
		STIMER_.StopSound = self:GetST_StopSound()  STIMER_.EndSound = self:GetST_EndSound()
		STIMER_.FadeInTime = self:GetST_FadeInTime() STIMER_.FadeOutTime = self:GetST_FadeOutTime()
		STIMER_.JustifyText = self:GetST_JustifyText()  STIMER_.EntityHidden = self:GetST_EntityHidden()
		STIMER_.GradientTextEffect = self:GetST_GradientTextEffect() STIMER_.GlitchTextEffect = self:GetST_GlitchTextEffect()
		STIMER_.GlitchFrequency = self:GetST_GlitchFrequency()  STIMER_.GradientSpeed = self:GetST_GradientSpeed()
		STIMER_.GradientFrequency = self:GetST_GradientFrequency()  STIMER_.TBCornerRadius = self:GetST_TBCornerRadius()
		STIMER_.TBPosX = self:GetST_TBPosX() STIMER_.TBPosY = self:GetST_TBPosY() STIMER_.TBWidth = self:GetST_TBWidth() STIMER_.TBHeight = self:GetST_TBHeight()
		STIMER_.TBColor = self:GetST_TBColor()  STIMER_.TBColorAlpha = self:GetST_TBColorAlpha()
		STIMER_.PosX = self:GetST_PosX() STIMER_.PosY = self:GetST_PosY()

		if STIMER_.StartSound == 1 then STIMER_.StartSound = "ambient/alarms/warningbell1.wav"
			elseif STIMER_.StartSound == 2 then STIMER_.StartSound = "ambient/levels/canals/windchime2.wav"
			elseif STIMER_.StartSound == 3 then STIMER_.StartSound = "physics/metal/metal_grate_impact_hard1.wav"
			elseif STIMER_.StartSound == 4 then STIMER_.StartSound = "fnaf3_night_start.wav"
			elseif STIMER_.StartSound == 5 then STIMER_.StartSound = "mysterious_perc_02.wav"
			elseif STIMER_.StartSound == 6 then STIMER_.StartSound = "spacebase_bang_01.mp3"
			elseif STIMER_.StartSound == 7 then STIMER_.StartSound = "spacebase_bang_02.mp3"
			elseif STIMER_.StartSound == 8 then STIMER_.StartSound = "spacebase_bang_03.mp3"
			elseif STIMER_.StartSound == 9 then STIMER_.StartSound = "spacebase_bang_04.mp3"
			elseif STIMER_.StartSound == 0 then STIMER_.StartSound = "No Sound"
		end
		if STIMER_.SecondStartSound == 1 then STIMER_.SecondStartSound = "tattletail-start-round.mp3"
			elseif STIMER_.SecondStartSound == 0 then STIMER_.SecondStartSound = "No Sound"
		end
		if STIMER_.StopSound == 1 then STIMER_.StopSound = "ambient/alarms/warningbell1.wav"
			elseif STIMER_.StopSound == 2 then STIMER_.StopSound = "ambient/levels/canals/windchime2.wav"
			elseif STIMER_.StopSound == 3 then STIMER_.StopSound = "physics/metal/metal_grate_impact_hard1.wav"
			elseif STIMER_.StopSound == 4 then STIMER_.StopSound = "fnaf3_night_start.wav"
			elseif STIMER_.StopSound == 5 then STIMER_.StopSound = "mysterious_perc_02.wav"
			elseif STIMER_.StopSound == 6 then STIMER_.StopSound = "spacebase_bang_01.mp3"
			elseif STIMER_.StopSound == 7 then STIMER_.StopSound = "spacebase_bang_02.mp3"
			elseif STIMER_.StopSound == 8 then STIMER_.StopSound = "spacebase_bang_03.mp3"
			elseif STIMER_.StopSound == 9 then STIMER_.StopSound = "spacebase_bang_04.mp3"
			elseif STIMER_.StopSound == 0 then STIMER_.StopSound = "No Sound"
		end
		if STIMER_.EndSound == 1 then STIMER_.EndSound = "ambient/alarms/warningbell1.wav"
			elseif STIMER_.EndSound == 2 then STIMER_.EndSound = "ambient/levels/canals/windchime2.wav"
			elseif STIMER_.EndSound == 3 then STIMER_.EndSound = "physics/metal/metal_grate_impact_hard1.wav"
			elseif STIMER_.EndSound == 4 then STIMER_.EndSound = "fnaf3_night_start.wav"
			elseif STIMER_.EndSound == 5 then STIMER_.EndSound = "mysterious_perc_02.wav"
			elseif STIMER_.EndSound == 6 then STIMER_.EndSound = "spacebase_bang_01.mp3"
			elseif STIMER_.EndSound == 7 then STIMER_.EndSound = "spacebase_bang_02.mp3"
			elseif STIMER_.EndSound == 8 then STIMER_.EndSound = "spacebase_bang_03.mp3"
			elseif STIMER_.EndSound == 9 then STIMER_.EndSound = "spacebase_bang_04.mp3"
			elseif STIMER_.EndSound == 0 then STIMER_.EndSound = "No Sound"
		end

		if STIMER_.State != self:GetST_State() then local sta, snd, tex = self:GetST_State(), self:GetST_HSnd(), self:GetST_HNot()
			local col = Color( STIMER_.Color.r * 255, STIMER_.Color.g * 255, STIMER_.Color.b * 255, 255 )
			if sta == 1 then
				if !snd and STIMER_.StartSound ~= "" then surface.PlaySound( STIMER_.StartSound ) end
				if !snd and STIMER_.SecondStartSound ~= "" then surface.PlaySound( STIMER_.SecondStartSound ) end
				if !tex then chat.AddText( col, STIMER_.Name, Color( 255, 255, 255 ), " started. Timeout: " .. math.Round( self:GetST_Timer() - CurTime() ) .. "s." ) end
			elseif sta == 2 then
				if !snd and STIMER_.EndSound ~= "" then surface.PlaySound( STIMER_.EndSound ) end
				if !tex then chat.AddText( col, STIMER_.Name, Color( 255, 255, 255 ), " expired." ) end
			elseif sta == 3 then
				if !snd and STIMER_.StopSound ~= "" then surface.PlaySound( STIMER_.StopSound ) end
				local ti = math.max( 0, math.Round( self:GetST_Time() - self:GetST_Timer() + CurTime(), 2 ) )
				if !tex then chat.AddText( col, STIMER_.Name, Color( 255, 255, 255 ), " stopped. Time: " .. ti .. "s." ) end
			end
			STIMER_.State = self:GetST_State()
		end
		if STIMER_.State == 1 and !self:GetST_HHud() then STIMER_.LerpAlp = Lerp( STIMER_.FadeInTime, STIMER_.LerpAlp, 1 ) end
		if STIMER_.State != 1 then STIMER_.LerpAlp = Lerp( STIMER_.FadeOutTime, STIMER_.LerpAlp, 0 ) end
		local text = self:GetOverlayText()
		if self:BeingLookedAtByLocalPlayer() then
			local sta, col = self:GetST_State(), Color( 255, 255, 255 )
			if sta == 1 then col = Color( 255, 255, 0 ) elseif sta == 2 then col = Color( 255, 0, 0 )
			elseif sta == 3 then col = Color( 0, 255, 0 ) end
			halo.Add( { self }, col, 2, 2, 1, true, true )
			if text != "" then AddWorldTip( self:EntIndex(), text, 0.5, self:GetPos(), self ) end
		end
	end
end
function ENT:UpdateTransmitState() return TRANSMIT_ALWAYS end
function ENT:Use( act )
	if !IsValid( act ) or !act:IsPlayer() or !act:IsAdmin() or self:GetST_NextUse() > CurTime() then return end
	local sta = self:GetST_State()  self:SetST_NextUse( CurTime() +0.5 )
	if !self:GetST_HSnd() then self:EmitSound( "Weapon_AR2.Empty" ) end self.Editable = ( self:GetST_State() == 0 )
	
	if sta == 0 then
		if IsValid(STIMER_ACTIVE) then
			STIMER_ACTIVE:SetST_State(3)
		end
		self:SetST_State(1)
		STIMER_ACTIVE = self
	elseif sta == 1 then
		self:SetST_State(3)
		STIMER_ACTIVE = nil
	else
		self:SetST_State(0)
	end
end
if SERVER then return end local Mat = Material( "xdeedited/checkpointclock" )
function ENT:Draw()
	if STIMER_.EntityHidden == true then
		return
	end
	local sta, col, siz = self:GetST_State(), Color( 255, 255, 255 ), 24
	if sta == 1 then col = Color( 255, 255, 0 )  siz = 18 +math.abs( math.sin( CurTime()*5 ) )*6 elseif sta == 2 then col = Color( 255, 0, 0 )
	elseif sta == 3 then col = Color( 0, 255, 0 ) end
	render.SetMaterial( Mat ) render.DrawSprite( self:GetPos(), siz, siz, col )
end