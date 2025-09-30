LabormateMainFrameMixin = LabormateMainFrameMixin or {}

function LabormateMainFrameMixin:OnLoad()
    Labormate.mainFrame = self

    local function configureBlizzardFrames()
        self:SetPortraitToAsset("Interface/Icons/ability_racial_jackofalltrades");
        self:SetPortraitTextureSizeAndOffset(36, -4, 1);

        self.TitleContainer.TitleText:SetText(Labormate.ADDON_NAME)
        self.TitleContainer:SetPoint("TOPLEFT", self, "TOPLEFT", 30, -1);

        self.CloseButton:SetNormalAtlas("128-RedButton-Exit")
        self.CloseButton:SetDisabledAtlas("128-RedButton-Exit-Disabled")
        self.CloseButton:SetPushedAtlas("128-RedButton-Exit-Pressed")
        self.CloseButton:SetHighlightAtlas("128-RedButton-ExitHighlight")
    end

    configureBlizzardFrames()
    self:RegisterForDrag("LeftButton")

    -- Ideally we would build the dropdown menu here, but we need to wait for LabormateDB to
    -- load, so we'll do it in ADDON_LOADED instead

    self:RegisterEvent(Labormate.Events.ADDON_LOADED)
    self:RegisterEvent(Labormate.Events.PLAYER_ENTERING_WORLD)
    self:RegisterEvent(Labormate.Events.SKILL_LINES_CHANGED)
end

function LabormateMainFrameMixin:InitializeExpansionDropdownMenu()
    self.ExpansionDropdown:SetDefaultText("Select an Expansion")
    self.ExpansionDropdown:SetupMenu(function(_, rootDescription)
        rootDescription:CreateTitle("Expansion")

        local function IsSelected(index) return index == LabormateDB.selectedExpansion; end
        local function SetSelected(index) self:OnExpansionDropdownOptionSelected(index); end

        for expansion = 0, 10 do
            rootDescription:CreateRadio(_G["EXPANSION_NAME" .. expansion], IsSelected, SetSelected, expansion)
        end
    end)
end

function LabormateMainFrameMixin:OnExpansionDropdownOptionSelected(index)
    LabormateDB.selectedExpansion = index
    self:UpdateStatusBars()
end

function LabormateMainFrameMixin:OnDragStart(_)
    self:StartMoving()
end

function LabormateMainFrameMixin:OnDragStop()
    self:StopMovingOrSizing()
end

function LabormateMainFrameMixin:OnHide()
    PlaySound(808)
    LabormateDB.isOpen = false
end

function LabormateMainFrameMixin:Toggle()
    if not self:IsShown() then
        self:Show()
    else
        self:Hide()
    end
end

function LabormateMainFrameMixin:OnShow()
    PlaySound(808)
    self:UpdateStatusBars()
    LabormateDB.isOpen = true
end

function LabormateMainFrameMixin:OnEvent(event, ...)
    if event == Labormate.Events.ADDON_LOADED then
        self:InitializeExpansionDropdownMenu()
    elseif event == Labormate.Events.PLAYER_ENTERING_WORLD then
        if LabormateDB.isOpen and not self:IsShown() then
            self:Show()
        end
    elseif event == Labormate.Events.SKILL_LINES_CHANGED then
        self:UpdateStatusBars()
    end
end

function LabormateMainFrameMixin:UpdateStatusBars()
    local prof1SkillIndex, prof2SkillIndex, archSkillIndex, fishSkillIndex, cookSkillIndex, _ = GetProfessions()

    self.prof1Panel:UpdateFromSkillIndex(prof1SkillIndex)
    self.prof1Panel:PlayStatusBarAnim()
    self.prof2Panel:UpdateFromSkillIndex(prof2SkillIndex)
    self.prof2Panel:PlayStatusBarAnim()
    self.cookPanel:UpdateFromSkillIndex(cookSkillIndex)
    self.cookPanel:PlayStatusBarAnim()
    self.fishPanel:UpdateFromSkillIndex(fishSkillIndex)
    self.fishPanel:PlayStatusBarAnim()
    self.archPanel:UpdateFromSkillIndex(archSkillIndex)
    self.archPanel:PlayStatusBarAnim()
end

LabormateMainFrameRefreshButtonMixin = LabormateMainFrameRefreshButtonMixin or {}

local function getFirstNonNilProfessionIndex()
    local index1, index2, index3, index4, index5, _ = GetProfessions()
    return index1 or index2 or index3 or index4 or index5
end

function LabormateMainFrameRefreshButtonMixin:OnClick()
    local dummyProfIndex = getFirstNonNilProfessionIndex()
    if not dummyProfIndex then
        return
    end

    local _, _, _, _, _, _, skillLine = GetProfessionInfo(dummyProfIndex)
    local success = C_TradeSkillUI.OpenTradeSkill(skillLine)

    if not success then
        print("Labormate: Unable to auto-parse profession data. Please open one of the profession books to force load.")
    else
        C_TradeSkillUI.CloseTradeSkill()
    end

    Labormate.mainFrame:UpdateStatusBars()
end

function LabormateMainFrameRefreshButtonMixin:OnEnter()
    GameTooltip:SetOwner(self, "ANCHOR_CURSOR_RIGHT")
    GameTooltip:ClearLines()

    GameTooltip:SetText("Refresh Player Skill Data", 1, 1, 1)
    GameTooltip:AddLine(
        "The trade skill API can sometimes pull data from sources other than the player (or provide no data at all), but there is no way to know when it is doing this.",
        nil, nil, nil, true)
    GameTooltip:AddLine(" ")
    GameTooltip:AddLine(
        "If it seems like this might be happening you can try hitting this button to force load the player's data.", nil,
        nil,
        nil, true)
    GameTooltip:AddLine(" ")
    GameTooltip:AddLine("This will interrupt any crafting operations and might cause some open windows to close.", 1, 0,
        0, true)

    GameTooltip:Show()
end

function LabormateMainFrameRefreshButtonMixin:OnLeave()
    GameTooltip:Hide()
    GameTooltip:ClearLines()
end
