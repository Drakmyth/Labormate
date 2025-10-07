LabormateProfessionStatusBarMixin = LabormateProfessionStatusBarMixin or {}

local FILL_PREFIX = "Skillbar_Fill_Flipbook_"
local DEFAULT_BLUE = "DefaultBlue"

local function getEnglishBaseProfessionName(professionInfo)
    if not professionInfo then
        return nil
    end

    local professions = tInvert(Enum.Profession)
    local name = professions[professionInfo.profession]

    if not name then
        return nil
    end

    return name
end

local function getFillAtlasFromName(professionName)
    if not professionName or professionName == "Archaeology" then
        return FILL_PREFIX .. DEFAULT_BLUE
    end
    return FILL_PREFIX .. professionName
end

local function getColoredSkillText(current, max, overrideColor)
    if current == max then
        return "|cff00ff00" .. current .. "|r"
    elseif overrideColor then
        return "|cff" .. overrideColor .. current .. "|r"
    end
    return current
end

function LabormateProfessionStatusBarMixin:SetFillAtlas(fillAtlas)
    local ATLAS_FRAME_HEIGHT = 34
    local atlasColumns = 2
    if fillAtlas == FILL_PREFIX .. DEFAULT_BLUE then
        atlasColumns = 1
    end

    local atlasInfo = C_Texture.GetAtlasInfo(fillAtlas)
    local atlasRows = atlasInfo.height / ATLAS_FRAME_HEIGHT
    local atlasFrames = atlasColumns * atlasRows

    local flipBook = self.skillBarAnim.flipBook

    flipBook:SetFlipBookColumns(atlasColumns)
    flipBook:SetFlipBookRows(atlasRows)
    flipBook:SetFlipBookFrames(atlasFrames)

    self.skillBarFillTexture:SetAtlas(fillAtlas, false)
end

function LabormateProfessionStatusBarMixin:UpdateFromInfo(professionInfo)
    self.professionInfo = professionInfo

    -----
    -- Update current and max skill text
    -----

    if not professionInfo or professionInfo.maxSkillLevel == 0 then
        self.currentValueLabel:SetText("")
        self.maxValueLabel:SetText("")
        self.skillBarFillMask:SetPoint("CENTER", self.skillBarFillTexture, 0, -self.skillBarFillTexture:GetWidth());
        return
    end

    local skillLevel = professionInfo.skillLevel
    local maxSkillLevel = professionInfo.maxSkillLevel

    local skillLevelText = getColoredSkillText(skillLevel, maxSkillLevel)
    self.currentValueLabel:SetText(skillLevelText)
    self.maxValueLabel:SetText(maxSkillLevel)

    -----
    -- Update bar fill texture
    -----

    local profName = getEnglishBaseProfessionName(professionInfo)
    local atlas = getFillAtlasFromName(profName)

    self:SetFillAtlas(atlas)

    -----
    -- Update bar fill mask
    -----

    local function lerp(a, b, t)
        return a + (b - a) * t
    end

    local ratio = 0;
    if maxSkillLevel > 0 then
        ratio = math.min(skillLevel / maxSkillLevel, 1);
    end

    local skillBarEmptyHeight = -self.skillBarFillTexture:GetWidth()
    local skillBarFullHeight = skillBarEmptyHeight + self.skillBarBackground:GetHeight()

    local skillBarHeight = lerp(skillBarEmptyHeight, skillBarFullHeight, ratio)

    self.skillBarFillMask:SetPoint("CENTER", self.skillBarFillTexture, 0, skillBarHeight);
end

function LabormateProfessionStatusBarMixin:OnShow()
    self:PlayAnim()
end

function LabormateProfessionStatusBarMixin:PlayAnim()
    self.skillBarAnim:Play()
end

function LabormateProfessionStatusBarMixin:OnEnter()
    GameTooltip:SetOwner(self, "ANCHOR_CURSOR_RIGHT")
    GameTooltip:ClearLines()

    local function buildProfessionTooltip()
        local professionName = ""
        if self.professionInfo.profession == Enum.Profession.Archaeology then
            professionName = self.professionInfo.professionName
        else
            professionName = self.professionInfo.parentProfessionName
        end

        GameTooltip:SetText("|cffffffff" .. professionName .. "|r")
        if self.professionInfo.maxSkillLevel == 0 then
            GameTooltip:AddLine("|cffff0000" .. "Visit a trainer to learn this skill." .. "|r")
        end

        local expansionName = _G["EXPANSION_NAME" .. LabormateDB.selectedExpansion]
        GameTooltip:AddLine(" ")
        GameTooltip:AddLine("Expansion: " .. expansionName)

        if self.professionInfo.maxSkillLevel > 0 then
            GameTooltip:AddLine("Progress: " .. getColoredSkillText(self.professionInfo.skillLevel, self.professionInfo.maxSkillLevel, "ffffff") .. "/|cffffffff" .. self.professionInfo.maxSkillLevel .. "|r")
        end
    end

    local function buildMissingProfessionTooltip()
        GameTooltip:SetText("|cffffffff???|r")
        GameTooltip:AddLine("|cffff0000You don't have this profession yet.|r")
    end

    if self.professionInfo then
        buildProfessionTooltip()
    else
        buildMissingProfessionTooltip()
    end

    GameTooltip:Show()
end

function LabormateProfessionStatusBarMixin:OnLeave()
    GameTooltip:Hide()
    GameTooltip:ClearLines()
end
