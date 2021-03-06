LibTransition = LibStub("LibTransition-1.0");
Combustion_UpdateInterval = 0.1; -- How often the OnUpdate code will run (in seconds)
local lvb,ffb,ignite,pyro1,pyro2,comb,impact,CritMass,ShadowMast,combulbtimer,combuffbtimer,combupyrotimer,combuignitetimer,combucrittimer
local LBTime,FFBTime,IgnTime,PyroTime,CombustionUp,ffbglyph,combufadeout,impactup,ffbheight,critheight,combucritwidth
 
function Combustion_OnLoad(CombustionFrame)

    if select(2, UnitClass("player")) ~= "MAGE" then CombustionFrame:Hide() return end
    
	CombustionFrame:RegisterForDrag("LeftButton")
	CombustionFrame:RegisterEvent("PLAYER_LOGIN")
	CombustionFrame:RegisterEvent("PLAYER_TALENT_UPDATE")
	CombustionFrame:RegisterEvent("GLYPH_ADDED")
	CombustionFrame:RegisterEvent("GLYPH_REMOVED")
	CombustionFrame:RegisterEvent("PLAYER_REGEN_DISABLED")
	CombustionFrame:RegisterEvent("PLAYER_REGEN_ENABLED")
 	CombustionFrame:RegisterEvent("COMBAT_LOG_EVENT_UNFILTERED")
 
    lvb = GetSpellInfo(44457) 
    ffb = GetSpellInfo(44614) 
    ignite = GetSpellInfo(12654) 
    pyro1 = GetSpellInfo(11366) 
    pyro2 = GetSpellInfo(92315) 
    comb = GetSpellInfo(11129)   
    impact = GetSpellInfo(64343)
    CritMass = GetSpellInfo(22959)
    ShadowMast = GetSpellInfo(17800)
    
    
    LibTransition:Attach(CombustionFrame)

            	   	
-------------------------------
--Default values    
    if (combuffb == nil) then combuffb = true end
    if (combuautohide == nil) or (combuautohide == false) or (combuautohide == true) then combuautohide = 1 end -- set autohide off as default upon very first launch
    if (combuimpact == nil) then combuimpact = true end-- set impact mode on as default upon very first launch
    if (combuscale == nil) then combuscale = 1 end-- set scale default upon very first launch
    if (combubeforefade == nil) then combubeforefade = 15 end-- set before fade out autohide upon very first launch
    if (combuafterfade == nil) then combuafterfade = 15 end-- set before fade in autohide upon very first launch
    if (combufadeoutspeed == nil) then combufadeoutspeed = 2 end-- set fade out speed default upon very first launch
    if (combufadeinspeed == nil) then combufadeinspeed = 2 end-- set fade in speed default upon very first launch
    if (combuwaitfade == nil) then combuwaitfade = 86 end-- set faded time autohide default upon very first launch
    if (combufadealpha == nil) then combufadealpha = 0 end-- set alpha value for fade upon very first launch
    if (combubartimers == nil) then combubartimers = false end-- set bar timers upon very first launch
	if (combubarwidth == nil) then combubarwidth = 24 end-- set bar timers width upon very first launch
    if (combured == nil) then combured = 0 end-- set alpha value for fade upon very first launch
    if (combugreen == nil) then combugreen = 0.5 end-- set bar timers upon very first launch
	if (combublue == nil) then combublue = 0.8 end-- set bar timers width upon very first launch
	if (combuopacity == nil) then combuopacity = 1 end-- set bar timers width upon very first launch
	if (combucrit == nil) then combucrit = true end-- set bar timers width upon very first launch
	if (comburefreshmode == nil) then comburefreshmode = true end-- set LB refresh warning mode upon very first launch
    if (combureport == nil) then combureport = true end -- set DPS report on upon very first launch
    if (combureportvalue == nil) then combureportvalue = 0 end -- set DPS report value on upon very first launch
    if (combureportthreshold == nil) then combureportthreshold = false end -- set DPS report threshold on upon very first launch

end

-------------------------------
-- helper function for option panel setup
function CombustionHelperOptions_OnLoad(panel)
	panel.name = "CombustionHelper"
	InterfaceOptions_AddCategory(panel);
end

-------------------------------
-- lock function for option panel
function Combustionlock()

	if CombulockButton:GetChecked(true) then combulock = true 
                                 CombustionFrame:EnableMouse(false)
                                 CombulockButton:SetChecked(true)
                                 ChatFrame1:AddMessage("|cff00ffffCombustionHelper locked|r")
	else combulock = false 
         CombustionFrame:EnableMouse(true)
         CombulockButton:SetChecked(false)
         ChatFrame1:AddMessage("|cff00ffffCombustionHelper unlocked|r")
	end
end

-------------------------------
-- lock function for option panel
function Combustionthreshold()

	if Combureportthreshold:GetChecked(true) then combureportthreshold = true 
                                 Combureportthreshold:SetChecked(true)
	else combureportthreshold = false 
         Combureportthreshold:SetChecked(false)
	end
end

-------------------------------
-- ffb function for option panel
function Combustionffb()

	if CombuffbButton:GetChecked(true) then combuffb = true 
                                 CombustionFrameresize()
                                 CombuffbButton:SetChecked(true)
                                 ChatFrame1:AddMessage("|cff00ffffFrostFire Bolt mode enabled|r")
	else combuffb = false 
         CombustionFrameresize()
         CombuffbButton:SetChecked(false)
         ChatFrame1:AddMessage("|cff00ffffFrostFire Bolt mode disabled|r")
	end
