LabormateProfessionPanelMixin = LabormateProfessionPanelMixin or {}

function LabormateProfessionPanelMixin:UpdateFromSkillIndex(professionSkillIndex)
    local icon = "Interface/Icons/inv_misc_grouplooking"

    local info = nil
    self.badge:ClearAttributes()
    self.badge.professionName = nil
    self.badge.spellID1 = nil
    self.badge.spellID2 = nil

    if professionSkillIndex then
        local _, realIcon, _, _, numAbilities, spellOffset, skillLine = GetProfessionInfo(professionSkillIndex)
        icon = realIcon

        if numAbilities > 0 then
            for i = 1, numAbilities do
                -- For professions, the journal is ability 1, and there may or may not be an ability 2
                -- We want the journal to go on Right-Click (button 2) and the ability on Left-Click (button 1)
                local buttonIndex = 3 - i
                local spellIndex = spellOffset + i
                local spellInfo = C_SpellBook.GetSpellBookItemInfo(spellIndex, Enum.SpellBookSpellBank.Player)

                self.badge["spellID" .. i] = spellInfo.actionID

                self.badge:SetAttribute("type" .. buttonIndex, "spell")
                self.badge:SetAttribute("spell" .. buttonIndex, spellInfo.actionID)
            end
        end

        local selectedExpansion = LabormateDB.selectedExpansion
        local skillLineId = Labormate.SkillLineIds[skillLine][selectedExpansion]
        info = C_TradeSkillUI.GetProfessionInfoBySkillLineID(skillLineId)

        if info.profession == Enum.Profession.Archaeology then
            self.badge.professionName = info.professionName
        else
            self.badge.professionName = info.parentProfessionName
        end
    end

    self.statusBar:UpdateFromInfo(info)
    self.badge.icon:SetTexture(icon)
end

function LabormateProfessionPanelMixin:PlayStatusBarAnim()
    self.statusBar:PlayAnim()
end
