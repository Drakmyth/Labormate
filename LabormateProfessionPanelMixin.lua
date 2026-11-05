LabormateProfessionPanelMixin = LabormateProfessionPanelMixin or {}

function LabormateProfessionPanelMixin:UpdateFromSkillIndex(professionSkillIndex)
    local icon = "Interface/Icons/inv_misc_grouplooking"

    local info = nil
    self.badge:ClearAttributes()
    self.badge.professionName = nil
    self.badge.spellID1 = nil
    self.badge.spellID2 = nil

    if professionSkillIndex then
        local _, realIcon = GetProfessionInfo(professionSkillIndex)
        icon = realIcon or icon

        for i, ability in ipairs(Labormate.client:GetProfessionAbilities(professionSkillIndex)) do
            self.badge["spellID" .. i] = ability.spellID
            self.badge:SetAttribute("type" .. ability.buttonIndex, "spell")
            self.badge:SetAttribute("spell" .. ability.buttonIndex, ability.spellID)
        end

        info = Labormate.client:GetProfessionInfo(professionSkillIndex, LabormateDB.selectedExpansion)
        if info then
            if info.profession == Enum.Profession.Archaeology then
                self.badge.professionName = info.professionName
            else
                self.badge.professionName = info.parentProfessionName
            end
        end
    end

    self.statusBar:UpdateFromInfo(info)
    self.badge.icon:SetTexture(icon)
end

function LabormateProfessionPanelMixin:PlayStatusBarAnim()
    self.statusBar:PlayAnim()
end