end

-------------------------------
-- DPS Report function for option panel
function Combustionreport()

	if CombureportButton:GetChecked(true) then combureport = true 
                                             CombureportButton:SetChecked(true)
                                             ChatFrame1:AddMessage("|cff00ffffDamage report mode enabled|r")
	else combureport = false 
         CombureportButton:SetChecked(false)
         ChatFrame1:AddMessage("|cff00ffffDamage report mode disabled|r")
	end
end

-------------------------------
-- lb refresh function for option panel
function Combustionrefresh()

	if ComburefreshButton:GetChecked(true) then comburefreshmode = true 
                                                ComburefreshButton:SetChecked(true)
                                                ChatFrame1:AddMessage("|cff00ffffEarly LB refresh mode enabled|r")
	else comburefreshmode = false 
         ComburefreshButton:SetChecked(false)
         ChatFrame1:AddMessage("|cff00ffffEarly LB refresh mode disabled|r")
	end
end

-------------------------------
-- impact function for option panel
function Combustionimpact()

	if CombuimpactButton:GetChecked(true) then combuimpact = true 
                                               CombuimpactButton:SetChecked(true)
                                               ChatFrame1:AddMessage("|cff00ffffImpact mode enabled|r")
	else combuimpact = false 
         CombuimpactButton:SetChecked(false)
         ChatFrame1:AddMessage("|cff00ffffImpact mode disabled|r")
	end
end

-------------------------------
-- Scale function for option panel
function CombustionScale (scale)

	CombustionFrame:SetScale(scale)
	combuscale = scale
end

-------------------------------
-- Bar timer function for option panel
function Combustionbar()

	if CombuBarButton:GetChecked(true) then combubartimers = true 
											CombustionFrameresize()
                                            CombuBarButton:SetChecked(true)
                                            ChatFrame1:AddMessage("|cff00ffffBar timer mode enabled|r")
	else combubartimers = false 
		 CombustionFrameresize()
         CombuBarButton:SetChecked(false)
         ChatFrame1:AddMessage("|cff00ffffBar timer mode disabled|r")
	end
end

-------------------------------
-- Critical Mass function for option panel
function Combustioncrit()

	if CombucritButton:GetChecked(true) then combucrit = true 
                                             CombustionFrameresize()
                                             CombucritButton:SetChecked(true)
                                             ChatFrame1:AddMessage("|cff00ffffCritical Mass tracker enabled|r")
	else combucrit = false 
		 CombustionFrameresize()
         CombucritButton:SetChecked(false)
         ChatFrame1:AddMessage("|cff00ffffCritical Mass tracker disabled|r")
	end
end

-------------------------------
-- Helper function for bar timer resizing
function CombustionFrameresize()
	
    if (combuffb == true) and (ffbglyph == true)
    then FFBButtonFrame:Show()
         FFBTextFrame:Show()
         FFB:Show()
         StatusTextFrame:SetPoint("TOPLEFT",CombustionFrame,"TOPLEFT",6,-41)
         ffbheight = 9
    else FFBButtonFrame:Hide()
         FFBTextFrame:Hide()
         FFB:Hide()
         StatusTextFrame:SetPoint("TOPLEFT",CombustionFrame,"TOPLEFT",6,-32)
         ffbheight = 0	
    end

    if (combucrit == true) 
    then CritTypeFrame:Show()
         CritTypeFrame:SetPoint("TOPLEFT",CombustionFrame,"TOPLEFT",6,(-41-ffbheight))
         CritTextFrame:Show()
         CritTextFrame:SetPoint("TOPLEFT",CombustionFrame,"TOPLEFT",6,(-41-ffbheight))
         critheight = 9
    else CritTypeFrame:Hide()
         CritTypeFrame:SetPoint("TOPLEFT",CombustionFrame,"TOPLEFT",6,(-41-ffbheight))
         CritTextFrame:Hide()
         CritTextFrame:SetPoint("TOPLEFT",CombustionFrame,"TOPLEFT",6,(-41-ffbheight))
         critheight = 0
    end    
    
    CombustionFrame:SetHeight(48+ffbheight+critheight)

	if (combubartimers == true) 
	then CombustionFrame:SetWidth(98+combubarwidth+6)
		 FFBTextFrame:SetWidth(28+combubarwidth+2)
		 FFBTextFrameLabel:SetJustifyH("RIGHT")
		 LBTextFrame:SetWidth(28+combubarwidth+2)
		 LBTextFrameLabel:SetJustifyH("RIGHT")
		 PyroTextFrame:SetWidth(28+combubarwidth+2)
		 PyroTextFrameLabel:SetJustifyH("RIGHT")
		 IgnTextFrame:SetWidth(28+combubarwidth+2)
		 IgnTextFrameLabel:SetJustifyH("RIGHT")
		 CritTextFrame:SetWidth(91+combubarwidth+2)
         combucritwidth = combubarwidth
	elseif (combubartimers == false) 
	then combucritwidth = (-7)
         CombustionFrame:SetWidth(98)
		 FFBTextFrame:SetWidth(28)
		 FFBbar:Hide()
		 FFBTextFrameLabel:SetJustifyH("LEFT")
		 LBTextFrame:SetWidth(28)
		 LBbar:Hide()
		 LBTextFrameLabel:SetJustifyH("LEFT")
		 PyroTextFrame:SetWidth(28)
		 Pyrobar:Hide()
		 PyroTextFrameLabel:SetJustifyH("LEFT")
		 Ignbar:Hide()
		 IgnTextFrame:SetWidth(28)
		 IgnTextFrameLabel:SetJustifyH("LEFT")
		 CritTextFrame:SetWidth(86)
	end

