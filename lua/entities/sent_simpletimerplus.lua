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

if CLIENT then
	STIMER_ = {
		Name = "",
		Time = 0,
		Timer = 0,
		State = 0,
		Color = Vector( 0, 0, 0 ),
		Start = false,
		LerpAlp = 0,
		Static = "",
		CustomFont = "Tahoma",
		HideTimer = false,
		StartSound = "",
		StopSound = "",
		EndSound = "",
		FadeInTime = 0.05,
		FadeOutTime = 0.025,
		EntityHidden = false,
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
	hook.Add( "HUDPaint", "SimpleTimerHUD", function() local tim, ply = STIMER_ENT, LocalPlayer()
		if STIMER_.LerpAlp > 0 and STIMER_.Timer > 0 then local sta = STIMER_.State
			local ww, hh = ScrW() / 2, ScrH() / 2
			local col = Color(STIMER_.Color.r * 255, STIMER_.Color.g * 255, STIMER_.Color.b * 255, STIMER_.LerpAlp * 255)
			draw.RoundedBox(8, ww - 200, 20, 400, 100, Color(0, 0, 0, 150 * STIMER_.LerpAlp))
			if STIMER_.CustomFont == "Chiller" then
				draw.TextShadow({ text = STIMER_.Name, pos = { ww, 22 },
				font = STIMER_.CustomFont ~= "" and STIMER_.CustomFont .. "_Font1" or "CourierNew_Font1", xalign = TEXT_ALIGN_CENTER,
				yalign = TEXT_ALIGN_DOWN, color = col}, 1, STIMER_.LerpAlp * 255)
			elseif STIMER_.CustomFont == "Papyrus" then
				draw.TextShadow({ text = STIMER_.Name, pos = { ww, 20 },
				font = STIMER_.CustomFont ~= "" and STIMER_.CustomFont .. "_Font1" or "CourierNew_Font1", xalign = TEXT_ALIGN_CENTER,
				yalign = TEXT_ALIGN_DOWN, color = col}, 1, STIMER_.LerpAlp * 255)
			elseif STIMER_.CustomFont == "HelpMe" then
				draw.TextShadow( { text = STIMER_.Name, pos = { ww, 26 },
				font = STIMER_.CustomFont ~= "" and STIMER_.CustomFont .. "_Font1" or "CourierNew_Font1", xalign = TEXT_ALIGN_CENTER,
				yalign = TEXT_ALIGN_DOWN, color = col }, 1, STIMER_.LerpAlp * 255)
			else
				draw.TextShadow( { text = STIMER_.Name, pos = { ww, 24 },
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
				if STIMER_.CustomFont == "Misery" and STIMER_.JustifyText then
					draw.TextShadow({ text = tx, pos = { ww - 130, 55 },
					font = STIMER_.CustomFont ~= "" and STIMER_.CustomFont .. "_Font2" or "CourierNew_Font2", xalign = TEXT_ALIGN_LEFT,
					yalign = TEXT_ALIGN_DOWN, color = col}, 1, STIMER_.LerpAlp * 255)
				elseif STIMER_.CustomFont == "Chiller" then
					if STIMER_.JustifyText then
						draw.TextShadow({ text = tx, pos = { ww - 84, 60 },
						font = STIMER_.CustomFont ~= "" and STIMER_.CustomFont .. "_Font2" or "CourierNew_Font2", xalign = TEXT_ALIGN_LEFT,
						yalign = TEXT_ALIGN_DOWN, color = col}, 1, STIMER_.LerpAlp * 255)
					else
						draw.TextShadow({ text = tx, pos = { ww, 60 },
						font = STIMER_.CustomFont ~= "" and STIMER_.CustomFont .. "_Font2" or "CourierNew_Font2", xalign = TEXT_ALIGN_CENTER,
						yalign = TEXT_ALIGN_DOWN, color = col}, 1, STIMER_.LerpAlp * 255)
					end
				elseif STIMER_.CustomFont == "Impact" and STIMER_.JustifyText then
					draw.TextShadow({ text = tx, pos = { ww - 88, 55 },
					font = STIMER_.CustomFont ~= "" and STIMER_.CustomFont .. "_Font2" or "CourierNew_Font2", xalign = TEXT_ALIGN_LEFT,
					yalign = TEXT_ALIGN_DOWN, color = col}, 1, STIMER_.LerpAlp * 255)
				elseif STIMER_.CustomFont == "Papyrus" then
					if STIMER_.JustifyText then
					draw.TextShadow({ text = tx, pos = { ww - 102, 45 },
					font = STIMER_.CustomFont ~= "" and STIMER_.CustomFont .. "_Font2" or "CourierNew_Font2", xalign = TEXT_ALIGN_LEFT,
					yalign = TEXT_ALIGN_DOWN, color = col}, 1, STIMER_.LerpAlp * 255)
					else
						draw.TextShadow({ text = tx, pos = { ww, 45 },
						font = STIMER_.CustomFont ~= "" and STIMER_.CustomFont .. "_Font2" or "CourierNew_Font2", xalign = TEXT_ALIGN_CENTER,
						yalign = TEXT_ALIGN_DOWN, color = col}, 1, STIMER_.LerpAlp * 255)
					end
				elseif STIMER_.CustomFont == "Darkmode" then
					if STIMER_.JustifyText then
					draw.TextShadow({ text = tx, pos = { ww - 104, 60 },
					font = STIMER_.CustomFont ~= "" and STIMER_.CustomFont .. "_Font2" or "CourierNew_Font2", xalign = TEXT_ALIGN_LEFT,
					yalign = TEXT_ALIGN_DOWN, color = col}, 1, STIMER_.LerpAlp * 255)
					else
						draw.TextShadow({ text = tx, pos = { ww, 60 },
						font = STIMER_.CustomFont ~= "" and STIMER_.CustomFont .. "_Font2" or "CourierNew_Font2", xalign = TEXT_ALIGN_CENTER,
						yalign = TEXT_ALIGN_DOWN, color = col}, 1, STIMER_.LerpAlp * 255)
					end
				elseif STIMER_.CustomFont == "HelpMe" then
					if STIMER_.JustifyText then
					draw.TextShadow({ text = tx, pos = { ww - 88, 60 },
					font = STIMER_.CustomFont ~= "" and STIMER_.CustomFont .. "_Font2" or "CourierNew_Font2", xalign = TEXT_ALIGN_LEFT,
					yalign = TEXT_ALIGN_DOWN, color = col}, 1, STIMER_.LerpAlp * 255)
					else
						draw.TextShadow({ text = tx, pos = { ww, 60 },
						font = STIMER_.CustomFont ~= "" and STIMER_.CustomFont .. "_Font2" or "CourierNew_Font2", xalign = TEXT_ALIGN_CENTER,
						yalign = TEXT_ALIGN_DOWN, color = col}, 1, STIMER_.LerpAlp * 255)
					end
				else
					draw.TextShadow({ text = tx, pos = { ww, 55 },
					font = STIMER_.CustomFont ~= "" and STIMER_.CustomFont .. "_Font2" or "CourierNew_Font2", xalign = TEXT_ALIGN_CENTER,
					yalign = TEXT_ALIGN_DOWN, color = col}, 1, STIMER_.LerpAlp * 255)
				end
			end
		end
	end )
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
	ent:SetST_Name( "Simple Timer Plus" ) ent:SetST_Color( Vector( 0, 1, 1 ) ) ent:SetST_Time( 60 )
	ent:SetST_HHud( false ) ent:SetST_HSnd( false ) ent:SetST_HNot( true )
	ent:SetST_CustomFont( "Tahoma" ) ent:SetST_FadeInTime ( 0.025 ) ent:SetST_FadeOutTime ( 0.05 )
	ent:SetST_StartSound( 1 ) ent:SetST_StopSound( 2 ) ent:SetST_EndSound ( 3 )
	ent:SetST_EStart( 0 ) ent:SetST_EStop( 0 ) ent:SetST_EEnd( 0 ) ent:SetST_Mission( 0 )
	ent:SetST_AMission( 0 ) ent:SetST_ATimer( 2 ) table.insert(STIMER_ENTS, ent) return ent
end
function ENT:SetupDataTables()
	self:NetworkVar( "String", 0, "ST_Name", { KeyName = "stname", Edit = { title = "Timer Name", category = "Main", type = "String", order = 0 } } )
	self:NetworkVar( "Vector",	0, "ST_Color", { KeyName = "stcolor", Edit = { title = "Timer Color", category = "Main", type = "VectorColor", order = 1 } } )
	self:NetworkVar( "Int", 0, "ST_Time", { KeyName = "sttime", Edit = { title = "Time", category = "Main", type = "Int", min = 1, max = 3600, order = 2 } } )
	self:NetworkVar( "Bool", 0, "ST_HHud", { KeyName = "sthhud", Edit = { title = "No HUD", category = "Hide", type = "Bool", order = 3 } } )
	self:NetworkVar( "Bool", 1, "ST_HSnd", { KeyName = "sthsnd", Edit = { title = "No Sound", category = "Hide", type = "Bool", order = 4 } } )
	self:NetworkVar( "Bool", 2, "ST_HNot", { KeyName = "sthnot", Edit = { title = "No Text", category = "Hide", type = "Bool", order = 5 } } )
	self:NetworkVar( "Int", 1, "ST_EStart", { KeyName = "stestart", Edit = { title = "Start Event", category = "Events", type = "Combo", values = STIMER_EVENTS, order = 6 } } )
	self:NetworkVar( "Int", 2, "ST_EStop", { KeyName = "stestop", Edit = { title = "Stop Event", category = "Events", type = "Combo", values = STIMER_EVENTS, order = 7 } } )
	self:NetworkVar( "Int", 3, "ST_EEnd", { KeyName = "steend", Edit = { title = "End Event", category = "Events", type = "Combo", values = STIMER_EVENTS, order = 8 } } )
	self:NetworkVar( "Int", 4, "ST_Mission", { KeyName = "stmission", Edit = { title = "Mission", category = "Mission", type = "Combo", values = STIMER_EVENT2, order = 9 } } )
	self:NetworkVar( "Int", 5, "ST_MEvent", { KeyName = "stmevent", Edit = { title = "Mission Event", category = "Mission", type = "Combo", values = STIMER_EVENTS, order = 10 } } )
	self:NetworkVar( "Int", 6, "ST_AMission", { KeyName = "stamission", Edit = { title = "After Mission", category = "Aftermath", type = "Combo", values = STIMER_EVENT3, order = 11 } } )
	self:NetworkVar( "Int", 7, "ST_ATimer", { KeyName = "statimer", Edit = { title = "After Timer", category = "Aftermath", type = "Combo", values = STIMER_EVENT4, order = 12 } } )
	self:NetworkVar( "Int", 8, "ST_State" ) self:NetworkVar( "Float", 0, "ST_Timer" ) self:NetworkVar( "Float", 1, "ST_NextUse" )
	self:NetworkVar("String", 1, "ST_CustomFont", { KeyName = "stcustomfont", Edit = { title = "Custom Font", category = "Main", type = "Combo", values = STIMER_FONTS, order = 13 } })
	self:NetworkVar( "Bool", 3, "ST_HideTimer", { KeyName = "sthidetimer", Edit = { title = "Hide Timer", category = "Main", type = "Bool", order = 15 } } )
	self:NetworkVar( "Int", 9, "ST_StartSound", { KeyName = "ststartsound", Edit = { title = "Start Sound", category = "Sound", type = "Combo", values = STIMER_SOUNDS, order = 16 } } )
	self:NetworkVar( "Int", 10, "ST_StopSound", { KeyName = "ststopsound", Edit = { title = "Stop Sound", category = "Sound", type = "Combo", values = STIMER_SOUNDS, order = 17 } } )
	self:NetworkVar( "Int", 11, "ST_EndSound", { KeyName = "stendsound", Edit = { title = "End Sound", category = "Sound", type = "Combo", values = STIMER_SOUNDS, order = 18 } } )
	self:NetworkVar( "Float", 2, "ST_FadeInTime", { KeyName = "stfadeintime", Edit = { title = "Fade In Time", category = "Main", type = "Float", min = 0, max = 1, order = 19 } } )
	self:NetworkVar( "Float", 3, "ST_FadeOutTime", { KeyName = "stfadeouttime", Edit = { title = "Fade Out Time", category = "Main", type = "Float", min = 0, max = 1, order = 20 } } )
	self:NetworkVar("Bool", 4, "ST_JustifyText", { KeyName = "stjustifytext", Edit = { title = "Realign Timer (Some Fonts Only)", category = "Main", type = "Bool", order = 21 } })
	self:NetworkVar("Bool", 5, "ST_EntityHidden", { KeyName = "stentityhidden", Edit = { title = "Hide Entity", category = "Main", type = "Bool", order = 22 } })
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
		STIMER_.Color = self:GetST_Color()  STIMER_.Timer = self:GetST_Timer()
		STIMER_.CustomFont = self:GetST_CustomFont()
		STIMER_.HideTimer = self:GetST_HideTimer()  STIMER_.StartSound = self:GetST_StartSound()
		STIMER_.StopSound = self:GetST_StopSound()  STIMER_.EndSound = self:GetST_EndSound()
		STIMER_.FadeInTime = self:GetST_FadeInTime() STIMER_.FadeOutTime = self:GetST_FadeOutTime()
		STIMER_.JustifyText = self:GetST_JustifyText()  STIMER_.EntityHidden = self:GetST_EntityHidden()

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