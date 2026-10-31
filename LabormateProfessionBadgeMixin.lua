LabormateProfessionBadgeMixin = LabormateProfessionBadgeMixin or {}

function LabormateProfessionBadgeMixin:OnLoad()
    self:RegisterEvent(Labormate.Events.PLAYER_REGEN_DISABLED)
    self:RegisterEvent(Labormate.Events.PLAYER_REGEN_ENABLED)
end

function LabormateProfessionBadgeMixin:OnEnter()
    GameTooltip:SetOwner(self, "ANCHOR_CURSOR_RIGHT")
    GameTooltip:ClearLines()

    if self.professionName then
        GameTooltip:SetText("|cffffffff" .. self.professionName .. "|r")
    else
        GameTooltip:SetText("|cffffffff???|r")
        GameTooltip:AddLine("|cffff0000You don't have this profession yet.|r")
    end

    if InCombatLockdown() then
        GameTooltip:AddLine("|cffff0000Button disabled while in combat|r")
    end

    for i = 2, 1, -1 do
        local spellId = self["spellID" .. i]
        local buttonIndex = 3 - i

        if spellId and not C_Spell.IsSpellPassive(spellId) then
            GameTooltip:AddLine(" ")

            local index, bank = C_SpellBook.FindSpellBookSlotForSpell(spellId)
            local data = index and bank and C_TooltipInfo.GetSpellBookItem(index, bank)

            for idx, line in ipairs(data and data.lines or {}) do
                local clickHeader = ""
                if idx == 1 then
                    if buttonIndex == 1 then
                        clickHeader = "|cff00ff00Left-Click:|r "
                    elseif buttonIndex == 2 then
                        clickHeader = "|cff00ff00Right-Click:|r "
                    end

                end

                local text = clickHeader .. (line.leftText or "")
                local leftColor = line.leftColor or NORMAL_FONT_COLOR
                local r, g, b = leftColor.r, leftColor.g, leftColor.b

                if line.rightText then
                    local rtext = line.rightText
                    local rightColor = line.rightColor or NORMAL_FONT_COLOR
                    local rr, rg, rb = rightColor.r, rightColor.g, rightColor.b
                    GameTooltip:AddDoubleLine(text, rtext, r, g, b, rr, rg, rb)
                else
                    GameTooltip:AddLine(text, r, g, b, line.wrapText)
                end
            end
        end
    end

    GameTooltip:Show()
end

function LabormateProfessionBadgeMixin:OnLeave()
    GameTooltip:Hide()
    GameTooltip:ClearLines()
end

function LabormateProfessionBadgeMixin:OnEvent(event)
    if event == Labormate.Events.PLAYER_REGEN_DISABLED then
        self.icon:SetDesaturated(true)
    elseif event == Labormate.Events.PLAYER_REGEN_ENABLED then
        self.icon:SetDesaturated(false)
    end
end