end

-------------------------------
-- helper function reset Savedvariables
function Combustionreset ()
 		combulock = false
        combuffb = true
        combuautohide = 1
        combuimpact = true
        combuscale = 1
        combubeforefade = 15
		combuafterfade = 15
		combufadeoutspeed = 2
		combufadeinspeed = 2
		combuwaitfade = 86
		combufadealpha = 0
		combubartimers = false
		combured = 0
		combugreen = 0.5
		combublue = 0.8
		combuopacity = 1
        combucrit = true
        CombustionFrame:ClearAllPoints()
        CombustionFrame:SetPoint("CENTER", UIParent, "CENTER" ,0,0)
        CombustionFrame:SetScale(1)
        comburefreshmode = true
        combureport = true
        combureportvalue = 0
        combureportthreshold = false
        ChatFrame1:AddMessage("|cff00ffffCombustionHelper Savedvariables have been resetted, you can logout now.|r")

end
	

-------------------------------
-- Color picker function
function CombuColorPicker()

 	ColorPickerFrame:SetColorRGB(combured,combugreen,combublue,combuopacity);
 	ColorPickerFrame.hasOpacity, ColorPickerFrame.opacity = (combuopacity ~= nil), combuopacity;
 	ColorPickerFrame.previousValues = {combured,combugreen,combublue,combuopacity};
 	ColorPickerFrame.func, ColorPickerFrame.opacityFunc, ColorPickerFrame.cancelFunc = CombuCallback, CombuCallback, CombuCallback;
 	ColorPickerFrame:Hide(); -- Need to run the OnShow handler.
 	ColorPickerFrame:Show();

end

function CombuCallback ()

    combuopacity, combured, combugreen, combublue = OpacitySliderFrame:GetValue(), ColorPickerFrame:GetColorRGB();
    LBbar:SetVertexColor(combured, combugreen, combublue, combuopacity)
 	Ignbar:SetVertexColor(combured, combugreen, combublue, combuopacity)
 	Pyrobar:SetVertexColor(combured, combugreen, combublue, combuopacity)
 	FFBbar:SetVertexColor(combured, combugreen, combublue, combuopacity)
    CombuColorSwatchNormalTexture:SetVertexColor(combured,combugreen,combublue,combuopacity)
	
end


-------------------------------
-- Helper function for ffb glyph check
function Combuffbglyphcheck ()

        local enabled1,_,_,id1 = GetGlyphSocketInfo(7)
        local enabled4,_,_,id4 = GetGlyphSocketInfo(8)
        local enabled6,_,_,id6 = GetGlyphSocketInfo(9)
         
	            if (id1 == 61205) and (ffbglyph == false) and (combutalent == true) 
	            then ffbglyph = true
                     combuffb = true
    	       		 CombustionFrameresize()
	                 ChatFrame1:AddMessage("|cff00ffffFrostfire Bolt glyph detected, FFB mode enabled|r")
	            
	            elseif (id4 == 61205) and (ffbglyph == false) and (combutalent == true) 
	            then ffbglyph = true
                     combuffb = true
    	       		 CombustionFrameresize()
	                 ChatFrame1:AddMessage("|cff00ffffFrostfire Bolt glyph detected, FFB mode enabled|r")
	            
	            elseif (id6 == 61205) and (ffbglyph == false) and (combutalent == true) 
	            then ffbglyph = true
                     combuffb = true
    	       		 CombustionFrameresize()
	                 ChatFrame1:AddMessage("|cff00ffffFrostfire Bolt glyph detected, FFB mode enabled|r")
				
				elseif (id1 ~= 61205) and (id4 ~= 61205) and (id6 ~= 61205) and (ffbglyph == true) and (combutalent == true)
				then ffbglyph = false
					 CombustionFrameresize()
	                 ChatFrame1:AddMessage("|cff00ffff No Frostfire Bolt glyph detected, FFB mode disabled|r")
	            
                elseif (id1 ~= 61205) and (id4 ~= 61205) and (id6 ~= 61205) and (combuffb == true) 
				then ffbglyph = false
					 CombustionFrameresize()
	                 ChatFrame1:AddMessage("|cff00ffff No Frostfire Bolt glyph detected, FFB mode disabled|r")

                elseif (ffbglyph == false)
	            then CombustionFrameresize()

            	end 
end

-------------------------------
--table for increased critical damage meta
CombuCritMeta = {
	34220, -- burning crusade
	41285, -- wrath of the lich king
	52291, -- cataclysm
};

-------------------------------------------------------------------------------------------------------	
-------------------------------------------------------------------------------------------------------	


