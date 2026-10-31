LabormateMinimapButtonMixin = LabormateMinimapButtonMixin or {}

function LabormateMinimapButtonMixin:OnLoad()
    self:RegisterForDrag("LeftButton")
    self:RegisterForClicks("LeftButtonUp", "RightButtonDown")
    self:RegisterEvent(Labormate.Events.PLAYER_ENTERING_WORLD)

    Labormate.minimapButton = self
end

local function adjustButtonTexturePressed(texture)
    texture:AdjustPointsOffset(1, -1)
    texture:SetVertexColor(0.5, 0.5, 0.5, 1)
end

local function adjustButtonTextureReleased(texture)
    texture:AdjustPointsOffset(-1, 1)
    texture:SetVertexColor(1, 1, 1, 1)
end

local function setButtonPosition(button, angle)
    local radius = Minimap:GetWidth() / 2
    button:ClearAllPoints()
    button:SetPoint("CENTER", Minimap, "CENTER", math.cos(angle) * radius, math.sin(angle) * radius)
end

local function getCursorAngle()
    local minimapX, minimapY = Minimap:GetCenter()
    local cursorX, cursorY = GetCursorPosition()
    local scale = Minimap:GetEffectiveScale()

    return math.atan2(cursorY / scale - minimapY, cursorX / scale - minimapX)
end

function LabormateMinimapButtonMixin:OnEvent(event)
    if event == Labormate.Events.PLAYER_ENTERING_WORLD then
        setButtonPosition(self, LabormateDB.minimapButtonAngle)

        if LabormateDB.showMinimapButton then
            self:Show()
        else
            self:Hide()
        end
    end
end

function LabormateMinimapButtonMixin:OnDragStart()
    adjustButtonTextureReleased(self.normalTexture)
    self:StartMoving()
    self:SetScript("OnUpdate", self.OnUpdate)
end

function LabormateMinimapButtonMixin:OnDragStop()
    self:StopMovingOrSizing()
    self:SetScript("OnUpdate", nil)
end

function LabormateMinimapButtonMixin:OnUpdate()
    LabormateDB.minimapButtonAngle = getCursorAngle()
    setButtonPosition(self, LabormateDB.minimapButtonAngle)
end

function LabormateMinimapButtonMixin:OnClick(button)
    if button == "LeftButton" then
        Labormate.mainFrame:Toggle()
    elseif button == "RightButton" then
        if not SettingsPanel:IsShown() then
            Settings.OpenToCategory(Labormate.SettingsCategory:GetID())
        else
            HideUIPanel(SettingsPanel)
        end
    end
end

function LabormateMinimapButtonMixin:OnEnter()
    GameTooltip:SetOwner(self, "ANCHOR_TOPRIGHT")
    GameTooltip:ClearLines()

    GameTooltip:SetText(Labormate.ADDON_NAME, 1, 1, 1)
    GameTooltip:AddLine(" ")
    GameTooltip:AddLine("|cff00ff00Left-Click:|r Open " .. Labormate.ADDON_NAME)
    GameTooltip:AddLine("|cff00ff00Right-Click:|r Open Settings")

    GameTooltip:Show()
end

function LabormateMinimapButtonMixin:OnLeave()
    GameTooltip:Hide()
    GameTooltip:ClearLines()
end

function LabormateMinimapButtonMixin:OnMouseDown(button)
    adjustButtonTexturePressed(self.normalTexture)
end

function LabormateMinimapButtonMixin:OnMouseUp(button, upInside)
    adjustButtonTextureReleased(self.normalTexture)
end
