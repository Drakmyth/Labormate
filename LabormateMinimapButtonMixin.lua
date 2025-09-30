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

local function projectCursorToMinimap()
    local mx, my = Minimap:GetCenter()
    local cx, cy = GetCursorPosition()
    local scale = Minimap:GetEffectiveScale()
    cx, cy = cx / scale, cy / scale

    local dx, dy = cx - mx, cy - my
    local radius = Minimap:GetWidth() / 2

    local angle = math.atan2(dy, dx)
    local x = math.cos(angle) * radius
    local y = math.sin(angle) * radius

    return x, y
end

function LabormateMinimapButtonMixin:OnEvent(event)
    if event == Labormate.Events.PLAYER_ENTERING_WORLD then
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
    self:ClearAllPoints()
    local x, y = projectCursorToMinimap()
    self:SetPoint("CENTER", Minimap, "CENTER", x, y)
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