function Combustion_OnEvent(self, event, ...)

    if (event == "PLAYER_LOGIN") then
    
    ChatFrame1:AddMessage("|cff00ffffCombustion Helper is loaded. Interface Panel -> Addons for Config.|r")
    
-------------------------------
--Combustion spell check on startup    
        local a6 = IsSpellKnown(11129) -- check if combustion is in the spellbook
                
        if (a6 == false) 
        then CombustionFrame:FadeOut(combufadeoutspeed,combufadealpha)
             combutalent = false

        elseif (a6 == true) 
        then CombustionFrame:FadeIn(combufadeinspeed)
             combutalent = true

        end
        
-------------------------------
--frostfirebolt glyph check on startup
        local enabled1,_,_,id1 = GetGlyphSocketInfo(7)
        local enabled4,_,_,id4 = GetGlyphSocketInfo(8)
        local enabled6,_,_,id6 = GetGlyphSocketInfo(9)
         
	            if (id1 == 61205) or (id4 == 61205) or (id6 == 61205)
	            then ffbglyph = true

	            else ffbglyph = false
                     combuffb = false

            	end 
                
-------------------------------
--Frame lock check on startup
        if (combulock == false) 
        then CombustionFrame:EnableMouse(true)
        
        elseif (combulock == true) 
        then CombustionFrame:EnableMouse(false)
        
        end	
            
-------------------------------
--autohide check on startup
        if (combuautohide == 2) or (combuautohide == 3)
        then CombustionFrame:FadeOut(combufadeoutspeed,combufadealpha)
 
        end	
        
    CombustionScale (combuscale) -- Scale check on startup
    CombustionFrameresize() -- Combustion Frame size check on startup    

    end
	
-------------------------------------------------------------------------------------------------------	
-------------------------------------------------------------------------------------------------------	
	

    if (event == "PLAYER_TALENT_UPDATE") then
-------------------------------
--Combustion spell check            
            local a6 = IsSpellKnown(11129) -- check if combustion is in the spellbook
                
            if (a6 == false) and (combutalent == true) then
                    CombustionFrame:FadeOut(combufadeoutspeed,combufadealpha)
                    combutalent = false
                    ChatFrame1:AddMessage("|cff00ffffNo Combustion spell in Spellbook, CombustionHelper hiding now.|r")
            elseif (a6 == true) and (combutalent == false) then
                    CombustionFrame:FadeIn(combufadeinspeed)
                    combutalent = true
                    ChatFrame1:AddMessage("|cff00ffffCombustion spell in Spellbook, CombustionHelper back in.|r")
                    CombustionFrameresize()
            end

    end
    
-------------------------------
--frostfirebolt glyph check
    if (event == "GLYPH_ADDED") or (event == "GLYPH_REMOVED")
        then Combuffbglyphcheck ()
             
    end
 
-------------------------------
--in and out of combat check  
    if (event == "PLAYER_REGEN_DISABLED") and (combuautohide ~= 1) and (combutalent == true)-- autoshow when in combat
        then CombustionFrame:FadeIn(combufadeinspeed)
    elseif (event == "PLAYER_REGEN_ENABLED") and (combuautohide ~= 1) and (combutalent == true)-- autohide when out of combat
        then CombustionFrame:FadeOut(combufadeoutspeed,combufadealpha)
    end
    
    
    
-------------------------------
--Combat log events checks
    if (event=="COMBAT_LOG_EVENT_UNFILTERED") then

        local timestamp, event, sourceGUID, sourceName, sourceFlags, destGUID, destName, destFlags, spellId, spellName, spellSchool, amount, overkill, school, resisted, blocked, absorbed, critical = select(1, ...)

            if (sourceName == UnitName("player")) then
            
-------------------------------------------
-- report event check 
			if (combureport == true) and (destGUID == UnitGUID("target")) then
				if (spellId == 44457) and (event == "SPELL_PERIODIC_DAMAGE") then 
					if (critical == 1) and (combumeta == true) then 
						combulbdamage = amount/2,03
					elseif (critical == 1) and (combumeta == false) then 
						combulbdamage = amount/2
					else combulbdamage = amount
					end
					LBLabel:SetText(format("%.0f Dmg", combulbdamage))
				elseif (spellId == 12654) and (event == "SPELL_PERIODIC_DAMAGE") then 
					combuigndamage = amount
					IgniteLabel:SetText(format("%.0f Dmg", combuigndamage))
				elseif ((spellId == 11366) and (event == "SPELL_PERIODIC_DAMAGE")) or ((spellId == 92315) and (event == "SPELL_PERIODIC_DAMAGE")) then 
					if (critical == 1) and (combumeta == true) then 
						combupyrodamage = amount/2,03
					elseif (critical == 1) and (combumeta == false) then 
						combupyrodamage = amount/2
					else combupyrodamage = amount
					end
					PyroLabel:SetText(format("%.0f Dmg", combupyrodamage))
				elseif (spellId == 44614) and (event == "SPELL_PERIODIC_DAMAGE") then 
					if (critical == 1) and (combumeta == true) then 
						combuffbdamage = amount/2,03
					elseif (critical == 1) and (combumeta == false) then 
						combuffbdamage = amount/2
					else combuffbdamage = amount
					end
					FFBLabel:SetText(format("%.0f Dmg", combuffbdamage))
				end
			end
                
