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

        if spellId then
            GameTooltip:AddLine(" ")

            local index, bank = C_SpellBook.FindSpellBookSlotForSpell(spellId)
            local data = C_TooltipInfo.GetSpellBookItem(index, bank)

            for idx, line in ipairs(data.lines) do
                local clickHeader = ""
                if idx == 1 then
                    if buttonIndex == 1 then
                        clickHeader = "|cff00ff00Left-Click:|r "
                    elseif buttonIndex == 2 then
                        clickHeader = "|cff00ff00Right-Click:|r "
                    end
                end

                local text = clickHeader .. line.leftText
                local r, g, b = line.leftColor.r, line.leftColor.g, line.leftColor.b

                if line.rightText then
                    local rtext = line.rightText
                    local rr, rg, rb = line.rightColor.r, line.rightColor.g, line.rightColor.b
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