-------------------------------------------
-- Living Bomb early refresh 
                if (comburefreshmode == true) and (spellId == 44457) and (event == "SPELL_AURA_REFRESH")
                    then combulbrefresh = combulbrefresh + 1
                         print(format("|cffff0000 -- You refreshed your Living bomb on |cffffffff%s |cffff0000too early. --|r",destName))
                end                
			end
    end
                    
-------------------------------------------
-- End of fight report and fight start reset counter 
    if (event == "PLAYER_REGEN_DISABLED") 
        then combulbrefresh = 0
        	 local gem1, gem2, gem3 = GetInventoryItemGems(1)
        	 if CombuCritMeta[gem1] or CombuCritMeta[gem2] or CombuCritMeta[gem3] 
        	 	then combumeta = true
        	 else combumeta = false
        	 end  
    elseif (event == "PLAYER_REGEN_ENABLED") and (combulbrefresh >= 1)
        then print(format("|cffff0000 -- Earlier Living bomb refresh for this fight : %d --|r",combulbrefresh))
    end
-------------------------------
end
	
-------------------------------------------------------------------------------------------------------	
-------------------------------------------------------------------------------------------------------	
	

function Combustion_OnUpdate(self, elapsed)
    self.TimeSinceLastUpdate = (self.TimeSinceLastUpdate or 0) + elapsed;
 
		if (self.TimeSinceLastUpdate > Combustion_UpdateInterval) then
            local time = GetTime()   
            
-------------------------------
--Living Bomb part
		local a,b,c,d,e,f,g,h,i,j,k = UnitAura("target", lvb, nil, "PLAYER HARMFUL")		
		
		if (k==44457) then 
			combulbtimer = (-1*(time-g))
		else combulbtimer = 0
			combulbdamage = 0
		end
		
		if (combulbtimer >= 2) then -- condition when timer is with more than 2 seconds left
			LBTextFrameLabel:SetText(format("|cff00ff00%.1f|r",combulbtimer))
			LBButton:SetTexture("Interface\\AddOns\\CombustionHelper\\Images\\Combustionon")
			LBTime = 1
		elseif (combulbtimer <= 2) and (combulbtimer ~= 0) then -- condition when timer is with less than 2 seconds left
			LBTextFrameLabel:SetText(format("|cffff0000%.1f|r",combulbtimer))
			LBButton:SetTexture("Interface\\AddOns\\CombustionHelper\\Images\\Combustionon")
			LBTime = 0
		else LBTextFrameLabel:SetText(format("|cffff0000LB|r")) 
			LBButton:SetTexture("Interface\\AddOns\\CombustionHelper\\Images\\Combustionoff") -- Text in red
			LBLabel:SetText(format("Living Bomb"))
			LBTime = 0
		end
			
		if (combubartimers == true) and (k==44457) and (combulbtimer <= 2) then
			LBbar:Show()
			LBbar:SetWidth((28+combubarwidth)*((-1*(GetTime()-g))/f))
			LBbar:SetVertexColor(1,0,0,combuopacity)
		elseif (combubartimers == true) and (k==44457) then 
			LBbar:Show()
			LBbar:SetWidth((28+combubarwidth)*((-1*(GetTime()-g))/f)) 			
			LBbar:SetVertexColor(combured, combugreen, combublue, combuopacity)
		else LBbar:Hide()
		end
			
--------------------------------
--FrostfireBolt part
		local a1,b1,c1,d1,e1,f1,g1,h1,i1,j1,k1 = UnitAura("target", ffb, nil, "PLAYER HARMFUL")		
		
		if (k1==44614) then 
			combuffbtimer = (-1*(time-g1))
		else combuffbtimer = 0
			combuffbdamage = 0
		end

 		if (ffbglyph == false) or (combuffb == false) then 
			FFBTime = 1
			FFBTextFrameLabel:SetText(format("|cffff0000Glyph|r"))
		elseif (combuffbtimer >= 2) then -- condition when timer is with more than 2 seconds left
			FFBTextFrameLabel:SetText(format("|cff00ff00%.1f/%d|r",combuffbtimer,(d1)))
			FFBButton:SetTexture("Interface\\AddOns\\CombustionHelper\\Images\\Combustionon")
			FFBTime = 1
		elseif (combuffbtimer <= 2) and (combuffbtimer ~= 0) then -- condition when timer is with less than 2 seconds left
			FFBTextFrameLabel:SetText(format("|cffff0000%.1f/%d|r",combuffbtimer,(d1)))
			FFBButton:SetTexture("Interface\\AddOns\\CombustionHelper\\Images\\Combustionon")
			FFBTime = 0
		else FFBTextFrameLabel:SetText(format("|cffff0000FFB|r"))
			FFBButton:SetTexture("Interface\\AddOns\\CombustionHelper\\Images\\Combustionoff") -- Text in red
			FFBLabel:SetText(format("FrostFire Bolt"))
			FFBTime = 0
		end
			
		if (combubartimers == true) and (k1==44614) and (combuffbtimer <= 2) then 
			FFBbar:Show()
			FFBbar:SetWidth((28+combubarwidth)*((-1*(GetTime()-g1))/f1))
			FFBbar:SetVertexColor(1,0,0,combuopacity)
		elseif (combubartimers == true) and (k1==44614) then 
			FFBbar:Show()
			FFBbar:SetWidth((28+combubarwidth)*((-1*(GetTime()-g1))/f1))
			FFBbar:SetVertexColor(combured, combugreen, combublue, combuopacity)
		else FFBbar:Hide()
		end
			
--------------------------------
--Ignite part
		local a2,b2,c2,d2,e2,f2,g2,h2,i2,j2,k2 = UnitAura("target", ignite, nil, "PLAYER HARMFUL")
		
		if (k2==12654) then 
			combuignitetimer = (-1*(time-g2))
		else combuignitetimer = 0
			combuigndamage = 0
		end
		
		if (combuignitetimer >= 2) then -- condition when timer is with more than 2 seconds left
			IgnTextFrameLabel:SetText(format("|cff00ff00%.1f|r",combuignitetimer))
			IgniteButton:SetTexture("Interface\\AddOns\\CombustionHelper\\Images\\Combustionon")
			IgnTime = 1
		elseif (combuignitetimer <= 2) and (combuignitetimer ~= 0) then -- condition when timer is with less than 2 seconds left
			IgnTextFrameLabel:SetText(format("|cffff0000%.1f|r",combuignitetimer))
			IgniteButton:SetTexture("Interface\\AddOns\\CombustionHelper\\Images\\Combustionon")
			IgnTime = 0
		else IgnTextFrameLabel:SetText(format("|cffff0000Ign|r"))
			IgniteButton:SetTexture("Interface\\AddOns\\CombustionHelper\\Images\\Combustionoff") -- Text in red
			IgniteLabel:SetText(format("Ignite"))
			IgnTime = 0
		end
			
		if (combubartimers == true) and (k2==12654) and (combuignitetimer <= 2) then 
			Ignbar:Show()
			Ignbar:SetWidth((28+combubarwidth)*((-1*(GetTime()-g2))/f2))
			Ignbar:SetVertexColor(1,0,0,combuopacity)
		elseif (combubartimers == true) and (k2==12654) then 
			Ignbar:Show()
			Ignbar:SetWidth((28+combubarwidth)*((-1*(GetTime()-g2))/f2))
			Ignbar:SetVertexColor(combured, combugreen, combublue, combuopacity)
		else Ignbar:Hide()
		end
			
--------------------------------
--Pyroblast part
		local a3,b3,c3,d3,e3,f3,g3,h3,i3,j3,k3 = UnitAura("target", pyro1, nil, "PLAYER HARMFUL")		
		local a4,b4,c4,d4,e4,f4,g4,h4,i4,j4,k4 = UnitAura("target", pyro2, nil, "PLAYER HARMFUL")		
		
		if (k3==11366) then 
			combupyrotimer = (-1*(time-g3))
		elseif (k4==92315) then 
			combupyrotimer = (-1*(time-g4))
		else combupyrotimer = 0
			combupyrodamage = 0
		end
		
		if (combupyrotimer >= 2) then -- condition when timer is with more than 2 seconds left
			PyroTextFrameLabel:SetText(format("|cff00ff00%.1f|r",combupyrotimer))
			PyroButton:SetTexture("Interface\\AddOns\\CombustionHelper\\Images\\Combustionon")
			PyroTime = 1
		elseif (combupyrotimer <= 2) and (combupyrotimer ~= 0) then -- condition when timer is with less than 2 seconds left
			PyroTextFrameLabel:SetText(format("|cffff0000%.1f|r",combupyrotimer))
			PyroButton:SetTexture("Interface\\AddOns\\CombustionHelper\\Images\\Combustionon")
			PyroTime = 0
		else PyroTextFrameLabel:SetText(format("|cffff0000Pyro|r"))
			PyroButton:SetTexture("Interface\\AddOns\\CombustionHelper\\Images\\Combustionoff") -- Text in red
			PyroLabel:SetText(format("Pyroblast"))
			PyroTime = 0
		end
            			
		if (combubartimers == true) and (k3==11366) and (combupyrotimer <= 2) then 
			Pyrobar:Show()
			Pyrobar:SetWidth((28+combubarwidth)*((-1*(GetTime()-g3))/f3))
			Pyrobar:SetVertexColor(1,0,0,combuopacity)
		elseif (combubartimers == true) and (k3==11366) then 
			Pyrobar:Show()
			Pyrobar:SetWidth((28+combubarwidth)*((-1*(GetTime()-g3))/f3))
			Pyrobar:SetVertexColor(combured, combugreen, combublue, combuopacity)
		elseif (combubartimers == true) and (k4==92315) and (combupyrotimer <= 2) then 
			Pyrobar:Show()
			Pyrobar:SetWidth((28+combubarwidth)*((-1*(GetTime()-g4))/f4))
			Pyrobar:SetVertexColor(1,0,0,combuopacity)
		elseif (combubartimers == true) and (k4==92315) then 
			Pyrobar:Show()
			Pyrobar:SetWidth((28+combubarwidth)*((-1*(GetTime()-g4))/f4))
			Pyrobar:SetVertexColor(combured, combugreen, combublue, combuopacity)
		else Pyrobar:Hide()
		end
		
--------------------------------
--Combustion/impact part            
			local a5,b5,c5 = GetSpellCooldown(comb)
			local a7,b7,c7,d7,e7,f7,g7,h7,i7,j7,k7 = UnitAura("player", impact)
					
			if (b5 == nil) then
			elseif (b5<=2) and (combureport == true) and (InCombatLockdown() == 1) then -- to show dot total damage in combat with report enabled
				CombustionUp = 1
				ImpactUp = 0
				combufadeout = false
				if (combureportvalue <= (combulbdamage + combupyrodamage + combuigndamage + combuffbdamage)) and combureportthreshold then
					StatusTextFrameLabel:SetText(format("|cff00ff00Total : %.0f - CB Up|r", combulbdamage + combupyrodamage + combuigndamage + combuffbdamage))
				else StatusTextFrameLabel:SetText(format("|cffffcc00Total : %.0f - CB Up|r", combulbdamage + combupyrodamage + combuigndamage + combuffbdamage))
				end
			elseif (b5<=2) then -- condition when combustion cd is up, taking gcd in account
				StatusTextFrameLabel:SetText(format("Combustion Up !"))
				CombustionUp = 1
				ImpactUp = 0
				combufadeout = false
			elseif (b5>=2) and (k7 == 64343) and (combuimpact == true) then -- condition when impact is up and combustion in cd
				StatusTextFrameLabel:SetText(format("|cff00ff00Impact Up for %.1f !!|r",-1*(time-g7)))
				CombustionUp = 0
				ImpactUp = 1
				combufadeout = false
			elseif ((a5 + b5 - time)>=60) and (combufadeout == false) and (k7 == nil) then -- timer for combustion in minutes
				StatusTextFrameLabel:SetText(format("Combustion in %d:%0.2d",(a5 + b5 - time) / 60,(a5 + b5 - time) % 60 ))  
				CombustionUp = 0
				ImpactUp = 0
	 		elseif ((a5 + b5 - time)<=60) and (k7 == nil) then 
				StatusTextFrameLabel:SetText(format("Combustion in %.0fsec",(a5 + b5 - time)))  -- timer for combustion in seconds
				CombustionUp = 0	
				ImpactUp = 0
			end
            
--------------------------------
-- Critical Mass/shadow mastery tracking
    if (combucrit==true) then
            
            local a9,b9,c9,d9,e9,f9,g9,h9,i9,j9,k9 = UnitAura("target", CritMass, nil, "HARMFUL")
			local a10,b10,c10,d10,e10,f10,g10,h10,i10,j10,k10 = UnitAura("target", ShadowMast, nil, "HARMFUL")

			if (k9==22959) then combucrittimer = (-1*(time-g9))
			elseif (k10==17800) then combucrittimer = (-1*(time-g10))
			else combucrittimer = 0
			end

			if (combucrittimer >= 2)-- condition when timer is with more than 2 seconds left
                    then CritTextFrameLabel:SetText(format("|cff00ff00%.1f|r",combucrittimer))
                         CritTextFrameLabel:SetJustifyH("RIGHT")
                         CritTypeFrameLabel:SetText(format("|cffffffff Critical Mass|r"))
 			elseif (combucrittimer <= 2) and (combucrittimer ~= 0) -- condition when timer is with less than 2 seconds left
                    then CritTextFrameLabel:SetText(format("|cffff0000%.1f|r",combucrittimer))
                         CritTextFrameLabel:SetJustifyH("RIGHT")
                         CritTypeFrameLabel:SetText(format("|cffffffff Critical Mass|r"))
            else CritTextFrameLabel:SetText(format("|cffff0000No Critical Mass !!|r"))
                 CritTextFrameLabel:SetJustifyH("LEFT")
                 CritTypeFrameLabel:SetText("")
            end
            			
			if (k9==22959) and (combucrittimer <= 2)
				then Critbar:Show()
                 Critbar:SetWidth((92+combucritwidth)*((-1*(GetTime()-g9))/f9))
                 Critbar:SetVertexColor(1,0,0,combuopacity)
			elseif (k9==22959)
				then Critbar:Show()
                 Critbar:SetWidth((92+combucritwidth)*((-1*(GetTime()-g9))/f9))
                 Critbar:SetVertexColor(combured, combugreen, combublue, combuopacity)
            elseif (k10==17800) and (combucrittimer <= 2) 
				then Critbar:Show()
                 Critbar:SetWidth((92+combucritwidth)*((-1*(GetTime()-g10))/f10))
                 Critbar:SetVertexColor(1,0,0,combuopacity)
            elseif (k10==17800) 
				then Critbar:Show()
                 Critbar:SetWidth((92+combucritwidth)*((-1*(GetTime()-g10))/f10))
                 Critbar:SetVertexColor(combured, combugreen, combublue, combuopacity)
            else Critbar:Hide()
			end
    
    else
    end
            
--------------------------------
-- Background colors settings
            if (LBTime == 1) 
                and (FFBTime == 1) 
                and (IgnTime == 1) 
                and (PyroTime == 1) 
                and (CombustionUp == 1)
                then CombustionFrame:SetBackdropColor(0,0.7,0) --Green background for frame when dots and combustion are up
            elseif (LBTime == 1) 
                and (FFBTime == 1) 
                and (IgnTime == 1) 
                and (PyroTime == 1) 
                and (ImpactUp == 1)
                and (CombustionUp == 0) --Yellow background for frame when dots and Impact are up
                then CombustionFrame:SetBackdropColor(1,0.82,0.5)
            else CombustionFrame:SetBackdropColor(0.25,0.25,0.25)
            end
--------------------------------
 -- autohide part 
 			if (a5 == nil) then
			elseif ((a5 + b5 - time) <= (120 - combubeforefade)) 
			   and ((a5 + b5 - time) >= (combuafterfade + combufadeinspeed))
			   and (combufadeout == false) 
			   and (combuautohide == 3) 
			   then combufadeout = true
	             	StatusTextFrameLabel:SetText(format("Autohiding now."))
				    CombustionFrame:FadeOut(combufadeoutspeed,combufadealpha);
				    CombustionFrame:Wait(combuwaitfade);
				    CombustionFrame:FadeIn(combufadeinspeed);
                    ChatFrame1:AddMessage(format("|cff00ffffCombustion Helper back in %d seconds|r", 120-combubeforefade-combuafterfade-combufadeoutspeed-combufadeinspeed))
			end
--------------------------------
		self.TimeSinceLastUpdate = 0

    end    
end


SLASH_COMBUCONFIG1 = "/combustionhelper"

SlashCmdList["COMBUCONFIG"] = function(msg)

	if msg=="lock" then
		combulock = true
		CombustionFrame:EnableMouse(false)
		ChatFrame1:AddMessage("|cff00ffffCombustion Helper is locked|r")

	elseif msg=="unlock" then
		combulock = false
		CombustionFrame:EnableMouse(true)
		ChatFrame1:AddMessage("|cff00ffffCombustion Helper is unlocked|r")

	elseif msg=="ffbon" then
		combuffb = true
		ChatFrame1:AddMessage("|cff00ffffFrostfire Bolt enabled|r")
		CombustionFrameresize()
        Combuffbglyphcheck ()	
        
	elseif msg=="ffboff" then
		combuffb = false
		ChatFrame1:AddMessage("|cff00ffffFrostfire Bolt disabled|r")
		CombustionFrameresize()
				
	elseif msg=="hide" then
 		combutalent = false
        CombustionFrame:FadeOut(combufadeoutspeed,combufadealpha);
		ChatFrame1:AddMessage("|cff00ffffCombustion Helper is hidden now|r")

	elseif msg=="show" then
 		combutalent = true
        CombustionFrame:FadeIn(combufadeinspeed);
		ChatFrame1:AddMessage("|cff00ffffCombustion Helper is showing now|r")
		
	elseif msg=="impactoff" then
 		combuimpact = false
		ChatFrame1:AddMessage("|cff00ffffImpact mode off|r")		

	elseif msg=="impacton" then
 		combuimpact = true
		ChatFrame1:AddMessage("|cff00ffffImpact mode on|r")

	elseif msg=="baron" then
 		combubartimers = true
		CombustionFrameresize()
		ChatFrame1:AddMessage("|cff00ffffBar timer mode on|r")

	elseif msg=="baroff" then
 		combubartimers = false
		CombustionFrameresize()
		ChatFrame1:AddMessage("|cff00ffffBar timer mode off|r")

	elseif msg=="critoff" then
 		combucrit = false
		CombustionFrameresize()
		ChatFrame1:AddMessage("|cff00ffffCritical Mass Tracker off|r")

	elseif msg=="criton" then
 		combucrit = true
		CombustionFrameresize()
		ChatFrame1:AddMessage("|cff00ffffCritical Mass Tracker on|r")

    elseif msg=="reset" then
  		Combustionreset()
		
    elseif msg == "" or  msg == "help" or  msg == "?" then
		ChatFrame1:AddMessage("/combustionhelper lock |cffffff00- Lock Combustion Helper|r")
		ChatFrame1:AddMessage("/combustionhelper unlock |cffffff00- Unlock Combustion Helper|r")
		ChatFrame1:AddMessage("/combustionhelper ffbon |cffffff00- Enable Frostfire Bolt|r")
		ChatFrame1:AddMessage("/combustionhelper ffboff |cffffff00- Disable Frostfire Bolt|r")
		ChatFrame1:AddMessage("/combustionhelper hide |cffffff00- Hide Combustion Helper|r")
		ChatFrame1:AddMessage("/combustionhelper show |cffffff00- Show Combustion Helper|r")
		ChatFrame1:AddMessage("/combustionhelper impacton |cffffff00- Enable Impact mode|r")
		ChatFrame1:AddMessage("/combustionhelper impactoff |cffffff00- Disable Impact mode|r")
		ChatFrame1:AddMessage("/combustionhelper reset |cffffff00- Combustionhelper Savedvariables have been reset, logout now for clean restart|r")
		ChatFrame1:AddMessage("/combustionhelper baron |cffffff00- Enable Bar mode|r")
		ChatFrame1:AddMessage("/combustionhelper baroff |cffffff00- Disable Bar mode|r")
		ChatFrame1:AddMessage("/combustionhelper criton |cffffff00- Enable Critical Mass Tracker|r")
		ChatFrame1:AddMessage("/combustionhelper critoff |cffffff00- Disable Critical Mass Tracker|r")
		ChatFrame1:AddMessage("|cffffff00- For Scale and autohide settings, go to Interface Panel -> Addons|r")
		
	else
		ChatFrame1:AddMessage("|cffffff00CombustionHelper: Unknown command, type '/combustionhelper' for help.|r")
	end

end