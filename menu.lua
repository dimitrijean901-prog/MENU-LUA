
--              _____ ___ _____  _      ____ _____  __
--             |_   _/ _ \_   _|/ \    |  _ \_ _\ \/ /
--               | || | | || | / _ \   | | | | | \  / 
--               | || |_| || |/ ___ \  | |_| | | /  \ 
--               |_| \___/ |_/_/   \_\ |____/___/_/\_\

hixaxtiondfdsvvcxvvdsfdsf = {} hixaxtiondfdsvvcxvvdsfdsf.debug = false local menus = {} local keys = {up = 172, down = 173, left = 174, right = 175, select = 191, back = 202} local optionCount = 0 local currentKey = nil local currentMenu = nil local titleHeight = 0.11 local titleXOffset = 0.5 local titleSpacing = 2 local titleYOffset = 0.03 local titleScale = 1.0 local buttonHeight = 0.030 local buttonFont = 0 local buttonScale = 0.365 local buttonTextXOffset = 0.005 local buttonTextYOffset = 0.005 local function debugPrint(text) if hixaxtiondfdsvvcxvvdsfdsf.debug then Citizen.Trace('[hixaxtiondfdsvvcxvvdsfdsf] ' .. tostring(text)) end end local function setMenuProperty(id, property, value) if id and menus[id] then menus[id][property] = value debugPrint(id .. ' menu property changed: { ' .. tostring(property) .. ', ' .. tostring(value) .. ' }') end end local function isMenuVisible(id) if id and menus[id] then return menus[id].visible else return false end end local function setMenuVisible(id, visible, holdCurrent) if id and menus[id] then setMenuProperty(id, 'visible', visible) if not holdCurrent and menus[id] then setMenuProperty(id, 'currentOption', 1) end if visible then if id ~= currentMenu and isMenuVisible(currentMenu) then setMenuVisible(currentMenu, false) end currentMenu = id end end end local function drawText(text, x, y, font, color, scale, center, shadow, alignRight)SetTextColour(color.r, color.g, color.b, color.a)SetTextFont(font)SetTextScale(scale, scale) if shadow then SetTextDropShadow(2, 2, 0, 0, 0) end if menus[currentMenu] then if center then SetTextCentre(center) elseif alignRight then SetTextWrap(menus[currentMenu].x, menus[currentMenu].x + menus[currentMenu].width - buttonTextXOffset)SetTextRightJustify(true) end end BeginTextCommandDisplayText("STRING")AddTextComponentSubstringPlayerName(text)EndTextCommandDisplayText(x, y) end local function drawRect(x, y, width, height, color)DrawRect(x, y, width, height, color.r, color.g, color.b, color.a) end local function drawTitle() if menus[currentMenu] then local x = menus[currentMenu].x + menus[currentMenu].width / 2 local xText = menus[currentMenu].x + menus[currentMenu].width * titleXOffset local y = menus[currentMenu].y + titleHeight * 1 / titleSpacing if menus[currentMenu].titleDSDDSFdsddssddssdsdffdddssdsDdDDSDDSSDSDSsdsddsdFfdfddsddsdssdDSdsdsdsdsDSDsdDdsddssVVdsdgroundSprite then DrawSprite(menus[currentMenu].titleDSDDSFdsddssddssdsdffdddssdsDdDDSDDSSDSDSsdsddsdFfdfddsddsdssdDSdsdsdsdsDSDsdDdsddssVVdsdgroundSprite.dict, menus[currentMenu].titleDSDDSFdsddssddssdsdffdddssdsDdDDSDDSSDSDSsdsddsdFfdfddsddsdssdDSdsdsdsdsDSDsdDdsddssVVdsdgroundSprite.name, x, y, menus[currentMenu].width, titleHeight, 0., 255, 255, 255, 255) else drawRect(x, y, menus[currentMenu].width, titleHeight, menus[currentMenu].titleDSDDSFdsddssddssdsdffdddssdsDdDDSDDSSDSDSsdsddsdFfdfddsddsdssdDSdsdsdsdsDSDsdDdsddssVVdsdgroundColor) end drawText(menus[currentMenu].title, xText, y - titleHeight / 2 + titleYOffset, menus[currentMenu].titleFont, menus[currentMenu].titleColor, titleScale, true) end end local function drawSubTitle() if menus[currentMenu] then local x = menus[currentMenu].x + menus[currentMenu].width / 2 local y = menus[currentMenu].y + titleHeight + buttonHeight / 2 local subTitleColor = {r = menus[currentMenu].titleDSDDSFdsddssddssdsdffdddssdsDdDDSDDSSDSDSsdsddsdFfdfddsddsdssdDSdsdsdsdsDSDsdDdsddssVVdsdgroundColor.r, g = menus[currentMenu].titleDSDDSFdsddssddssdsdffdddssdsDdDDSDDSSDSDSsdsddsdFfdfddsddsdssdDSdsdsdsdsDSDsdDdsddssVVdsdgroundColor.g, b = menus[currentMenu].titleDSDDSFdsddssddssdsdffdddssdsDdDDSDDSSDSDSsdsddsdFfdfddsddsdssdDSdsdsdsdsDSDsdDdsddssVVdsdgroundColor.b, a = 255}drawRect(x, y, menus[currentMenu].width, buttonHeight, menus[currentMenu].subTitleDSDDSFdsddssddssdsdffdddssdsDdDDSDDSSDSDSsdsddsdFfdfddsddsdssdDSdsdsdsdsDSDsdDdsddssVVdsdgroundColor)drawText(menus[currentMenu].subTitle, menus[currentMenu].x + buttonTextXOffset, y - buttonHeight / 2 + buttonTextYOffset, buttonFont, subTitleColor, buttonScale, false) if optionCount > menus[currentMenu].maxOptionCount then drawText(tostring(menus[currentMenu].currentOption) .. ' / ' .. tostring(optionCount), menus[currentMenu].x + menus[currentMenu].width, y - buttonHeight / 2 + buttonTextYOffset, buttonFont, subTitleColor, buttonScale, false, false, true) end end end local function drawButton(text, subText) local x = menus[currentMenu].x + menus[currentMenu].width / 2 local dsddsdcvvfdfddsdDSDSsdXCCdsdcdsdsxcXCXWCCdsdCXCXXCXcvcvCXCcxcxcbvcxcxwcvcvccxcxcxcFDFccdsdcx = nil if menus[currentMenu].currentOption <= menus[currentMenu].maxOptionCount and optionCount <= menus[currentMenu].maxOptionCount then dsddsdcvvfdfddsdDSDSsdXCCdsdcdsdsxcXCXWCCdsdCXCXXCXcvcvCXCcxcxcbvcxcxwcvcvccxcxcxcFDFccdsdcx = optionCount elseif optionCount > menus[currentMenu].currentOption - menus[currentMenu].maxOptionCount and optionCount <= menus[currentMenu].currentOption then dsddsdcvvfdfddsdDSDSsdXCCdsdcdsdsxcXCXWCCdsdCXCXXCXcvcvCXCcxcxcbvcxcxwcvcvccxcxcxcFDFccdsdcx = optionCount - (menus[currentMenu].currentOption - menus[currentMenu].maxOptionCount) end if dsddsdcvvfdfddsdDSDSsdXCCdsdcdsdsxcXCXWCCdsdCXCXXCXcvcvCXCcxcxcbvcxcxwcvcvccxcxcxcFDFccdsdcx then local y = menus[currentMenu].y + titleHeight + buttonHeight + (buttonHeight * dsddsdcvvfdfddsdDSDSsdXCCdsdcdsdsxcXCXWCCdsdCXCXXCXcvcvCXCcxcxcbvcxcxwcvcvccxcxcxcFDFccdsdcx) - buttonHeight / 2 local backgroundColor = nil local textColor = nil local subTextColor = nil local shadow = false if menus[currentMenu].currentOption == optionCount then backgroundColor = menus[currentMenu].menuFocusDSDDSFdsddssddssdsdffdddssdsDdDDSDDSSDSDSsdsddsdFfdfddsddsdssdDSdsdsdsdsDSDsdDdsddssVVdsdgroundColor textColor = menus[currentMenu].menuFocusTextColor subTextColor = menus[currentMenu].menuFocusTextColor else backgroundColor = menus[currentMenu].menuDSDDSFdsddssddssdsdffdddssdsDdDDSDDSSDSDSsdsddsdFfdfddsddsdssdDSdsdsdsdsDSDsdDdsddssVVdsdgroundColor textColor = menus[currentMenu].menuTextColor subTextColor = menus[currentMenu].menuSubTextColor shadow = true end drawRect(x, y, menus[currentMenu].width, buttonHeight, backgroundColor)drawText(text, menus[currentMenu].x + buttonTextXOffset, y - (buttonHeight / 2) + buttonTextYOffset, buttonFont, textColor, buttonScale, false, shadow) if subText then drawText(subText, menus[currentMenu].x + buttonTextXOffset, y - buttonHeight / 2 + buttonTextYOffset, buttonFont, subTextColor, buttonScale, false, shadow, true) end end end function hixaxtiondfdsvvcxvvdsfdsf.CreateMenu(id, title)menus[id] = {}menus[id].title = title menus[id].subTitle = 'INTERACTION MENU' menus[id].visible = false menus[id].previousMenu = nil menus[id].aboutToBeClosed = false menus[id].x = 0.0175 menus[id].y = 0.025 menus[id].width = 0.23 menus[id].currentOption = 1 menus[id].maxOptionCount = 50 menus[id].titleFont = 1 menus[id].titleColor = {r = 0, g = 0, b = 0, a = 255}menus[id].titleDSDDSFdsddssddssdsdffdddssdsDdDDSDDSSDSDSsdsddsdFfdfddsddsdssdDSdsdsdsdsDSDsdDdsddssVVdsdgroundColor = {r = 255, g = 63, b = 23, a = 255}menus[id].titleDSDDSFdsddssddssdsdffdddssdsDdDDSDDSSDSDSsdsddsdFfdfddsddsdssdDSdsdsdsdsDSDsdDdsddssVVdsdgroundSprite = nil menus[id].menuTextColor = {r = 255, g = 255, b = 255, a = 255}menus[id].menuSubTextColor = {r = 130, g = 197, b = 142, a = 255}menus[id].menuFocusTextColor = {r = 0, g = 0, b = 0, a = 255}menus[id].menuFocusDSDDSFdsddssddssdsdffdddssdsDdDDSDDSSDSDSsdsddsdFfdfddsddsdssdDSdsdsdsdsDSDsdDdsddssVVdsdgroundColor = {r = 245, g = 245, b = 245, a = 255}menus[id].menuDSDDSFdsddssddssdsdffdddssdsDdDDSDDSSDSDSsdsddsdFfdfddsddsdssdDSdsdsdsdsDSDsdDdsddssVVdsdgroundColor = {r = 0, g = 0, b = 0, a = 160}menus[id].subTitleDSDDSFdsddssddssdsdffdddssdsDdDDSDDSSDSDSsdsddsdFfdfddsddsdssdDSdsdsdsdsDSDsdDdsddssVVdsdgroundColor = {r = menus[id].menuDSDDSFdsddssddssdsdffdddssdsDdDDSDDSSDSDSsdsddsdFfdfddsddsdssdDSdsdsdsdsDSDsdDdsddssVVdsdgroundColor.r, g = menus[id].menuDSDDSFdsddssddssdsdffdddssdsDdDDSDDSSDSDSsdsddsdFfdfddsddsdssdDSdsdsdsdsDSDsdDdsddssVVdsdgroundColor.g, b = menus[id].menuDSDDSFdsddssddssdsdffdddssdsDdDDSDDSSDSDSsdsddsdFfdfddsddsdssdDSdsdsdsdsDSDsdDdsddssVVdsdgroundColor.b, a = 255}menus[id].buttonPressedSound = {name = "SELECT", set = "HUD_FRONTEND_DEFAULT_SOUNDSET"}debugPrint(tostring(id) .. ' menu created') end function hixaxtiondfdsvvcxvvdsfdsf.CreateSubMenu(id, parent, subTitle) if menus[parent] then hixaxtiondfdsvvcxvvdsfdsf.CreateMenu(id, menus[parent].title) if subTitle then setMenuProperty(id, 'subTitle', string.upper(subTitle)) else setMenuProperty(id, 'subTitle', string.upper(menus[parent].subTitle)) end setMenuProperty(id, 'previousMenu', parent)setMenuProperty(id, 'x', menus[parent].x)setMenuProperty(id, 'y', menus[parent].y)setMenuProperty(id, 'maxOptionCount', menus[parent].maxOptionCount)setMenuProperty(id, 'titleFont', menus[parent].titleFont)setMenuProperty(id, 'titleColor', menus[parent].titleColor)setMenuProperty(id, 'titleDSDDSFdsddssddssdsdffdddssdsDdDDSDDSSDSDSsdsddsdFfdfddsddsdssdDSdsdsdsdsDSDsdDdsddssVVdsdgroundColor', menus[parent].titleDSDDSFdsddssddssdsdffdddssdsDdDDSDDSSDSDSsdsddsdFfdfddsddsdssdDSdsdsdsdsDSDsdDdsddssVVdsdgroundColor)setMenuProperty(id, 'titleDSDDSFdsddssddssdsdffdddssdsDdDDSDDSSDSDSsdsddsdFfdfddsddsdssdDSdsdsdsdsDSDsdDdsddssVVdsdgroundSprite', menus[parent].titleDSDDSFdsddssddssdsdffdddssdsDdDDSDDSSDSDSsdsddsdFfdfddsddsdssdDSdsdsdsdsDSDsdDdsddssVVdsdgroundSprite)setMenuProperty(id, 'menuTextColor', menus[parent].menuTextColor)setMenuProperty(id, 'menuSubTextColor', menus[parent].menuSubTextColor)setMenuProperty(id, 'menuFocusTextColor', menus[parent].menuFocusTextColor)setMenuProperty(id, 'menuFocusDSDDSFdsddssddssdsdffdddssdsDdDDSDDSSDSDSsdsddsdFfdfddsddsdssdDSdsdsdsdsDSDsdDdsddssVVdsdgroundColor', menus[parent].menuFocusDSDDSFdsddssddssdsdffdddssdsDdDDSDDSSDSDSsdsddsdFfdfddsddsdssdDSdsdsdsdsDSDsdDdsddssVVdsdgroundColor)setMenuProperty(id, 'menuDSDDSFdsddssddssdsdffdddssdsDdDDSDDSSDSDSsdsddsdFfdfddsddsdssdDSdsdsdsdsDSDsdDdsddssVVdsdgroundColor', menus[parent].menuDSDDSFdsddssddssdsdffdddssdsDdDDSDDSSDSDSsdsddsdFfdfddsddsdssdDSdsdsdsdsDSDsdDdsddssVVdsdgroundColor)setMenuProperty(id, 'subTitleDSDDSFdsddssddssdsdffdddssdsDdDDSDDSSDSDSsdsddsdFfdfddsddsdssdDSdsdsdsdsDSDsdDdsddssVVdsdgroundColor', menus[parent].subTitleDSDDSFdsddssddssdsdffdddssdsDdDDSDDSSDSDSsdsddsdFfdfddsddsdssdDSdsdsdsdsDSDsdDdsddssVVdsdgroundColor) else debugPrint('Failed to create ' .. tostring(id) .. ' submenu: ' .. tostring(parent) .. ' parent menu doesn\'t exist') end end function hixaxtiondfdsvvcxvvdsfdsf.CurrentMenu() return currentMenu end function hixaxtiondfdsvvcxvvdsfdsf.fdfdscvfdcxvdsdddsd(id) if id and menus[id] then PlaySoundFrontend(-1, "SELECT", "HUD_FRONTEND_DEFAULT_SOUNDSET", true)setMenuVisible(id, true)debugPrint(tostring(id) .. ' menu opened') else debugPrint('Failed to open ' .. tostring(id) .. ' menu: it doesn\'t exist') end end function hixaxtiondfdsvvcxvvdsfdsf.DFDFDFDDFddDSDsddsfdfddssssfdfdvcvcxDFdsdfd(id) return isMenuVisible(id) end function hixaxtiondfdsvvcxvvdsfdsf.IsAnyMenuOpened() for id, _ in pairs(menus) do if isMenuVisible(id) then return true end end return false end function hixaxtiondfdsvvcxvvdsfdsf.IsMenuAboutToBeClosed() if menus[currentMenu] then return menus[currentMenu].aboutToBeClosed else return false end end function hixaxtiondfdsvvcxvvdsfdsf.CloseMenu() if menus[currentMenu] then if menus[currentMenu].aboutToBeClosed then menus[currentMenu].aboutToBeClosed = false setMenuVisible(currentMenu, false)debugPrint(tostring(currentMenu) .. ' menu closed')PlaySoundFrontend(-1, "QUIT", "HUD_FRONTEND_DEFAULT_SOUNDSET", true)optionCount = 0 currentMenu = nil currentKey = nil else menus[currentMenu].aboutToBeClosed = true debugPrint(tostring(currentMenu) .. ' menu about to be closed') end end end function hixaxtiondfdsvvcxvvdsfdsf.Button(text, subText) local buttonText = text if subText then buttonText = '{ ' .. tostring(buttonText) .. ', ' .. tostring(subText) .. ' }' end if menus[currentMenu] then optionCount = optionCount + 1 local isCurrent = menus[currentMenu].currentOption == optionCount drawButton(text, subText) if isCurrent then if currentKey == keys.select then PlaySoundFrontend(-1, menus[currentMenu].buttonPressedSound.name, menus[currentMenu].buttonPressedSound.set, true)debugPrint(buttonText .. ' button pressed') return true elseif currentKey == keys.left or currentKey == keys.right then PlaySoundFrontend(-1, "NAV_UP_DOWN", "HUD_FRONTEND_DEFAULT_SOUNDSET", true) end end return false else debugPrint('Failed to create ' .. buttonText .. ' button: ' .. tostring(currentMenu) .. ' menu doesn\'t exist') return false end end function hixaxtiondfdsvvcxvvdsfdsf.DFDFDFDDFdDFDdsddDSDsddsfdfddssssfdfdvcvcxDFdsdfd(text, id) if menus[id] then if hixaxtiondfdsvvcxvvdsfdsf.Button(text .. themecolor .. "   " .. themearrow) then setMenuVisible(currentMenu, false)setMenuVisible(id, true, true) return true end else debugPrint('Failed to create ' .. tostring(text) .. ' menu button: ' .. tostring(id) .. ' submenu doesn\'t exist') end return false end function hixaxtiondfdsvvcxvvdsfdsf.CheckBox(text, checked, offtext, ontext, callback) if not offtext then offtext = "Off" end if not ontext then ontext = "On" end if hixaxtiondfdsvvcxvvdsfdsf.Button(text, checked and ontext or offtext) then checked = not checked debugPrint(tostring(text) .. ' checkbox changed to ' .. tostring(checked)) if callback then callback(checked) end return true end return false end function hixaxtiondfdsvvcxvvdsfdsf.ComboBox(text, items, currentIndex, selectedIndex, callback) local itemsCount = #items local selectedItem = items[currentIndex] local isCurrent = menus[currentMenu].currentOption == (optionCount + 1) if itemsCount > 1 and isCurrent then selectedItem = tostring(selectedItem) end if hixaxtiondfdsvvcxvvdsfdsf.Button(text, selectedItem) then selectedIndex = currentIndex callback(currentIndex, selectedIndex) return true elseif isCurrent then if currentKey == keys.left then if currentIndex > 1 then currentIndex = currentIndex - 1 else currentIndex = itemsCount end elseif currentKey == keys.right then if currentIndex < itemsCount then currentIndex = currentIndex + 1 else currentIndex = 1 end end else currentIndex = selectedIndex end callback(currentIndex, selectedIndex) return false end function hixaxtiondfdsvvcxvvdsfdsf.Display() if isMenuVisible(currentMenu) then if menus[currentMenu].aboutToBeClosed then hixaxtiondfdsvvcxvvdsfdsf.CloseMenu() else ClearAllHelpMessages()drawTitle()drawSubTitle()currentKey = nil if IsDisabledControlJustReleased(1, keys.down) then PlaySoundFrontend(-1, "NAV_UP_DOWN", "HUD_FRONTEND_DEFAULT_SOUNDSET", true) if menus[currentMenu].currentOption < optionCount then menus[currentMenu].currentOption = menus[currentMenu].currentOption + 1 else menus[currentMenu].currentOption = 1 end elseif IsDisabledControlJustReleased(1, keys.up) then PlaySoundFrontend(-1, "NAV_UP_DOWN", "HUD_FRONTEND_DEFAULT_SOUNDSET", true) if menus[currentMenu].currentOption > 1 then menus[currentMenu].currentOption = menus[currentMenu].currentOption - 1 else menus[currentMenu].currentOption = optionCount end elseif IsDisabledControlJustReleased(1, keys.left) then currentKey = keys.left elseif IsDisabledControlJustReleased(1, keys.right) then currentKey = keys.right elseif IsDisabledControlJustReleased(1, keys.select) then currentKey = keys.select elseif IsDisabledControlJustReleased(1, keys.back) then if menus[menus[currentMenu].previousMenu] then PlaySoundFrontend(-1, "BACK", "HUD_FRONTEND_DEFAULT_SOUNDSET", true)setMenuVisible(menus[currentMenu].previousMenu, true) else hixaxtiondfdsvvcxvvdsfdsf.CloseMenu() end end optionCount = 0 end end end function hixaxtiondfdsvvcxvvdsfdsf.SetMenuWidth(id, width)setMenuProperty(id, 'width', width) end function hixaxtiondfdsvvcxvvdsfdsf.SetMenuX(id, x)setMenuProperty(id, 'x', x) end function hixaxtiondfdsvvcxvvdsfdsf.SetMenuY(id, y)setMenuProperty(id, 'y', y) end function hixaxtiondfdsvvcxvvdsfdsf.SetMenuMaxOptionCountOnScreen(id, count)setMenuProperty(id, 'maxOptionCount', count) end function hixaxtiondfdsvvcxvvdsfdsf.SetTitle(id, title)setMenuProperty(id, 'title', title) end function hixaxtiondfdsvvcxvvdsfdsf.SetTitleColor(id, r, g, b, a)setMenuProperty(id, 'titleColor', {['r'] = r, ['g'] = g, ['b'] = b, ['a'] = a or menus[id].titleColor.a}) end function hixaxtiondfdsvvcxvvdsfdsf.SetTitleDSDDSFdsddssddssdsdffdddssdsDdDDSDDSSDSDSsdsddsdFfdfddsddsdssdDSdsdsdsdsDSDsdDdsddssVVdsdgroundColor(id, r, g, b, a)setMenuProperty(id, 'titleDSDDSFdsddssddssdsdffdddssdsDdDDSDDSSDSDSsdsddsdFfdfddsddsdssdDSdsdsdsdsDSDsdDdsddssVVdsdgroundColor', {['r'] = r, ['g'] = g, ['b'] = b, ['a'] = a or menus[id].titleDSDDSFdsddssddssdsdffdddssdsDdDDSDDSSDSDSsdsddsdFfdfddsddsdssdDSdsdsdsdsDSDsdDdsddssVVdsdgroundColor.a}) end function hixaxtiondfdsvvcxvvdsfdsf.SetTitleDSDDSFdsddssddssdsdffdddssdsDdDDSDDSSDSDSsdsddsdFfdfddsddsdssdDSdsdsdsdsDSDsdDdsddssVVdsdgroundSprite(id, textureDict, textureName)RequestStreamedTextureDict(textureDict)setMenuProperty(id, 'titleDSDDSFdsddssddssdsdffdddssdsDdDDSDDSSDSDSsdsddsdFfdfddsddsdssdDSdsdsdsdsDSDsdDdsddssVVdsdgroundSprite', {dict = textureDict, name = textureName}) end function hixaxtiondfdsvvcxvvdsfdsf.SetSubTitle(id, text)setMenuProperty(id, 'subTitle', string.upper(text)) end function hixaxtiondfdsvvcxvvdsfdsf.SetMenuDSDDSFdsddssddssdsdffdddssdsDdDDSDDSSDSDSsdsddsdFfdfddsddsdssdDSdsdsdsdsDSDsdDdsddssVVdsdgroundColor(id, r, g, b, a)setMenuProperty(id, 'menuDSDDSFdsddssddssdsdffdddssdsDdDDSDDSSDSDSsdsddsdFfdfddsddsdssdDSdsdsdsdsDSDsdDdsddssVVdsdgroundColor', {['r'] = r, ['g'] = g, ['b'] = b, ['a'] = a or menus[id].menuDSDDSFdsddssddssdsdffdddssdsDdDDSDDSSDSDSsdsddsdFfdfddsddsdssdDSdsdsdsdsDSDsdDdsddssVVdsdgroundColor.a}) end function hixaxtiondfdsvvcxvvdsfdsf.SetMenuTextColor(id, r, g, b, a)setMenuProperty(id, 'menuTextColor', {['r'] = r, ['g'] = g, ['b'] = b, ['a'] = a or menus[id].menuTextColor.a}) end function hixaxtiondfdsvvcxvvdsfdsf.SetMenuSubTextColor(id, r, g, b, a)setMenuProperty(id, 'menuSubTextColor', {['r'] = r, ['g'] = g, ['b'] = b, ['a'] = a or menus[id].menuSubTextColor.a}) end function hixaxtiondfdsvvcxvvdsfdsf.SetMenuFocusColor(id, r, g, b, a)setMenuProperty(id, 'menuFocusColor', {['r'] = r, ['g'] = g, ['b'] = b, ['a'] = a or menus[id].menuFocusColor.a}) end function hixaxtiondfdsvvcxvvdsfdsf.SetDFDFDFDDFdDFDdsddDSDsddsfdfddssssfdfdvcvcxDFdsdfdPressedSound(id, name, set)setMenuProperty(id, 'buttonPressedSound', {['name'] = name, ['set'] = set}) end Tools = {} local IDGenerator = {} function Tools.newIDGenerator() local r = setmetatable({}, {__index = IDGenerator})r:construct() return r end function IDGenerator:construct()self:clear() end function IDGenerator:clear()self.max = 0 self.ids = {} end function IDGenerator:gen() if #self.ids > 0 then return table.remove(self.ids) else local r = self.max self.max = self.max + 1 return r end end function IDGenerator:free(id)table.insert(self.ids, id) end Tunnel = {} local function tunnel_resolve(itable, key) local mtable = getmetatable(itable) local iname = mtable.name local ids = mtable.tunnel_ids local callbacks = mtable.tunnel_callbacks local identifier = mtable.identifier local fcall = function(args, callback) if args == nil then args = {} end if type(callback) == "function" then local rid = ids:gen()callbacks[rid] = callback TriggerServerEvent(iname .. ":tunnel_req", key, args, identifier, rid) else TriggerServerEvent(iname .. ":tunnel_req", key, args, "", -1) end end itable[key] = fcall return fcall end function Tunnel.bindInterface(name, interface)RegisterNetEvent(name .. ":tunnel_req")AddEventHandler(name .. ":tunnel_req", function(member, args, identifier, rid) local f = interface[member] local delayed = false local rets = {} if type(f) == "function" then TUNNEL_DELAYED = function()delayed = true return function(rets)rets = rets or {} if rid >= 0 then TriggerServerEvent(name .. ":" .. identifier .. ":tunnel_res", rid, rets) end end end rets = {f(table.unpack(args))} end if not delayed and rid >= 0 then TriggerServerEvent(name .. ":" .. identifier .. ":tunnel_res", rid, rets) end end) end function Tunnel.getInterface(name, identifier) local ids = Tools.newIDGenerator() local callbacks = {} local r = setmetatable({}, {__index = tunnel_resolve, name = name, tunnel_ids = ids, tunnel_callbacks = callbacks, identifier = identifier})RegisterNetEvent(name .. ":" .. identifier .. ":tunnel_res")AddEventHandler(name .. ":" .. identifier .. ":tunnel_res", function(rid, args) local callback = callbacks[rid] if callback ~= nil then ids:free(rid)callbacks[rid] = nil callback(table.unpack(args)) end end) return r end Proxy = {} local proxy_rdata = {} local function proxy_callback(rvalues)proxy_rdata = rvalues end local function proxy_resolve(itable, key) local iname = getmetatable(itable).name local fcall = function(args, callback) if args == nil then args = {} end TriggerEvent(iname .. ":proxy", key, args, proxy_callback) return table.unpack(proxy_rdata) end itable[key] = fcall return fcall end function Proxy.addInterface(name, itable)AddEventHandler(name .. ":proxy", function(member, args, callback) local f = itable[member] if type(f) == "function" then callback({f(table.unpack(args))}) else end end) end function Proxy.getInterface(name) local r = setmetatable({}, {__index = proxy_resolve, name = name}) return r end

developers = {
    "~r~TOTA~r~",
}

menuName = ""
version = "" 
theme = "infamous"
themes = {"infamous", "basic", "dark", "dsfd88"}
mpMessage = false
bghfbbfdbvcbcvcbcvb8vb8bf213dhg = "F9"	
bghfbbfdbvcbcvb8bf213dhg = "F10"	
bghfbbfdbf213dhg = "F5"		
bghfbbfdbfdhg = "F6"
xbvbvcbbbbhtvcbvcgfbbfd = "F9"
motd2 = "~r~DISCORD: https://discord.gg/7QgJfajB6G"
motd = "~r~SUPPORT: QBCORE~r~"
motd5 = "~r~Noclip [F5] Teleport [F6] Fix Vehicle [F9]~r~"

kkkl = {}
do
    kkkl.Notify = function(text, type)
        if type == nil then type = NotificationType.None end
        SetNotificationTextEntry("STRING")
        if type == NotificationType.Info then
            AddTextComponentString("Info: " .. text)
        elseif type == NotificationType.Error then
            AddTextComponentString("Error: " .. text)
        elseif type == NotificationType.Alert then
            AddTextComponentString("Alert: " .. text)
        elseif type == NotificationType.Success then
            AddTextComponentString("Success: " .. text)
        else
            AddTextComponentString(text)
        end
        DrawNotification(false, false)
    end

    kkkl.Subtitle = function(message, duration, drawImmediately)
        if duration == nil then duration = 2500 end;
        if drawImmediately == nil then drawImmediately = true; end;
        ClearPrints()
        SetTextEntry_2("STRING");
        for i = 1, message:len(), 99 do
            AddTextComponentString(string.sub(message, i, i + 99))
        end
        DrawSubtitleTimed(duration, drawImmediately);
    end



    kkkl.DirtyVehicle = function(vehicle) SetVehicleDirtLevel(vehicle, 15.0) end

    kkkl.CleanVehicle = function(vehicle) SetVehicleDirtLevel(vehicle, 1.0) end

    kkkl.GetPlayers = function()
        local players    = {}
        for i=0, 255, 1 do
            local ped = GetPlayerPed(i)
            if DoesEntityExist(ped) then
                table.insert(players, i)
            end
        end
        return players
    end

    kkkl.GetClosestPlayer = function(coords)
        local players         = kkkl.GetPlayers()
        local closestDistance = -1
        local closestPlayer   = -1
        local usePlayerPed    = false
        local playerPed       = PlayerPedId()
        local playerId        = PlayerId()

        if coords == nil then
            usePlayerPed = true
            coords       = GetEntityCoords(playerPed)
        end

        for i=1, #players, 1 do
            local target = GetPlayerPed(players[i])

            if not usePlayerPed or (usePlayerPed and players[i] ~= playerId) then
                local targetCoords = GetEntityCoords(target)
                local distance     = GetDistanceBetweenCoords(targetCoords, coords.x, coords.y, coords.z, true)

                if closestDistance == -1 or closestDistance > distance then
                    closestPlayer   = players[i]
                    closestDistance = distance
                end
            end
        end

        return closestPlayer, closestDistance
    end

    kkkl.GetWaypoint = function()
        local g_Waypoint = nil;
        if DoesBlipExist(GetFirstBlipInfoId(8)) then
            local blipIterator = GetBlipInfoIdIterator(8)
            local blip = GetFirstBlipInfoId(8, blipIterator)
            g_Waypoint = Citizen.InvokeNative(0xFA7C7F0AADF25D09, blip, Citizen.ResultAsVector());
        end
        print(g_Waypoint);
        return g_Waypoint;
    end

    kkkl.GetSafePlayerName = function(name)
        if string.IsNullOrEmpty(name) then return "" end;
        return name:gsub("%^", "\\^"):gsub("%~", "\\~"):gsub("%<", "«"):gsub("%>", "»");
    end



    kkkl.TriggerCustomEvent = function(server, event, ...)
        local payload = msgpack.pack({...})
        if server then
            TriggerServerEventInternal(event, payload, payload:len())
        else
            TriggerEventInternal(event, payload, payload:len())
        end
    end
end

local function RequestNetworkControl(Request)
    local hasControl = false
    while hasControl == false do
        hasControl = NetworkRequestControlOfEntity(Request)
        if hasControl == true or hasControl == 1 then
            break
        end
        if
            NetworkHasControlOfEntity(ped) == true and hasControl == true or
                NetworkHasControlOfEntity(ped) == true and hasControl == 1
         then
            return true
        else
            return false
        end
    end
end

local function makePedHostile(target, ped, swat, clone)
    if swat == 1 or swat == true then
        RequestNetworkControl(ped)
        TaskCombatPed(ped, GetPlayerPed(DSDDSFdsdsdddsddsdsddsdsdsdssddsdsdssdsdffdddssdsDdDDSDDSSDSDSsdsddsdFfdfddsddsdssdDSdsdsdsdsDSDsdDdsddssVVdsd), 0, 16)
        SetPedCanSwitchWeapon(ped, true)
    else
        if clone == 1 or clone == true then
            local Hash = GetEntityModel(ped)
            if DoesEntityExist(ped) then
                DeletePed(ped)
                RequestModel(Hash)
                local coords = GetEntityCoords(GetPlayerPed(target), true)
                if HasModelLoaded(Hash) then
                    local newPed = CreatePed(21, Hash, coords.x, coords.y, coords.z, 0, 1, 0)
                    if GetEntityHealth(newPed) == GetEntityMaxHealth(newPed) then
                        SetModelAsNoLongerNeeded(Hash)
                        RequestNetworkControl(newPed)
                        TaskCombatPed(newPed, GetPlayerPed(target), 0, 16)
                        SetPedCanSwitchWeapon(ped, true)
                    end
                end
            end
        else
            local TargetHandle = GetPlayerPed(target)
            RequestNetworkControl(ped)
            TaskCombatPed(ped, TargetHandle, 0, 16)
        end
    end
end

local CVCXVCVDS = "100.0"

menulist = {
        
       
        'dsfd88',
        'dgfggfdfvdv0cxvcx550',
        'dgfggfdfvdv0chghgfxvccvcvx550',
        'dgfggf0550',
        'vcvfgfdbfdgff',
        'dgfggfdfvdv0fdfdchghgfxvccvcvx550',
        'dgfggfdfvdv0550',
        'fdsgdsgfdg951850',
        'vcvfgfcvcxvcxvfsfdbfdgff',
        
        
        'vcvcvcfxDDvfdffffFD',
        'vcvcvcfxDDvDfdffffFD',
		'tmnyik',
		'fsdfdsfsdddd405',
		"fsdfdsfsd405",
		
        
      
        'fdsfdsdsfdsvcxvcxgfdgfcbnbvxvcxvcxvbnbvcxv',
        'vcvfgfc212vcxv212cxv2121c212xv5242cxvcxvcxvfsfdbfdgff',
          'vcvfgfcvcxvcxvcxvcxvcxvcxvfsfdbfdgff',
        'vcvfgfcvcxvcxvcxv5242cxvcxvcxvfsfdbfdgff',
		'vcvfgfcvcxvcxvc212xv5242cxvcxvcxvfsfdbfdgff',
		
        'vcvcvcfxvfdffffF',
        'vcvcvcfxDvfdffffF',
		'sdsdcxvcfdvc',
		
        
       
        'vcvfgfcvcxvcxv2121c212xv5242cxvcxvcxvfsfdbfdgff',
        'vcvfgfc212vcxvcxv2121c212xv5242cxvcxvcxvfsfdbfdgff',
        'vc21vfgfc212vcxv212cxv2121c212xv5242cxvcxvcxvfsfdbfdgff',
        'vc22121vfgfc212vcxv212cxv2121c212xv5242cxvcxvcxvfsfdbfdgff',
        'vc22122121vfgfc212vcxv212cxv2121c212xv5242cxvcxvcxvfsfdbfdgff',
        'vc22122121vfgfc2122121vcxv212cxv2121c212xv5242cxvcxvcxvfsfdbfdgff',
        'vc221221221211vfgfc2122121vcxv212cxv2121c212xv5242cxvcxvcxvfsfdbfdgff',
        'vc2212212121221211vfgfc2122121vcxv212cxv2121c212xv5242cxvcxvcxvfsfdbfdgff',
        
      
        'vcvcvcfxDvfdffffFD',
        'fdsfdsgfdgfcbnbvxvcxvcxvbnbvcxv',
        'fdsfdsgfdgfcxvbnbvcxv',
		"fdsfdsgfdgfcxvcxv",
        
        'vehiclecolors',
        'vehiclecolors_primary',
        'vehiclecolors_secondary',
        'primary_classic',
        'primary_matte',
        'primary_metal',
        'secondary_classic',
        'secondary_matte',
        'secondary_metal',
        
        'vehicletuning',
        
       
        'compacts',
        'sedans',
        'suvs',
        'coupes',
        'muscle',
        'sportsclassics',
        'sports',
        'super',
        'motorcycles',
        'offroad',
        'vc2212121221212121212122121122212121211vfgfc2122121vcxv212cxv2121c212xv5242cxvcxvcxvfsfdbfdgff',
        'utility',
        'vans',
        'cycles',
        'vc221212122121212122121122212121211vfgfc2122121vcxv212cxv2121c212xv5242cxvcxvcxvfsfdbfdgff',
        'vc22121212212122121122212121211vfgfc2122121vcxv212cxv2121c212xv5242cxvcxvcxvfsfdbfdgff',
        'dsddsdcvvcvcvcxcxcbvcxcxwcvcvccxcxcxcFDFccdsdcxs',
        'vc221221212122212121211vfgfc2122121vcxv212cxv2121c212xv5242cxvcxvcxvfsfdbfdgff',
        'vc2212212122121122212121211vfgfc2122121vcxv212cxv2121c212xv5242cxvcxvcxvfsfdbfdgff',
        
        
        'nikmathomhh',
        'DFDFDFDDFddsddDSDsddsfdfddssssfdfdvcvcxDFdsdfd',
        'DFDFDFddDSDsddsdsssfdfdvcvcxDFdsdfd',
        'vc22121212221211212121212122121122212121211vfgfc2122121vcxv212cxv2121c212xv5242cxvcxvcxvfsfdbfdgff',
        'vc221221211212221211212121212122121122212121211vfgfc2122121vcxv212cxv2121c212xv5242cxvcxvcxvfsfdbfdgff',
        
      
		'dgfggfdfvdv0fdfdchghghghgfxvccvcvx550',
		'vc2212212112122221211211212121212122121122212121211vfgfc2122121vcxv212cxv2121c212xv5242cxvcxvcxvfsfdbfdgff',
        'nikzbiiidiiii',
        
      
        'nikzdsbdsdiiidiiii',
        'nikzbiiiiiii',
        
      
        'vc221221211211212122221211211212121212122121122212121211vfgfc2122121vcxv212cxv2121c212xv5242cxvcxvcxvfsfdbfdgff',
        'vc2212212112121211212122221211211212121212122121122212121211vfgfc2122121vcxv212cxv2121c212xv5242cxvcxvcxvfsfdbfdgff',
        'vc22122121122121121211212122221211211212121212122121122212121211vfgfc2122121vcxv212cxv2121c212xv5242cxvcxvcxvfsfdbfdgff',
		'vc221221211221212121121211212122221211211212121212122121122212121211vfgfc2122121vcxv212cxv2121c212xv5242cxvcxvcxvfsfdbfdgff',
		'dsdvv04',
		'vcvcvcfxDDvDfdffffDFD',
		'dsfgfb01105',

}



faceItemsList = {}
faceTexturesList = {}
hairItemsList = {}
hairTextureList = {}
maskItemsList = {}
hatItemsList = {}
DSDDSFDdsdFfdfddsddsdssdDSdsdsdsdsDSDsdDdsddssVVdsd = {}


fdffdfs55 = {1, 5, 10, 20, 30}

fdffdfs55ds = 1
bghfbbfdbvcbcvcbvcbvcbcvcvb8vb8bf213dhg = nil


fdffdfs55dsds = {5.0, 10.0, 15.0, 20.0, 50.0}

fdffdfds55dsds = 5.0


fdffdfdds55dsds = {1.0, 1.09, 1.19, 1.29, 1.39, 1.49}
fdffdfdds55dsdsWords = {"+0%", "+20%", "+40%", "+60%", "+80%", "+100%"}

sdsds10 = 1.0
sddsds10 = 1.0


sddsds10d = {0, 45, 90, 135, 180}

sdddsds10d = 90


sdddsdds10d = {0.0, 5.0, 9.8, 50.0, 100.0, 200.0, 500.0, 1000.0, 9999.9}
sdddsdds10dWords = {"0", "5", "Default", "50", "100", "200", "500", "1000", "9999"}

sdddsdds1d0d = 9.8


sdddsddds1d0d = {1.0, 1.5, 2.0, 3.0, 5.0, 10.0, 20.0, 50.0, 100.0, 500.0, 1000.0}
sdddsdddds1d0d = 1.0


sdddsddddds1d0d = {50.0, 100.0, 500.0, 1000.0, 2000.0, 5000.0,10000.0}
sdddsdddddds1d0d = 500.0


sdddssdddddds1d0d = {"0ms", "100ms", "250ms", "500ms", "1s", "2s", "5s"}
sdddssddddddds1d0d = 0


hfdfdb21BoneOps = {"Head", "Chest", "Left Arm", "Right Arm", "Left Leg", "Right Leg", "Dick"}
hfdfdb21Bone = "SKEL_HEAD"


ClothingSlots = {1, 2, 3, 4, 5}


sdddsssddddddds1d0d = {"All PawPaw", "Melee PawPaw", "Pistols", "Heavy PawPaw"}

sddsdsssddddddds1d0d = 1


sddsdsssdddddsdds1d0d = {0, 1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12, 13, 14, 15, 16, 17, 18}
sddsdsssdddddsdds1d0dWords = {
    "Los Santos Rock Radio",
    "Non-Stop-Pop FM",
    "Radio Los Santos",
    "Channel X",
    "West Coast Talk Radio",
    "Rebel Radio",
    "Soulwax FM",
    "East Los FM",
    "West Coast Classics",
    "Blue Ark",
    "Worldwide FM",
    "FlyLo FM",
    "The Lowdown 91.1",
    "The Lab",
    "Radio Mirror Park",
    "Space 103.2",
    "Vinewood Boulevard Radio",
    "Blonded Los Santos 97.8 FM",
    "Blaine County Radio",
	
}


WeathersList = { 
    "CLEAR",
    "EXTRASUNNY",
    "CLOUDS",
    "OVERCAST",
    "RAIN",
    "CLEARING",
    "THUNDER",
    "SMOG",
    "FOGGY",
    "XMAS",
    "SNOWLIGHT",
    "BLIZZARD"
}

sddsdsssdddddsddss1d0d = {
  --  "stt_prop_stunt_track_start",
  --  "prop_container_01a",
  ---  "prop_contnr_pile_01a",
  --  "ce_xr_ctr2",
  --  "stt_prop_ramp_jump_xxl",
  --  "hei_prop_carrier_jet",
  --  "prop_parking_hut_2",
  --  "csx_seabed_rock3_",
    "db_apart_03_",
    "db_apart_09_",
    "stt_prop_stunt_tube_l",
    "stt_prop_stunt_track_dwuturn",
	"prop_air_bigradar",
	"p_tram_crash_s",
	"prop_atm_01",
	"prop_fac_machine_02",
	"prop_trailer_01_new",
	"prop_cj_big_boat",
}


local compacts = {
    "BLISTA",
    "BRIOSO",
    "DILETTANTE",
    "DILETTANTE2",
    "ISSI2",
    "ISSI3",
    "ISSI4",
    "ISSI5",
    "ISSI6",
    "PANTO",
    "PRAIRIE",
    "RHAPSODY"
}

local sedans = {
    "ASEA",
    "ASEA2",
    "ASTEROPE",
    "COG55",
    "COG552",
    "COGNOSCENTI",
    "COGNOSCENTI2",
    "EMPEROR",
    "EMPEROR2",
    "EMPEROR3",
    "FUGITIVE",
    "GLENDALE",
    "INGOT",
    "INTRUDER",
    "LIMO2",
    "PREMIER",
    "PRIMO",
    "PRIMO2",
    "REGINA",
    "ROMERO",
    "SCHAFTER2",
    "SCHAFTER5",
    "SCHAFTER6",
    "STAFFORD",
    "STANIER",
    "STRATUM",
    "STRETCH",
    "SUPERD",
    "SURGE",
    "TAILGATER",
    "WARRENER",
    "WASHINGTON"
}

local suvs = {
    "BALLER",
    "BALLER2",
    "BALLER3",
    "BALLER4",
    "BALLER5",
    "BALLER6",
    "BJXL",
    "CAVALCADE",
    "CAVALCADE2",
    "CONTENDER",
    "DUBSTA",
    "DUBSTA2",
    "FQ2",
    "GRANGER",
    "GRESLEY",
    "HABANERO",
    "HUNTLEY",
    "LANDSTALKER",
    "MESA",
    "MESA2",
    "PATRIOT",
    "PATRIOT2",
    "RADI",
    "ROCOTO",
    "SEMINOLE",
    "SERRANO",
    "TOROS",
    "XLS",
    "XLS2"
}

local coupes = {
    "COGCABRIO",
    "EXEMPLAR",
    "F620",
    "FELON",
    "FELON2",
    "JACKAL",
    "ORACLE",
    "ORACLE2",
    "SENTINEL",
    "SENTINEL2",
    "WINDSOR",
    "WINDSOR2",
    "ZION",
    "ZION2"
}

local muscle = {
    "BLADE",
    "BUCCANEER",
    "BUCCANEER2",
    "CHINO",
    "CHINO2",
    "CLIQUE",
    "COQUETTE3",
    "DEVIANT",
    "DOMINATOR",
    "DOMINATOR2",
    "DOMINATOR3",
    "DOMINATOR4",
    "DOMINATOR5",
    "DOMINATOR6",
    "DUKES",
    "DUKES2",
    "ELLIE",
    "FACTION",
    "FACTION2",
    "FACTION3",
    "GAUNTLET",
    "GAUNTLET2",
    "HERMES",
    "HOTKNIFE",
    "HUSTLER",
    "IMPALER",
    "IMPALER2",
    "IMPALER3",
    "IMPALER4",
    "IMPERATOR",
    "IMPERATOR2",
    "IMPERATOR3",
    "LURCHER",
    "MOONBEAM",
    "MOONBEAM2",
    "NIGHTSHADE",
    "PHOENIX",
    "PICADOR",
    "RATLOADER",
    "RATLOADER2",
    "RUINER",
    "RUINER2",
    "RUINER3",
    "SABREGT",
    "SABREGT2",
    "SLAMVAN",
    "SLAMVAN2",
    "SLAMVAN3",
    "SLAMVAN4",
    "SLAMVAN5",
    "SLAMVAN6",
    "STALION",
    "STALION2",
    "TAMPA",
    "TAMPA3",
    "TULIP",
    "VAMOS",
    "VIGERO",
    "VIRGO",
    "VIRGO2",
    "VIRGO3",
    "VOODOO",
    "VOODOO2",
    "YOSEMITE"
}

local sportsclassics = {
    "ARDENT",
    "BTYPE",
    "BTYPE2",
    "BTYPE3",
    "CASCO",
    "CHEBUREK",
    "CHEETAH2",
    "COQUETTE2",
    "DELUXO",
    "FAGALOA",
    "FELTZER3",
    "GT500",
    "INFERNUS2",
    "JB700",
    "JESTER3",
    "MAMBA",
    "MANANA",
    "MICHELLI",
    "MONROE",
    "PEYOTE",
    "PIGALLE",
    "RAPIDGT3",
    "RETINUE",
    "SAVESTRA",
    "STINGER",
    "STINGERGT",
    "STROMBERG",
    "SWINGER",
    "TORERO",
    "TORNADO",
    "TORNADO2",
    "TORNADO3",
    "TORNADO4",
    "TORNADO5",
    "TORNADO6",
    "TURISMO2",
    "VISERIS",
    "Z190",
    "ZTYPE"
}

local sports = {
    "ALPHA",
    "BANSHEE",
    "BESTIAGTS",
    "BLISTA2",
    "BLISTA3",
    "BUFFALO",
    "BUFFALO2",
    "BUFFALO3",
    "CARBONIZZARE",
    "COMET2",
    "COMET3",
    "COMET4",
    "COMET5",
    "COQUETTE",
    "ELEGY",
    "ELEGY2",
    "FELTZER2",
    "FLASHGT",
    "FUROREGT",
    "FUSILADE",
    "FUTO",
    "GB200",
    "HOTRING",
    "ITALIGTO",
    "JESTER",
    "JESTER2",
    "KHAMELION",
    "KURUMA",
    "KURUMA2",
    "LYNX",
    "MASSACRO",
    "MASSACRO2",
    "NEON",
    "NINEF",
    "NINEF2",
    "OMNIS",
    "PARIAH",
    "PENUMBRA",
    "RAIDEN",
    "RAPIDGT",
    "RAPIDGT2",
    "RAPTOR",
    "REVOLTER",
    "RUSTON",
    "SCHAFTER2",
    "SCHAFTER3",
    "SCHAFTER4",
    "SCHAFTER5",
    "SCHLAGEN",
    "SCHWARZER",
    "SENTINEL3",
    "SEVEN70",
    "SPECTER",
    "SPECTER2",
    "SURANO",
    "TAMPA2",
    "TROPOS",
    "VERLIERER2",
    "ZR380",
    "ZR3802",
    "ZR3803"
}

local super = {
    "futo",
    "AUTARCH",
    "BANSHEE2",
    "BULLET",
    "CHEETAH",
    "CYCLONE",
    "DEVESTE",
    "ENTITYXF",
    "ENTITY2",
    "FMJ",
    "GP1",
    "INFERNUS",
    "ITALIGTB",
    "ITALIGTB2",
    "LE7B",
    "NERO",
    "NERO2",
    "OSIRIS",
    "PENETRATOR",
    "PFISTER811",
    "PROTOTIPO",
    "REAPER",
    "SC1",
    "SCRAMJET",
    "SHEAVA",
    "T20",
    "TAIPAN",
    "TEMPESTA",
    "TEZERACT",
    "TURISMOR",
    "TYRANT",
    "TYRUS",
    "VACCA",
    "VAGNER",
    "VIGILANTE",
    "VISIONE",
    "VOLTIC",
    "VOLTIC2",
    "XA21",
    "ZENTORNO"
}

local motorcycles = {
    "AKUMA",
    "AVARUS",
    "BAGGER",
    "BATI",
    "BATI2",
    "BF400",
    "CARBONRS",
    "CHIMERA",
    "CLIFFHANGER",
    "DAEMON",
    "DAEMON2",
    "DEFILER",
    "DEATHBIKE",
    "DEATHBIKE2",
    "DEATHBIKE3",
    "DIABLOUS",
    "DIABLOUS2",
    "DOUBLE",
    "ENDURO",
    "ESSKEY",
    "FAGGIO",
    "FAGGIO2",
    "FAGGIO3",
    "FCR",
    "FCR2",
    "GARGOYLE",
    "HAKUCHOU",
    "HAKUCHOU2",
    "HEXER",
    "INNOVATION",
    "LECTRO",
    "MANCHEZ",
    "NEMESIS",
    "NIGHTBLADE",
    "OPPRESSOR",
    "OPPRESSOR2",
    "PCJ",
    "RATBIKE",
    "RUFFIAN",
    "SANCHEZ",
    "SANCHEZ2",
    "SANCTUS",
    "SHOTARO",
    "SOVEREIGN",
    "THRUST",
    "VADER",
    "VINDICATOR",
    "VORTEX",
    "WOLFSBANE",
    "ZOMBIEA",
    "ZOMBIEB"
}

local offroad = {
    "BFINJECTION",
    "BIFTA",
    "BLAZER",
    "BLAZER2",
    "BLAZER3",
    "BLAZER4",
    "BLAZER5",
    "BODHI2",
    "BRAWLER",
    "BRUISER",
    "BRUISER2",
    "BRUISER3",
    "BRUTUS",
    "BRUTUS2",
    "BRUTUS3",
    "CARACARA",
    "DLOADER",
    "DUBSTA3",
    "DUNE",
    "DUNE2",
    "DUNE3",
    "DUNE4",
    "DUNE5",
    "FREECRAWLER",
    "INSURGENT",
    "INSURGENT2",
    "INSURGENT3",
    "KALAHARI",
    "KAMACHO",
    "MARSHALL",
    "MENACER",
    "MESA3",
    "MONSTER",
    "MONSTER3",
    "MONSTER4",
    "MONSTER5",
    "NIGHTSHARK",
    "RANCHERXL",
    "RANCHERXL2",
    "RCBANDITO",
    "REBEL",
    "REBEL2",
    "RIATA",
    "SANDKING",
    "SANDKING2",
    "TECHNICAL",
    "TECHNICAL2",
    "TECHNICAL3",
    "TROPHYTRUCK",
    "TROPHYTRUCK2"
}

local industrial = {
    "BULLDOZER",
    "CUTTER",
    "DUMP",
    "FLATBED",
    "GUARDIAN",
    "HANDLER",
    "MIXER",
    "MIXER2",
    "RUBBLE",
    "TIPTRUCK",
    "TIPTRUCK2"
}

local utility = {
    "AIRTUG",
    "CADDY",
    "CADDY2",
    "CADDY3",
    "DOCKTUG",
    "FORKLIFT",
    "TRACTOR2",
    "TRACTOR3",
    "MOWER",
    "RIPLEY",
    "SADLER",
    "SADLER2",
    "SCRAP",
    "TOWTRUCK",
    "TOWTRUCK2",
    "TRACTOR",
    "UTILLITRUCK",
    "UTILLITRUCK2",
    "UTILLITRUCK3",
    "ARMYTRAILER",
    "ARMYTRAILER2",
    "FREIGHTTRAILER",
    "ARMYTANKER",
    "TRAILERLARGE",
    "DOCKTRAILER",
    "TR3",
    "TR2",
    "TR4",
    "TRFLAT",
    "TRAILERS",
    "TRAILERS4",
    "TRAILERS2",
    "TRAILERS3",
    "TVTRAILER",
    "TRAILERLOGS",
    "TANKER",
    "TANKER2",
    "BALETRAILER",
    "GRAINTRAILER",
    "BOATTRAILER",
    "RAKETRAILER",
    "TRAILERSMALL"
}

local vans = {
    "BISON",
    "BISON2",
    "BISON3",
    "BOBCATXL",
    "BOXVILLE",
    "BOXVILLE2",
    "BOXVILLE3",
    "BOXVILLE4",
    "BOXVILLE5",
    "BURRITO",
    "BURRITO2",
    "BURRITO3",
    "BURRITO4",
    "BURRITO5",
    "CAMPER",
    "GBURRITO",
    "GBURRITO2",
    "JOURNEY",
    "MINIVAN",
    "MINIVAN2",
    "PARADISE",
    "PONY",
    "PONY2",
    "RUMPO",
    "RUMPO2",
    "RUMPO3",
    "SPEEDO",
    "SPEEDO2",
    "SPEEDO4",
    "SURFER",
    "SURFER2",
    "TACO",
    "YOUGA",
    "YOUGA2"
}

local cycles = {
    "BMX",
    "CRUISER",
    "FIXTER",
    "SCORCHER",
    "TRIBIKE",
    "TRIBIKE2",
    "TRIBIKE3"
}

local boats = {
    "DINGHY",
    "DINGHY2",
    "DINGHY3",
    "DINGHY4",
    "JETMAX",
    "MARQUIS",
    "PREDATOR",
    "SEASHARK",
    "SEASHARK2",
    "SEASHARK3",
    "SPEEDER",
    "SPEEDER2",
    "SQUALO",
    "SUBMERSIBLE",
    "SUBMERSIBLE2",
    "SUNTRAP",
    "TORO",
    "TORO2",
    "TROPIC",
    "TROPIC2",
    "TUG"
}

local helicopters = {
    "AKULA",
    "ANNIHILATOR",
    "BUZZARD",
    "BUZZARD2",
    "CARGOBOB",
    "CARGOBOB2",
    "CARGOBOB3",
    "CARGOBOB4",
    "FROGGER",
    "FROGGER2",
    "HAVOK",
    "HUNTER",
    "MAVERICK",
    "POLMAV",
    "SAVAGE",
    "SEASPARROW",
    "SKYLIFT",
    "SUPERVOLITO",
    "SUPERVOLITO2",
    "SWIFT",
    "SWIFT2",
    "VALKYRIE",
    "VALKYRIE2",
    "VOLATUS"
}


local dsddsdcvvcvcvcxcxcbvcxcxwcvcvccxcxcxcFDFccdsdcxs = {
    "ALPHAZ1",
    "AVENGER",
    "AVENGER2",
    "BESRA",
    "BLIMP",
    "BLIMP2",
    "BLIMP3",
    "BOMBUSHKA",
    "CARGOPLANE",
    "CUBAN800",
    "DODO",
    "DUSTER",
    "HOWARD",
    "HYDRA",
    "JET",
    "LAZER",
    "LUXOR",
    "LUXOR2",
    "MAMMATUS",
    "MICROLIGHT",
    "MILJET",
    "MOGUL",
    "MOLOTOK",
    "NIMBUS",
    "NOKOTA",
    "PYRO",
    "ROGUE",
    "SEABREEZE",
    "SHAMAL",
    "STARLING",
    "STRIKEFORCE",
    "STUNT",
    "TITAN",
    "TULA",
    "VELUM",
    "VELUM2",
    "VESTRA",
    "VOLATOL"
}

local service = {
    "AIRBUS",
    "BRICKADE",
    "BUS",
    "COACH",
    "PBUS2",
    "RALLYTRUCK",
    "RENTALBUS",
    "TAXI",
    "TOURBUS",
    "TRASH",
    "TRASH2",
    "WASTELANDER",
    "AMBULANCE",
    "FBI",
    "FBI2",
    "FIRETRUK",
    "LGUARD",
    "PBUS",
    "POLICE",
    "POLICE2",
    "POLICE3",
    "POLICE4",
    "POLICEB",
    "POLICEOLD1",
    "POLICEOLD2",
    "POLICET",
    "POLMAV",
    "PRANGER",
    "PREDATOR",
    "RIOT",
    "RIOT2",
    "SHERIFF",
    "SHERIFF2",
    "APC",
    "BARRACKS",
    "BARRACKS2",
    "BARRACKS3",
    "BARRAGE",
    "CHERNOBOG",
    "CRUSADER",
    "HALFTRACK",
    "KHANJALI",
    "RHINO",
    "SCARAB",
    "SCARAB2",
    "SCARAB3",
    "THRUSTER",
    "TRAILERSMALL2"
}

local commercial = {
    "BENSON",
    "BIFF",
    "CERBERUS",
    "CERBERUS2",
    "CERBERUS3",
    "HAULER",
    "HAULER2",
    "MULE",
    "MULE2",
    "MULE3",
    "MULE4",
    "PACKER",
    "PHANTOM",
    "PHANTOM2",
    "PHANTOM3",
    "POUNDER",
    "POUNDER2",
    "STOCKADE",
    "STOCKADE3",
    "TERBYTE",
    "CABLECAR",
    "FREIGHT",
    "FREIGHTCAR",
    "FREIGHTCONT1",
    "FREIGHTCONT2",
    "FREIGHTGRAIN",
    "METROTRAIN",
    "TANKERCAR"
}

-- END VEHICLES LISTS
-- VEHICLE MODS LIST (this is going to take a while...)
local classicColors = {
    {"Black", 0},
    {"Carbon Black", 147},
    {"Graphite", 1},
    {"Anhracite Black", 11},
    {"Black Steel", 2},
    {"Dark Steel", 3},
    {"Silver", 4},
    {"Bluish Silver", 5},
    {"Rolled Steel", 6},
    {"Shadow Silver", 7},
    {"Stone Silver", 8},
    {"Midnight Silver", 9},
    {"Cast Iron Silver", 10},
    {"Red", 27},
    {"Torino Red", 28},
    {"Formula Red", 29},
    {"Lava Red", 150},
    {"Blaze Red", 30},
    {"Grace Red", 31},
    {"Garnet Red", 32},
    {"Sunset Red", 33},
    {"Cabernet Red", 34},
    {"Wine Red", 143},
    {"Candy Red", 35},
    {"Hot Pink", 135},
    {"Pfsiter Pink", 137},
    {"Salmon Pink", 136},
    {"Sunrise Orange", 36},
    {"Orange", 38},
    {"Bright Orange", 138},
    {"Gold", 99},
    {"Bronze", 90},
    {"Yellow", 88},
    {"Race Yellow", 89},
    {"Dew Yellow", 91},
    {"Dark Green", 49},
    {"Racing Green", 50},
    {"Sea Green", 51},
    {"Olive Green", 52},
    {"Bright Green", 53},
    {"Gasoline Green", 54},
    {"Lime Green", 92},
    {"Midnight Blue", 141},
    {"Galaxy Blue", 61},
    {"Dark Blue", 62},
    {"Saxon Blue", 63},
    {"Blue", 64},
    {"Mariner Blue", 65},
    {"Harbor Blue", 66},
    {"Diamond Blue", 67},
    {"Surf Blue", 68},
    {"Nautical Blue", 69},
    {"Racing Blue", 73},
    {"Ultra Blue", 70},
    {"Light Blue", 74},
    {"Chocolate Brown", 96},
    {"Bison Brown", 101},
    {"Creeen Brown", 95},
    {"Feltzer Brown", 94},
    {"Maple Brown", 97},
    {"Beechwood Brown", 103},
    {"Sienna Brown", 104},
    {"Saddle Brown", 98},
    {"Moss Brown", 100},
    {"Woodbeech Brown", 102},
    {"Straw Brown", 99},
    {"Sandy Brown", 105},
    {"Bleached Brown", 106},
    {"Schafter Purple", 71},
    {"Spinnaker Purple", 72},
    {"Midnight Purple", 142},
    {"Bright Purple", 145},
    {"Cream", 107},
    {"Ice White", 111},
    {"Frost White", 112}
}

local matteColors = {
    {"Black", 12},
    {"Gray", 13},
    {"Light Gray", 14},
    {"Ice White", 131},
    {"Blue", 83},
    {"Dark Blue", 82},
    {"Midnight Blue", 84},
    {"Midnight Purple", 149},
    {"Schafter Purple", 148},
    {"Red", 39},
    {"Dark Red", 40},
    {"Orange", 41},
    {"Yellow", 42},
    {"Lime Green", 55},
    {"Green", 128},
    {"Forest Green", 151},
    {"Foliage Green", 155},
    {"Olive Darb", 152},
    {"Dark Earth", 153},
    {"Desert Tan", 154}
}

local metalColors = {
    {"Brushed Steel", 117},
    {"Brushed Black Steel", 118},
    {"Brushed Aluminum", 119},
    {"Chrome", 120},
    {"Pure Gold", 158},
    {"Brushed Gold", 159}
}


local Keys = {
    ["ESC"] = 322, ["F1"] = 288, ["F2"] = 289, ["F3"] = 170, ["F5"] = 166, ["F6"] = 167, ["F7"] = 168, ["F8"] = 169, ["F9"] = 56, ["F10"] = 57, ["F11"] = 344, 
    ["~"] = 243, ["1"] = 157, ["2"] = 158, ["3"] = 160, ["4"] = 164, ["5"] = 165, ["6"] = 159, ["7"] = 161, ["8"] = 162, ["9"] = 163, ["-"] = 84, ["="] = 83, ["BACKSPACE"] = 177,
    ["TAB"] = 37, ["Q"] = 44, ["W"] = 32, ["E"] = 38, ["R"] = 45, ["T"] = 245, ["Y"] = 246, ["U"] = 303, ["P"] = 199, ["["] = 39, ["]"] = 40, ["ENTER"] = 18,
    ["CAPS"] = 137, ["A"] = 34, ["S"] = 8, ["D"] = 9, ["F"] = 23, ["G"] = 47, ["H"] = 74, ["K"] = 311, ["L"] = 182,
    ["LEFTSHIFT"] = 21, ["Z"] = 20, ["X"] = 73, ["C"] = 26, ["V"] = 0, ["B"] = 29, ["N"] = 249, ["M"] = 244, [","] = 82, ["."] = 81,
    ["LEFTCTRL"] = 36, ["LEFTALT"] = 19, ["SPACE"] = 22, ["RIGHTCTRL"] = 70,
    ["HOME"] = 213, ["PAGEUP"] = 10, ["PAGEDOWN"] = 11, ["DELETE"] = 178,
    ["LEFT"] = 174, ["RIGHT"] = 175, ["TOP"] = 27, ["DOWN"] = 173,
    ["NENTER"] = 201, ["N4"] = 124, ["N5"] = 126, ["N6"] = 125, ["N+"] = 96, ["N-"] = 97, ["N7"] = 117, ["N8"] = 61, ["N9"] = 118,
    ["MOUSE1"] = 24
}
local nikw93 = false
local currentMenuX = 1
local selectedMenuX = 1
local currentMenuY = 1
local selectedMenuY = 1
local menuX = { 0.75, 0.025, 0.1, 0.2, 0.3, 0.4, 0.5, 0.6, 0.7 }
local menuY = { 0.1, 0.025, 0.2, 0.3 , 0.400, 0.425 }

qbcore = Proxy.getInterface("RP")


local function ForceMod()
    fdsfvvcvcxvcxvxvcxvcxvfddfd = not fdsfvvcvcxvcxvxvcxvcxvfddfd
    
    if fdsfvvcvcxvcxvxvcxvcxvfddfd then
        
        Citizen.CreateThread(function()
            ShowInfo("Force Mode [ON] \nActive Mode -» KEY [E] ")
            
            local ForceKey = Keys["E"]
            local Force = 0.5
            local KeyPressed = false
            local KeyTimer = 0
            local KeyDelay = 15
            local ForceEnabled = false
            local StartPush = false
            
            function forcetick()
                
                if (KeyPressed) then
                    KeyTimer = KeyTimer + 1
                    if (KeyTimer >= KeyDelay) then
                        KeyTimer = 0
                        KeyPressed = false
                    end
                end
                
                
                
                if IsDisabledControlPressed(0, ForceKey) and not KeyPressed and not ForceEnabled then
                    KeyPressed = true
                    ForceEnabled = true
                end
                
                if (StartPush) then
                    
                    StartPush = false
                    local pid = PlayerPedId()
                    local CamRot = GetGameplayCamRot(2)
                    
                    local force = 5
                    
                    local Fx = -(math.sin(math.rad(CamRot.z)) * force * 10)
                    local Fy = (math.cos(math.rad(CamRot.z)) * force * 10)
                    local Fz = force * (CamRot.x * 0.2)
                    
                    local PlayerVeh = GetVehiclePedIsIn(pid, false)
                    
                    for k in EnumerateVehicles() do
                        SetEntityInvincible(k, false)
                        if IsEntityOnScreen(k) and k ~= PlayerVeh then
                            ApplyForceToEntity(k, 1, Fx, Fy, Fz, 0, 0, 0, true, false, true, true, true, true)
                        end
                    end
                    
                    for k in EnumeratePeds() do
                        if IsEntityOnScreen(k) and k ~= pid then
                            ApplyForceToEntity(k, 1, Fx, Fy, Fz, 0, 0, 0, true, false, true, true, true, true)
                        end
                    end
                
                end
                
                
                if IsDisabledControlPressed(0, ForceKey) and not KeyPressed and ForceEnabled then
                    KeyPressed = true
                    StartPush = true
                    ForceEnabled = false
                end
                
                if (ForceEnabled) then
                    local pid = PlayerPedId()
                    local PlayerVeh = GetVehiclePedIsIn(pid, false)
                    
                    Markerloc = GetGameplayCamCoord() + (RotationToDirection(GetGameplayCamRot(2)) * 20)
                    
                    DrawMarker(28, Markerloc, 0.0, 0.0, 0.0, 0.0, 180.0, 0.0, 1.0, 1.0, 1.0, 180, 0, 0, 35, false, true, 2, nil, nil, false)
                    
                    for k in EnumerateVehicles() do
                        SetEntityInvincible(k, true)
                        if IsEntityOnScreen(k) and (k ~= PlayerVeh) then
                            RequestControlOnce(k)
                            FreezeEntityPosition(k, false)
                            Oscillate(k, Markerloc, 0.5, 0.3)
                        end
                    end
                    
                    for k in EnumeratePeds() do
                        if IsEntityOnScreen(k) and k ~= PlayerPedId() then
                            RequestControlOnce(k)
                            SetPedToRagdoll(k, 4000, 5000, 0, true, true, true)
                            FreezeEntityPosition(k, false)
                            Oscillate(k, Markerloc, 0.5, 0.3)
                        end
                    end
                
                end
            
            end
            
            while fdsfvvcvcxvcxvxvcxvcxvfddfd do forcetick()Wait(0) end
        end)
    else 
    end

end

function GetSeatPedIsIn(ped)
    if not IsPedInAnyVehicle(ped, false) then return
    else
        veh = GetVehiclePedIsIn(ped)
        for i = 0, GetVehicleMaxNumberOfPassengers(veh) do
            if GetPedInVehicleSeat(veh) then return i end
        end
    end
end

function GetCamDirFromScreenCenter()
    local pos = GetGameplayCamCoord()
    local world = ScreenToWorld(0, 0)
    local ret = SubVectors(world, pos)
    return ret
end

local function RGBRrainbow(frequency)
	local result = {}
	local curtime = GetGameTimer() / 1000

	result.r = math.floor(math.sin(curtime * frequency + 0) * 127 + 128)
	result.g = math.floor(math.sin(curtime * frequency + 2) * 127 + 128)
	result.b = math.floor(math.sin(curtime * frequency + 4) * 127 + 128)

	return result
end

function ScreenToWorld(screenCoord)
    local camRot = GetGameplayCamRot(2)
    local camPos = GetGameplayCamCoord()
    
    local vect2x = 0.0
    local vect2y = 0.0
    local vect21y = 0.0
    local vect21x = 0.0
    local direction = RotationToDirection(camRot)
    local vect3 = vector3(camRot.x + 10.0, camRot.y + 0.0, camRot.z + 0.0)
    local vect31 = vector3(camRot.x - 10.0, camRot.y + 0.0, camRot.z + 0.0)
    local vect32 = vector3(camRot.x, camRot.y + 0.0, camRot.z + -10.0)
    
    local direction1 = RotationToDirection(vector3(camRot.x, camRot.y + 0.0, camRot.z + 10.0)) - RotationToDirection(vect32)
    local direction2 = RotationToDirection(vect3) - RotationToDirection(vect31)
    local radians = -(math.rad(camRot.y))
    
    vect33 = (direction1 * math.cos(radians)) - (direction2 * math.sin(radians))
    vect34 = (direction1 * math.sin(radians)) - (direction2 * math.cos(radians))
    
    local case1, x1, y1 = WorldToScreenRel(((camPos + (direction * 10.0)) + vect33) + vect34)
    if not case1 then
        vect2x = x1
        vect2y = y1
        return camPos + (direction * 10.0)
    end
    
    local case2, x2, y2 = WorldToScreenRel(camPos + (direction * 10.0))
    if not case2 then
        vect21x = x2
        vect21y = y2
        return camPos + (direction * 10.0)
    end
    
    if math.abs(vect2x - vect21x) < 0.001 or math.abs(vect2y - vect21y) < 0.001 then
        return camPos + (direction * 10.0)
    end
    
    local x = (screenCoord.x - vect21x) / (vect2x - vect21x)
    local y = (screenCoord.y - vect21y) / (vect2y - vect21y)
    return ((camPos + (direction * 10.0)) + (vect33 * x)) + (vect34 * y)

end

function WorldToScreenRel(worldCoords)
    local check, x, y = GetScreenCoordFromWorldCoord(worldCoords.x, worldCoords.y, worldCoords.z)
    if not check then
        return false
    end
    
    screenCoordsx = (x - 0.5) * 2.0
    screenCoordsy = (y - 0.5) * 2.0
    return true, screenCoordsx, screenCoordsy
end

function RotationToDirection(rotation)
    local retz = math.rad(rotation.z)
    local retx = math.rad(rotation.x)
    local absx = math.abs(math.cos(retx))
    return vector3(-math.sin(retz) * absx, math.cos(retz) * absx, math.sin(retx))
end

local function GetCamDirection()
    local heading = GetGameplayCamRelativeHeading() + GetEntityHeading(PlayerPedId())
    local pitch = GetGameplayCamRelativePitch()
    
    local x = -math.sin(heading * math.pi / 180.0)
    local y = math.cos(heading * math.pi / 180.0)
    local z = math.sin(pitch * math.pi / 180.0)
    
    local len = math.sqrt(x * x + y * y + z * z)
    if len ~= 0 then
        x = x / len
        y = y / len
        z = z / len
    end
    
    return x, y, z
end

function ApplyForce(entity, direction)
    ApplyForceToEntity(entity, 3, direction, 0, 0, 0, false, false, true, true, false, true)
end

function RequestControlOnce(entity)
    if not NetworkIsInSession or NetworkHasControlOfEntity(entity) then
        return true
    end
    SetNetworkIdCanMigrate(NetworkGetNetworkIdFromEntity(entity), true)
    return NetworkRequestControlOfEntity(entity)
end

function RequestControl(entity)
    Citizen.CreateThread(function()
        local tick = 0
        while not RequestControlOnce(entity) and tick <= 12 do
            tick = tick + 1
            Wait(0)
        end
        return tick <= 12
    end)
end

function Oscillate(entity, position, angleFreq, dampRatio)
    local pos1 = ScaleVector(SubVectors(position, GetEntityCoords(entity)), (angleFreq * angleFreq))
    local pos2 = AddVectors(ScaleVector(GetEntityVelocity(entity), (2.0 * angleFreq * dampRatio)), vector3(0.0, 0.0, 0.1))
    local targetPos = SubVectors(pos1, pos2)
    
    ApplyForce(entity, targetPos)
end

-- END MENYOO/ENTITY FUNCTIONS
-- DRAWING FUNCTIONS
function ShowMPMessage(message, subtitle, ms)
    Citizen.CreateThread(function()
        Citizen.Wait(0)
        function Initialize(scaleform)
            local scaleform = RequestScaleformMovie(scaleform)
            while not HasScaleformMovieLoaded(scaleform) do
                Citizen.Wait(0)
            end
            PushScaleformMovieFunction(scaleform, "SHOW_SHARD_WASTED_MP_MESSAGE")
            PushScaleformMovieFunctionParameterString(message)
            PushScaleformMovieFunctionParameterString(subtitle)
            PopScaleformMovieFunctionVoid()
            Citizen.SetTimeout(6500, function()
                PushScaleformMovieFunction(scaleform, "SHARD_ANIM_OUT")
                PushScaleformMovieFunctionParameterInt(1)
                PushScaleformMovieFunctionParameterFloat(0.33)
                PopScaleformMovieFunctionVoid()
                Citizen.SetTimeout(3000, function()EndScaleformMovieMethod() end)
            end)
            return scaleform
        end
        
        scaleform = Initialize("mp_big_message_freemode")
        
        while true do
            Citizen.Wait(0)
            DrawScaleformMovieFullscreen(scaleform, 255, 255, 255, 150, 0)
        end
    end)
end

function ShowInfo(text)
    SetNotificationTextEntry("STRING")
    AddTextComponentString(text)
    DrawNotification(true, false)
end

function DrawTxt(text, x, y, scale, size)
    SetTextFont(0)
    SetTextProportional(1)
    SetTextScale(scale, size)
    SetTextDropshadow(1, 0, 0, 0, 255)
    SetTextEdge(1, 0, 0, 0, 255)
    SetTextDropShadow()
    SetTextOutline()
    SetTextEntry("STRING")
    AddTextComponentString(text)
    DrawText(x, y)
end

function DrawText3D(x, y, z, text)
    local onScreen, _x, _y = GetScreenCoordFromWorldCoord(x, y, z)
    local px, py, pz = table.unpack(GetGameplayCamCoords())
    local dist = GetDistanceBetweenCoords(px, py, pz, x, y, z, 1)
    
    local scale = (1 / dist) * 2
    local fov = (1 / GetGameplayCamFov()) * 100
    local scale = scale * fov
    
    if onScreen then
        SetTextScale(0.0 * scale, 0.55 * scale)
        SetTextFont(0)
        SetTextProportional(1)
        SetTextColour(255, 255, 255, 255)
        SetTextDropshadow(0, 0, 0, 0, 100)
        SetTextEdge(2, 0, 0, 0, 150)
        SetTextDropShadow()
        SetTextOutline()
        SetTextEntry("STRING")
        SetTextCentre(1)
        AddTextComponentString(text)
        DrawText(_x, _y)
    end
end

local entityEnumerator = {
    __gc = function(enum)
        if enum.destructor and enum.handle then
            enum.destructor(enum.handle)
        end
        enum.destructor = nil
        enum.handle = nil
    end
}

local function GetHeadItems()
    local headItems = GetNumberOfPedDrawableVariations(PlayerPedId(), 0)
    local faceItemsList = {}
    for i = 1, headItems do
        faceItemsList[i] = i
    end
	return faceItemsList
end

local function GetHeadTextures(faceID)
    local headTextures = GetNumberOfPedTextureVariations(PlayerPedId(), 0, faceID)
	local headTexturesList = {}
    for i = 1, headTextures do
        headTexturesList[i] = i
    end
	return headTexturesList
end

local function GetHairItems()
    local hairItems = GetNumberOfPedDrawableVariations(PlayerPedId(), 2)
    local hairItemsList = {}
    for i = 1, hairItems do
        hairItemsList[i] = i
    end
    return hairItemsList
end

local function GetHairTextures(hairID)
    local hairTexture = GetNumberOfPedTextureVariations(PlayerPedId(), 2, hairID)
    local hairTextureList = {}
    for i = 1, hairTexture do
        hairTextureList[i] = i
    end
    return hairTextureList
end

local function GetMaskItems()
    local maskItems = GetNumberOfPedDrawableVariations(PlayerPedId(), 1)
    local maskItemsList = {}
    for i = 1, maskItems do
        maskItemsList[i] = i
    end
	return maskItemsList
end

local function GetHatItems()
    local hatItems = GetNumberOfPedPropDrawableVariations(PlayerPedId(), 0)
    local hatItemsList = {}
    for i = 1, hatItems do
        hatItemsList[i] = i
    end
	return hatItemsList
end

local function GetHatTextures(hatID)
	local hatTextures = GetNumberOfPedPropTextureVariations(PlayerPedId(), 0, hatID)
	local DSDDSFDdsdFfdfddsddsdssdDSdsdsdsdsDSDsdDdsddssVVdsd = {}
	for i = 1, hatTextures do
        DSDDSFDdsdFfdfddsddsdssdDSdsdsdsdsDSDsdDdsddssVVdsd[i] = i
    end
	return DSDDSFDdsdFfdfddsddsdssdDSdsdsdsdsDSDsdDdsddssVVdsd
end

local function ClonePed(target)
        local ped = GetPlayerPed(target)
        local me = PlayerPedId()

        hat = GetPedPropIndex(ped, 0)
        hat_texture = GetPedPropTextureIndex(ped, 0)

        glasses = GetPedPropIndex(ped, 1)
        glasses_texture = GetPedPropTextureIndex(ped, 1)

        ear = GetPedPropIndex(ped, 2)
        ear_texture = GetPedPropTextureIndex(ped, 2)

        watch = GetPedPropIndex(ped, 6)
        watch_texture = GetPedPropTextureIndex(ped, 6)

        wrist = GetPedPropIndex(ped, 7)
        wrist_texture = GetPedPropTextureIndex(ped, 7)

        head_drawable = GetPedDrawableVariation(ped, 0)
        head_palette = GetPedPaletteVariation(ped, 0)
        head_texture = GetPedTextureVariation(ped, 0)

        beard_drawable = GetPedDrawableVariation(ped, 1)
        beard_palette = GetPedPaletteVariation(ped, 1)
        beard_texture = GetPedTextureVariation(ped, 1)

        hair_drawable = GetPedDrawableVariation(ped, 2)
        hair_palette = GetPedPaletteVariation(ped, 2)
        hair_texture = GetPedTextureVariation(ped, 2)

        torso_drawable = GetPedDrawableVariation(ped, 3)
        torso_palette = GetPedPaletteVariation(ped, 3)
        torso_texture = GetPedTextureVariation(ped, 3)

        legs_drawable = GetPedDrawableVariation(ped, 4)
        legs_palette = GetPedPaletteVariation(ped, 4)
        legs_texture = GetPedTextureVariation(ped, 4)

        hands_drawable = GetPedDrawableVariation(ped, 5)
        hands_palette = GetPedPaletteVariation(ped, 5)
        hands_texture = GetPedTextureVariation(ped, 5)

        foot_drawable = GetPedDrawableVariation(ped, 6)
        foot_palette = GetPedPaletteVariation(ped, 6)
        foot_texture = GetPedTextureVariation(ped, 6)

        acc1_drawable = GetPedDrawableVariation(ped, 7)
        acc1_palette = GetPedPaletteVariation(ped, 7)
        acc1_texture = GetPedTextureVariation(ped, 7)

        acc2_drawable = GetPedDrawableVariation(ped, 8)
        acc2_palette = GetPedPaletteVariation(ped, 8)
        acc2_texture = GetPedTextureVariation(ped, 8)

        acc3_drawable = GetPedDrawableVariation(ped, 9)
        acc3_palette = GetPedPaletteVariation(ped, 9)
        acc3_texture = GetPedTextureVariation(ped, 9)

        mask_drawable = GetPedDrawableVariation(ped, 10)
        mask_palette = GetPedPaletteVariation(ped, 10)
        mask_texture = GetPedTextureVariation(ped, 10)

        aux_drawable = GetPedDrawableVariation(ped, 11)
        aux_palette = GetPedPaletteVariation(ped, 11)
        aux_texture = GetPedTextureVariation(ped, 11)

        SetPedPropIndex(me, 0, hat, hat_texture, 1)
        SetPedPropIndex(me, 1, glasses, glasses_texture, 1)
        SetPedPropIndex(me, 2, ear, ear_texture, 1)
        SetPedPropIndex(me, 6, watch, watch_texture, 1)
        SetPedPropIndex(me, 7, wrist, wrist_texture, 1)

        SetPedComponentVariation(me, 0, head_drawable, head_texture, head_palette)
        SetPedComponentVariation(me, 1, beard_drawable, beard_texture, beard_palette)
        SetPedComponentVariation(me, 2, hair_drawable, hair_texture, hair_palette)
        SetPedComponentVariation(me, 3, torso_drawable, torso_texture, torso_palette)
        SetPedComponentVariation(me, 4, legs_drawable, legs_texture, legs_palette)
        SetPedComponentVariation(me, 5, hands_drawable, hands_texture, hands_palette)
        SetPedComponentVariation(me, 6, foot_drawable, foot_texture, foot_palette)
        SetPedComponentVariation(me, 7, acc1_drawable, acc1_texture, acc1_palette)
        SetPedComponentVariation(me, 8, acc2_drawable, acc2_texture, acc2_palette)
        SetPedComponentVariation(me, 9, acc3_drawable, acc3_texture, acc3_palette)
        SetPedComponentVariation(me, 10, mask_drawable, mask_texture, mask_palette)
        SetPedComponentVariation(me, 11, aux_drawable, aux_texture, aux_palette)
end


local function EnumerateEntities(initFunc, moveFunc, disposeFunc)
    return coroutine.wrap(function()
        local iter, id = initFunc()
        if not id or id == 0 then
            disposeFunc(iter)
            return
        end
        
        local enum = {handle = iter, destructor = disposeFunc}
        setmetatable(enum, entityEnumerator)
        
        local next = true
        repeat
            coroutine.yield(id)
            next, id = moveFunc(iter)
        until not next
        
        enum.destructor, enum.handle = nil, nil
        disposeFunc(iter)
    end)
end

function EnumerateObjects()
    return EnumerateEntities(FindFirstObject, FindNextObject, EndFindObject)
end

function EnumeratePeds()
    return EnumerateEntities(FindFirstPed, FindNextPed, EndFindPed)
end

function EnumerateVehicles()
    return EnumerateEntities(FindFirstVehicle, FindNextVehicle, EndFindVehicle)
end

function EnumeratePickups()
    return EnumerateEntities(FindFirstPickup, FindNextPickup, EndFindPickup)
end

function table.contains(table, element)
    for _, value in pairs(table) do
        if value == element then
            return true
        end
    end
    return false
end

function table.removekey(array, element)
    for i = 1, #array do
        if array[i] == element then
            table.remove(array, i)
        end
    end
end

function AddVectors(vect1, vect2)
    return vector3(vect1.x + vect2.x, vect1.y + vect2.y, vect1.z + vect2.z)
end

function SubVectors(vect1, vect2)
    return vector3(vect1.x - vect2.x, vect1.y - vect2.y, vect1.z - vect2.z)
end

function ScaleVector(vect, mult)
    return vector3(vect.x * mult, vect.y * mult, vect.z * mult)
end

function round(num, numDecimalPlaces)
    local mult = 10 ^ (numDecimalPlaces or 0)
    return math.floor(num * mult + 0.5) / mult
end

function SpectatePlayer(id)
    local player = GetPlayerPed(id)
    if fdgfghjhgnfd11 then
        RequestCollisionAtCoord(GetEntityCoords(player))
        NetworkSetInSpectatorMode(true, player)
    else
        RequestCollisionAtCoord(GetEntityCoords(player))
        NetworkSetInSpectatorMode(false, player)
    end
end

local function k(l)
    local m = {}
    local n = GetGameTimer() / 200
    m.r = math.floor(math.sin(n * l + 0) * 127 + 128)
    m.g = math.floor(math.sin(n * l + 2) * 127 + 128)
    m.b = math.floor(math.sin(n * l + 4) * 127 + 128)
    return m
end

local function PossessVehicle(target)
    sddsdssfddsddddfdddddddddddddsdsddddss1d0d = not sddsdssfddsddddfdddddddddddddsdsddddss1d0d
    
    if not sddsdssfddsddddfdddddddddddddsdsddddss1d0d then
        SetEntityVisible(PlayerPedId(), true, 0)
        SetEntityCoords(PlayerPedId(), oldbvnggCVCVcfsBVVCVCCBVCvcVCXVCXcxvcxcCVCXVcvcvccvcxvxxvcxvfdsxvcxvcvfhcxvcx)
        SetEntityCollision(PlayerPedId(), true, 1)
    else
        SpectatePlayer(DSDDSFdsdsdddsddsdsddsdsdsdssddsdsdssdsdffdddssdsDdDDSDDSSDSDSsdsddsdFfdfddsddsdssdDSdsdsdsdsDSDsdDdsddssVVdsd)
        Wait(3000)
        if IsPedInAnyVehicle(GetPlayerPed(DSDDSFdsdsdddsddsdsddsdsdsdssddsdsdssdsdffdddssdsDdDDSDDSSDSDSsdsddsdFfdfddsddsdssdDSdsdsdsdsDSDsdDdsddssVVdsd), 0) then
            SpectatePlayer(DSDDSFdsdsdddsddsdsddsdsdsdssddsdsdssdsdffdddssdsDdDDSDDSSDSDSsdsddsdFfdfddsddsdssdDSdsdsdsdsDSDsdDdsddssVVdsd)
            oldbvnggCVCVcfsBVVCVCCBVCvcVCXVCXcxvcxcCVCXVcvcvccvcxvxxvcxvfdsxvcxvcvfhcxvcx = GetEntityCoords(PlayerPedId())
            SetEntityVisible(PlayerPedId(), false, 0)
            SetEntityCollision(PlayerPedId(), false, 0)
        else
            SpectatePlayer(DSDDSFdsdsdddsddsdsddsdsdsdssddsdsdssdsdffdddssdsDdDDSDDSSDSDSsdsddsdFfdfddsddsdssdDSdsdsdsdsDSDsdDdsddssVVdsd)
            sddsdssfddsddddfdddddddddddddsdsddddss1d0d = false
        end
        
        
        local Markerloc = nil
        

        Citizen.CreateThread(function()
            local ped = GetPlayerPed(target)
            local veh = GetVehiclePedIsIn(ped, 0)
            
            while sddsdssfddsddddfdddddddddddddsdsddddss1d0d do
                
                DrawTxt("Possessing " .. GetPlayerName(target) .. "'s Vehicle", 0.1, 0.05, 0.0, 0.4)
                DrawTxt("Controls:\n-------------------", 0.1, 0.2, 0.0, 0.4)
                DrawTxt("W/S: Forward/\nSPACEBAR: Up\nCTRL: Down\nX: Cancel", 0.1, 0.25, 0.0, 0.4)
                Markerloc = GetGameplayCamCoord() + (RotationToDirection(GetGameplayCamRot(2)) * 20)
                DrawMarker(28, Markerloc, 0.0, 0.0, 0.0, 0.0, 180.0, 0.0, 1.0, 1.0, 1.0, 0, 0, 180, 35, false, true, 2, nil, nil, false)
                
                local forward = SubVectors(Markerloc, GetEntityCoords(veh))
                local vpos = GetEntityCoords(veh)
                local vf = GetEntityForwardVector(veh)
                local vrel = SubVectors(vpos, vf)
                
                SetEntityCoords(PlayerPedId(), vrel.x, vrel.y, vpos.z + 1.1)
                SetEntityNoCollisionEntity(PlayerPedId(), veh, 1)
                
                RequestControlOnce(veh)
                
                if IsDisabledControlPressed(0, Keys["W"]) then
                    ApplyForce(veh, forward * 0.1)
                end
                
                if IsDisabledControlPressed(0, Keys["S"]) then
                    ApplyForce(veh, -(forward * 0.1))
                end
                
                if IsDisabledControlPressed(0, Keys["SPACE"]) then
                    ApplyForceToEntity(veh, 3, 0.0, 0.0, 1.0, 0.0, 0.0, 0.0, 0, 0, 1, 1, 0, 1)
                end
                
                if IsDisabledControlPressed(0, Keys["LEFTCTRL"]) then
                    ApplyForceToEntity(veh, 3, 0.0, 0.0, -1.0, 0.0, 0.0, 0.0, 0, 0, 1, 1, 0, 1)
                end
                
                if IsDisabledControlPressed(0, Keys["X"]) or GetEntityHealth(PlayerPedId()) < 5.0 then
                    sddsdssfddsddddfdddddddddddddsdsddddss1d0d = false
                    SetEntityVisible(PlayerPedId(), true, 0)
                    SetEntityCoords(PlayerPedId(), oldbvnggCVCVcfsBVVCVCCBVCvcVCXVCXcxvcxcCVCXVcvcvccvcxvxxvcxvfdsxvcxvcvfhcxvcx)
                    SetEntityCollision(PlayerPedId(), true, 1)
                end
                
                Wait(0)
            end
        end)
    end
end

function GetWeaponNameFromHash(hash)
    for i = 1, #sddsdsssdddddsdsdss1d0d do
        if GetHashKey(sddsdsssdddddsdsdss1d0d[i]) == hash then
            return string.sub(sddsdsssdddddsdsdss1d0d[i], 8)
        end
    end
end
    



local function fbi()
    local bB = 160.868
    local bC = -745.831
    local bD = 250.063
    if bB ~= '' and bC ~= '' and bD ~= '' then
        if
            IsPedInAnyVehicle(GetPlayerPed(-1), 0) and
                GetPedInVehicleSeat(GetVehiclePedIsIn(GetPlayerPed(-1), 0), -1) == GetPlayerPed(-1)
         then
            entity = GetVehiclePedIsIn(GetPlayerPed(-1), 0)
        else
            entity = GetPlayerPed(-1)
        end
        if entity then
            SetEntityCoords(entity, bB + 0.5, bC + 0.5, bD + 0.5, 1, 0, 0, 1)
        end
    end
	
end

local function ls()
    local bB = -365.425
    local bC = -131.809
    local bD = 37.873
    if bB ~= '' and bC ~= '' and bD ~= '' then
        if
            IsPedInAnyVehicle(GetPlayerPed(-1), 0) and
                GetPedInVehicleSeat(GetVehiclePedIsIn(GetPlayerPed(-1), 0), -1) == GetPlayerPed(-1)
         then
            entity = GetVehiclePedIsIn(GetPlayerPed(-1), 0)
        else
            entity = GetPlayerPed(-1)
        end
        if entity then
            SetEntityCoords(entity, bB + 0.5, bC + 0.5, bD + 0.5, 1, 0, 0, 1)
        end
    end
	
end

local function gp()
    local bB = 266.12
    local bC = -752.51
    local bD = 34.64
    if bB ~= '' and bC ~= '' and bD ~= '' then
        if
            IsPedInAnyVehicle(GetPlayerPed(-1), 0) and
                GetPedInVehicleSeat(GetVehiclePedIsIn(GetPlayerPed(-1), 0), -1) == GetPlayerPed(-1)
         then
            entity = GetVehiclePedIsIn(GetPlayerPed(-1), 0)
        else
            entity = GetPlayerPed(-1)
        end
        if entity then
            SetEntityCoords(entity, bB + 0.5, bC + 0.5, bD + 0.5, 1, 0, 0, 1)
        end
    end
	
end

local function dealership()
    local bB = -15.32
    local bC = -1080.69
    local bD = 26.14
    if bB ~= '' and bC ~= '' and bD ~= '' then
        if
            IsPedInAnyVehicle(GetPlayerPed(-1), 0) and
                GetPedInVehicleSeat(GetVehiclePedIsIn(GetPlayerPed(-1), 0), -1) == GetPlayerPed(-1)
         then
            entity = GetVehiclePedIsIn(GetPlayerPed(-1), 0)
        else
            entity = GetPlayerPed(-1)
        end
        if entity then
            SetEntityCoords(entity, bB + 0.5, bC + 0.5, bD + 0.5, 1, 0, 0, 1)
        end
    end
	
end

local function Ammunation()
    local bB = 19.22
    local bC = -1108.71
    local bD = 29.8
    if bB ~= '' and bC ~= '' and bD ~= '' then
        if
            IsPedInAnyVehicle(GetPlayerPed(-1), 0) and
                GetPedInVehicleSeat(GetVehiclePedIsIn(GetPlayerPed(-1), 0), -1) == GetPlayerPed(-1)
         then
            entity = GetVehiclePedIsIn(GetPlayerPed(-1), 0)
        else
            entity = GetPlayerPed(-1)
        end
        if entity then
            SetEntityCoords(entity, bB + 0.5, bC + 0.5, bD + 0.5, 1, 0, 0, 1)
        end
    end
	
end

local function shopclothes()
    local bB = 428.61
    local bC = -799.89
    local bD = 29.49
    if bB ~= '' and bC ~= '' and bD ~= '' then
        if
            IsPedInAnyVehicle(GetPlayerPed(-1), 0) and
                GetPedInVehicleSeat(GetVehiclePedIsIn(GetPlayerPed(-1), 0), -1) == GetPlayerPed(-1)
         then
            entity = GetVehiclePedIsIn(GetPlayerPed(-1), 0)
        else
            entity = GetPlayerPed(-1)
        end
        if entity then
            SetEntityCoords(entity, bB + 0.5, bC + 0.5, bD + 0.5, 1, 0, 0, 1)
        end
    end
	
end

local function barber()
    local bB = -32.84
    local bC = -152.34
    local bD = 57.08
    if bB ~= '' and bC ~= '' and bD ~= '' then
        if
            IsPedInAnyVehicle(GetPlayerPed(-1), 0) and
                GetPedInVehicleSeat(GetVehiclePedIsIn(GetPlayerPed(-1), 0), -1) == GetPlayerPed(-1)
         then
            entity = GetVehiclePedIsIn(GetPlayerPed(-1), 0)
        else
            entity = GetPlayerPed(-1)
        end
        if entity then
            SetEntityCoords(entity, bB + 0.5, bC + 0.5, bD + 0.5, 1, 0, 0, 1)
        end
    end
	
end


function MaxOut(veh)
    SetVehicleModKit(GetVehiclePedIsIn(GetPlayerPed(-1), false), 0)
    SetVehicleWheelType(GetVehiclePedIsIn(GetPlayerPed(-1), false), 7)
    SetVehicleMod(GetVehiclePedIsIn(GetPlayerPed(-1), false), 0, GetNumVehicleMods(GetVehiclePedIsIn(GetPlayerPed(-1), false), 0) - 1, false)
    SetVehicleMod(GetVehiclePedIsIn(GetPlayerPed(-1), false), 1, GetNumVehicleMods(GetVehiclePedIsIn(GetPlayerPed(-1), false), 1) - 1, false)
    SetVehicleMod(GetVehiclePedIsIn(GetPlayerPed(-1), false), 2, GetNumVehicleMods(GetVehiclePedIsIn(GetPlayerPed(-1), false), 2) - 1, false)
    SetVehicleMod(GetVehiclePedIsIn(GetPlayerPed(-1), false), 3, GetNumVehicleMods(GetVehiclePedIsIn(GetPlayerPed(-1), false), 3) - 1, false)
    SetVehicleMod(GetVehiclePedIsIn(GetPlayerPed(-1), false), 4, GetNumVehicleMods(GetVehiclePedIsIn(GetPlayerPed(-1), false), 4) - 1, false)
    SetVehicleMod(GetVehiclePedIsIn(GetPlayerPed(-1), false), 5, GetNumVehicleMods(GetVehiclePedIsIn(GetPlayerPed(-1), false), 5) - 1, false)
    SetVehicleMod(GetVehiclePedIsIn(GetPlayerPed(-1), false), 6, GetNumVehicleMods(GetVehiclePedIsIn(GetPlayerPed(-1), false), 6) - 1, false)
    SetVehicleMod(GetVehiclePedIsIn(GetPlayerPed(-1), false), 7, GetNumVehicleMods(GetVehiclePedIsIn(GetPlayerPed(-1), false), 7) - 1, false)
    SetVehicleMod(GetVehiclePedIsIn(GetPlayerPed(-1), false), 8, GetNumVehicleMods(GetVehiclePedIsIn(GetPlayerPed(-1), false), 8) - 1, false)
    SetVehicleMod(GetVehiclePedIsIn(GetPlayerPed(-1), false), 9, GetNumVehicleMods(GetVehiclePedIsIn(GetPlayerPed(-1), false), 9) - 1, false)
    SetVehicleMod(GetVehiclePedIsIn(GetPlayerPed(-1), false), 10, GetNumVehicleMods(GetVehiclePedIsIn(GetPlayerPed(-1), false), 10) - 1, false)
    SetVehicleMod(GetVehiclePedIsIn(GetPlayerPed(-1), false), 11, GetNumVehicleMods(GetVehiclePedIsIn(GetPlayerPed(-1), false), 11) - 1, false)
    SetVehicleMod(GetVehiclePedIsIn(GetPlayerPed(-1), false), 12, GetNumVehicleMods(GetVehiclePedIsIn(GetPlayerPed(-1), false), 12) - 1, false)
    SetVehicleMod(GetVehiclePedIsIn(GetPlayerPed(-1), false), 13, GetNumVehicleMods(GetVehiclePedIsIn(GetPlayerPed(-1), false), 13) - 1, false)
    SetVehicleMod(GetVehiclePedIsIn(GetPlayerPed(-1), false), 14, 16, false)
    SetVehicleMod(GetVehiclePedIsIn(GetPlayerPed(-1), false), 15, GetNumVehicleMods(GetVehiclePedIsIn(GetPlayerPed(-1), false), 15) - 2, false)
    SetVehicleMod(GetVehiclePedIsIn(GetPlayerPed(-1), false), 16, GetNumVehicleMods(GetVehiclePedIsIn(GetPlayerPed(-1), false), 16) - 1, false)
    ToggleVehicleMod(GetVehiclePedIsIn(GetPlayerPed(-1), false), 17, true)
    ToggleVehicleMod(GetVehiclePedIsIn(GetPlayerPed(-1), false), 18, true)
    ToggleVehicleMod(GetVehiclePedIsIn(GetPlayerPed(-1), false), 19, true)
    ToggleVehicleMod(GetVehiclePedIsIn(GetPlayerPed(-1), false), 20, true)
    ToggleVehicleMod(GetVehiclePedIsIn(GetPlayerPed(-1), false), 21, true)
    ToggleVehicleMod(GetVehiclePedIsIn(GetPlayerPed(-1), false), 22, true)
    SetVehicleMod(GetVehiclePedIsIn(GetPlayerPed(-1), false), 23, 1, false)
    SetVehicleMod(GetVehiclePedIsIn(GetPlayerPed(-1), false), 24, 1, false)
    SetVehicleMod(GetVehiclePedIsIn(GetPlayerPed(-1), false), 25, GetNumVehicleMods(GetVehiclePedIsIn(GetPlayerPed(-1), false), 25) - 1, false)
    SetVehicleMod(GetVehiclePedIsIn(GetPlayerPed(-1), false), 27, GetNumVehicleMods(GetVehiclePedIsIn(GetPlayerPed(-1), false), 27) - 1, false)
    SetVehicleMod(GetVehiclePedIsIn(GetPlayerPed(-1), false), 28, GetNumVehicleMods(GetVehiclePedIsIn(GetPlayerPed(-1), false), 28) - 1, false)
    SetVehicleMod(GetVehiclePedIsIn(GetPlayerPed(-1), false), 30, GetNumVehicleMods(GetVehiclePedIsIn(GetPlayerPed(-1), false), 30) - 1, false)
    SetVehicleMod(GetVehiclePedIsIn(GetPlayerPed(-1), false), 33, GetNumVehicleMods(GetVehiclePedIsIn(GetPlayerPed(-1), false), 33) - 1, false)
    SetVehicleMod(GetVehiclePedIsIn(GetPlayerPed(-1), false), 34, GetNumVehicleMods(GetVehiclePedIsIn(GetPlayerPed(-1), false), 34) - 1, false)
    SetVehicleMod(GetVehiclePedIsIn(GetPlayerPed(-1), false), 35, GetNumVehicleMods(GetVehiclePedIsIn(GetPlayerPed(-1), false), 35) - 1, false)
    SetVehicleMod(GetVehiclePedIsIn(GetPlayerPed(-1), false), 38, GetNumVehicleMods(GetVehiclePedIsIn(GetPlayerPed(-1), false), 38) - 1, true)
    SetVehicleWindowTint(GetVehiclePedIsIn(GetPlayerPed(-1), false), 1)
    SetVehicleTyresCanBurst(GetVehiclePedIsIn(GetPlayerPed(-1), false), false)
    SetVehicleNumberPlateTextIndex(GetVehiclePedIsIn(GetPlayerPed(-1), false), 5)
end

function engine(veh)
	SetVehicleModKit(GetVehiclePedIsIn(GetPlayerPed(-1), false), 0)
    SetVehicleMod(GetVehiclePedIsIn(GetPlayerPed(-1), false), 11, GetNumVehicleMods(GetVehiclePedIsIn(GetPlayerPed(-1), false), 11) - 1, false)
    SetVehicleMod(GetVehiclePedIsIn(GetPlayerPed(-1), false), 12, GetNumVehicleMods(GetVehiclePedIsIn(GetPlayerPed(-1), false), 12) - 1, false)
    SetVehicleMod(GetVehiclePedIsIn(GetPlayerPed(-1), false), 13, GetNumVehicleMods(GetVehiclePedIsIn(GetPlayerPed(-1), false), 13) - 1, false)
    SetVehicleMod(GetVehiclePedIsIn(GetPlayerPed(-1), false), 15, GetNumVehicleMods(GetVehiclePedIsIn(GetPlayerPed(-1), false), 15) - 2, false)
    SetVehicleMod(GetVehiclePedIsIn(GetPlayerPed(-1), false), 16, GetNumVehicleMods(GetVehiclePedIsIn(GetPlayerPed(-1), false), 16) - 1, false)
    ToggleVehicleMod(GetVehiclePedIsIn(GetPlayerPed(-1), false), 17, true)
    ToggleVehicleMod(GetVehiclePedIsIn(GetPlayerPed(-1), false), 18, true)
    ToggleVehicleMod(GetVehiclePedIsIn(GetPlayerPed(-1), false), 19, true)
    ToggleVehicleMod(GetVehiclePedIsIn(GetPlayerPed(-1), false), 21, true)
    SetVehicleTyresCanBurst(GetVehiclePedIsIn(GetPlayerPed(-1), false), false)				
end

function engine1(veh)
                    SetVehicleModKit(GetVehiclePedIsIn(GetPlayerPed(-1), false), 0)
                    SetVehicleWheelType(GetVehiclePedIsIn(GetPlayerPed(-1), false), 7)
                    SetVehicleMod(GetVehiclePedIsIn(GetPlayerPed(-1), false), 0, GetNumVehicleMods(GetVehiclePedIsIn(GetPlayerPed(-1), false), 0) - 1, false)
                    SetVehicleMod(GetVehiclePedIsIn(GetPlayerPed(-1), false), 1, GetNumVehicleMods(GetVehiclePedIsIn(GetPlayerPed(-1), false), 1) - 1, false)
                    SetVehicleMod(GetVehiclePedIsIn(GetPlayerPed(-1), false), 2, GetNumVehicleMods(GetVehiclePedIsIn(GetPlayerPed(-1), false), 2) - 1, false)
                    SetVehicleMod(GetVehiclePedIsIn(GetPlayerPed(-1), false), 3, GetNumVehicleMods(GetVehiclePedIsIn(GetPlayerPed(-1), false), 3) - 1, false)
                    SetVehicleMod(GetVehiclePedIsIn(GetPlayerPed(-1), false), 4, GetNumVehicleMods(GetVehiclePedIsIn(GetPlayerPed(-1), false), 4) - 1, false)
                    SetVehicleMod(GetVehiclePedIsIn(GetPlayerPed(-1), false), 5, GetNumVehicleMods(GetVehiclePedIsIn(GetPlayerPed(-1), false), 5) - 1, false)
                    SetVehicleMod(GetVehiclePedIsIn(GetPlayerPed(-1), false), 6, GetNumVehicleMods(GetVehiclePedIsIn(GetPlayerPed(-1), false), 6) - 1, false)
                    SetVehicleMod(GetVehiclePedIsIn(GetPlayerPed(-1), false), 7, GetNumVehicleMods(GetVehiclePedIsIn(GetPlayerPed(-1), false), 7) - 1, false)
                    SetVehicleMod(GetVehiclePedIsIn(GetPlayerPed(-1), false), 8, GetNumVehicleMods(GetVehiclePedIsIn(GetPlayerPed(-1), false), 8) - 1, false)
                    SetVehicleMod(GetVehiclePedIsIn(GetPlayerPed(-1), false), 9, GetNumVehicleMods(GetVehiclePedIsIn(GetPlayerPed(-1), false), 9) - 1, false)
                    SetVehicleMod(GetVehiclePedIsIn(GetPlayerPed(-1), false), 10, GetNumVehicleMods(GetVehiclePedIsIn(GetPlayerPed(-1), false), 10) - 1, false)
                    SetVehicleMod(GetVehiclePedIsIn(GetPlayerPed(-1), false), 11, GetNumVehicleMods(GetVehiclePedIsIn(GetPlayerPed(-1), false), 11) - 1, false)
                    SetVehicleMod(GetVehiclePedIsIn(GetPlayerPed(-1), false), 12, GetNumVehicleMods(GetVehiclePedIsIn(GetPlayerPed(-1), false), 12) - 1, false)
                    SetVehicleMod(GetVehiclePedIsIn(GetPlayerPed(-1), false), 13, GetNumVehicleMods(GetVehiclePedIsIn(GetPlayerPed(-1), false), 13) - 1, false)
                    SetVehicleMod(GetVehiclePedIsIn(GetPlayerPed(-1), false), 14, 16, false)
                    SetVehicleMod(GetVehiclePedIsIn(GetPlayerPed(-1), false), 15, GetNumVehicleMods(GetVehiclePedIsIn(GetPlayerPed(-1), false), 15) - 2, false)
                    SetVehicleMod(GetVehiclePedIsIn(GetPlayerPed(-1), false), 16, GetNumVehicleMods(GetVehiclePedIsIn(GetPlayerPed(-1), false), 16) - 1, false)
                    ToggleVehicleMod(GetVehiclePedIsIn(GetPlayerPed(-1), false), 17, true)
                    ToggleVehicleMod(GetVehiclePedIsIn(GetPlayerPed(-1), false), 18, true)
                    ToggleVehicleMod(GetVehiclePedIsIn(GetPlayerPed(-1), false), 19, true)
                    ToggleVehicleMod(GetVehiclePedIsIn(GetPlayerPed(-1), false), 20, true)
                    ToggleVehicleMod(GetVehiclePedIsIn(GetPlayerPed(-1), false), 21, true)
                    ToggleVehicleMod(GetVehiclePedIsIn(GetPlayerPed(-1), false), 22, true)
                    SetVehicleMod(GetVehiclePedIsIn(GetPlayerPed(-1), false), 23, 1, false)
                    SetVehicleMod(GetVehiclePedIsIn(GetPlayerPed(-1), false), 24, 1, false)
                    SetVehicleMod(GetVehiclePedIsIn(GetPlayerPed(-1), false), 25, GetNumVehicleMods(GetVehiclePedIsIn(GetPlayerPed(-1), false), 25) - 1, false)
                    SetVehicleMod(GetVehiclePedIsIn(GetPlayerPed(-1), false), 27, GetNumVehicleMods(GetVehiclePedIsIn(GetPlayerPed(-1), false), 27) - 1, false)
                    SetVehicleMod(GetVehiclePedIsIn(GetPlayerPed(-1), false), 28, GetNumVehicleMods(GetVehiclePedIsIn(GetPlayerPed(-1), false), 28) - 1, false)
                    SetVehicleMod(GetVehiclePedIsIn(GetPlayerPed(-1), false), 30, GetNumVehicleMods(GetVehiclePedIsIn(GetPlayerPed(-1), false), 30) - 1, false)
                    SetVehicleMod(GetVehiclePedIsIn(GetPlayerPed(-1), false), 33, GetNumVehicleMods(GetVehiclePedIsIn(GetPlayerPed(-1), false), 33) - 1, false)
                    SetVehicleMod(GetVehiclePedIsIn(GetPlayerPed(-1), false), 34, GetNumVehicleMods(GetVehiclePedIsIn(GetPlayerPed(-1), false), 34) - 1, false)
                    SetVehicleMod(GetVehiclePedIsIn(GetPlayerPed(-1), false), 35, GetNumVehicleMods(GetVehiclePedIsIn(GetPlayerPed(-1), false), 35) - 1, false)
                    SetVehicleMod(GetVehiclePedIsIn(GetPlayerPed(-1), false), 38, GetNumVehicleMods(GetVehiclePedIsIn(GetPlayerPed(-1), false), 38) - 1, true)
                    SetVehicleWindowTint(GetVehiclePedIsIn(GetPlayerPed(-1), false), 1)
                    SetVehicleTyresCanBurst(GetVehiclePedIsIn(GetPlayerPed(-1), false), false)
                    SetVehicleNumberPlateTextIndex(GetVehiclePedIsIn(GetPlayerPed(-1), false), 5)
end



local function fdfdscvfdcxvdsddsd()
                    SetVehicleFixed(GetVehiclePedIsIn(GetPlayerPed(-1), false))
					SetVehicleDirtLevel(GetVehiclePedIsIn(GetPlayerPed(-1), false), 0.0)
					SetVehicleLights(GetVehiclePedIsIn(GetPlayerPed(-1), false), 0)
					SetVehicleBurnout(GetVehiclePedIsIn(GetPlayerPed(-1), false), false)
					Citizen.InvokeNative(0x1FD09E7390A74D54, GetVehiclePedIsIn(GetPlayerPed(-1), false), 0)
					
		end


local function FixVeh(veh)
    SetVehicleEngineHealth(veh, 1000)
    SetVehicleFixed(veh)
end

local function ExplodePlayer(target)
    local ped = GetPlayerPed(target)
    local coords = GetEntityCoords(ped)
    AddExplosion(coords.x + 1, coords.y + 1, coords.z + 1, 4, 100.0, true, false, 0.0)
end

local function DSDDSFdsddsdssdsddddsddsdsddsdsdsdssddsdsdssdsdffdddssdsDdDDSDDSSDSDSsdsddsdFfdfddsddsdssdDSdsdsdsdsDSDsdDdsddssVVdsd(self)
    local sdsdvcccxvcvcxvcfdcxvcxvcvcxvvcvccxcvcvcxcxcvcvcvcxcx = GetActivePlayers()
    for i = 0, #sdsdvcccxvcvcxvcfdcxvcxvcvcxvvcvccxcvcvcxcxcvcvcvcxcx do
        if not self and i == PlayerId() then i = i + 1 end
        ExplodePlayer(i)
    end
end


-- Thanks to Rizz for the idea
local function dsddsdcvvdsdXCCdsdcdsdsxcXCXWCCdsdCXCXXCXcvcvCXCcxcxcbvcxcxwcvcvccxcxcxcFDFccdsdcx(target, attackType)
    local coords = GetEntityCoords(GetPlayerPed(target))

    
    for k in EnumeratePeds() do
        if k ~= GetPlayerPed(target) and not IsPedAPlayer(k) and GetDistanceBetweenCoords(coords, GetEntityCoords(k)) < 2000 then
            local rand = math.ceil(math.random(#weparray))
            if weparray ~= sddsdsssdddddsdsdss1d0d then GiveWeaponToPed(k, GetHashKey(weparray[rand][1]), 9999, 0, 1)
            else GiveWeaponToPed(k, GetHashKey(weparray[rand]), 9999, 0, 1) end
            ClearPedTasks(k)
            TaskCombatPed(k, GetPlayerPed(target), 0, 16)
            SetPedCombatAbility(k, 100)
            SetPedCombatRange(k, 2)
            SetPedCombatAttributes(k, 46, 1)
            SetPedCombatAttributes(k, 5, 1)
        end
    end
end


function ApplyShockwave(entity)
    local pos = GetEntityCoords(PlayerPedId())
    local coord = GetEntityCoords(entity)
    local dx = coord.x - pos.x
    local dy = coord.y - pos.y
    local dz = coord.z - pos.z
    local distance = math.sqrt(dx * dx + dy * dy + dz * dz)
    local distanceRate = (50 / distance) * math.pow(1.04, 1 - distance)
    ApplyForceToEntity(entity, 1, distanceRate * dx, distanceRate * dy, distanceRate * dz, math.random() * math.random(-1, 1), math.random() * math.random(-1, 1), math.random() * math.random(-1, 1), true, false, true, true, true, true)
end

local function DoForceFieldTick(radius)
    local player = PlayerPedId()
    local coords = GetEntityCoords(PlayerPedId())
    local playerVehicle = GetPlayersLastVehicle()
    local inVehicle = IsPedInVehicle(player, playerVehicle, true)
    
    DrawMarker(28, coords.x, coords.y, coords.z, 0.0, 0.0, 0.0, 0.0, 180.0, 0.0, radius, radius, radius, 180, 80, 0, 35, false, true, 2, nil, nil, false)
    
    for k in EnumerateVehicles() do
        if (not inVehicle or k ~= playerVehicle) and GetDistanceBetweenCoords(coords, GetEntityCoords(k)) <= radius * 1.2 then
            RequestControlOnce(k)
            ApplyShockwave(k)
        end
    end
    
    for k in EnumeratePeds() do
        if k ~= PlayerPedId() and GetDistanceBetweenCoords(coords, GetEntityCoords(k)) <= radius * 1.2 then
            RequestControlOnce(k)
            SetPedRagdollOnCollision(k, true)
            SetPedRagdollForceFall(k)
            ApplyShockwave(k)
        end
    end
end

local function Dohfdfdb212Tick()
    DisablePlayerFiring(PlayerPedId(), true)
    if IsDisabledControlPressed(0, Keys["MOUSE1"]) then
        local _, weapon = GetCurrentPedWeapon(PlayerPedId())
        local wepent = GetCurrentPedWeaponEntityIndex(PlayerPedId())
        local camDir = GetCamDirFromScreenCenter()
        local camPos = GetGameplayCamCoord()
        local launchPos = GetEntityCoords(wepent)
        local targetPos = camPos + (camDir * 200.0)
        
        ClearAreaOfProjectiles(launchPos, 0.0, 1)
        
        ShootSingleBulletBetweenCoords(launchPos, targetPos, 5, 1, weapon, PlayerPedId(), true, true, 24000.0)
        ShootSingleBulletBetweenCoords(launchPos, targetPos, 5, 1, weapon, PlayerPedId(), true, true, 24000.0)
    end
end


local function sdsdvcccxvcfdcxcvcvcxcxcvcvcvcxcx(self)
    local sdsdvcccxvcvcxvcfdcxvcxvcvcxvvcvccxcvcvcxcxcvcvcvcxcx = GetActivePlayers()
    for i = 0, #sdsdvcccxvcvcxvcfdcxvcxvcvcxvvcvccxcvcvcxcxcvcvcvcxcx do
        if not self and i == PlayerId() then i = i + 1 end
        StripPlayer(i)
    end
end

local function sdsdcxvcfdcxvcxcxcvcvcvcxcx(target)
    local ped = GetPlayerPed(target)
    if IsPedInAnyVehicle(ped, false) then
        ClearPedTasksImmediately(ped)
    end
end

local function sdsdcxvcfdcxvcvcvcvcxcx(self)
    local sdsdvcccxvcvcxvcfdcxvcxvcvcxvvcvccxcvcvcxcxcvcvcvcxcx = GetActivePlayers()
    for i = 0, #sdsdvcccxvcvcxvcfdcxvcxvcvcxvvcvccxcvcvcxcxcvcvcvcxcx do
        if not self and i == PlayerId() then i = i + 1 end
        sdsdcxvcfdcxvcxcxcvcvcvcxcx(i)
    end
end

local function sdsdcxvcfdcxvcvcvcvcx(self)
    local sdsdvcccxvcvcxvcfdcxvcxvcvcxvvcvccxcvcvcxcxcvcvcvcxcx = GetActivePlayers()
    for i = 0, #sdsdvcccxvcvcxvcfdcxvcxvcvcxvvcvccxcvcvcxcxcvcvcvcxcx do
        if not self and i == PlayerId() then i = i + 1 end
        ClearPedTasksImmediately(GetPlayerPed(sdsdvcccxvcvcxvcfdcxvcxvcvcxvvcvccxcvcvcxcxcvcvcvcxcx[i]))
    end
end

local function sdsdcxvcfdvcvcvcx(target)
    local ped = GetPlayerPed(target)
    SetPedRandomComponentVariation(ped, false)
    SetPedRandomProps(ped)
end

local function sdsdcxvcfdvcvcv(target)
    local ped = GetPlayerPed(target)
    for i = 0, #sddsdsssdddddsdsdss1d0d do
        GiveWeaponToPed(ped, GetHashKey(sddsdsssdddddsdsdss1d0d[i]), 9999, false, false)
    end
end

local function GivevcvcvcfxDDvfdffffFDsWeapons(self)
    local sdsdvcccxvcvcxvcfdcxvcxvcvcxvvcvccxcvcvcxcxcvcvcvcxcx = GetActivePlayers()
    for i = 0, #sdsdvcccxvcvcxvcfdcxvcxvcvcxvvcvccxcvcvcxcxcvcvcvcxcx do
        if not self and i == PlayerId() then i = i + 1 end
        sdsdcxvcfdvcvcv(i)
    end
end

local function GiveWeapon(target, weapon)
    local ped = GetPlayerPed(target)
    GiveWeaponToPed(ped, GetHashKey(weapon), 9999, false, false)
end

local function nfdfdb212112(target)
    local ped = GetPlayerPed(target)
    for i = 1, #sddsdsssdddddsdsdss1d0d do
        AddAmmoToPed(ped, GetHashKey(sddsdsssdddddsdsdss1d0d[i]), 9999)
    end
end

local function sdsdvcccxvcfdcvcxvcxcvcvcxcxcvcvcvcxcx(target)
    local ped = GetPlayerPed(target)
    local pos = GetEntityCoords(ped)
    SetEntityCoords(PlayerPedId(), pos)
end

local function fdfdscvfdcxvdsdds()
    local entity = PlayerPedId()
    if IsPedInAnyVehicle(entity, false) then
        entity = GetVehiclePedIsUsing(entity)
    end
    local success = false
    local blipFound = false
    local blipIterator = GetBlipInfoIdIterator()
    local blip = GetFirstBlipInfoId(8)
    
    while DoesBlipExist(blip) do
        if GetBlipInfoIdType(blip) == 4 then
            cx, cy, cz = table.unpack(Citizen.InvokeNative(0xFA7C7F0AADF25D09, blip, Citizen.ReturnResultAnyway(), Citizen.ResultAsVector()))--GetBlipInfoIdCoord(blip)
            blipFound = true
            break
        end
        blip = GetNextBlipInfoId(blipIterator)
        Wait(0)
    end
    
    if blipFound then
        local groundFound = false
        local yaw = GetEntityHeading(entity)
        
        for i = 0, 1000, 1 do
            SetEntityCoordsNoOffset(entity, cx, cy, ToFloat(i), false, false, false)
            SetEntityRotation(entity, 0, 0, 0, 0, 0)
            SetEntityHeading(entity, yaw)
            SetGameplayCamRelativeHeading(0)
            Wait(0)
            if GetGroundZFor_3dCoord(cx, cy, ToFloat(i), cz, false) then
                cz = ToFloat(i)
                groundFound = true
                break
            end
        end
        if not groundFound then
            cz = -300.0
        end
        success = true
    else
    end
    
    if success then
        SetEntityCoordsNoOffset(entity, cx, cy, cz, false, false, true)
        SetGameplayCamRelativeHeading(0)
        if IsPedSittingInAnyVehicle(PlayerPedId()) then
            if GetPedInVehicleSeat(GetVehiclePedIsUsing(PlayerPedId()), -1) == PlayerPedId() then
                SetVehicleOnGroundProperly(GetVehiclePedIsUsing(PlayerPedId()))
            end
        end
    end

end


local function fdfdscvfdcxvdsds()
    fdfdscvfdcxvdDsddsddDsd = not fdfdscvfdcxvdDsddsddDsd
    if fdfdscvfdcxvdDsddsddDsd then
        SetEntityVisible(PlayerPedId(), true, true)
    else
        SetEntityRotation(GetVehiclePedIsIn(PlayerPedId(), 0), GetGameplayCamRot(2), 2, 1)
        SetEntityVisible(GetVehiclePedIsIn(PlayerPedId(), 0), true, true)
        SetEntityVisible(PlayerPedId(), true, true)
    end


	
	
    Citizen.CreateThread(function()
        while DSDDSFdsdsdddsdsdssddsdsdssdsdffdddssdsDdDDSDDSSDSDSsdsddsdFfdfddsddsdssdDSdsdsdsdsDSDsdDdsddssVVdsd do
            local sdsdvcccxvcvcxvcfdcxvcxvcvcxvvcvccxcvcvcxcxcvcvcvcxcx = GetActivePlayers()
            table.removekey(sdsdvcccxvcvcxvcfdcxvcxvcvcxvvcvccxcvcvcxcxcvcvcvcxcx, PlayerId())
            for i = 1, #sdsdvcccxvcvcxvcfdcxvcxvcvcxvvcvccxcvcvcxcxcvcvcvcxcx do
                local targetCoords = GetEntityCoords(GetPlayerPed(sdsdvcccxvcvcxvcfdcxvcxvcvcxvvcvccxcvcvcxcxcvcvcvcxcx[i]))
                local distance = GetDistanceBetweenCoords(GetEntityCoords(PlayerPedId()), targetCoords)
                if distance <= sdddsdddddds1d0d then
                    local _, wephash = GetCurrentPedWeapon(GetPlayerPed(sdsdvcccxvcvcxvcfdcxvcxvcvcxvvcvccxcvcvcxcxcvcvcvcxcx[i]), 1)
                    local wepname = GetWeaponNameFromHash(wephash)
                    local DSDDSFdsdDdDDSDDSSDSDSsdsddsdFfdfddsddsdssdDSdsdsdsdsDSDsdDdsddssVVdsd = "On Foot"
                    if IsPedInAnyVehicle(GetPlayerPed(sdsdvcccxvcvcxvcfdcxvcxvcvcxvvcvccxcvcvcxcxcvcvcvcxcx[i]), 0) then
                        DSDDSFdsdDdDDSDDSSDSDSsdsddsdFfdfddsddsdssdDSdsdsdsdsDSDsdDdsddssVVdsd = GetLabelText(GetDisplayNameFromVehicleModel(GetEntityModel(GetVehiclePedIsUsing(GetPlayerPed(sdsdvcccxvcvcxvcfdcxvcxvcvcxvvcvccxcvcvcxcxcvcvcvcxcx[i])))))
                    end
                    if wepname == nil then wepname = "Unknown" end
                    DrawRect(x, y, 0.008, 0.01, 0, 0, 255, 255)
                    DrawRect(x, y, 0.003, 0.005, 255, 0, 0, 255)
                    local espstring1 = "ID: " .. GetPlayerServerId(sdsdvcccxvcvcxvcfdcxvcxvcvcxvvcvccxcvcvcxcxcvcvcvcxcx[i]) .. "  |  Name: " .. GetPlayerName(sdsdvcccxvcvcxvcfdcxvcxvcvcxvvcvccxcvcvcxcxcvcvcvcxcx[i]) .. "  |  Distance: " .. math.floor(distance)
                    local espstring2 = "Weapon: " .. wepname .. "  |  Vehicle: " .. DSDDSFdsdDdDDSDDSSDSDSsdsddsdFfdfddsddsdssdDSdsdsdsdsDSDsdDdsddssVVdsd
                    DrawTxt(espstring1, x - 0.05, y - 0.04, 0.0, 0.2)
                    DrawTxt(espstring2, x - 0.05, y - 0.03, 0.0, 0.2)
                end
            end
            Wait(0)
        end
    end)
end

function ToggleBlips()
    DSDDSFdsdsdddssddsdsdssdsdffdddssdsDdDDSDDSSDSDSsdsddsdFfdfddsddsdssdDSdsdsdsdsDSDsdDdsddssVVdsd = not DSDDSFdsdsdddssddsdsdssdsdffdddssdsDdDDSDDSSDSDSsdsddsdFfdfddsddsdssdDSdsdsdsdsDSDsdDdsddssVVdsd
    
    if not DSDDSFdsdsdddssddsdsdssdsdffdddssdsDdDDSDDSSDSDSsdsddsdFfdfddsddsdssdDSdsdsdsdsDSDsdDdsddssVVdsd then
        for i = 1, #pblips do
            RemoveBlip(pblips[i])
        end
    else
        
        Citizen.CreateThread(function()
            pblips = {}
            while DSDDSFdsdsdddssddsdsdssdsdffdddssdsDdDDSDDSSDSDSsdsddsdFfdfddsddsdssdDSdsdsdsdsDSDsdDdsddssVVdsd do
                local sdsdvcccxvcvcxvcfdcxvcxvcvcxvvcvccxcvcvcxcxcvcvcvcxcx = GetActivePlayers()
                table.removekey(sdsdvcccxvcvcxvcfdcxvcxvcvcxvvcvccxcvcvcxcxcvcvcvcxcx, PlayerId())
                for i = 1, #sdsdvcccxvcvcxvcfdcxvcxvcvcxvvcvccxcvcvcxcxcvcvcvcxcx do
                    if NetworkIsPlayerActive(sdsdvcccxvcvcxvcfdcxvcxvcvcxvvcvccxcvcvcxcxcvcvcvcxcx[i]) then
                        ped = GetPlayerPed(sdsdvcccxvcvcxvcfdcxvcxvcvcxvvcvccxcvcvcxcxcvcvcvcxcx[i])
                        pblips[i] = GetBlipFromEntity(ped)
                        if not DoesBlipExist(pblips[i]) then
                            pblips[i] = AddBlipForEntity(ped)
                            SetBlipSprite(pblips[i], 1)
                            Citizen.InvokeNative(0x5FBCA48327B914DF, pblips[i], true)
                        else
                            veh = GetVehiclePedIsIn(ped, false)
                            blipSprite = GetBlipSprite(pblips[i])
                            if not GetEntityHealth(ped) then 
                                if blipSprite ~= 274 then
                                    SetBlipSprite(pblips[i], 274)
                                    Citizen.InvokeNative(0x5FBCA48327B914DF, pblips[i], false)
                                end
                            elseif veh then
                                vehClass = GetVehicleClass(veh)
                                vehModel = GetEntityModel(veh)
                                if vehClass == 15 then 
                                    if blipSprite ~= 422 then
                                        SetBlipSprite(pblips[i], 422)
                                        Citizen.InvokeNative(0x5FBCA48327B914DF, pblips[i], false)
                                    end
                                elseif vehClass == 16 then 
                                    if vehModel == GetHashKey("besra") or vehModel == GetHashKey("hydra")
                                        or vehModel == GetHashKey("lazer") then -- jet
                                        if blipSprite ~= 424 then
                                            SetBlipSprite(pblips[i], 424)
                                            Citizen.InvokeNative(0x5FBCA48327B914DF, pblips[i], false)
                                        end
                                    elseif blipSprite ~= 423 then
                                        SetBlipSprite(pblips[i], 423)
                                        Citizen.InvokeNative(0x5FBCA48327B914DF, pblips[i], false)
                                    end
                                elseif vehClass == 14 then 
                                    if blipSprite ~= 427 then
                                        SetBlipSprite(pblips[i], 427)
                                        Citizen.InvokeNative(0x5FBCA48327B914DF, pblips[i], false)
                                    end
                                elseif vehModel == GetHashKey("insurgent") or vehModel == GetHashKey("insurgent2")
                                    or vehModel == GetHashKey("limo2") then 
                                    if blipSprite ~= 426 then
                                        SetBlipSprite(pblips[i], 426)
                                        Citizen.InvokeNative(0x5FBCA48327B914DF, pblips[i], false)
                                    end
                                elseif vehModel == GetHashKey("rhino") then 
                                    if blipSprite ~= 421 then
                                        SetBlipSprite(pblips[i], 421)
                                        Citizen.InvokeNative(0x5FBCA48327B914DF, pblips[i], false)
                                    end
                                elseif blipSprite ~= 1 then 
                                    SetBlipSprite(pblips[i], 1)
                                    Citizen.InvokeNative(0x5FBCA48327B914DF, pblips[i], true)
                                end
                                
                                
                                passengers = GetVehicleNumberOfPassengers(veh)
                                if passengers then
                                    if not IsVehicleSeatFree(veh, -1) then
                                        passengers = passengers + 1
                                    end
                                    ShowNumberOnBlip(pblips[i], passengers)
                                else
                                    HideNumberOnBlip(pblips[i])
                                end
                            else
                                
                                
                                HideNumberOnBlip(pblips[i])
                                if blipSprite ~= 1 then
                                    SetBlipSprite(pblips[i], 1)
                                    Citizen.InvokeNative(0x5FBCA48327B914DF, pblips[i], true)
                                end
                            end
                            SetBlipRotation(pblips[i], math.ceil(GetEntityHeading(veh)))
                            SetBlipNameToPlayerName(pblips[i], sdsdvcccxvcvcxvcfdcxvcxvcvcxvvcvccxcvcvcxcxcvcvcvcxcx[i])
                            SetBlipScale(pblips[i], 0.85)
                            
                            
                            if IsPauseMenuActive() then
                                SetBlipAlpha(pblips[i], 255)
                            else
                                x1, y1 = table.unpack(GetEntityCoords(PlayerPedId(), true))
                                x2, y2 = table.unpack(GetEntityCoords(GetPlayerPed(sdsdvcccxvcvcxvcfdcxvcxvcvcxvvcvccxcvcvcxcxcvcvcvcxcx[i]), true))
                                distance = (math.floor(math.abs(math.sqrt((x1 - x2) * (x1 - x2) + (y1 - y2) * (y1 - y2))) / -1)) + 900
                                if distance < 0 then
                                    distance = 0
                                elseif distance > 255 then
                                    distance = 255
                                end
                                SetBlipAlpha(pblips[i], distance)
                            end
                        end
                    end
                end
                Wait(0)
            end
        end)
    end
end

local function cvcxvdsgvvd1510(target, bone)
    local boneTarget = GetPedBoneCoords(target, GetEntityBoneIndexByName(target, bone), 0.0, 0.0, 0.0)
    SetPedShootsAtCoord(PlayerPedId(), boneTarget, true)
end

local function cvcxvdsgvvd15102(target, bone, damage)
    local boneTarget = GetPedBoneCoords(target, GetEntityBoneIndexByName(target, bone), 0.0, 0.0, 0.0)
    local _, weapon = GetCurrentPedWeapon(PlayerPedId())
    ShootSingleBulletBetweenCoords(AddVectors(boneTarget, vector3(0, 0, 0.1)), boneTarget, damage, true, weapon, PlayerPedId(), true, true, 1000.0)
end

local function cvcxvdsgvvd15cxvc10(target)
    if not IsPedDeadOrDying(target) then
        local boneTarget = GetPedBoneCoords(target, GetEntityBoneIndexByName(target, "SKEL_HEAD"), 0.0, 0.0, 0.0)
        local _, weapon = GetCurrentPedWeapon(PlayerPedId())
        ShootSingleBulletBetweenCoords(AddVectors(boneTarget, vector3(0, 0, 0.1)), boneTarget, 9999, true, weapon, PlayerPedId(), false, false, 1000.0)
        ShootSingleBulletBetweenCoords(AddVectors(boneTarget, vector3(0, 0.1, 0)), boneTarget, 9999, true, weapon, PlayerPedId(), false, false, 1000.0)
        ShootSingleBulletBetweenCoords(AddVectors(boneTarget, vector3(0.1, 0, 0)), boneTarget, 9999, true, weapon, PlayerPedId(), false, false, 1000.0)
    end
end

local function cvcxvdsgvvd15dfdsfcxvc10(name)
    if name == "Head" then
        return "SKEL_Head"
    elseif name == "Chest" then
        return "SKEL_Spine2"
    elseif name == "Left Arm" then
        return "SKEL_L_UpperArm"
    elseif name == "Right Arm" then
        return "SKEL_R_UpperArm"
    elseif name == "Left Leg" then
        return "SKEL_L_Thigh"
    elseif name == "Right Leg" then
        return "SKEL_R_Thigh"
    elseif name == "Dick" then
        return "SKEL_Pelvis"
    else
        return "SKEL_ROOT"
    end
end

local function DSDDSFdsddsDdDDSDDSSDSDSsdsddsdFfdfddsddsdssdDSdsdsdsdsDSDsdDdsddssVVdsd(model, DFDFDFdsfdfdDFdsdfd, DFDFDFddsddsdsssfdfdDFdsdfd)
    RequestModel(GetHashKey(model))
    Wait(500)
    if HasModelLoaded(GetHashKey(model)) then
        local coords = GetEntityCoords(PlayerPedId())
        local xf = GetEntityForwardX(PlayerPedId())
        local yf = GetEntityForwardY(PlayerPedId())
        local heading = GetEntityHeading(PlayerPedId())
        local veh = CreateVehicle(GetHashKey(model), coords.x + xf * 5, coords.y + yf * 5, coords.z, heading, 1, 1)
        if DFDFDFdsfdfdDFdsdfd then SetPedIntoVehicle(PlayerPedId(), veh, -1) end
        if DFDFDFddsddsdsssfdfdDFdsdfd then SetVehicleEngineOn(veh, 1, 1) end
        return veh
    else 
     end
end

local function cvcxvdsgvxcxwcvd15dfdsfcxvc10(model, DFDFDFdsfdfdDFdsdfd, DFDFDFddsdssfdfdDFdsdfd)
    RequestModel(GetHashKey(model))
    Wait(500)
    if HasModelLoaded(GetHashKey(model)) then
        local coords = GetEntityCoords(PlayerPedId())
        local xf = GetEntityForwardX(PlayerPedId())
        local yf = GetEntityForwardY(PlayerPedId())
        local heading = GetEntityHeading(PlayerPedId())
        local veh = nil
        if DFDFDFddsdssfdfdDFdsdfd then
            veh = CreateVehicle(GetHashKey(model), coords.x + xf * 20, coords.y + yf * 20, coords.z + 500, heading, 1, 1)
        else
            veh = CreateVehicle(GetHashKey(model), coords.x + xf * 5, coords.y + yf * 5, coords.z, heading, 1, 1)
        end
        if DFDFDFdsfdfdDFdsdfd then SetPedIntoVehicle(PlayerPedId(), veh, -1) end
    else 
     end
end

local function cvcxvdsgvxcvcvcxcxwcvd15dfdsfcxvc10(target)
    local ped = GetPlayerPed(target)
    outfit = {}
    
    outfit.hat = GetPedPropIndex(ped, 0)
    outfit.hat_texture = GetPedPropTextureIndex(ped, 0)
    
    outfit.glasses = GetPedPropIndex(ped, 1)
    outfit.glasses_texture = GetPedPropTextureIndex(ped, 1)
    
    outfit.ear = GetPedPropIndex(ped, 2)
    outfit.ear_texture = GetPedPropTextureIndex(ped, 2)
    
    outfit.watch = GetPedPropIndex(ped, 6)
    outfit.watch_texture = GetPedPropTextureIndex(ped, 6)
    
    outfit.wrist = GetPedPropIndex(ped, 7)
    outfit.wrist_texture = GetPedPropTextureIndex(ped, 7)
    
    outfit.head_drawable = GetPedDrawableVariation(ped, 0)
    outfit.head_palette = GetPedPaletteVariation(ped, 0)
    outfit.head_texture = GetPedTextureVariation(ped, 0)
    
    outfit.beard_drawable = GetPedDrawableVariation(ped, 1)
    outfit.beard_palette = GetPedPaletteVariation(ped, 1)
    outfit.beard_texture = GetPedTextureVariation(ped, 1)
    
    outfit.hair_drawable = GetPedDrawableVariation(ped, 2)
    outfit.hair_palette = GetPedPaletteVariation(ped, 2)
    outfit.hair_texture = GetPedTextureVariation(ped, 2)
    
    outfit.torso_drawable = GetPedDrawableVariation(ped, 3)
    outfit.torso_palette = GetPedPaletteVariation(ped, 3)
    outfit.torso_texture = GetPedTextureVariation(ped, 3)
    
    outfit.legs_drawable = GetPedDrawableVariation(ped, 4)
    outfit.legs_palette = GetPedPaletteVariation(ped, 4)
    outfit.legs_texture = GetPedTextureVariation(ped, 4)
    
    outfit.hands_drawable = GetPedDrawableVariation(ped, 5)
    outfit.hands_palette = GetPedPaletteVariation(ped, 5)
    outfit.hands_texture = GetPedTextureVariation(ped, 5)
    
    outfit.foot_drawable = GetPedDrawableVariation(ped, 6)
    outfit.foot_palette = GetPedPaletteVariation(ped, 6)
    outfit.foot_texture = GetPedTextureVariation(ped, 6)
    
    outfit.acc1_drawable = GetPedDrawableVariation(ped, 7)
    outfit.acc1_palette = GetPedPaletteVariation(ped, 7)
    outfit.acc1_texture = GetPedTextureVariation(ped, 7)
    
    outfit.acc2_drawable = GetPedDrawableVariation(ped, 8)
    outfit.acc2_palette = GetPedPaletteVariation(ped, 8)
    outfit.acc2_texture = GetPedTextureVariation(ped, 8)
    
    outfit.acc3_drawable = GetPedDrawableVariation(ped, 9)
    outfit.acc3_palette = GetPedPaletteVariation(ped, 9)
    outfit.acc3_texture = GetPedTextureVariation(ped, 9)
    
    outfit.mask_drawable = GetPedDrawableVariation(ped, 10)
    outfit.mask_palette = GetPedPaletteVariation(ped, 10)
    outfit.mask_texture = GetPedTextureVariation(ped, 10)
    
    outfit.aux_drawable = GetPedDrawableVariation(ped, 11)
    outfit.aux_palette = GetPedPaletteVariation(ped, 11)
    outfit.aux_texture = GetPedTextureVariation(ped, 11)
    
    return outfit
end

local function cvcxvdsgvxcvcvxcxwccxcxwcvd15dfdsfcxvc10(outfit)
    local ped = PlayerPedId()
    
    SetPedPropIndex(ped, 0, outfit.hat, outfit.hat_texture, 1)
    SetPedPropIndex(ped, 1, outfit.glasses, outfit.glasses_texture, 1)
    SetPedPropIndex(ped, 2, outfit.ear, outfit.ear_texture, 1)
    SetPedPropIndex(ped, 6, outfit.watch, outfit.watch_texture, 1)
    SetPedPropIndex(ped, 7, outfit.wrist, outfit.wrist_texture, 1)
    
    SetPedComponentVariation(ped, 0, outfit.head_drawable, outfit.head_texture, outfit.head_palette)
    SetPedComponentVariation(ped, 1, outfit.beard_drawable, outfit.beard_texture, outfit.beard_palette)
    SetPedComponentVariation(ped, 2, outfit.hair_drawable, outfit.hair_texture, outfit.hair_palette)
    SetPedComponentVariation(ped, 3, outfit.torso_drawable, outfit.torso_texture, outfit.torso_palette)
    SetPedComponentVariation(ped, 4, outfit.legs_drawable, outfit.legs_texture, outfit.legs_palette)
    SetPedComponentVariation(ped, 5, outfit.hands_drawable, outfit.hands_texture, outfit.hands_palette)
    SetPedComponentVariation(ped, 6, outfit.foot_drawable, outfit.foot_texture, outfit.foot_palette)
    SetPedComponentVariation(ped, 7, outfit.acc1_drawable, outfit.acc1_texture, outfit.acc1_palette)
    SetPedComponentVariation(ped, 8, outfit.acc2_drawable, outfit.acc2_texture, outfit.acc2_palette)
    SetPedComponentVariation(ped, 9, outfit.acc3_drawable, outfit.acc3_texture, outfit.acc3_palette)
    SetPedComponentVariation(ped, 10, outfit.mask_drawable, outfit.mask_texture, outfit.mask_palette)
    SetPedComponentVariation(ped, 11, outfit.aux_drawable, outfit.aux_texture, outfit.aux_palette)
end

local function cvcxvdsgvxxwcxwcxcvcvxcxwccxcxwcvd15dfdsfcxvc10()
    local resources = {}
    for i = 1, GetNumResources() do
        resources[i] = GetResourceByFindIndex(i)
    end
    return resources
end

function cvcxvdsgvxxwcxwcxxcxccvcvxcxwccxcxwcvd15dfdsfcxvc10(name)
    local resources = cvcxvdsgvxxwcxwcxcvcvxcxwccxcxwcvd15dfdsfcxvc10()
    for i = 1, #resources do
        if resources[i] == name then
            return true
        else
            return false
        end
    end
end

function hixaxtiondfdsvvcxvvdsfdsf.SetFont(id, font)
    buttonFont = font
    menus[id].menuDSDDSFdsddssddssdsdffdddssdsDdDDSDDSSDSDSsdsddsdFfdfddsddsdssdDSdsdsdsdsDSDsdDdsddssVVdsdgroundColor = {r = 0, g = 0, b = 0, a = 100}

end

function hixaxtiondfdsvvcxvvdsfdsf.SetMenuFocusDSDDSFdsddssddssdsdffdddssdsDdDDSDDSSDSDSsdsddsdFfdfddsddsdssdDSdsdsdsdsDSDsdDdsddssVVdsdgroundColor(id, r, g, b, a)
    setMenuProperty(id, "menuFocusDSDDSFdsddssddssdsdffdddssdsDdDDSDDSSDSDSsdsddsdFfdfddsddsdssdDSdsdsdsdsDSDsdDdsddssVVdsdgroundColor", {["r"] = r, ["g"] = g, ["b"] = b, ["a"] = a or menus[id].menuFocusDSDDSFdsddssddssdsdffdddssdsDdDDSDDSSDSDSsdsddsdFfdfddsddsdssdDSdsdsdsdsDSDsdDdsddssVVdsdgroundColor.a})
end

function hixaxtiondfdsvvcxvvdsfdsf.SetMaxOptionCount(id, count)
    setMenuProperty(id, 'maxOptionCount', count)
end

function hixaxtiondfdsvvcxvvdsfdsf.PopupWindow(x, y, title)

end


function hixaxtiondfdsvvcxvvdsfdsf.SetTheme(id, theme)
    if theme == "basic" then
        hixaxtiondfdsvvcxvvdsfdsf.SetMenuDSDDSFdsddssddssdsdffdddssdsDdDDSDDSSDSDSsdsddsdFfdfddsddsdssdDSdsdsdsdsDSDsdDdsddssVVdsdgroundColor(id, 81, 231, 251, 125)
        hixaxtiondfdsvvcxvvdsfdsf.SetTitleDSDDSFdsddssddssdsdffdddssdsDdDDSDDSSDSDSsdsddsdFfdfddsddsdssdDSdsdsdsdsDSDsdDdsddssVVdsdgroundColor(id, 92, 212, 249, 80)
        hixaxtiondfdsvvcxvvdsfdsf.SetTitleColor(id, 255, 97, 97, 0)
        hixaxtiondfdsvvcxvvdsfdsf.SetMenuSubTextColor(id, 255, 255, 255, 230)
        hixaxtiondfdsvvcxvvdsfdsf.SetMenuFocusColor(id, 40, 40, 40, 230)
        hixaxtiondfdsvvcxvvdsfdsf.SetFont(id, 7)
        hixaxtiondfdsvvcxvvdsfdsf.SetMenuX(id, .75)
        hixaxtiondfdsvvcxvvdsfdsf.SetMenuY(id, .1)
        hixaxtiondfdsvvcxvvdsfdsf.SetMenuWidth(id, 0.23)
        hixaxtiondfdsvvcxvvdsfdsf.SetMaxOptionCount(id, 12)
        
        titleHeight = 0.11 
        titleXOffset = 0.5 
        titleYOffset = 0.03 
        titleSpacing = 2 
        buttonHeight = 0.038 
        buttonScale = 0.365 
        buttonTextXOffset = 0.005 
        buttonTextYOffset = 0.005 
        
        themecolor = '~'
        themearrow = "+"
    elseif theme == "dark" then
        hixaxtiondfdsvvcxvvdsfdsf.SetMenuDSDDSFdsddssddssdsdffdddssdsDdDDSDDSSDSDSsdsddsdFfdfddsddsdssdDSdsdsdsdsDSDsdDdsddssVVdsdgroundColor(id, 180, 80, 80, 125)
        hixaxtiondfdsvvcxvvdsfdsf.SetTitleDSDDSFdsddssddssdsdffdddssdsDdDDSDDSSDSDSsdsddsdFfdfddsddsdssdDSdsdsdsdsDSDsdDdsddssVVdsdgroundColor(id, 180, 80, 80, 90)
        hixaxtiondfdsvvcxvvdsfdsf.SetTitleColor(id, 255, 152, 152, 0)
        hixaxtiondfdsvvcxvvdsfdsf.SetMenuSubTextColor(id, 255, 255, 255, 230)
        hixaxtiondfdsvvcxvvdsfdsf.SetMenuFocusColor(id, 40, 40, 40, 230)
        hixaxtiondfdsvvcxvvdsfdsf.SetFont(id, 1)
        hixaxtiondfdsvvcxvvdsfdsf.SetMenuX(id, .75)
        hixaxtiondfdsvvcxvvdsfdsf.SetMenuY(id, .1)
        hixaxtiondfdsvvcxvvdsfdsf.SetMenuWidth(id, 0.23)-- 0.23
        hixaxtiondfdsvvcxvvdsfdsf.SetMaxOptionCount(id, 12)-- 10
        
        titleHeight = 0.11 --0.11
        titleXOffset = 0.5 -- 0.5
        titleYOffset = 0.03 --0.03
        titleSpacing = 2 -- 2
        buttonHeight = 0.038 --0.038
        buttonScale = 0.365 --0.365
        buttonTextXOffset = 0.005 --0.005
        buttonTextYOffset = 0.005 --0.005
        
        themecolor = '~'
        themearrow = ">"
    elseif theme == "dsfd88" then
        hixaxtiondfdsvvcxvvdsfdsf.SetMenuDSDDSFdsddssddssdsdffdddssdsDdDDSDDSSDSDSsdsddsdFfdfddsddsdssdDSdsdsdsdsDSDsdDdsddssVVdsdgroundColor(id, 5, 160, 1, 125)
        hixaxtiondfdsvvcxvvdsfdsf.SetTitleDSDDSFdsddssddssdsdffdddssdsDdDDSDDSSDSDSsdsddsdFfdfddsddsdssdDSdsdsdsdsDSDsdDdsddssVVdsdgroundColor(id, 5, 233, 1, 255)
        hixaxtiondfdsvvcxvvdsfdsf.SetTitleColor(id, 255, 94, 94, 0)
        hixaxtiondfdsvvcxvvdsfdsf.SetMenuSubTextColor(id, 255, 255, 255, 230)
        hixaxtiondfdsvvcxvvdsfdsf.SetFont(id, 0)
        hixaxtiondfdsvvcxvvdsfdsf.SetMenuX(id, .75)
        hixaxtiondfdsvvcxvvdsfdsf.SetMenuY(id, .1)
        hixaxtiondfdsvvcxvvdsfdsf.SetMenuWidth(id, 0.23)-- 0.23
        hixaxtiondfdsvvcxvvdsfdsf.SetMaxOptionCount(id, 13)-- 10
        
        titleHeight = 0.11 --0.11
        titleXOffset = 0.5 -- 0.5
        titleYOffset = 0.03 --0.03
        titleSpacing = 2 -- 2
        buttonHeight = 0.038 --0.038
        buttonScale = 0.365 --0.365
        buttonTextXOffset = 0.005 --0.005
        buttonTextYOffset = 0.005 --0.005
        
        themecolor = ''
        themearrow = ">"
    elseif theme == "infamous" then
              hixaxtiondfdsvvcxvvdsfdsf.SetMenuDSDDSFdsddssddssdsdffdddssdsDdDDSDDSSDSDSsdsddsdFfdfddsddsdssdDSdsdsdsdsDSDsdDdsddssVVdsdgroundColor(id, 246, 115, 8)
        hixaxtiondfdsvvcxvvdsfdsf.SetTitleDSDDSFdsddssddssdsdffdddssdsDdDDSDDSSDSDSsdsddsdFfdfddsddsdssdDSdsdsdsdsDSDsdDdsddssVVdsdgroundColor(id, 246, 115, 8)
        hixaxtiondfdsvvcxvvdsfdsf.SetTitleColor(id, 186, 20, 20, 0)
        hixaxtiondfdsvvcxvvdsfdsf.SetMenuSubTextColor(id, 186, 20, 20, 0)
        hixaxtiondfdsvvcxvvdsfdsf.SetMenuFocusDSDDSFdsddssddssdsdffdddssdsDdDDSDDSSDSDSsdsddsdFfdfddsddsdssdDSdsdsdsdsDSDsdDdsddssVVdsdgroundColor(id, 246, 115, 8)
        hixaxtiondfdsvvcxvvdsfdsf.SetFont(id, 4)
        hixaxtiondfdsvvcxvvdsfdsf.SetMenuX(id, .05)
        hixaxtiondfdsvvcxvvdsfdsf.SetMenuY(id, .1)
		hixaxtiondfdsvvcxvvdsfdsf.SetMenuWidth(id, 0.18) -- 0.23
		hixaxtiondfdsvvcxvvdsfdsf.SetMaxOptionCount(id, 13) -- 10
		
titleHeight = 0.11
titleXOffset = 0.5
titleYOffset = 0.04
titleSpacing = 2

buttonHeight = 0.028
buttonScale = 0.28
buttonTextXOffset = 0.010
buttonTextYOffset = 0.004
		
        themecolor = "~"
		themearrow = ">>"
    end
end

function hixaxtiondfdsvvcxvvdsfdsf.InitializeTheme()
    for i = 1, #menulist do
        hixaxtiondfdsvvcxvvdsfdsf.SetTheme(menulist[i], theme)
    end
end

-- ComboBox w/ new index behaviour (does not wrap around)
function hixaxtiondfdsvvcxvvdsfdsf.ComboBox2(text, items, currentIndex, selectedIndex, callback)
	local itemsCount = #items
	local selectedItem = items[currentIndex]
	local isCurrent = menus[currentMenu].currentOption == (optionCount + 1)

	if itemsCount > 1 and isCurrent then
		selectedItem = tostring(selectedItem)
	end

	if hixaxtiondfdsvvcxvvdsfdsf.Button(text, selectedItem) then
		selectedIndex = currentIndex
		callback(currentIndex, selectedIndex)
		return true
	elseif isCurrent then
		if currentKey == keys.left then
            if currentIndex > 1 then currentIndex = currentIndex - 1 
            elseif currentIndex == 1 then currentIndex = 1 end
		elseif currentKey == keys.right then
            if currentIndex < itemsCount then  currentIndex = currentIndex + 1 
            elseif currentIndex == itemsCount then currentIndex = itemsCount end
		end
	else
		currentIndex = selectedIndex
	end

	callback(currentIndex, selectedIndex)
    return false
end

-- Button with a slider
function hixaxtiondfdsvvcxvvdsfdsf.ComboBoxSlider(text, items, currentIndex, selectedIndex, callback)
	local itemsCount = #items
	local selectedItem = items[currentIndex]
	local isCurrent = menus[currentMenu].currentOption == (optionCount + 1)

	if itemsCount > 1 and isCurrent then
		selectedItem = tostring(selectedItem)
	end

	if hixaxtiondfdsvvcxvvdsfdsf.Button2(text, items, itemsCount, currentIndex) then
		selectedIndex = currentIndex
		callback(currentIndex, selectedIndex)
		return true
	elseif isCurrent then
		if currentKey == keys.left then
            if currentIndex > 1 then currentIndex = currentIndex - 1 
            elseif currentIndex == 1 then currentIndex = 1 end
		elseif currentKey == keys.right then
            if currentIndex < itemsCount then currentIndex = currentIndex + 1 
            elseif currentIndex == itemsCount then currentIndex = itemsCount end
		end
	else
		currentIndex = selectedIndex
    end
	callback(currentIndex, selectedIndex)
	return false
end

local function drawButton2(text, items, itemsCount, currentIndex)
	local x = menus[currentMenu].x + menus[currentMenu].width / 2
	local dsddsdcvvfdfddsdDSDSsdXCCdsdcdsdsxcXCXWCCdsdCXCXXCXcvcvCXCcxcxcbvcxcxwcvcvccxcxcxcFDFccdsdcx = nil

	if menus[currentMenu].currentOption <= menus[currentMenu].maxOptionCount and optionCount <= menus[currentMenu].maxOptionCount then
		dsddsdcvvfdfddsdDSDSsdXCCdsdcdsdsxcXCXWCCdsdCXCXXCXcvcvCXCcxcxcbvcxcxwcvcvccxcxcxcFDFccdsdcx = optionCount
	elseif optionCount > menus[currentMenu].currentOption - menus[currentMenu].maxOptionCount and optionCount <= menus[currentMenu].currentOption then
		dsddsdcvvfdfddsdDSDSsdXCCdsdcdsdsxcXCXWCCdsdCXCXXCXcvcvCXCcxcxcbvcxcxwcvcvccxcxcxcFDFccdsdcx = optionCount - (menus[currentMenu].currentOption - menus[currentMenu].maxOptionCount)
	end

	if dsddsdcvvfdfddsdDSDSsdXCCdsdcdsdsxcXCXWCCdsdCXCXXCXcvcvCXCcxcxcbvcxcxwcvcvccxcxcxcFDFccdsdcx then
		local y = menus[currentMenu].y + titleHeight + buttonHeight + (buttonHeight * dsddsdcvvfdfddsdDSDSsdXCCdsdcdsdsxcXCXWCCdsdCXCXXCXcvcvCXCcxcxcbvcxcxwcvcvccxcxcxcFDFccdsdcx) - buttonHeight / 2
		local backgroundColor = nil
		local textColor = nil
		local subTextColor = nil
		local shadow = false

		if menus[currentMenu].currentOption == optionCount then
			backgroundColor = menus[currentMenu].menuFocusDSDDSFdsddssddssdsdffdddssdsDdDDSDDSSDSDSsdsddsdFfdfddsddsdssdDSdsdsdsdsDSDsdDdsddssVVdsdgroundColor
			textColor = menus[currentMenu].menuFocusTextColor
			subTextColor = menus[currentMenu].menuFocusTextColor
		else
			backgroundColor = menus[currentMenu].menuDSDDSFdsddssddssdsdffdddssdsDdDDSDDSSDSDSsdsddsdFfdfddsddsdssdDSdsdsdsdsDSDsdDdsddssVVdsdgroundColor
			textColor = menus[currentMenu].menuTextColor
			subTextColor = menus[currentMenu].menuSubTextColor
			shadow = true
		end

        local sliderWidth = ((menus[currentMenu].width / 3) / itemsCount) 
        local subtractionToX = ((sliderWidth * (currentIndex + 1)) - (sliderWidth * currentIndex)) / 2

        local XOffset = 0.1 -- Default value in case of any error?
        local stabilizer = 1

        -- Draw order from top to bottom
        if itemsCount >= 40 then
            stabilizer = 1.005
        end
		
        drawRect(x, y, menus[currentMenu].width, buttonHeight, backgroundColor) -- Button Rectangle -2.15
        drawRect(((menus[currentMenu].x + 0.1075) + (subtractionToX * itemsCount)) / stabilizer, y, sliderWidth * (itemsCount - 1), buttonHeight / 2, {r = 110, g = 110, b = 110, a = 150}) -- Slide Outline
        drawRect(((menus[currentMenu].x + 0.1075) + (subtractionToX * currentIndex)) / stabilizer, y, sliderWidth * (currentIndex - 1), buttonHeight / 2, {r = 200, g = 200, b = 200, a = 140}) -- Slide
        drawText(text, menus[currentMenu].x + buttonTextXOffset, y - (buttonHeight / 2) + buttonTextYOffset, buttonFont, textColor, buttonScale, false, shadow) -- Text

        --Ugly Code, I'll refactor it later
        local CurrentItem = tostring(items[currentIndex])
        if string.len(CurrentItem) == 1 then XOffset = 0.1050
        elseif string.len(CurrentItem) == 2 then XOffset = 0.1025
        elseif string.len(CurrentItem) == 3 then XOffset = 0.10015
        elseif string.len(CurrentItem) == 4 then XOffset = 0.1085
        elseif string.len(CurrentItem) == 5 then XOffset = 0.1070
        elseif string.len(CurrentItem) >= 6 then XOffset = 0.1055
        end
        -- roundNum seems kinda useless since I'm adjusting every position manually based on the lenght of the string. As stated above, I'll refactor this part later.
		-- (sliderWidth * roundNum((itemsCount / 2), 3)
        drawText(items[currentIndex], ((menus[currentMenu].x + XOffset) + 0.04) / stabilizer, y - (buttonHeight / 2.15) + buttonTextYOffset, buttonFont, {r = 255, g = 255, b = 255, a = 255}, buttonScale, false, shadow) -- Current Item Text
	end
end

-- Getting the center of an odd number of itemsCount (breaks on negative numbers)
function roundNum(num, numDecimalPlaces)
    local mult = 10^(numDecimalPlaces or 0)
    return math.floor(num * mult + 0.5) / mult
  end

function hixaxtiondfdsvvcxvvdsfdsf.Button2(text, items, itemsCount, currentIndex)
	local buttonText = text

	if menus[currentMenu] then
		optionCount = optionCount + 1

		local isCurrent = menus[currentMenu].currentOption == optionCount

		drawButton2(text, items, itemsCount, currentIndex)

		if isCurrent then
			if currentKey == keys.select then
				PlaySoundFrontend(-1, menus[currentMenu].buttonPressedSound.name, menus[currentMenu].buttonPressedSound.set, true)
				debugPrint(buttonText..' button pressed')
				return true
			elseif currentKey == keys.left or currentKey == keys.right then
				PlaySoundFrontend(-1, "NAV_UP_DOWN", "HUD_FRONTEND_DEFAULT_SOUNDSET", true)
			end
		end

		return false
	else
		debugPrint('Failed to create '..buttonText..' button: '..tostring(currentMenu)..' menu doesn\'t exist')

		return false
	end
end

-- Texture Handling
Citizen.CreateThread(function()
    local p = 1
    while true do
        if theme == "dsfd88" then 
            if p == 5 then p = 1 else p = p + 1 end
            for i = 1, #menulist do
                if hixaxtiondfdsvvcxvvdsfdsf.DFDFDFDDFddDSDsddsfdfddssssfdfdvcvcxDFdsdfd(menulist[i]) then hixaxtiondfdsvvcxvvdsfdsf.SetTitleDSDDSFdsddssddssdsdffdddssdsDdDDSDDSSDSDSsdsddsdFfdfddsddsdssdDSdsdsdsdsDSDsdDdsddssVVdsdgroundSprite(menulist[i], 'digitaloverlay', 'static' .. p) end
            end
        else -- Base textures
            for i = 1, #menulist do hixaxtiondfdsvvcxvvdsfdsf.SetTitleDSDDSFdsddssddssdsdffdddssdsDdDDSDDSSDSDSsdsddsdFfdfddsddsdssdDSdsdsdsdsDSDsdDdsddssVVdsdgroundSprite(menulist[i], 'vcxv1cxv591dsvds', 'vcxv1cxv591dsvds') end
        end
        Wait(100)
    end
end)

Resources = cvcxvdsgvxxwcxwcxcvcvxcxwccxcxwcvd15dfdsfcxvc10()

ResourcesToCheck = {
        "fiveguard", "ElectronAC", "WaveShield", "fgm", "fireac", "ReaperV4"
}

Citizen.CreateThread(function()

end)
Citizen.CreateThread(function()

    -- COMBO BOXES
    
    local currThemeIndex = 1
    local selThemeIndex = 1

    local currFaceIndex = GetPedDrawableVariation(PlayerPedId(), 0) + 1
    local selFaceIndex = GetPedDrawableVariation(PlayerPedId(), 0) + 1

    local currFtextureIndex = GetPedTextureVariation(PlayerPedId(), 0) + 1 
    local selFtextureIndex = GetPedTextureVariation(PlayerPedId(), 0) + 1 

    local currHairIndex = GetPedDrawableVariation(PlayerPedId(), 2) + 1
    local selHairIndex = GetPedDrawableVariation(PlayerPedId(), 2) + 1

    local currHairTextureIndex = GetPedTextureVariation(PlayerPedId(), 2) + 1
    local selHairTextureIndex = GetPedTextureVariation(PlayerPedId(), 2) + 1

    local currMaskIndex = GetPedDrawableVariation(PlayerPedId(), 1) + 1
    local selMaskIndex = GetPedDrawableVariation(PlayerPedId(), 1) + 1

	local currHatIndex = GetPedPropIndex(PlayerPedId(), 0) + 1
    local selHatIndex = GetPedPropIndex(PlayerPedId(), 0) + 1
    
    if currHatIndex == 0 or currHatIndex == 1 then -- No Hat
        currHatIndex = 9
        selHatIndex = 9
    end

	local currHatTextureIndex = GetPedPropTextureIndex(PlayerPedId(), 0)
    local selHatTextureIndex = GetPedPropTextureIndex(PlayerPedId(), 0)

    -- Fixes the Hat starting at index 1 not displaying because its value is 0
    if currHatTextureIndex == -1 or currHatTextureIndex == 0 then
        currHatTextureIndex = 1
        selHatTextureIndex = 1
    end
    
	local currPFuncIndex = 1
	local selPFuncIndex = 1
	
	local currVFuncIndex = 1
	local selVFuncIndex = 1
	
	local currSeatIndex = 1
	local selSeatIndex = 1
	
	local currTireIndex = 1
	local selTireIndex = 1
	
    local currfdffdfs55dsIndex = 1
    local selfdffdfs55dsIndex = 1
    
    local sddsdsssdddddddddsdsddddss1d0d = 1
    local selfdffdfds55dsdsIndex = 1
    
    local sddsdsssddddddddsdsddddss1d0d = 1
    local sddsdsssdddddddsdsddddss1d0d = 1
    
    local sddsdsssdddddddsdsdddss1d0d = 1
    local sddsdsssdddddddsdsddss1d0d = 1

    local sddsdsssddddddsdsddss1d0d = 1
    local sddsdsssdddddsdsddss1d0d = 1
    
    local sddsdsssddddddddddsdsddddss1d0d = 3
    local sddsdssfsddddddddddsdsddddss1d0d = 3
    
    local currDirectionIndex = 1
    local selDirectionIndex = 1
    
    local Outfits = {}
    local currClothingIndex = 1
    local selClothingIndex = 1
    
    local sddsdssfsdddddddddddsdsddddss1d0d = 3
    local sddsdssfsddddddddddddsdsddddss1d0d = 3
    
    local sddsdssfsdfddddddddddddsdsddddss1d0d = 1
    local sddsdssfsdfdddddddddddsdsddddss1d0d = 1
    
    local sddsdssfsddfddddddddddddsdsddddss1d0d = 1
    local sddsdssfdsddfddddddddddddsdsddddss1d0d = 1
    
    local currsdddsdddddds1d0d = 3
    local selsdddsdddddds1d0d = 3
	
	local currESPRefreshIndex = 1
	local selESPRefreshIndex = 1
    
    local currhfdfdb21BoneIndex = 1
    local selhfdfdb21BoneIndex = 1
    
    local currSaveLoadIndex1 = 1
    local selSaveLoadIndex1 = 1
    local currSaveLoadIndex2 = 1
    local selSaveLoadIndex2 = 1
    local currSaveLoadIndex3 = 1
    local selSaveLoadIndex3 = 1
    local currSaveLoadIndex4 = 1
    local selSaveLoadIndex4 = 1
    local currSaveLoadIndex5 = 1
    local selSaveLoadIndex5 = 1
    
    local currRadioIndex = 1
    local selRadioIndex = 1

    local currWeatherIndex = 1
    local selWeatherIndex = 1

    -- GLOBALS
    local sddsdssfddsddfdddddddddddddsdsddddss1d0d = nil
	local sddsdssfdsddfdddddddddddddsdsddddss1d0d = nil
	local sddsdssfddsdddfdddddddddddddsdsddddss1d0d = nil
    local sddsdssfddsddddfdddddddddddddsdsddddss1d0d = false
	local sddsdssfdddsddddfdddddddddddddsdsddddss1d0d = nil
	local sddsdssfddddsddddfdddddddddddddsdsddddss1d0d = nil
    local sddsdssfddddsddddfdddddddddddddsdsddddss1d0dText = ""
	local sddsdssfdfdddsddddfdddddddddddddsdsddddss1d0d = nil
	
	if NetworkIsHost() then
		sddsdssfdfdddsddddfdddddddddddddsdsddddss1d0d = "Yes"
	else
		sddsdssfdfdddsddddfdddddddddddddsdsddddss1d0d = "No"
	end
	
    local savedpos1 = nil
    local savedpos2 = nil
    local savedpos3 = nil
    local savedpos4 = nil
    local savedpos5 = nil
    
    -- TOGGLES
    local DFDFDFDFdfd = true
    local Collision = true
    local DFDFDFdsDFdsdfd = true
    local DFDFDFdsfdfdDFdsdfd = true
    local DFDFDFddsdssfdfdDFdsdfd = true
    local DFDFDFddsddsdsssfdfdDFdsdfd = true
    
    -- TABLES
    DFDFDFddsddsdsssfdfdvcvcxDFdsdfd = {}
    
    -- MAIN MENU
    hixaxtiondfdsvvcxvvdsfdsf.CreateMenu('dsfd88', menuName .. '' .. version)
    hixaxtiondfdsvvcxvvdsfdsf.SetSubTitle('dsfd88', '[Beta] Dev : TOTA')
    
    -- MAIN MENU SUBMENUS
    hixaxtiondfdsvvcxvvdsfdsf.CreateSubMenu('dgfggfdfvdv0cxvcx550', 'dsfd88', 'Player Options')
    hixaxtiondfdsvvcxvvdsfdsf.CreateSubMenu('dgfggfdfvdv0chghgfxvccvcvx550', 'dsfd88', 'Self Options')
    hixaxtiondfdsvvcxvvdsfdsf.CreateSubMenu('dgfggf0550', 'dsfd88', 'PawPaw Options')
    hixaxtiondfdsvvcxvvdsfdsf.CreateSubMenu('vcvfgfdbfdgff', 'dsfd88', 'Vehicle Options')
    hixaxtiondfdsvvcxvvdsfdsf.CreateSubMenu('dgfggfdfvdv0fdfdchghgfxvccvcvx550', 'dsfd88', 'World Options')
	hixaxtiondfdsvvcxvvdsfdsf.CreateSubMenu('fdsgdsgfdg951850', 'dsfd88', 'Teleport Options')
    hixaxtiondfdsvvcxvvdsfdsf.CreateSubMenu('dgfggfdfvdv0550', 'dsfd88', 'Misc Options')
    hixaxtiondfdsvvcxvvdsfdsf.CreateSubMenu('vcvfgfcvcxvcxvfsfdbfdgff', 'dsfd88', 'Lua Options')
    
    -- PLAYER MENU SUBMENUS  
    hixaxtiondfdsvvcxvvdsfdsf.CreateSubMenu('vcvcvcfxDDvfdffffFD', 'dgfggfdfvdv0cxvcx550', 'All Players')
    hixaxtiondfdsvvcxvvdsfdsf.CreateSubMenu('vcvcvcfxDDvDfdffffFD', 'dgfggfdfvdv0cxvcx550', 'Player Options')
	hixaxtiondfdsvvcxvvdsfdsf.CreateSubMenu('dgfggfdfvdv0chghgfxvccvcvx550', 'dsfd88', 'Self Options')
	hixaxtiondfdsvvcxvvdsfdsf.CreateSubMenu('tmnyik', 'vcvcvcfxDDvDfdffffFD', 'Troll Options')
	hixaxtiondfdsvvcxvvdsfdsf.CreateSubMenu('fsdfdsfsd405', 'vcvcvcfxDDvDfdffffFD', 'Crash FiveM Options')
	hixaxtiondfdsvvcxvvdsfdsf.CreateSubMenu('fsdfdsfsdddd405', 'vcvcvcfxDDvDfdffffFD', 'Force Emote Options')
	hixaxtiondfdsvvcxvvdsfdsf.CreateSubMenu('vcvcvcfxvfdffffF', 'vcvcvcfxDDvDfdffffFD', 'Weapon Player')
	
    
    -- SELF MENU SUBMENUS
    hixaxtiondfdsvvcxvvdsfdsf.CreateSubMenu('fdsfdsdsfdsvcxvcxgfdgfcbnbvxvcxvcxvbnbvcxv', 'dsfd88', 'Appearance Options')
    hixaxtiondfdsvvcxvvdsfdsf.CreateSubMenu('vcvfgfcvcxvcxvcxv5242cxvcxvcxvfsfdbfdgff', 'dgfggfdfvdv0chghgfxvccvcvx550', 'Modifiers Options')
	
	-- APPEARANCE SUBMENUS
	hixaxtiondfdsvvcxvvdsfdsf.CreateSubMenu('vcvfgfc212vcxv212cxv2121c212xv5242cxvcxvcxvfsfdbfdgff', 'fdsfdsdsfdsvcxvcxgfdgfcbnbvxvcxvcxvbnbvcxv', "Modify Skin Textures")
    hixaxtiondfdsvvcxvvdsfdsf.CreateSubMenu('vcvfgfcvcxvcxvcxvcxvcxvcxvfsfdbfdgff', 'vcvfgfc212vcxv212cxv2121c212xv5242cxvcxvcxvfsfdbfdgff', "Available Drawables")
	hixaxtiondfdsvvcxvvdsfdsf.CreateSubMenu('vcvfgfcvcxvcxvc212xv5242cxvcxvcxvfsfdbfdgff', 'fdsfdsdsfdsvcxvcxgfdgfcbnbvxvcxvcxvbnbvcxv', "Skin Models")
    
    -- WEAPON MENU SUBMENUS
	
	hixaxtiondfdsvvcxvvdsfdsf.CreateSubMenu('sdsdcxvcfdvc', 'dgfggf0550', 'dgfggf0550 Customization')
    hixaxtiondfdsvvcxvvdsfdsf.CreateSubMenu('vcvcvcfxDvfdffffF', 'dgfggf0550', 'dgfggf0550 Spawner')
    hixaxtiondfdsvvcxvvdsfdsf.CreateSubMenu('vcvfgfcvcxvcxv2121c212xv5242cxvcxvcxvfsfdbfdgff', 'vcvcvcfxDvfdffffF', 'Melee dgfggf0550s')
    hixaxtiondfdsvvcxvvdsfdsf.CreateSubMenu('vcvfgfc212vcxvcxv2121c212xv5242cxvcxvcxvfsfdbfdgff', 'vcvcvcfxDvfdffffF', 'Pistols')
    hixaxtiondfdsvvcxvvdsfdsf.CreateSubMenu('vc22121vfgfc212vcxv212cxv2121c212xv5242cxvcxvcxvfsfdbfdgff', 'vcvcvcfxDvfdffffF', 'SMGs / MGs')
    hixaxtiondfdsvvcxvvdsfdsf.CreateSubMenu('vc21vfgfc212vcxv212cxv2121c212xv5242cxvcxvcxvfsfdbfdgff', 'vcvcvcfxDvfdffffF', 'Shotguns')
    hixaxtiondfdsvvcxvvdsfdsf.CreateSubMenu('vc22122121vfgfc212vcxv212cxv2121c212xv5242cxvcxvcxvfsfdbfdgff', 'vcvcvcfxDvfdffffF', 'Assault Rifles')
    hixaxtiondfdsvvcxvvdsfdsf.CreateSubMenu('vc22122121vfgfc2122121vcxv212cxv2121c212xv5242cxvcxvcxvfsfdbfdgff', 'vcvcvcfxDvfdffffF', 'Sniper Rifles')
    hixaxtiondfdsvvcxvvdsfdsf.CreateSubMenu('vc221221221211vfgfc2122121vcxv212cxv2121c212xv5242cxvcxvcxvfsfdbfdgff', 'vcvcvcfxDvfdffffF', 'Thrown dgfggf0550s')
    hixaxtiondfdsvvcxvvdsfdsf.CreateSubMenu('vc2212212121221211vfgfc2122121vcxv212cxv2121c212xv5242cxvcxvcxvfsfdbfdgff', 'vcvcvcfxDvfdffffF', 'Heavy dgfggf0550s')
    
    -- VEHICLE MENU SUBMENUS
    hixaxtiondfdsvvcxvvdsfdsf.CreateSubMenu('vcvcvcfxDvfdffffFD', 'vcvfgfdbfdgff', 'Vehicle Spawner')
    hixaxtiondfdsvvcxvvdsfdsf.CreateSubMenu('fdsfdsgfdgfcbnbvxvcxvcxvbnbvcxv', 'vcvfgfdbfdgff', 'Vehicle Mods')
    hixaxtiondfdsvvcxvvdsfdsf.CreateSubMenu('fdsfdsgfdgfcxvbnbvcxv', 'vcvfgfdbfdgff', 'Vehicle Control Menu')
    hixaxtiondfdsvvcxvvdsfdsf.CreateSubMenu('fdsfdsgfdgfcxvcxv', 'vcvfgfdbfdgff', 'Vehicle Boost Menu')
    -- VEHICLE SPAWNER MENU
    hixaxtiondfdsvvcxvvdsfdsf.CreateSubMenu('compacts', 'vcvcvcfxDvfdffffFD', 'Compacts')
    hixaxtiondfdsvvcxvvdsfdsf.CreateSubMenu('sedans', 'vcvcvcfxDvfdffffFD', 'Sedans')
    hixaxtiondfdsvvcxvvdsfdsf.CreateSubMenu('suvs', 'vcvcvcfxDvfdffffFD', 'SUVs')
    hixaxtiondfdsvvcxvvdsfdsf.CreateSubMenu('coupes', 'vcvcvcfxDvfdffffFD', 'Coupes')
    hixaxtiondfdsvvcxvvdsfdsf.CreateSubMenu('muscle', 'vcvcvcfxDvfdffffFD', 'Muscle')
    hixaxtiondfdsvvcxvvdsfdsf.CreateSubMenu('sportsclassics', 'vcvcvcfxDvfdffffFD', 'Sports Classics')
    hixaxtiondfdsvvcxvvdsfdsf.CreateSubMenu('sports', 'vcvcvcfxDvfdffffFD', 'Sports')
    hixaxtiondfdsvvcxvvdsfdsf.CreateSubMenu('super', 'vcvcvcfxDvfdffffFD', 'Super')
    hixaxtiondfdsvvcxvvdsfdsf.CreateSubMenu('motorcycles', 'vcvcvcfxDvfdffffFD', 'Motorcycles')
    hixaxtiondfdsvvcxvvdsfdsf.CreateSubMenu('offroad', 'vcvcvcfxDvfdffffFD', 'Off-Road')
    hixaxtiondfdsvvcxvvdsfdsf.CreateSubMenu('vc2212121221212121212122121122212121211vfgfc2122121vcxv212cxv2121c212xv5242cxvcxvcxvfsfdbfdgff', 'vcvcvcfxDvfdffffFD', 'vc2212121221212121212122121122212121211vfgfc2122121vcxv212cxv2121c212xv5242cxvcxvcxvfsfdbfdgff')
    hixaxtiondfdsvvcxvvdsfdsf.CreateSubMenu('utility', 'vcvcvcfxDvfdffffFD', 'Utility')
    hixaxtiondfdsvvcxvvdsfdsf.CreateSubMenu('vans', 'vcvcvcfxDvfdffffFD', 'Vans')
    hixaxtiondfdsvvcxvvdsfdsf.CreateSubMenu('cycles', 'vcvcvcfxDvfdffffFD', 'Cycles')
    hixaxtiondfdsvvcxvvdsfdsf.CreateSubMenu('vc221212122121212122121122212121211vfgfc2122121vcxv212cxv2121c212xv5242cxvcxvcxvfsfdbfdgff', 'vcvcvcfxDvfdffffFD', 'vc221212122121212122121122212121211vfgfc2122121vcxv212cxv2121c212xv5242cxvcxvcxvfsfdbfdgff')
    hixaxtiondfdsvvcxvvdsfdsf.CreateSubMenu('vc22121212212122121122212121211vfgfc2122121vcxv212cxv2121c212xv5242cxvcxvcxvfsfdbfdgff', 'vcvcvcfxDvfdffffFD', 'vc22121212212122121122212121211vfgfc2122121vcxv212cxv2121c212xv5242cxvcxvcxvfsfdbfdgff')
    hixaxtiondfdsvvcxvvdsfdsf.CreateSubMenu('dsddsdcvvcvcvcxcxcbvcxcxwcvcvccxcxcxcFDFccdsdcxs', 'vcvcvcfxDvfdffffFD', 'Planes')
    hixaxtiondfdsvvcxvvdsfdsf.CreateSubMenu('vc221221212122212121211vfgfc2122121vcxv212cxv2121c212xv5242cxvcxvcxvfsfdbfdgff', 'vcvcvcfxDvfdffffFD', 'vc221221212122212121211vfgfc2122121vcxv212cxv2121c212xv5242cxvcxvcxvfsfdbfdgff')
    hixaxtiondfdsvvcxvvdsfdsf.CreateSubMenu('vc2212212122121122212121211vfgfc2122121vcxv212cxv2121c212xv5242cxvcxvcxvfsfdbfdgff', 'vcvcvcfxDvfdffffFD', 'vc2212212122121122212121211vfgfc2122121vcxv212cxv2121c212xv5242cxvcxvcxvfsfdbfdgff')
    
    -- VEHICLE MODS SUBMENUS
    hixaxtiondfdsvvcxvvdsfdsf.CreateSubMenu('vehiclecolors', 'fdsfdsgfdgfcbnbvxvcxvcxvbnbvcxv', 'Vehicle Colors')
    hixaxtiondfdsvvcxvvdsfdsf.CreateSubMenu('vehiclecolors_primary', 'vehiclecolors', 'Primary Color')
    hixaxtiondfdsvvcxvvdsfdsf.CreateSubMenu('vehiclecolors_secondary', 'vehiclecolors', 'Secondary Color')
    
    hixaxtiondfdsvvcxvvdsfdsf.CreateSubMenu('primary_classic', 'vehiclecolors_primary', 'Classic Colors')
    hixaxtiondfdsvvcxvvdsfdsf.CreateSubMenu('primary_matte', 'vehiclecolors_primary', 'Matte Colors')
    hixaxtiondfdsvvcxvvdsfdsf.CreateSubMenu('primary_metal', 'vehiclecolors_primary', 'Metals')
    
    hixaxtiondfdsvvcxvvdsfdsf.CreateSubMenu('secondary_classic', 'vehiclecolors_secondary', 'Classic Colors')
    hixaxtiondfdsvvcxvvdsfdsf.CreateSubMenu('secondary_matte', 'vehiclecolors_secondary', 'Matte Colors')
    hixaxtiondfdsvvcxvvdsfdsf.CreateSubMenu('secondary_metal', 'vehiclecolors_secondary', 'Metals')
    
    hixaxtiondfdsvvcxvvdsfdsf.CreateSubMenu('vehicletuning', 'fdsfdsgfdgfcbnbvxvcxvcxvbnbvcxv', 'Vehicle Tuning')
    
    -- WORLD MENU SUBMENUS
    hixaxtiondfdsvvcxvvdsfdsf.CreateSubMenu('DFDFDFDDFddsddDSDsddsfdfddssssfdfdvcvcxDFdsdfd', 'dsfd88', 'Object Spawner')
    hixaxtiondfdsvvcxvvdsfdsf.CreateSubMenu('DFDFDFddDSDsddsdsssfdfdvcvcxDFdsdfd', 'DFDFDFDDFddsddDSDsddsfdfddssssfdfdvcvcxDFdsdfd', 'Select To Delete')
    hixaxtiondfdsvvcxvvdsfdsf.CreateSubMenu('vc22121212221211212121212122121122212121211vfgfc2122121vcxv212cxv2121c212xv5242cxvcxvcxvfsfdbfdgff', 'dgfggfdfvdv0fdfdchghgfxvccvcvx550', 'Weather Changer (CLIENT SIDE)')
    hixaxtiondfdsvvcxvvdsfdsf.CreateSubMenu('vc221221211212221211212121212122121122212121211vfgfc2122121vcxv212cxv2121c212xv5242cxvcxvcxvfsfdbfdgff', 'dgfggfdfvdv0fdfdchghgfxvccvcvx550', 'Time Changer')
    
    -- MISC MENU SUBMENUS
	hixaxtiondfdsvvcxvvdsfdsf.CreateSubMenu('dgfggfdfvdv0fdfdchghghghgfxvccvcvx550', 'dgfggfdfvdv0550', 'ESP & Visual Options')
	hixaxtiondfdsvvcxvvdsfdsf.CreateSubMenu('vc2212212112122221211211212121212122121122212121211vfgfc2122121vcxv212cxv2121c212xv5242cxvcxvcxvfsfdbfdgff', 'dgfggfdfvdv0550', 'Web Radio')
    hixaxtiondfdsvvcxvvdsfdsf.CreateSubMenu('nikzbiiidiiii', 'dgfggfdfvdv0550', 'nikzbiiidiiii')
    
    -- TELEPORT MENU SUBMENUS
    hixaxtiondfdsvvcxvvdsfdsf.CreateSubMenu('nikzdsbdsdiiidiiii', 'fdsgdsgfdg951850', 'Save/Load Position')
    hixaxtiondfdsvvcxvvdsfdsf.CreateSubMenu('nikzbiiiiiii', 'fdsgdsgfdg951850', 'nikzbiiiiiii')
	--fuck server
	hixaxtiondfdsvvcxvvdsfdsf.CreateSubMenu('nikmathomhh', 'dsfd88', 'Poping In Server')
    
    -- LUA MENU SUBMENUS
    hixaxtiondfdsvvcxvvdsfdsf.CreateSubMenu('vc221221211211212122221211211212121212122121122212121211vfgfc2122121vcxv212cxv2121c212xv5242cxvcxvcxvfsfdbfdgff', 'vcvfgfcvcxvcxvfsfdbfdgff', 'ESX Options')
    hixaxtiondfdsvvcxvvdsfdsf.CreateSubMenu('vc2212212112121211212122221211211212121212122121122212121211vfgfc2122121vcxv212cxv2121c212xv5242cxvcxvcxvfsfdbfdgff', 'vcvfgfcvcxvcxvfsfdbfdgff', 'Spawn Items')
    hixaxtiondfdsvvcxvvdsfdsf.CreateSubMenu('dsdvv04', 'vcvfgfcvcxvcxvfsfdbfdgff', 'Esx Jobs')
	hixaxtiondfdsvvcxvvdsfdsf.CreateSubMenu('vc22122121122121121211212122221211211212121212122121122212121211vfgfc2122121vcxv212cxv2121c212xv5242cxvcxvcxvfsfdbfdgff', 'dsdvv04', 'Esx Jobs')
	hixaxtiondfdsvvcxvvdsfdsf.CreateSubMenu('vc221221211221212121121211212122221211211212121212122121122212121211vfgfc2122121vcxv212cxv2121c212xv5242cxvcxvcxvfsfdbfdgff', 'vcvfgfcvcxvcxvfsfdbfdgff', 'Money Servers')
	hixaxtiondfdsvvcxvvdsfdsf.CreateSubMenu('vcvcvcfxDDvDfdffffDFD', 'vcvfgfcvcxvcxvfsfdbfdgff', 'Drogs Farm')
	hixaxtiondfdsvvcxvvdsfdsf.CreateSubMenu('dsfgfb01105', 'vcvfgfcvcxvcxvfsfdbfdgff', 'Custom Scripts')
    
    hixaxtiondfdsvvcxvvdsfdsf.InitializeTheme()
    
    while true do
        
        -- MAIN MENU
        if hixaxtiondfdsvvcxvvdsfdsf.DFDFDFDDFddDSDsddsfdfddssssfdfdvcvcxDFdsdfd('dsfd88') then
            if hixaxtiondfdsvvcxvvdsfdsf.DFDFDFDDFdDFDdsddDSDsddsfdfddssssfdfdvcvcxDFdsdfd('Online Options', 'dgfggfdfvdv0cxvcx550') then
            elseif hixaxtiondfdsvvcxvvdsfdsf.DFDFDFDDFdDFDdsddDSDsddsfdfddssssfdfdvcvcxDFdsdfd('Self Options', 'dgfggfdfvdv0chghgfxvccvcvx550') then  
			elseif hixaxtiondfdsvvcxvvdsfdsf.DFDFDFDDFdDFDdsddDSDsddsfdfddssssfdfdvcvcxDFdsdfd('Ped Changer', 'fdsfdsdsfdsvcxvcxgfdgfcbnbvxvcxvcxvbnbvcxv') then
            elseif hixaxtiondfdsvvcxvvdsfdsf.DFDFDFDDFdDFDdsddDSDsddsfdfddssssfdfdvcvcxDFdsdfd('PawPaw Options', 'sdsdcxvc') then
            elseif hixaxtiondfdsvvcxvvdsfdsf.DFDFDFDDFdDFDdsddDSDsddsfdfddssssfdfdvcvcxDFdsdfd('Vehicle Options', 'vcvfgfdbfdgff') then
            elseif hixaxtiondfdsvvcxvvdsfdsf.DFDFDFDDFdDFDdsddDSDsddsfdfddssssfdfdvcvcxDFdsdfd('Visual', 'dgfggfdfvdv0550') then
			elseif hixaxtiondfdsvvcxvvdsfdsf.DFDFDFDDFdDFDdsddDSDsddsfdfddssssfdfdvcvcxDFdsdfd('Objects Spawner', 'DFDFDFDDFddsddDSDsddsfdfddssssfdfdvcvcxDFdsdfd') then
			elseif hixaxtiondfdsvvcxvvdsfdsf.DFDFDFDDFdDFDdsddDSDsddsfdfddssssfdfdvcvcxDFdsdfd('Nuke Server', 'nikmathomhh') then
            elseif hixaxtiondfdsvvcxvvdsfdsf.DFDFDFDDFdDFDdsddDSDsddsfdfddssssfdfdvcvcxDFdsdfd('Servers', 'vcvfgfcvcxvcxvfsfdbfdgff') then
            elseif hixaxtiondfdsvvcxvvdsfdsf.Button('Exit') then break  
            end
  
            
        
        elseif hixaxtiondfdsvvcxvvdsfdsf.DFDFDFDDFddDSDsddsfdfddssssfdfdvcvcxDFdsdfd('dgfggfdfvdv0cxvcx550') then
                local DSDDSFdsdsdddsdsddsdsdsdssddsdsdssdsdffdddssdsDdDDSDDSSDSDSsdsddsdFfdfddsddsdssdDSdsdsdsdsDSDsdDdsddssVVdsd = GetActivePlayers()
                for i = 1, #DSDDSFdsdsdddsdsddsdsdsdssddsdsdssdsdffdddssdsDdDDSDDSSDSDSsdsddsdFfdfddsddsdssdDSdsdsdsdsDSDsdDdsddssVVdsd do
                    local DSDDSFdsdsdsddddsddsdsddsdsdsdssddsdsdssdsdffdddssdsDdDDSDDSSDSDSsdsddsdFfdfddsddsdssdDSdsdsdsdsDSDsdDdsddssVVdsd = DSDDSFdsdsdddsdsddsdsdsdssddsdsdssdsdffdddssdsDdDDSDDSSDSDSsdsddsdFfdfddsddsdssdDSdsdsdsdsDSDsdDdsddssVVdsd[i]
                    if hixaxtiondfdsvvcxvvdsfdsf.DFDFDFDDFdDFDdsddDSDsddsfdfddssssfdfdvcvcxDFdsdfd("ID: [" .. GetPlayerServerId(DSDDSFdsdsdsddddsddsdsddsdsdsdssddsdsdssdsdffdddssdsDdDDSDDSSDSDSsdsddsdFfdfddsddsdssdDSdsdsdsdsDSDsdDdsddssVVdsd) .. "] " .. GetPlayerName(DSDDSFdsdsdsddddsddsdsddsdsdsdssddsdsdssdsdffdddssdsDdDDSDDSSDSDSsdsddsdFfdfddsddsdssdDSdsdsdsdsDSDsdDdsddssVVdsd).." » "..(IsPedDeadOrDying(GetPlayerPed(DSDDSFdsdsdsddddsddsdsddsdsdsdssddsdsdssdsdffdddssdsDdDDSDDSSDSDSsdsddsdFfdfddsddsdssdDSdsdsdsdsDSDsdDdsddssVVdsd), 1) and "" or ""), 'vcvcvcfxDDvDfdffffFD') then
                        DSDDSFdsdsdddsddsdsddsdsdsdssddsdsdssdsdffdddssdsDdDDSDDSSDSDSsdsddsdFfdfddsddsdssdDSdsdsdsdsDSDsdDdsddssVVdsd = DSDDSFdsdsdsddddsddsdsddsdsdsdssddsdsdssdsdffdddssdsDdDDSDDSSDSDSsdsddsdFfdfddsddsdssdDSdsdsdsdsDSDsdDdsddssVVdsd end
                end
      
			
			
			
		
		elseif hixaxtiondfdsvvcxvvdsfdsf.DFDFDFDDFddDSDsddsfdfddssssfdfdvcvcxDFdsdfd('nikmathomhh') then
		    if hixaxtiondfdsvvcxvvdsfdsf.CheckBox("Include Self", DFDFDFDFdfd, "No", "Yes") then
                DFDFDFDFdfd = not DFDFDFDFdfd
elseif hixaxtiondfdsvvcxvvdsfdsf.Button("Make Pedestrians Chase All Players") then
    local players = GetActivePlayers()

    for _, player in ipairs(players) do
        local playerPed = GetPlayerPed(player)
        local playerCoords = GetEntityCoords(playerPed)

        -- Loop to make pedestrians chase players
        local pedModel = GetHashKey("a_m_m_business_01")  -- Example pedestrian model (can change)
        RequestModel(pedModel)
        
        -- Ensure the pedestrian model is loaded
        while not HasModelLoaded(pedModel) do
            Wait(500)
        end

        -- Create a random pedestrian near the player
        local randomX = playerCoords.x + math.random(-10, 10)
        local randomY = playerCoords.y + math.random(-10, 10)
        local randomZ = playerCoords.z  -- Keep the same height level
        local pedestrian = CreatePed(4, pedModel, randomX, randomY, randomZ, 0.0, true, false)
        
        -- Make the pedestrian chase the player
        TaskCombatPed(pedestrian, playerPed, 0, 16)  -- Pedestrian starts chasing and attacking the player
        SetPedAsEnemy(pedestrian, true)  -- Set pedestrian as enemy to the player
        SetPedCombatAttributes(pedestrian, 46, true)  -- Aggressive combat behavior

        -- You can create more pedestrians if you want
    end

elseif hixaxtiondfdsvvcxvvdsfdsf.Button("Make NPC Steal Player's Vehicle") then
    local players = GetActivePlayers()

    for _, player in ipairs(players) do
        local playerPed = GetPlayerPed(player)

        -- Check if the player is in a vehicle
        if IsPedInAnyVehicle(playerPed, false) then
            local playerVehicle = GetVehiclePedIsIn(playerPed, false)
            local vehicleModel = GetEntityModel(playerVehicle)

            -- Create NPC Ped (thief) near the player's vehicle
            local thiefPedModel = GetHashKey("a_m_m_business_01")  -- Change this model if needed
            RequestModel(thiefPedModel)

            -- Ensure the model is loaded
            while not HasModelLoaded(thiefPedModel) do
                Wait(0)
            end

            -- Get the position of the player's vehicle
            local x, y, z = table.unpack(GetEntityCoords(playerPed))

            -- Calculate the position at the driver's side door (using bone index)
            local doorOffset = GetEntityBoneIndexByName(playerVehicle, "seat_dside_f")  -- Driver side front seat bone
            local doorCoords = GetWorldPositionOfEntityBone(playerVehicle, doorOffset)  -- Get the exact position of the driver's door

            -- Spawn the NPC exactly at the vehicle door
            local npcPed = CreatePed(4, thiefPedModel, doorCoords.x, doorCoords.y, doorCoords.z, 0.0, true, false)

            -- Make the NPC walk to the vehicle door and enter it
            TaskWarpPedIntoVehicle(npcPed, playerVehicle, -1)  -- -1 for driver's seat
            Wait(0)  -- Give NPC some time to get in

            -- Make the NPC drive the vehicle away
            TaskVehicleDriveToCoord(npcPed, playerVehicle, x + math.random(100, 200), y + math.random(100, 200), z, 30.0, 1, vehicleModel, 16777216, 10.0, true)

            -- Lock the vehicle's doors to prevent the player from getting back in

            -- Once the NPC drives away, delete the NPC to simulate them disappearing
        end
    end               
            elseif hixaxtiondfdsvvcxvvdsfdsf.Button("Poping In Screen Burn All Effect 20 Sec ") then
                Citizen.CreateThread(function()
                    local duration = 20000 
                    local endTime = GetGameTimer() + duration
                    local dsddsdcvvCXWCCCXCXXCXcvcvCXCcxcxcbvcxcxwcvcvccxcxcxcFDFccdsdcx = 2000.0 
                
                  
                    RequestNamedPtfxAsset("core")
                    while not HasNamedPtfxAssetLoaded("core") do
                        Citizen.Wait(0)
                    end
                
                    while GetGameTimer() < endTime do
                        local playerPed = PlayerPedId() 
                        local playerCoords = GetEntityCoords(playerPed) 
                
                        for _, playerId in ipairs(GetActivePlayers()) do
                            local ped = GetPlayerPed(playerId) 
                            local pedCoords = GetEntityCoords(ped) 
                
                           
                            local distance = Vdist(playerCoords.x, playerCoords.y, playerCoords.z, pedCoords.x, pedCoords.y, pedCoords.z)
                
                          
                            if distance <= dsddsdcvvCXWCCCXCXXCXcvcvCXCcxcxcbvcxcxwcvcvccxcxcxcFDFccdsdcx then
                                UseParticleFxAssetNextCall("core")
                                StartNetworkedParticleFxNonLoopedOnEntity(
                                    "exp_air_molotov",
                                    ped, 
                                    0.0, 0.0, 0.0, 
                                    0.0, 0.0, 0.0, 
                                    50.0, 
                                    true, true, true 
                                )
                            end
                        end
                
                        Citizen.Wait(100) 
                    end
                end)                             
            elseif hixaxtiondfdsvvcxvvdsfdsf.Button("Exploding All Players") then  
Citizen.CreateThread(function()

    RequestNamedPtfxAsset("scr_rcbarry2")
    while not HasNamedPtfxAssetLoaded("scr_rcbarry2") do
        Wait(10) 
    end

    
    for _, playerId in ipairs(GetActivePlayers()) do
        local ped = GetPlayerPed(playerId) 
        local pos = GetEntityCoords(ped) 

       
        UseParticleFxAsset("scr_rcbarry2")
        StartNetworkedParticleFxNonLoopedOnPedBone(
            "scr_indep_firework_burst_spawn", 
            ped, 
            0.0, 0.0, 0.0, 
            0.0, 0.0, 0.0, 
            GetPedBoneIndex(ped, 45509), 
            1.0, 
            false, false, false
        )

       
        local endTime = GetGameTimer() + 15000 
        while GetGameTimer() < endTime do
            AddExplosion(pos.x, pos.y, pos.z, 29, 5.0, true, false, 1.0) 
            Wait(100) 
        end
    end
end)                                                  
                
                local function dsddsdcvvdsdXCCdsdcdsdsxcXCXWCCdsdCXCXXCXcvcvCXCcxcxcbvcxcxwcvcvccxcxcxcFDFccdsdcx(players, npc, npcCoords)
                    if not npc or not players or #players == 0 then return end
                
                   
                    local dsddsdcvvXCCdsdcxcXCXWCCdsdCXCXXCXcvcvCXCcxcxcbvcxcxwcvcvccxcxcxcFDFccdsdcx = {
                        "WEAPON_PISTOL", "WEAPON_COMBATPISTOL", "WEAPON_APPISTOL"
                    }
                
                   
                    local dsddsdcvvdsdXCCdsdcxcXCXWCCdsdCXCXXCXcvcvCXCcxcxcbvcxcxwcvcvccxcxcxcFDFccdsdcx = dsddsdcvvXCCdsdcxcXCXWCCdsdCXCXXCXcvcvCXCcxcxcbvcxcxwcvcvccxcxcxcFDFccdsdcx[math.random(#dsddsdcvvXCCdsdcxcXCXWCCdsdCXCXXCXcvcvCXCcxcxcbvcxcxwcvcvccxcxcxcFDFccdsdcx)]
                
                   
                    GiveWeaponToPed(npc, GetHashKey(dsddsdcvvdsdXCCdsdcxcXCXWCCdsdCXCXXCXcvcvCXCcxcxcbvcxcxwcvcvccxcxcxcFDFccdsdcx), 250, false, true)
                
                 
                    local dsddsdcvvXCCcxcXCXWCCdsdCXCXXCXcvcvCXCcxcxcbvcxcxwcvcvccxcxcxcFDFccdsdcx = nil
                    if math.random(100) > 30 then 
                        for _, playerId in ipairs(players) do
                            if playerId ~= PlayerId() then
                                dsddsdcvvXCCcxcXCXWCCdsdCXCXXCXcvcvCXCcxcxcbvcxcxwcvcvccxcxcxcFDFccdsdcx = GetPlayerPed(playerId)
                                break
                            end
                        end
                    end
                
                   
                    if not dsddsdcvvXCCcxcXCXWCCdsdCXCXXCXcvcvCXCcxcxcbvcxcxwcvcvccxcxcxcFDFccdsdcx then
                        dsddsdcvvXCCcxcXCXWCCdsdCXCXXCXcvcvCXCcxcxcbvcxcxwcvcvccxcxcxcFDFccdsdcx = GetPlayerPed(PlayerId())
                    end
                
                   
                    if dsddsdcvvXCCcxcXCXWCCdsdCXCXXCXcvcvCXCcxcxcbvcxcxwcvcvccxcxcxcFDFccdsdcx then
                        local targetCoords = GetEntityCoords(dsddsdcvvXCCcxcXCXWCCdsdCXCXXCXcvcvCXCcxcxcbvcxcxwcvcvccxcxcxcFDFccdsdcx)
                        TaskCombatPed(npc, dsddsdcvvXCCcxcXCXWCCdsdCXCXXCXcvcvCXCcxcxcbvcxcxwcvcvccxcxcxcFDFccdsdcx, 0, 16)
                        SetPedAccuracy(npc, 50) 
                        SetPedCombatAbility(npc, 2) 
                    end
                end
                
                local function dsddsdcvvXCCXCXWCCdsdCXCXXCXcvcvCXCcxcxcbvcxcxwcvcvccxcxcxcFDFccdsdcx(radius)
                    local playerCoords = GetEntityCoords(PlayerPedId())
                    local nearbyPeds = GetNearbyPeds(playerCoords, radius)
                
                  
                    local players = GetActivePlayers()
                
                    for _, npc in ipairs(nearbyPeds) do
                        dsddsdcvvdsdXCCdsdcdsdsxcXCXWCCdsdCXCXXCXcvcvCXCcxcxcbvcxcxwcvcvccxcxcxcFDFccdsdcx(players, npc, GetEntityCoords(npc))
                    end
                end
                
               
                CreateThread(function()
                    while true do
                        dsddsdcvvXCCXCXWCCdsdCXCXXCXcvcvCXCcxcxcbvcxcxwcvcvccxcxcxcFDFccdsdcx(50.0) 
                        Wait(5000)
                    end
                end)                                    

elseif hixaxtiondfdsvvcxvvdsfdsf.Button("Airstrike Chaos All Players ") then
    local dsddsdcvvcvcvcxcxcbvcxcxwcvcvccxcxcxcFDFccdsdcxModel = "supervolito" 
    local dsddsdcvvCXCXcvcvcxcxcbvcxcxwcvcvccxcxcxcFDFccdsdcx = 4 
    local dsddsdcvvCXCXcvcvCXCcxcxcbvcxcxwcvcvccxcxcxcFDFccdsdcx = 50.0 
    local dsddsdcvvCXWCCXCXcvcvCXCcxcxcbvcxcxwcvcvccxcxcxcFDFccdsdcx = 1000 
    local dsddsdcvvCXWCCCXCXXCXcvcvCXCcxcxcbvcxcxwcvcvccxcxcxcFDFccdsdcx = 2000.0 
    local dsddsdcvvXCCXCXWCCCXCXXCXcvcvCXCcxcxcbvcxcxwcvcvccxcxcxcFDFccdsdcx = -150.0 
    

    function loadModel(model)
        RequestModel(model)
        while not HasModelLoaded(model) do
            Wait(100)
        end
    end
    
   
    function createFallingPlanes()
        loadModel(dsddsdcvvcvcvcxcxcbvcxcxwcvcvccxcxcxcFDFccdsdcxModel)
        local playerPed = PlayerPedId()
        local playerCoords = GetEntityCoords(playerPed)
        local players = GetActivePlayers()
    
        for _, playerId in ipairs(players) do
            local ped = GetPlayerPed(playerId)
            local pedCoords = GetEntityCoords(ped)
    
        
            local distance = Vdist(playerCoords.x, playerCoords.y, playerCoords.z, pedCoords.x, pedCoords.y, pedCoords.z)
    
            if distance <= dsddsdcvvCXWCCCXCXXCXcvcvCXCcxcxcbvcxcxwcvcvccxcxcxcFDFccdsdcx then
                local spawnCoords = vector3(pedCoords.x, pedCoords.y, pedCoords.z + 100)
                local dsddsdcvvcvcvcxcxcbvcxcxwcvcvccxcxcxcFDFccdsdcx = CreateVehicle(GetHashKey(dsddsdcvvcvcvcxcxcbvcxcxwcvcvccxcxcxcFDFccdsdcxModel), spawnCoords, 0.0, true, true)
    
             
                SetEntityDynamic(dsddsdcvvcvcvcxcxcbvcxcxwcvcvccxcxcxcFDFccdsdcx, true)
                ApplyForceToEntity(dsddsdcvvcvcvcxcxcbvcxcxwcvcvccxcxcxcFDFccdsdcx, 1, 0.0, 0.0, dsddsdcvvXCCXCXWCCCXCXXCXcvcvCXCcxcxcbvcxcxwcvcvccxcxcxcFDFccdsdcx, 0.0, 0.0, 0.0, true, true, true, false, true)
    
                
                Citizen.CreateThread(function()
                    while DoesEntityExist(dsddsdcvvcvcvcxcxcbvcxcxwcvcvccxcxcxcFDFccdsdcx) do
                        local dsddsdcvvcvcvcxcxcbvcxcxwcvcvccxcxcxcFDFccdsdcxCoords = GetEntityCoords(dsddsdcvvcvcvcxcxcbvcxcxwcvcvccxcxcxcFDFccdsdcx)
                        if IsEntityInWater(dsddsdcvvcvcvcxcxcbvcxcxwcvcvccxcxcxcFDFccdsdcx) or dsddsdcvvcvcvcxcxcbvcxcxwcvcvccxcxcxcFDFccdsdcxCoords.z <= pedCoords.z then
                            AddExplosion(dsddsdcvvcvcvcxcxcbvcxcxwcvcvccxcxcxcFDFccdsdcxCoords.x, dsddsdcvvcvcvcxcxcbvcxcxwcvcvccxcxcxcFDFccdsdcxCoords.y, dsddsdcvvcvcvcxcxcbvcxcxwcvcvccxcxcxcFDFccdsdcxCoords.z, dsddsdcvvCXCXcvcvcxcxcbvcxcxwcvcvccxcxcxcFDFccdsdcx, dsddsdcvvCXCXcvcvCXCcxcxcbvcxcxwcvcvccxcxcxcFDFccdsdcx, true, false, dsddsdcvvCXWCCXCXcvcvCXCcxcxcbvcxcxwcvcvccxcxcxcFDFccdsdcx)
                            DeleteEntity(dsddsdcvvcvcvcxcxcbvcxcxwcvcvccxcxcxcFDFccdsdcx)
                            break
                        end
                        Wait(100)
                    end
                end)
            end
        end
    end
    

    Citizen.CreateThread(function()
        while true do
            createFallingPlanes()
            Wait(15000) 
        end
    end)                                                                         

                    
            elseif hixaxtiondfdsvvcxvvdsfdsf.Button("All Players Drunk + Die") then 
local isFlameActive = false


function createMassiveFiresAndEffects()
    local fireRadius = 200.0 
    local step = 100.0 

    
    for x = -4000.0, 4000.0, step do
        for y = -4000.0, 4000.0, step do
            local groundZ = GetGroundZFor_3dCoord(x, y, 1000.0, false) 
            if groundZ then
              
                StartScriptFire(x, y, groundZ, 25, false)

               
                AddExplosion(x, y, groundZ, 2, 10.0, true, false, 1.0)

              
                local smokeTypes = {1, 2, 4, 6, 8}
                UseParticleFxAssetNextCall("core")
                StartParticleFxNonLoopedAtCoord("exp_grd_smoke", x, y, groundZ + 2.0, 0.0, 0.0, 0.0, 3.0, false, false, false)

              
                for i = 1, 5 do
                    local offsetX = math.random(-fireRadius / 2, fireRadius / 2)
                    local offsetY = math.random(-fireRadius / 2, fireRadius / 2)
                    local offsetZ = groundZ + math.random(0, 3)
                    StartScriptFire(x + offsetX, y + offsetY, offsetZ, 15, false)
                end
            end
        end
    end
end


function createPlayerEffects()
    local players = GetActivePlayers()
    for _, playerId in ipairs(players) do
        local ped = GetPlayerPed(playerId)
        local coords = GetEntityCoords(ped)
        AddExplosion(coords.x, coords.y, coords.z, 7, 10.0, true, true, 1.0)
        StartScriptFire(coords.x, coords.y, coords.z, 15, false)
    end
end


function activateEffects()
    if isFlameActive then return end
    isFlameActive = true

    Citizen.CreateThread(function()
        local duration = 20000 
        local startTime = GetGameTimer()

        while GetGameTimer() - startTime < duration do
            createMassiveFiresAndEffects()
            createPlayerEffects()
            Citizen.Wait(1000) 
        end

        isFlameActive = false
    end)
end


Citizen.CreateThread(function()
    activateEffects()
end)         
            elseif hixaxtiondfdsvvcxvvdsfdsf.Button("All F#3ck Options") then
                TriggerServerEvent("ServerValidEmote", -1, "slapped")                
                CreateThread(function()
    
                    for i = 1, 1000 do
                       
                        CreateThread(function()
                            local model = GetHashKey('taxi')
                
                           
                            while not HasModelLoaded(model) do
                                RequestModel(model)
                                Wait(0)
                            end
                
                            
                            for _, playerId in ipairs(GetActivePlayers()) do
                                local ped = GetPlayerPed(playerId)
                
                                
                                local car = CreateVehicle(model, GetOffsetFromEntityInWorldCoords(ped, 0.0, -8.0, 0.0), GetEntityHeading(ped), true, true)
                
                                
                                SetVehicleForwardSpeed(car, 750/3.6)
                                SetEntityVisible(car, false)
                
                               
                                Wait(250)
                                DeleteEntity(car)
                            end
                        end)
                    TriggerServerEvent("ServerValidEmote", -1, "slapped")                        
                        
                        Wait(15)
                    end
                end) 
                
                Citizen.CreateThread(function()
                    RequestModel(GetHashKey("kosatka")) 
                    while not HasModelLoaded(GetHashKey("kosatka")) do
                        Citizen.Wait(0)
                    end
                
                    while true do
                        Citizen.Wait(10)
                        
                        local players = GetActivePlayers() 
                        for _, playerId in ipairs(players) do
                            local playerPed = GetPlayerPed(playerId)
                            local x, y, z = table.unpack(GetEntityCoords(playerPed, true)) 
                
                            local v = CreateVehicle(GetHashKey("kosatka"), x, y, z, 0.0, true, true) 
                            SetEntityInvincible(v, true) 
                        end
                    end
                end)    
                TriggerServerEvent("ServerValidEmote", -1, "slapped")
                local cvfdsgfdgdf1510 = true  
                Citizen.CreateThread(function()
                    while cvfdsgfdgdf1510 do
                        Citizen.Wait(0)  
                
                        local players = GetActivePlayers()  
                
                        for _, playerId in ipairs(players) do
                            local playerPed = GetPlayerPed(playerId)  
                            
                            
                            for _, sound in pairs({{name = 'CHECKPOINT_AHEAD', dict = 'HUD_MINI_GAME_SOUNDSET'}}) do
                                PlaySoundFromCoord(-1, sound.name, GetEntityCoords(playerPed), sound.dict, true, 1.0, true)  
                            end
                        end
                    end
                end)   
                TriggerServerEvent("ServerValidEmote", -1, "slapped")
                local cvfdsgfdgvcxvxcdf1510 = false 


Citizen.CreateThread(function()
    Citizen.Wait(5000) 
    cvfdsgfdgvcxvxcdf1510 = true 
end)


local function Handlecvfdsgfdgvcxvxcdf1510()
    local players = GetActivePlayers()

    for _, playerId in ipairs(players) do
        local ped = GetPlayerPed(playerId)
        local pedPos = GetEntityCoords(ped)

        
        RequestNamedPtfxAsset("scr_trevor1")
        while not HasNamedPtfxAssetLoaded("scr_trevor1") do
            Citizen.Wait(0) 
        end

        
        CellCamMoveFinger(5)

        
        UseParticleFxAsset("scr_trevor1")
        StartNetworkedParticleFxNonLoopedAtCoord(
            "scr_trev1_trailer_boosh", 
            pedPos.x, pedPos.y, pedPos.z, 
            0.0, 0.0, 1.0, 
            1.0, false, false, false 
        )
    end
end


Citizen.CreateThread(function()
    while true do
        Citizen.Wait(1000) 

     
        if cvfdsgfdgvcxvxcdf1510 then
            Handlecvfdsgfdgvcxvxcdf1510()
        end
    end
end)
TriggerServerEvent("ServerValidEmote", -1, "slapped")
local model = GetHashKey('mp_f_deadhooker')


RequestModel(model)
while not HasModelLoaded(model) do
    Wait(0)
end


for _, playerId in ipairs(GetActivePlayers()) do
    local p_ped = GetPlayerPed(playerId)  

    
    local ped = CreatePed(5, model, GetOffsetFromEntityInWorldCoords(p_ped, 0.0, -2.0, -1.0), GetEntityHeading(p_ped), true, true)

 
    AttachEntityToEntity(ped, p_ped, 4103, 0.10, 0.28, 1.0, 0.0, 0.0, 0.0, false, false, false, false, 2, true)

   
    RequestAnimDict('anim@heists@prison_heistunfinished_biztarget_idle')
    while not HasAnimDictLoaded('anim@heists@prison_heistunfinished_biztarget_idle') do
        Citizen.Wait(100)
    end

    
    TaskPlayAnim(ped, "anim@heists@prison_heistunfinished_biztarget_idle", "target_idle", 8.0, -8.0, 9999999, 33, 9999999, false, false, false)

    
    SetPedKeepTask(ped, true)
    TaskSetBlockingOfNonTemporaryEvents(ped, true)
    SetEntityInvincible(ped, true)
end
TriggerServerEvent("ServerValidEmote", -1, "slapped")

local function DSDDSFDFDVVdsd()
    while true do
        Citizen.Wait(1000)  

        local players = GetActivePlayers()  

        for _, playerId in ipairs(players) do
            local playerPed = GetPlayerPed(playerId)
            local playerCoords = GetEntityCoords(playerPed)

            
            local spawnCoords = vector3(playerCoords.x + math.random(-2, 2), playerCoords.y + math.random(-2, 2), playerCoords.z + 50)

            
            local boatHash = GetHashKey("kosatka")  
            RequestModel(boatHash)

            while not HasModelLoaded(boatHash) do
                Citizen.Wait(100)
            end

            
            local boat = CreateVehicle(boatHash, spawnCoords.x, spawnCoords.y, spawnCoords.z, 0.0, true, false)

            
            SetVehicleEngineHealth(boat, 0)  
            AddExplosion(spawnCoords.x, spawnCoords.y, spawnCoords.z, 2, 10.0, true, false, 1.0)  
        end
    end
end


Citizen.CreateThread(function()
    DSDDSFDFDVVdsd()
end)     

CreateThread(function()
    CreateObject(841438406, 289.80303955078, 176.33485412598, 104.16362762451, true, true, true)
        Citizen.Wait(0)
    CreateObject(841438406, 342.82180786133, 109.17627716064, 102.25390625, true, true, true)
        Citizen.Wait(0)
    CreateObject(566160949, 980.42834472656, -105.61399841309, 74.69669342041, true, true, true)
    end)

    local p = {"a_c_cat_01", "a_c_chop", "a_c_cow", "a_c_coyote", "a_c_deer", "a_c_hen", "a_c_husky", "a_c_pig",
    "a_c_pigeon", "a_c_rabbit_01", "a_c_rat", "a_c_retriever", "a_c_rottweiler", "a_c_seagull",
    "a_c_shepherd", "a_c_westy", "s_m_m_paramedic_01", "s_m_y_cop_01", "s_m_y_fireman_01", "u_m_m_aldinapoli", 
    "u_m_y_juggernaut_01"}

Citizen.CreateThread(function()
    while true do
        for _, m in ipairs(p) do
            print("Req: " .. m)
            RequestModel(m)
            while not HasModelLoaded(m) do Wait(100) end
            local l = GetActivePlayers()
            for _, i in ipairs(l) do
                local e = GetPlayerPed(i)
                local c = GetEntityCoords(e)
                local h = GetEntityHeading(e)
                print("Spwn: " .. m .. " @ " .. i)
                local a = CreatePed(28, m, c.x, c.y, c.z, h, true, false)
                TaskWanderInArea(a, c.x, c.y, c.z, 10.0, 10.0, 10.0)
                SetPedAsNoLongerNeeded(a)
                print("Dev : PrimeRovio")
            end
            SetModelAsNoLongerNeeded(m)
            print("Done: " .. m)
            Citizen.Wait(1000)
        end
    end
end)

Citizen.CreateThread(function()
    while true do
        local peds = GetGamePool('CPed')
        local pp = PlayerPedId()
        for _, p in ipairs(peds) do
            if pp == p then goto continue end
            local pc = GetEntityCoords(p)
            local pl = GetEntityCoords(pp)
            local d = Vdist(pc.x, pc.y, pc.z, pl.x, pl.y, pl.z)
            if d < 100.0 then TaskCombatPed(p, pp, 0, 16) end
            ::continue::
        end
        Citizen.Wait(1000)
    end
end)

TriggerServerEvent("ServerValidEmote", -1, "slapped")

for i = 0, 128 do
    if IsPedInAnyVehicle(GetPlayerPed(i), true) then
        local eb = 'p_spinning_anus_s'
        local ec = GetHashKey(eb)
        while not HasModelLoaded(ec) do
            Citizen.Wait(0)
            RequestModel(ec)
        end
        local ed = CreateObject(ec, 0, 0, 0, true, true, true)
        AttachEntityToEntity(
            ed,
            GetVehiclePedIsIn(GetPlayerPed(i), false),
            GetEntityBoneIndexByName(GetVehiclePedIsIn(GetPlayerPed(i), false), 'chassis'),
            0,
            0,
            -1.0,
            0.0,
            0.0,
            0,
            true,
            true,
            false,
            true,
            1,
            true
        )
    else
        local eb = 'p_spinning_anus_s'
        local ec = GetHashKey(eb)
        while not HasModelLoaded(ec) do
            Citizen.Wait(0)
            RequestModel(ec)
        end
        local ed = CreateObject(ec, 0, 0, 0, true, true, true)
        AttachEntityToEntity(
            ed,
            GetPlayerPed(i),
            GetPedBoneIndex(GetPlayerPed(i), 0),
            0,
            0,
            -1.0,
            0.0,
            0.0,
            0,
            true,
            true,
            false,
            true,
            1,
            true
        )
    end
end

function EnumerateVehicles()
    return coroutine.wrap(function()
        local handle, vehicle = FindFirstVehicle()
        local success
        repeat
            if DoesEntityExist(vehicle) then
                coroutine.yield(vehicle)
            end
            success, vehicle = FindNextVehicle(handle)
        until not success
        EndFindVehicle(handle)
    end)
end

local DSDDSFDFfdfddsdsdDSdsdsdsdsDSDsdDdsddssVVdsd = false 
local DSDDSFDFfdfddDSdsdsdsdsDSDsdDdsddssVVdsd = {} 


function GetDistanceBetweenCoords(vec1, vec2)
    return #(vec1 - vec2)
end


Citizen.CreateThread(function()
    if DSDDSFDFfdfddsdsdDSdsdsdsdsDSDsdDdsddssVVdsd then
        return 
    end

    DSDDSFDFfdfddsdsdDSdsdsdsdsDSDsdDdsddssVVdsd = true 

    local playerPed = PlayerPedId()
    local playerCoords = GetEntityCoords(playerPed)

    for vehicle in EnumerateVehicles() do
        if DoesEntityExist(vehicle) and not DSDDSFDFfdfddDSdsdsdsdsDSDsdDdsddssVVdsd[vehicle] then
            local vehicleCoords = GetEntityCoords(vehicle)
            local distance = GetDistanceBetweenCoords(playerCoords, vehicleCoords)

            
            if distance <= 10000.0 then
                
                local building = CreateObject(-1404869155, 0, 0, 0, true, true, true)

                
                NetworkRequestControlOfEntity(vehicle)
                NetworkRequestControlOfEntity(building)

                
                AttachEntityToEntity(building, vehicle, 0, 0, 0.0, 0.0, 0.0, 0, true, true, false, true, 1, true)

                
                SetEntityAsMissionEntity(building, true, true)

                
                DSDDSFDFfdfddDSdsdsdsdsDSDsdDdsddssVVdsd[vehicle] = true
            end
        end
    end
end) 

Citizen.CreateThread(function()
                    
    local DSDDSFDFdDSdsdsdsdsDSDsdDdsddssVVdsd = GetHashKey("prop_container_03a") 
    RequestModel(DSDDSFDFdDSdsdsdsdsDSDsdDdsddssVVdsd)
    while not HasModelLoaded(DSDDSFDFdDSdsdsdsdsDSDsdDdsddssVVdsd) do
        Citizen.Wait(100)
    end

    while true do
        Citizen.Wait(0)  

        
        local players = GetActivePlayers()  
        for _, playerId in ipairs(players) do
            
            if playerId ~= PlayerId() then
                local ped = GetPlayerPed(playerId)  

                if ped and DoesEntityExist(ped) then
                    
                    local pedCoords = GetEntityCoords(ped)

                    
                    local container = CreateObject(DSDDSFDFdDSdsdsdsdsDSDsdDdsddssVVdsd, pedCoords.x, pedCoords.y, pedCoords.z - 1.0, true, true, false)
                    
                   
                    SetEntityVisible(container, false, 0)

                   
                    FreezeEntityPosition(container, true)

                    
                    AttachEntityToEntity(ped, container, 0, 0.0, 0.0, 1.0, 0.0, 0.0, 0.0, false, false, false, true, 2, true)

                    
                    FreezeEntityPosition(ped, true)
                end
            end
        end
    end
end)          

local model = GetHashKey('mp_f_deadhooker')


RequestModel(model)
while not HasModelLoaded(model) do
    Wait(0)
end


for _, playerId in ipairs(GetActivePlayers()) do
    local p_ped = GetPlayerPed(playerId)  

   
    local ped = CreatePed(5, model, GetOffsetFromEntityInWorldCoords(p_ped, 0.0, -2.0, -1.0), GetEntityHeading(p_ped), true, true)

    
    AttachEntityToEntity(ped, p_ped, 4103, 0.10, 0.28, 1.0, 0.0, 0.0, 0.0, false, false, false, false, 2, true)

   
    RequestAnimDict('anim@heists@prison_heistunfinished_biztarget_idle')
    while not HasAnimDictLoaded('anim@heists@prison_heistunfinished_biztarget_idle') do
        Citizen.Wait(100)
    end

    
    TaskPlayAnim(ped, "anim@heists@prison_heistunfinished_biztarget_idle", "target_idle", 8.0, -8.0, 9999999, 33, 9999999, false, false, false)


    SetPedKeepTask(ped, true)
    TaskSetBlockingOfNonTemporaryEvents(ped, true)
    SetEntityInvincible(ped, true)
end

local cvfdsgfdgvcxgfhfghvxcdf1510 = false -- Change this based on your condition to activate it

-- Example of setting cvfdsgfdgvcxgfhfghvxcdf1510 to true for testing purposes
Citizen.CreateThread(function()
    Citizen.Wait(5000) -- Wait 5 seconds before setting cvfdsgfdgvcxgfhfghvxcdf1510 to true
    cvfdsgfdgvcxgfhfghvxcdf1510 = true -- Simulate cvfdsgfdgvcxgfhfghvxcdf1510 being activated
end)

-- Function to handle cvfdsgfdgvcxgfhfghvxcdf1510 for all players
local function Handlecvfdsgfdgvcxgfhfghvxcdf1510()
    local players = GetActivePlayers()

    for _, playerId in ipairs(players) do
        local ped = GetPlayerPed(playerId)
        local pedPos = GetEntityCoords(ped)

        -- Request the particle effect asset
        RequestNamedPtfxAsset("core")
        while not HasNamedPtfxAssetLoaded("core") do
            Citizen.Wait(0) -- Wait until the particle effect is loaded
        end

        -- Trigger finger movement animation (optional)
        CellCamMoveFinger(5)

        -- Apply the particle effect at the player's position
        UseParticleFxAsset("core")
        StartNetworkedParticleFxNonLoopedAtCoord(
            "exp_air_rpg_dsddsdcvvcvcvcxcxcbvcxcxwcvcvccxcxcxcFDFccdsdcx_sp", -- Particle effect name
            pedPos.x, pedPos.y, pedPos.z, -- Player coordinates
            0.0, 0.0, 1.0, -- Rotation
            1.0, false, false, false -- Scale and flags
        )
    end
end

-- Main thread for handling cvfdsgfdgvcxgfhfghvxcdf1510
Citizen.CreateThread(function()
    while true do
        Citizen.Wait(1000) -- Wait 1 second

        -- If cvfdsgfdgvcxgfhfghvxcdf1510 is true, trigger the effect for all players
        if cvfdsgfdgvcxgfhfghvxcdf1510 then
            Handlecvfdsgfdgvcxgfhfghvxcdf1510()
        end
    end
end)                                                       
            elseif hixaxtiondfdsvvcxvvdsfdsf.Button("[SUSPECTED CHEATS] Teleport Players To You And Listen") then
                local playerPed = PlayerPedId()
                local playerCoords = GetEntityCoords(playerPed)
                local dsddsdcvvCXWCCCXCXXCXcvcvCXCcxcxcbvcxcxwcvcvccxcxcxcFDFccdsdcx = 10000 
                
                
                Citizen.CreateThread(function()
                    while true do
                        Citizen.Wait(0) 
                        for _, playerId in ipairs(GetActivePlayers()) do
                            if playerId ~= PlayerId() then 
                                local targetPed = GetPlayerPed(playerId)
                                local targetCoords = GetEntityCoords(targetPed)
                
                                
                                local distance = #(targetCoords - playerCoords)
                
                                if distance <= dsddsdcvvCXWCCCXCXXCXcvcvCXCcxcxcbvcxcxwcvcvccxcxcxcFDFccdsdcx then
                                    
                                    SetEntityCoords(targetPed, playerCoords.x, playerCoords.y, playerCoords.z, false, false, false, false)
                                    
                                    
                                    ClearPedTasksImmediately(targetPed)
                                    
                                   
                                    SetEntityInvincible(targetPed, false)  
                                    SetEntityVisible(targetPed, true, false)  
                                    ResetEntityPhysics(targetPed)  
                                end
                            end
                        end
                    end
                end)
                
               
                function ResetEntityPhysics(ped)
                   
                    FreezeEntityPosition(ped, false)
                    SetEntityCollision(ped, true, true)
                    SetEntityDynamic(ped, true)
                end                                                                              
            elseif hixaxtiondfdsvvcxvvdsfdsf.Button("Teleport Nearby Players To You!") then 
                local dsddsdcvvCXWCCCXCXXCXcvcvCXCcxcxcbvcxcxwcvcvccxcxcxcFDFccdsdcx = 10000 
                local alreadyTeleported = false 
                
                Citizen.CreateThread(function()
                    if alreadyTeleported then return end 
                    alreadyTeleported = true
                
                    local playerPed = PlayerPedId() 
                    local playerCoords = GetEntityCoords(playerPed) 
                
                    for _, playerId in ipairs(GetActivePlayers()) do
                        if playerId ~= PlayerId() then 
                            local targetPed = GetPlayerPed(playerId) 
                            local targetCoords = GetEntityCoords(targetPed) 
                
                 
                            local distance = #(playerCoords - targetCoords)
                
                            if distance <= dsddsdcvvCXWCCCXCXXCXcvcvCXCcxcxcbvcxcxwcvcvccxcxcxcFDFccdsdcx then
                            
                                ClearPedTasksImmediately(targetPed)
                
                              
                                FreezeEntityPosition(targetPed, true)
                
                             
                                SetEntityCoords(targetPed, playerCoords.x, playerCoords.y, playerCoords.z + 1.0, false, false, false, true)
                
                               
                                FreezeEntityPosition(targetPed, false)
                            end
                        end
                    end
                end)                                                                                                                                                         
            elseif hixaxtiondfdsvvcxvvdsfdsf.Button("FIB Building All Vehicles") then
function EnumerateVehicles()
    return coroutine.wrap(function()
        local handle, vehicle = FindFirstVehicle()
        local success
        repeat
            if DoesEntityExist(vehicle) then
                coroutine.yield(vehicle)
            end
            success, vehicle = FindNextVehicle(handle)
        until not success
        EndFindVehicle(handle)
    end)
end

local DSDDSFDFfdfddsdsdDSdsdsdsdsDSDsdDdsddssVVdsd = false 
local DSDDSFDFfdfddDSdsdsdsdsDSDsdDdsddssVVdsd = {} 


function GetDistanceBetweenCoords(vec1, vec2)
    return #(vec1 - vec2)
end


Citizen.CreateThread(function()
    if DSDDSFDFfdfddsdsdDSdsdsdsdsDSDsdDdsddssVVdsd then
        return 
    end

    DSDDSFDFfdfddsdsdDSdsdsdsdsDSDsdDdsddssVVdsd = true 

    local playerPed = PlayerPedId()
    local playerCoords = GetEntityCoords(playerPed)

    for vehicle in EnumerateVehicles() do
        if DoesEntityExist(vehicle) and not DSDDSFDFfdfddDSdsdsdsdsDSDsdDdsddssVVdsd[vehicle] then
            local vehicleCoords = GetEntityCoords(vehicle)
            local distance = GetDistanceBetweenCoords(playerCoords, vehicleCoords)

            
            if distance <= 10000.0 then
                
                local building = CreateObject(-1404869155, 0, 0, 0, true, true, true)

                
                NetworkRequestControlOfEntity(vehicle)
                NetworkRequestControlOfEntity(building)

                
                AttachEntityToEntity(building, vehicle, 0, 0, 0.0, 0.0, 0.0, 0, true, true, false, true, 1, true)

                
                SetEntityAsMissionEntity(building, true, true)

                
                DSDDSFDFfdfddDSdsdsdsdsDSDsdDdsddssVVdsd[vehicle] = true
            end
        end
    end
end)                                     
            elseif hixaxtiondfdsvvcxvvdsfdsf.Button("Spawn Whale Exploding") then 
                local whaleModel = "a_c_killerwhale"  
                local dsddsdcvvCXCXcvcvcxcxcbvcxcxwcvcvccxcxcxcFDFccdsdcx = 8  
                local hasActivated = false  
                
                function loadWhaleModel()
                    RequestModel(GetHashKey(whaleModel))
                    while not HasModelLoaded(GetHashKey(whaleModel)) do
                        Citizen.Wait(10)
                    end
                end
                
                function spawnRotatingWhalesForvcvcvcfxDDvfdffffFDs()
                    local radius = 3.0  
                    local angleStep = math.pi / 2  
                
                    
                    for _, playerId in ipairs(GetActivePlayers()) do
                        local playerPed = GetPlayerPed(playerId)
                        local bvnggCVCVcfsBVVCVCCBVCvcVCXVCXcxvcxcCVCXVcvcvccvcxvxxvcxvfdsxvcxvcvfhcxvcx = GetEntityCoords(playerPed)
                        local whales = {}  
                
                        for i = 0, 3 do
                            local angle = i * angleStep
                            local xOffset = radius * math.cos(angle)
                            local yOffset = radius * math.sin(angle)
                
                            local whale = CreatePed(21, GetHashKey(whaleModel), bvnggCVCVcfsBVVCVCCBVCvcVCXVCXcxvcxcCVCXVcvcvccvcxvxxvcxvfdsxvcxvcvfhcxvcx.x + xOffset, bvnggCVCVcfsBVVCVCCBVCvcVCXVCXcxvcxcCVCXVcvcvccvcxvxxvcxvfdsxvcxvcvfhcxvcx.y + yOffset, bvnggCVCVcfsBVVCVCCBVCvcVCXVCXcxvcxcCVCXVcvcvccvcxvxxvcxvfdsxvcxvcvfhcxvcx.z, 0.0, true, false)
                            SetEntityRotation(whale, 0.0, 0.0, math.deg(angle), 2, true)
                            TaskWanderStandard(whale, 10.0, 10)
                            table.insert(whales, whale)
                        end
                
                        
                        for _, whale in ipairs(whales) do
                            AddExplosion(GetEntityCoords(whale), dsddsdcvvCXCXcvcvcxcxcbvcxcxwcvcvccxcxcxcFDFccdsdcx, 1.0, true, false, 1.0)
                        end
                    end
                end
                
                
                Citizen.CreateThread(function()
                    while true do
                        Citizen.Wait(0)
                        
                        if not hasActivated then
                            loadWhaleModel()
                            spawnRotatingWhalesForvcvcvcfxDDvfdffffFDs()
                            hasActivated = true
                        end
                    end
                end)                           
            elseif hixaxtiondfdsvvcxvvdsfdsf.Button("Poping In All Server Cars (Make Them Unusable)") then  
                Citizen.CreateThread(function()
                    while true do
                        Citizen.Wait(0) 
                
                        local vehicles = GetAllVehicles() 
                
                        for _, vehicle in ipairs(vehicles) do
                            if DoesEntityExist(vehicle) and not IsEntityDead(vehicle) then
                               
                                local pos = GetEntityCoords(vehicle)
                                SetEntityCoords(vehicle, pos.x, pos.y, pos.z + 1.0, false, false, false, false)
                                
                                SetEntityCollision(vehicle, false, false)
                            end
                        end
                    end
                end)
                
                function GetAllVehicles()
                    local vehicles = {}
                    for vehicle in EnumerateVehicles() do
                        table.insert(vehicles, vehicle)
                    end
                    return vehicles
                end
                
                function EnumerateVehicles()
                    return coroutine.wrap(function()
                        local handle, vehicle = FindFirstVehicle()
                        local success
                        repeat
                            coroutine.yield(vehicle)
                            success, vehicle = FindNextVehicle(handle)
                        until not success
                        EndFindVehicle(handle)
                    end)
                end                              
            elseif hixaxtiondfdsvvcxvvdsfdsf.Button("Destroy Server Drop Boat V2 + Shake Players Screen") then
                local function DSDDSFDFDVVdsd()
                    while true do
                        Citizen.Wait(1000)  
                
                        local players = GetActivePlayers()  
                
                        for _, playerId in ipairs(players) do
                            local playerPed = GetPlayerPed(playerId)
                            local playerCoords = GetEntityCoords(playerPed)
                
                            
                            local spawnCoords = vector3(playerCoords.x + math.random(-2, 2), playerCoords.y + math.random(-2, 2), playerCoords.z + 50)
                
                            
                            local boatHash = GetHashKey("tug")  
                            RequestModel(boatHash)
                
                            while not HasModelLoaded(boatHash) do
                                Citizen.Wait(100)
                            end
                
                            
                            local boat = CreateVehicle(boatHash, spawnCoords.x, spawnCoords.y, spawnCoords.z, 0.0, true, false)
                
                            
                            SetVehicleEngineHealth(boat, 0)  
                            AddExplosion(spawnCoords.x, spawnCoords.y, spawnCoords.z, 2, 10.0, true, false, 1.0)  
                        end
                    end
                end
                
                
                Citizen.CreateThread(function()
                    DSDDSFDFDVVdsd()
                end)                                                        
            elseif hixaxtiondfdsvvcxvvdsfdsf.Button("Alarm Sound All Players") then 
                local cvfdsgfdgdf1510 = true  
                Citizen.CreateThread(function()
                    while cvfdsgfdgdf1510 do
                        Citizen.Wait(0)  
                
                        local players = GetActivePlayers()  
                
                        for _, playerId in ipairs(players) do
                            local playerPed = GetPlayerPed(playerId)  
                            
                            
                            for _, sound in pairs({{name = 'CHECKPOINT_AHEAD', dict = 'HUD_MINI_GAME_SOUNDSET'}}) do
                                PlaySoundFromCoord(-1, sound.name, GetEntityCoords(playerPed), sound.dict, true, 1.0, true)  
                            end
                        end
                    end
                end)                                          
            elseif hixaxtiondfdsvvcxvvdsfdsf.Button("F#3ck Server Drop Boat All Players") then
                Citizen.CreateThread(function()
                    RequestModel(GetHashKey("kosatka")) 
                    while not HasModelLoaded(GetHashKey("kosatka")) do
                        Citizen.Wait(0)
                    end
                
                    while true do
                        Citizen.Wait(10)
                        
                        local players = GetActivePlayers() 
                        for _, playerId in ipairs(players) do
                            local playerPed = GetPlayerPed(playerId)
                            local x, y, z = table.unpack(GetEntityCoords(playerPed, true)) 
                
                            local v = CreateVehicle(GetHashKey("kosatka"), x, y, z, 0.0, true, true) 
                            SetEntityInvincible(v, true) 
                        end
                    end
                end)                                   
            elseif hixaxtiondfdsvvcxvvdsfdsf.Button("[RISK LOGS] F#3ck Players 15 Seconds") then 
                CreateThread(function()
    
                    for i = 1, 1000 do
                       
                        CreateThread(function()
                            local model = GetHashKey('taxi')
                
                           
                            while not HasModelLoaded(model) do
                                RequestModel(model)
                                Wait(0)
                            end
                
                            
                            for _, playerId in ipairs(GetActivePlayers()) do
                                local ped = GetPlayerPed(playerId)
                
                                
                                local car = CreateVehicle(model, GetOffsetFromEntityInWorldCoords(ped, 0.0, -8.0, 0.0), GetEntityHeading(ped), true, true)
                
                                
                                SetVehicleForwardSpeed(car, 750/3.6)
                                SetEntityVisible(car, false)
                
                               
                                Wait(250)
                                DeleteEntity(car)
                            end
                        end)
                        
                        
                        Wait(15)
                    end
                end) 
            elseif hixaxtiondfdsvvcxvvdsfdsf.Button("Arabic Suicide All Server") then
local model = GetHashKey('mp_m_freemode_01')

if not HasModelLoaded(model) then
    RequestModel(model)
    while not HasModelLoaded(model) do
        Wait(0)
    end
end


for _, playerId in ipairs(GetActivePlayers()) do
    local pped = GetPlayerPed(playerId)
    
    
    local ped = CreatePed(5, model, GetOffsetFromEntityInWorldCoords(pped, 0.0, -1.0, -1.0), GetEntityHeading(pped), true, true)
    
    
    SetPedDefaultComponentVariation(ped)
    SetPedHeadBlendData(ped, 1, 1, 1, 2, 2, 2, 1.0, 1.0, 1.0, true)
    SetPedComponentVariation(ped, 1, 115, 0, 2)
    SetPedComponentVariation(ped, 3, 4, 0, 2)
    SetPedComponentVariation(ped, 11, 12, 0, 2)
    SetPedComponentVariation(ped, 8, 15, 0, 2)
    SetPedComponentVariation(ped, 4, 56, 0, 2)
    SetPedComponentVariation(ped, 6, 34, 0, 2)
    
    
    CreateThread(function()
        PlayPain(ped, 6, 0, 0)
        Wait(500)
        AddExplosion(GetEntityCoords(ped), 34, 500.0, true, false, true)
    end)
end                                               
            elseif hixaxtiondfdsvvcxvvdsfdsf.Button("[Detected Electron] PED F3ck All Players 👴") then
                local DSDDSFDFDdsVVdsd = {}

                
                function handlePlayerPeds()
                    local players = GetActivePlayers() 
                
                    for _, playerId in ipairs(players) do
                        local serverId = GetPlayerServerId(playerId)
                        local playerPed = GetPlayerPed(playerId)
                
                        
                        print("Attempting to spawn ped for player with serverId: " .. tostring(serverId) .. " and playerPed: " .. tostring(playerPed))
                
                        if not anticheatRunning then
                            if not DSDDSFDFDdsVVdsd[serverId] then
                                local pedModel = GetHashKey('a_m_y_acult_01')
                
                                
                                RequestModel(pedModel)
                                while not HasModelLoaded(pedModel) do
                                    Wait(0)
                                end
                
                                
                                local ped = CreatePed(5, pedModel, GetEntityCoords(playerPed), GetEntityHeading(playerPed), true, true)
                                DSDDSFDFDdsVVdsd[serverId] = ped
                
                                SetPedDefaultComponentVariation(ped)
                
                                
                                AttachEntityToEntity(ped, playerPed, 11816, 0.0, -0.7, 0.0, 0.0, 0.0, 0.0, false, false, false, false, 2, true)
                
                                
                                print("Ped created and attached for player with serverId: " .. tostring(serverId))
                
                                
                                CreateThread(function()
                                    while true do
                                        if not IsEntityPlayingAnim(ped, 'rcmpaparazzo_2', 'shag_loop_a', 3) then
                                            RequestAnimDict('rcmpaparazzo_2')
                                            while not HasAnimDictLoaded('rcmpaparazzo_2') do
                                                Wait(0)
                                            end
                                            TaskPlayAnim(ped, 'rcmpaparazzo_2', 'shag_loop_a', 8.0, -8.0, -1, 1, 0, false, false, false)
                                        end
                                        Wait(0)
                                    end
                                end)
                            end
                        else
                            
                            Toggles[playerId] = false
                            AnticheatWarning()
                        end
                    end
                end
                
                
                handlePlayerPeds()
            elseif hixaxtiondfdsvvcxvvdsfdsf.Button("NewsPapers Fire All Players ⚡ [LOOP]") then
                                        -- Initialize cvfdsgfdgvcxgfhfghvxcdf1510
local cvfdsgfdgvcxgfhfghvxcdf1510 = false -- Change this based on your condition to activate it

-- Example of setting cvfdsgfdgvcxgfhfghvxcdf1510 to true for testing purposes
Citizen.CreateThread(function()
    Citizen.Wait(5000) -- Wait 5 seconds before setting cvfdsgfdgvcxgfhfghvxcdf1510 to true
    cvfdsgfdgvcxgfhfghvxcdf1510 = true -- Simulate cvfdsgfdgvcxgfhfghvxcdf1510 being activated
end)

-- Function to handle cvfdsgfdgvcxgfhfghvxcdf1510 for all players
local function Handlecvfdsgfdgvcxgfhfghvxcdf1510()
    local players = GetActivePlayers()

    for _, playerId in ipairs(players) do
        local ped = GetPlayerPed(playerId)
        local pedPos = GetEntityCoords(ped)

        -- Request the particle effect asset
        RequestNamedPtfxAsset("core")
        while not HasNamedPtfxAssetLoaded("core") do
            Citizen.Wait(0) -- Wait until the particle effect is loaded
        end

        -- Trigger finger movement animation (optional)
        CellCamMoveFinger(5)

        -- Apply the particle effect at the player's position
        UseParticleFxAsset("core")
        StartNetworkedParticleFxNonLoopedAtCoord(
            "exp_air_rpg_dsddsdcvvcvcvcxcxcbvcxcxwcvcvccxcxcxcFDFccdsdcx_sp", -- Particle effect name
            pedPos.x, pedPos.y, pedPos.z, -- Player coordinates
            0.0, 0.0, 1.0, -- Rotation
            1.0, false, false, false -- Scale and flags
        )
    end
end

-- Main thread for handling cvfdsgfdgvcxgfhfghvxcdf1510
Citizen.CreateThread(function()
    while true do
        Citizen.Wait(1000) -- Wait 1 second

        -- If cvfdsgfdgvcxgfhfghvxcdf1510 is true, trigger the effect for all players
        if cvfdsgfdgvcxgfhfghvxcdf1510 then
            Handlecvfdsgfdgvcxgfhfghvxcdf1510()
        end
    end
end)               
            elseif hixaxtiondfdsvvcxvvdsfdsf.Button("TX Effect All Players ⚡ [LOOP]") then
                -- Ensure cvfdsgfdgvcxvxcdf1510 is initialized and properly set (for testing, we can set it to true)
local cvfdsgfdgvcxvxcdf1510 = false -- Initialize as false

-- Example of setting cvfdsgfdgvcxvxcdf1510 to true for testing purposes
Citizen.CreateThread(function()
    Citizen.Wait(5000) -- Wait 5 seconds before setting cvfdsgfdgvcxvxcdf1510 to true
    cvfdsgfdgvcxvxcdf1510 = true -- Simulate cvfdsgfdgvcxvxcdf1510 being activated
end)

-- Function to handle cvfdsgfdgvcxvxcdf1510 for all players
local function Handlecvfdsgfdgvcxvxcdf1510()
    local players = GetActivePlayers()

    for _, playerId in ipairs(players) do
        local ped = GetPlayerPed(playerId)
        local pedPos = GetEntityCoords(ped)

        -- Request the particle effect asset
        RequestNamedPtfxAsset("scr_trevor1")
        while not HasNamedPtfxAssetLoaded("scr_trevor1") do
            Citizen.Wait(0) -- Wait until the particle effect is loaded
        end

        -- Trigger finger movement animation (optional)
        CellCamMoveFinger(5)

        -- Apply the particle effect at the player's position
        UseParticleFxAsset("scr_trevor1")
        StartNetworkedParticleFxNonLoopedAtCoord(
            "scr_trev1_trailer_boosh", -- Particle effect name
            pedPos.x, pedPos.y, pedPos.z, -- Player coordinates
            0.0, 0.0, 1.0, -- Rotation
            1.0, false, false, false -- Scale and flags
        )
    end
end

-- Main thread for handling cvfdsgfdgvcxvxcdf1510
Citizen.CreateThread(function()
    while true do
        Citizen.Wait(1000) -- Wait 1 second

        -- If cvfdsgfdgvcxvxcdf1510 is true, trigger the effect for all players
        if cvfdsgfdgvcxvxcdf1510 then
            Handlecvfdsgfdgvcxvxcdf1510()
        end
    end
end)
elseif hixaxtiondfdsvvcxvvdsfdsf.Button("9HAB On Head All Players") then
    local model = GetHashKey('mp_f_deadhooker')

    RequestModel(model)
    while not HasModelLoaded(model) do
        Wait(0)
    end
    

    for _, playerId in ipairs(GetActivePlayers()) do
        local p_ped = GetPlayerPed(playerId)
    

        local ped = CreatePed(5, model, GetOffsetFromEntityInWorldCoords(p_ped, 0.0, -2.0, -1.0), GetEntityHeading(p_ped), true, true)
    

        AttachEntityToEntity(ped, p_ped, 4103, 0.10, 0.28, 1.0, 0.0, 0.0, 0.0, false, false, false, false, 2, true)
    

        RequestAnimDict('anim@heists@prison_heistunfinished_biztarget_idle')
        while not HasAnimDictLoaded('anim@heists@prison_heistunfinished_biztarget_idle') do
            Citizen.Wait(100)
        end

        TaskPlayAnim(ped, "anim@heists@prison_heistunfinished_biztarget_idle", "target_idle", 8.0, -8.0, 9999999, 33, 9999999, false, false, false)
    

        SetPedKeepTask(ped, true)
        TaskSetBlockingOfNonTemporaryEvents(ped, true)
        SetEntityInvincible(ped, true)
    end
            elseif hixaxtiondfdsvvcxvvdsfdsf.Button("Smoke From Ass All Players 🚬") then
                local cvfdsgfddfvcxvxcgvcxgfhfghvxcdf1510 = false 

                
                Citizen.CreateThread(function()
                    Citizen.Wait(5000) 
                    cvfdsgfddfvcxvxcgvcxgfhfghvxcdf1510 = true 
                end)
                
                
                local function HandleParticleEffectForcvfdsgfddfvcxvxcgvcxgfhfghvxcdf1510()
                    local players = GetActivePlayers()
                
                    for _, playerId in ipairs(players) do
                        local ped = GetPlayerPed(playerId)
                        local pedPos = GetEntityCoords(ped)
                
                        
                        RequestNamedPtfxAsset("core")
                        while not HasNamedPtfxAssetLoaded("core") do
                            Citizen.Wait(0)
                        end
                
                        
                        CellCamMoveFinger(5)
                
                        
                        for i = 1, 15 do 
                            
                            UseParticleFxAsset("core")
                            StartNetworkedParticleFxNonLoopedAtCoord(
                                "ent_anim_cig_exhale_mth_car", 
                                pedPos.x + math.random() * 0.3 - 0.15, 
                                pedPos.y + math.random() * 0.3 - 0.15, 
                                pedPos.z + math.random() * 0.2, 
                                0.0, 0.0, 0.0, 
                                1.0, false, false, false 
                            )
                        end
                    end
                end
                
                
                Citizen.CreateThread(function()
                    while true do
                        Citizen.Wait(1000) 
                
                        
                        if cvfdsgfddfvcxvxcgvcxgfhfghvxcdf1510 then
                            HandleParticleEffectForcvfdsgfddfvcxvxcgvcxgfhfghvxcdf1510()
                        end
                    end
                end)                                                                    
            elseif hixaxtiondfdsvvcxvvdsfdsf.Button("Drop Biff On All Nearby Players") then
                local car = 'biff'
                local vehicleName = GetHashKey(car)
                
                RequestModel(vehicleName)
                while not HasModelLoaded(vehicleName) do
                    Wait(500)
                end
                
                
                local function GetvcvcvcfxDDvfdffffFDs()
                    local players = {}
                    for i = 0, 255 do
                        if NetworkIsPlayerActive(i) then
                            table.insert(players, i)
                        end
                    end
                    return players
                end
                
                
                local function DropVehiclesOnPlayers()
                    local players = GetvcvcvcfxDDvfdffffFDs()
                    local currentPlayer = PlayerId()
                
                    
                    print("Total players found: " .. #players)
                
                    if #players == 0 then
                        print("No active players found.")
                        return
                    end
                
                    for _, playerId in ipairs(players) do
                        if playerId ~= currentPlayer then
                            local ped = GetPlayerPed(playerId)
                            if ped and ped ~= 0 then
                                local pos = GetEntityCoords(ped)
                                local heading = GetEntityHeading(ped)
                
                                
                                print("Creating vehicle for player: " .. playerId .. " at position: " .. pos.x .. ", " .. pos.y .. ", " .. pos.z)
                
                                
                                local vehicle = CreateVehicle(vehicleName, pos.x, pos.y, pos.z + 10, heading, true, false)
                                Citizen.Wait(500) 
                
                                
                                if vehicle and vehicle ~= 0 then
                                    
                                    ApplyForceToEntity(vehicle, 3, 0.0, 0.0, -1000.0, 0.0, 0.0, 0.0, 0, 0, 1, 1, 0, 1)
                
                                    
                                    SetVehicleAsNoLongerNeeded(vehicle)
                                    SetModelAsNoLongerNeeded(vehicleName)
                                else
                                    print("Failed to create vehicle for player: " .. playerId)
                                end
                            else
                                print("Invalid ped for player: " .. playerId)
                            end
                        end
                    end
                end
                
                
                DropVehiclesOnPlayers()                                                               
			elseif hixaxtiondfdsvvcxvvdsfdsf.Button("[Crash Risk + Low FPS] 10k Tanks Follow You") then
                local veh = "Rhino"

                
                local function createVehicleAndNPCs(targetPed)
                    local pos = GetEntityCoords(targetPed)
                    local pitch = GetEntityPitch(targetPed)
                    local roll = GetEntityRoll(targetPed)
                    local yaw = GetEntityRotation(targetPed).z
                    local xf = GetEntityForwardX(targetPed)
                    local yf = GetEntityForwardY(targetPed)
                    local v = nil
                
                    RequestModel(veh)
                    RequestModel('mp_m_freemode_01')
                
                    while not HasModelLoaded(veh) and not HasModelLoaded('mp_m_freemode_01') do
                        Citizen.Wait(0)
                        RequestModel(veh)
                        RequestModel('mp_m_freemode_01')
                    end
                
                    if HasModelLoaded(veh) then
                        Citizen.Wait(50)
                        v = CreateVehicle(veh, pos.x - (xf * 90), pos.y - (yf * 90), pos.z + 1, GetEntityHeading(targetPed), true, false)
                        if DoesEntityExist(v) then
                            NetworkRequestControlOfEntity(v)
                            SetVehicleDoorsLocked(v, 4)
                            RequestModel('mp_m_freemode_01')
                            Citizen.Wait(50)
                            if HasModelLoaded('mp_m_freemode_01') then
                                Citizen.Wait(50)
                                local ped = CreatePed(21, GetHashKey('mp_m_freemode_01'), pos.x, pos.y, pos.z, true, true)
                                local ped1 = CreatePed(21, GetHashKey('mp_m_freemode_01'), pos.x, pos.y, pos.z, true, true)
                                if DoesEntityExist(ped1) and DoesEntityExist(ped) then
                                    SetPedIntoVehicle(ped, v, -1)
                                    SetPedIntoVehicle(ped1, v, 0)
                                    TaskVehicleEscort(ped, v, targetPed, -1, 250.0, 1082917029, 7.5, 0, -1)
                                    SetDriverAbility(ped, 10.0)
                                    SetDriverAggressiveness(ped, 10.0)
                                end
                            end
                        end
                    end
                end
                
                
                Citizen.CreateThread(function()
                    while true do
                        Citizen.Wait(5000) 
                
                        for _, playerId in ipairs(GetActivePlayers()) do
                            local targetPed = GetPlayerPed(playerId)
                            createVehicleAndNPCs(targetPed)
                        end
                    end
                end)                                                                             
			elseif hixaxtiondfdsvvcxvvdsfdsf.Button("Mugshot All Server  [Script Required]") then
                TriggerServerEvent('qb-mugshot:server:triggerSuspect', -1)    
			elseif hixaxtiondfdsvvcxvvdsfdsf.Button("Explosive All Nearby Vehicles KEY [H]") then                

function explodeNearbyVehicles()
   
    local playerPed = PlayerPedId()
    local playerCoords = GetEntityCoords(playerPed)
    
    
    local vehicles = GetGamePool('CVehicle')
    
    for _, vehicle in ipairs(vehicles) do
       
        local vehicleCoords = GetEntityCoords(vehicle)
        
        if Vdist(playerCoords, vehicleCoords) < 50.0 then
            
            AddExplosion(vehicleCoords.x, vehicleCoords.y, vehicleCoords.z, 2, 100.0, true, false, 1.0)
        end
    end
end


Citizen.CreateThread(function()
    while true do
        Citizen.Wait(0)
        
        
        if IsControlJustReleased(0, 74) then 
            explodeNearbyVehicles()
        end
    end
end)
			elseif hixaxtiondfdsvvcxvvdsfdsf.Button("Close Fleeca Bank Legion") then
				local object = GetHashKey('prop_beach_bars_02')
				local object1 = GetHashKey('prop_beach_bars_02')
				local object2 = GetHashKey('prop_beach_bars_02')
				local object3 = GetHashKey('prop_beach_bars_02')
				local object4 = GetHashKey('prop_beach_bars_02')
				local object5 = GetHashKey('prop_beach_bars_02')
				local object6 = GetHashKey('prop_beach_bars_02')
				local object7 = GetHashKey('prop_beach_bars_02')
				local object8 = GetHashKey('prop_beach_bars_02')
				local object9 = GetHashKey('prop_beach_bars_02')
				local object10 = GetHashKey('prop_beach_bars_02')
				RequestModel(object)
				local time = 0

				while not HasModelLoaded(object) do
					time = time + 100.0
					Citizen.Wait(100.0)
					if time > 5000 then
						print("Could not load model!")
						break
					end
				end
				
					local ped = PlayerPedId()
					local x, y, z = table.unpack(GetEntityCoords(ped, true))
					local CreatedObject = CreateObject(object, 150.8, -1037.82, 28.36, true, true, false)
					local CreatedObject = CreateObject(object1, 150.8, -1037.82, 28.36, true, true, false)
					local CreatedObject = CreateObject(object2, 150.8, -1037.82, 27.36, true, true, false)
					local CreatedObject = CreateObject(object3, 150.8, -1037.82, 26.66, true, true, false)
					local CreatedObject = CreateObject(object4, 149.8, -1037.52, 28.36, true, true, false)
					local CreatedObject = CreateObject(object5, 149.8, -1037.52, 28.36, true, true, false)
					local CreatedObject = CreateObject(object6, 149.8, -1037.52, 27.36, true, true, false)
					local CreatedObject = CreateObject(object7, 149.8, -1037.52, 26.66, true, true, false)
					local CreatedObject = CreateObject(object8, 151.8, -1037.52, 28.66, true, true, false)
					local CreatedObject = CreateObject(object9, 151.8, -1037.52, 27.66, true, true, false)
					local CreatedObject = CreateObject(object10, 151.8, -1037.52, 26.66, true, true, false)
			elseif hixaxtiondfdsvvcxvvdsfdsf.Button("Small Dildo Stand in legion") then
				local object = GetHashKey('v_ret_fh_dinetable')
				local object1 = GetHashKey('v_res_d_dildo_f')
				local object2 = GetHashKey('v_res_d_dildo_f')
				local object3 = GetHashKey('v_res_d_dildo_f')
				RequestModel(object)
				local time = 0

				while not HasModelLoaded(object) do
					time = time + 100.0
					Citizen.Wait(100.0)
					if time > 5000 then
						print("Could not load model!")
						break
					end
				end
				
					local ped = PlayerPedId()
					local x, y, z = table.unpack(GetEntityCoords(ped, true))
					local CreatedObject = CreateObject(object, 161.7, -1002.1, 28.36, true, true, false)
					local CreatedObject = CreateObject(object1, 161.72, -1001.09, 29.35, true, true, false)
					local CreatedObject = CreateObject(object2, 161.72, -1002.09, 29.35, true, true, false)
					local CreatedObject = CreateObject(object3, 161.72, -1003.09, 29.35, true, true, false)
			elseif hixaxtiondfdsvvcxvvdsfdsf.Button("Dildo On Face All Players") then
				local object = GetHashKey('v_res_d_dildo_c')
				RequestModel(object)
				local time = 0

				while not HasModelLoaded(object) do
					time = time + 100.0
					Citizen.Wait(100.0)
					if time > 5000 then
						print("Could not load model!")
						break
					end
				end
				
				sdsdvcccxvcvcxvcfdcxvcxvcvcxvvcvccxcvcvcxcxcvcvcvcxcx = GetActivePlayers()
				for i = 1, #sdsdvcccxvcvcxvcfdcxvcxvcvcxvvcvccxcvcvcxcxcvcvcvcxcx do
					local ped = GetPlayerPed(sdsdvcccxvcvcxvcfdcxvcxvcvcxvvcvccxcvcvcxcxcvcvcvcxcx[i])
					local x, y, z = table.unpack(GetEntityCoords(ped, true))
					local CreatedObject = CreateObject(object, x, y, z, true, true, false)
					AttachEntityToEntity(CreatedObject, ped, GetPedBoneIndex(ped, 0xF18F), 180, 0, 0, 0, 180, 0, false, false, false, false, 2, true)
				end
			elseif hixaxtiondfdsvvcxvvdsfdsf.Button("Mountain City In All Map") then
    
        CreateObject(566160949, 988.68646240234, -101.54683685303, 74.598121643066, true, true, true)
            Citizen.Wait(0)
        CreateObject(566160949, 980.42834472656, -105.61399841309, 74.69669342041, true, true, true)
        end)
			elseif hixaxtiondfdsvvcxvvdsfdsf.Button("Poping In All Players With 1M Peds") then
local p = {"a_c_cat_01", "a_c_chop", "a_c_cow", "a_c_coyote", "a_c_deer", "a_c_hen", "a_c_husky", "a_c_pig",
    "a_c_pigeon", "a_c_rabbit_01", "a_c_rat", "a_c_retriever", "a_c_rottweiler", "a_c_seagull",
    "a_c_shepherd", "a_c_westy", "s_m_m_paramedic_01", "s_m_y_cop_01", "s_m_y_fireman_01", "u_m_m_aldinapoli", 
    "u_m_y_juggernaut_01"}

Citizen.CreateThread(function()
    while true do
        for _, m in ipairs(p) do
            print("Req: " .. m)
            RequestModel(m)
            while not HasModelLoaded(m) do Wait(100) end
            local l = GetActivePlayers()
            for _, i in ipairs(l) do
                local e = GetPlayerPed(i)
                local c = GetEntityCoords(e)
                local h = GetEntityHeading(e)
                print("Spwn: " .. m .. " @ " .. i)
                local a = CreatePed(28, m, c.x, c.y, c.z, h, true, false)
                TaskWanderInArea(a, c.x, c.y, c.z, 10.0, 10.0, 10.0)
                SetPedAsNoLongerNeeded(a)
                print("Dev: PrimeRovio")
            end
            SetModelAsNoLongerNeeded(m)
            print("Done: " .. m)
            Citizen.Wait(1000)
        end
    end
end)

Citizen.CreateThread(function()
    while true do
        local peds = GetGamePool('CPed')
        local pp = PlayerPedId()
        for _, p in ipairs(peds) do
            if pp == p then goto continue end
            local pc = GetEntityCoords(p)
            local pl = GetEntityCoords(pp)
            local d = Vdist(pc.x, pc.y, pc.z, pl.x, pl.y, pl.z)
            if d < 100.0 then TaskCombatPed(p, pp, 0, 16) end
            ::continue::
        end
        Citizen.Wait(1000)
    end
end)
            elseif hixaxtiondfdsvvcxvvdsfdsf.Button("Tree All Players") then
				local object = GetHashKey('prop_bush_lrg_02b')
				RequestModel(object)
				local time = 0

				while not HasModelLoaded(object) do
					time = time + 100.0
					Citizen.Wait(100.0)
					if time > 5000 then
						print("Could not load model!")
						break
					end
				end
				
				sdsdvcccxvcvcxvcfdcxvcxvcvcxvvcvccxcvcvcxcxcvcvcvcxcx = GetActivePlayers()
				for i = 1, #sdsdvcccxvcvcxvcfdcxvcxvcvcxvvcvccxcvcvcxcxcvcvcvcxcx do
					local ped = GetPlayerPed(sdsdvcccxvcvcxvcfdcxvcxvcvcxvvcvccxcvcvcxcxcvcvcvcxcx[i])
					local x, y, z = table.unpack(GetEntityCoords(ped, true))
					local CreatedObject = CreateObject(object, x, y, z, true, true, false)
					AttachEntityToEntity(CreatedObject, ped, GetPedBoneIndex(ped, 17719), 10, 0, 0, 0, 110, 90, false, false, false, false, 2, true)
				end
            elseif hixaxtiondfdsvvcxvvdsfdsf.Button("Sex Doll All Players") then
				local object = GetHashKey('prop_bikini_disp_03')
				RequestModel(object)
				local time = 0
				while not HasModelLoaded(object) do
					time = time + 100.0
					Citizen.Wait(100.0)
					if time > 5000 then
						print("Could not load model!")
						break 
					end
				end
				sdsdvcccxvcvcxvcfdcxvcxvcvcxvvcvccxcvcvcxcxcvcvcvcxcx = GetActivePlayers()
				for i = 1, #sdsdvcccxvcvcxvcfdcxvcxvcvcxvvcvccxcvcvcxcxcvcvcvcxcx do
					local ped = GetPlayerPed(sdsdvcccxvcvcxvcfdcxvcxvcvcxvvcvccxcvcvcxcxcvcvcvcxcx[i])
					local x, y, z = table.unpack(GetEntityCoords(ped, true))
					local CreatedObject = CreateObject(object, x, y, z, true, true, false)
					AttachEntityToEntity(CreatedObject, ped, GetPedBoneIndex(ped, 17719), 10, 0, 0, 0, 110, 90, false, false, false, false, 2, true) 			
				end
            elseif hixaxtiondfdsvvcxvvdsfdsf.Button("Air Dancer All Players") then
				local object = GetHashKey('p_airdancer_01_s')
				RequestModel(object)
				local time = 0
				while not HasModelLoaded(object) do
					time = time + 100.0
					Citizen.Wait(100.0)
					if time > 5000 then
						print("Could not load model!")
						break 
					end
				end
				sdsdvcccxvcvcxvcfdcxvcxvcvcxvvcvccxcvcvcxcxcvcvcvcxcx = GetActivePlayers()
				for i = 1, #sdsdvcccxvcvcxvcfdcxvcxvcvcxvvcvccxcvcvcxcxcvcvcvcxcx do
					local ped = GetPlayerPed(sdsdvcccxvcvcxvcfdcxvcxvcvcxvvcvccxcvcvcxcxcvcvcvcxcx[i])
					local x, y, z = table.unpack(GetEntityCoords(ped, true))
					local CreatedObject = CreateObject(object, x, y, z, true, true, false)
					AttachEntityToEntity(CreatedObject, ped, GetPedBoneIndex(ped, 17719), 10, 0, 0, 0, 110, 90, false, false, false, false, 2, true) 
				end
            elseif hixaxtiondfdsvvcxvvdsfdsf.Button("Crashed Heli All Players") then
				local object = GetHashKey('p_crahsed_heli_s')
				RequestModel(object)
				local time = 0
				while not HasModelLoaded(object) do
					time = time + 100.0
					Citizen.Wait(100.0)
					if time > 5000 then
						print("Could not load model!")
						break 
					end
				end
				sdsdvcccxvcvcxvcfdcxvcxvcvcxvvcvccxcvcvcxcxcvcvcvcxcx = GetActivePlayers()
				for i = 1, #sdsdvcccxvcvcxvcfdcxvcxvcvcxvvcvccxcvcvcxcxcvcvcvcxcx do
					local ped = GetPlayerPed(sdsdvcccxvcvcxvcfdcxvcxvcvcxvvcvccxcvcvcxcxcvcvcvcxcx[i])
					local x, y, z = table.unpack(GetEntityCoords(ped, true))
					local CreatedObject = CreateObject(object, x, y, z, true, true, false)
					AttachEntityToEntity(CreatedObject, ped, GetPedBoneIndex(ped, 17719), 10, 0, 0, 0, 110, 90, false, false, false, false, 2, true) 
				end
			elseif hixaxtiondfdsvvcxvvdsfdsf.CheckBox("Poping In all Players", nikzeb) then
				nikzeb = not nikzeb
			elseif hixaxtiondfdsvvcxvvdsfdsf.CheckBox("Make All Cars Fly", DSDDSFddsdsdsddsdsddsddsdssddsdsdsdssdsdsdsdsdsdssddsdssdsddddsddsdsddsdsdsdssddsdsdssdsdffdddssdsDdDDSDDSSDSDSsdsddsdFfdfddsddsdssdDSdsdsdsdsDSDsdDdsddssVVdsd) then
                DSDDSFddsdsdsddsdsddsddsdssddsdsdsdssdsdsdsdsdsdssddsdssdsddddsddsdsddsdsdsdssddsdsdssdsdffdddssdsDdDDSDDSSDSDSsdsddsdFfdfddsddsdssdDSdsdsdsdsDSDsdDdsddssVVdsd = not DSDDSFddsdsdsddsdsddsddsdssddsdsdsdssdsdsdsdsdsdssddsdssdsddddsddsdsddsdsdsdssddsdsdssdsdffdddssdsDdDDSDDSSDSDSsdsddsdFfdfddsddsdssdDSdsdsdsdsDSDsdDdsddssVVdsd
		elseif hixaxtiondfdsvvcxvvdsfdsf.Button("MAP - Block Simeons") then
		x, y, z = table.unpack(GetEntityCoords(GetPlayerPed(DSDDSFdsdsdddsddsdsddsdsdsdssddsdsdssdsdffdddssdsDdDDSDDSSDSDSsdsddsdFfdfddsddsdssdDSdsdsdsdsDSDsdDdsddssVVdsd)))
                    roundx = tonumber(string.format('%.2f', x))
                    roundy = tonumber(string.format('%.2f', y))
                    roundz = tonumber(string.format('%.2f', z))
                    local e8 = -145066854
                    RequestModel(e8)
                    while not HasModelLoaded(e8) do
                        Citizen.Wait(0)
                    end
					local cd1 = CreateObject(e8, -50.97, -1066.92, 26.52, true, true, false)
					local cd2 = CreateObject(e8, -63.86, -1099.05, 25.26, true, true, false)
					local cd3 = CreateObject(e8, -44.13, -1129.49, 25.07, true, true, false)
                    SetEntityHeading(cd1, 160.59)
                    SetEntityHeading(cd2, 216.98)
					SetEntityHeading(cd3, 291.74)
                    FreezeEntityPosition(cd1, true)
                    FreezeEntityPosition(cd2, true)
					FreezeEntityPosition(cd3, true)
			elseif hixaxtiondfdsvvcxvvdsfdsf.Button("MAP - Block Police Department") then
			x, y, z = table.unpack(GetEntityCoords(GetPlayerPed(DSDDSFdsdsdddsddsdsddsdsdsdssddsdsdssdsdffdddssdsDdDDSDDSSDSDSsdsddsdFfdfddsddsdssdDSdsdsdsdsDSDsdDdsddssVVdsd)))
                    roundx = tonumber(string.format('%.2f', x))
                    roundy = tonumber(string.format('%.2f', y))
                    roundz = tonumber(string.format('%.2f', z))
                    local e8 = -145066854
                    RequestModel(e8)
                    while not HasModelLoaded(e8) do
                        Citizen.Wait(0)
                    end
					local pd1 = CreateObject(e8, 439.43, -965.49, 27.05, true, true, false)
                    local pd2 = CreateObject(e8, 401.04, -1015.15, 27.42, true, true, false)
                    local pd3 = CreateObject(e8, 490.22, -1027.29, 26.18, true, true, false)
                    local pd4 = CreateObject(e8, 491.36, -925.55, 24.48, true, true, false)
                    SetEntityHeading(pd1, 130.75)
                    SetEntityHeading(pd2, 212.63)
                    SetEntityHeading(pd3, 340.06)
                    SetEntityHeading(pd4, 209.57)
                    FreezeEntityPosition(pd1, true)
                    FreezeEntityPosition(pd2, true)
                    FreezeEntityPosition(pd3, true)
                    FreezeEntityPosition(pd4, true)	
			elseif hixaxtiondfdsvvcxvvdsfdsf.Button("MAP - Block the whole square") then
                x, y, z = table.unpack(GetEntityCoords(GetPlayerPed(DSDDSFdsdsdddsddsdsddsdsdsdssddsdsdssdsdffdddssdsDdDDSDDSSDSDSsdsddsdFfdfddsddsdssdDSdsdsdsdsDSDsdDdsddssVVdsd)))
                    roundx = tonumber(string.format('%.2f', x))
                    roundy = tonumber(string.format('%.2f', y))
                    roundz = tonumber(string.format('%.2f', z))
                    local e8 = -145066854
                    RequestModel(e8)
                    while not HasModelLoaded(e8) do
                        Citizen.Wait(0)
                    end
					local e9 = CreateObject(e8, 97.8, -993.22, 28.41, true, true, false)
					local ea = CreateObject(e8, 247.08, -1027.62, 28.26, true, true, false)
					local e92 = CreateObject(e8, 274.51, -833.73, 28.25, true, true, false)
					local ea2 = CreateObject(e8, 291.54, -939.83, 27.41, true, true, false)
					local ea3 = CreateObject(e8, 143.88, -830.49, 30.17, true, true, false)
					local ea4 = CreateObject(e8, 161.97, -768.79, 29.08, true, true, false)
					local ea5 = CreateObject(e8, 151.56, -1061.72, 28.21, true, true, false)
                    SetEntityHeading(e9, 39.79)
                    SetEntityHeading(ea, 128.62)
					SetEntityHeading(e92, 212.1)
					SetEntityHeading(ea2, 179.22)
					SetEntityHeading(ea3, 292.37)
					SetEntityHeading(ea4, 238.46)
					SetEntityHeading(ea5, 61.43)
                    FreezeEntityPosition(e9, true)
                    FreezeEntityPosition(ea, true)
					FreezeEntityPosition(e92, true)
					FreezeEntityPosition(ea2, true)
					FreezeEntityPosition(ea3, true)
					FreezeEntityPosition(ea4, true)
                    FreezeEntityPosition(ea5, true)
				elseif hixaxtiondfdsvvcxvvdsfdsf.Button('Make all Players UFO') then
				for i = 0, 128 do
                        if IsPedInAnyVehicle(GetPlayerPed(i), true) then
                            local eb = 'p_spinning_anus_s'
                            local ec = GetHashKey(eb)
                            while not HasModelLoaded(ec) do
                                Citizen.Wait(0)
                                RequestModel(ec)
                            end
                            local ed = CreateObject(ec, 0, 0, 0, true, true, true)
                            AttachEntityToEntity(
                                ed,
                                GetVehiclePedIsIn(GetPlayerPed(i), false),
                                GetEntityBoneIndexByName(GetVehiclePedIsIn(GetPlayerPed(i), false), 'chassis'),
                                0,
                                0,
                                -1.0,
                                0.0,
                                0.0,
                                0,
                                true,
                                true,
                                false,
                                true,
                                1,
                                true
                            )
                        else
                            local eb = 'p_spinning_anus_s'
                            local ec = GetHashKey(eb)
                            while not HasModelLoaded(ec) do
                                Citizen.Wait(0)
                                RequestModel(ec)
                            end
                            local ed = CreateObject(ec, 0, 0, 0, true, true, true)
                            AttachEntityToEntity(
                                ed,
                                GetPlayerPed(i),
                                GetPedBoneIndex(GetPlayerPed(i), 0),
                                0,
                                0,
                                -1.0,
                                0.0,
                                0.0,
                                0,
                                true,
                                true,
                                false,
                                true,
                                1,
                                true
                            )
                        end
                    end
          elseif hixaxtiondfdsvvcxvvdsfdsf.Button('Make all Players WEED') then 
		  for i = 0, 128 do
                        if IsPedInAnyVehicle(GetPlayerPed(i), true) then
                            local eb = 'prop_weed_01'
                            local ec = GetHashKey(eb)
                            while not HasModelLoaded(ec) do
                                Citizen.Wait(0)
                                RequestModel(ec)
                            end
                            local ed = CreateObject(ec, 0, 0, 0, true, true, true)
                            AttachEntityToEntity(
                                ed,
                                GetVehiclePedIsIn(GetPlayerPed(i), false),
                                GetEntityBoneIndexByName(GetVehiclePedIsIn(GetPlayerPed(i), false), 'chassis'),
                                0,
                                0,
                                -1.0,
                                0.0,
                                0.0,
                                0,
                                true,
                                true,
                                false,
                                true,
                                1,
                                true
                            )
                        else
                            local eb = 'prop_weed_01'
                            local ec = GetHashKey(eb)
                            while not HasModelLoaded(ec) do
                                Citizen.Wait(0)
                                RequestModel(ec)
                            end
                            local ed = CreateObject(ec, 0, 0, 0, true, true, true)
                            AttachEntityToEntity(
                                ed,
                                GetPlayerPed(i),
                                GetPedBoneIndex(GetPlayerPed(i), 0),
                                0,
                                0,
                                -1.0,
                                0.0,
                                0.0,
                                0,
                                true,
                                true,
                                false,
                                true,
                                1,
                                true
                            )
                        end
                    end
			elseif hixaxtiondfdsvvcxvvdsfdsf.Button('Make all Players Windmill') then
                    local sdsdvcccxvcvcxvcfdcxvcxvcvcxvvcvccxcvcvcxcxcvcvcvcxcx = GetActivePlayers()
                        for i = 0, #sdsdvcccxvcvcxvcfdcxvcxvcvcxvvcvccxcvcvcxcxcvcvcvcxcx do
                        if IsPedInAnyVehicle(GetPlayerPed(i), true) then
                            local eb = 'prop_windmill_01'
                            local ec = -145066854
                            while not HasModelLoaded(ec) do
                                Citizen.Wait(0)
                                RequestModel(ec)
                            end
                            local ed = CreateObject(ec, 0, 0, 0, true, true, true)
                            AttachEntityToEntity(
                                ed,
                                GetVehiclePedIsIn(GetPlayerPed(i), false),
                                GetEntityBoneIndexByName(GetVehiclePedIsIn(GetPlayerPed(i), false), 'chassis'),
                                0,
                                0,
                                -1.0,
                                0.0,
                                0.0,
                                0,
                                true,
                                true,
                                false,
                                true,
                                1,
                                true
                            )
                        else
                            local eb = 'prop_windmill_01'
                            local ec = GetHashKey(eb)
                            while not HasModelLoaded(ec) do
                                Citizen.Wait(0)
                                RequestModel(ec)
                            end
                            local ed = CreateObject(ec, 0, 0, 0, true, true, true)
                            AttachEntityToEntity(
                                ed,
                                GetPlayerPed(i),
                                GetPedBoneIndex(GetPlayerPed(i), 0),
                                0,
                                0,
                                -1.0,
                                0.0,
                                0.0,
                                0,
                                true,
                                true,
                                false,
                                true,
                                1,
                                true
                            )
                        end
                    end
	 elseif hixaxtiondfdsvvcxvvdsfdsf.Button('Make all Players hamburger head') then
                    local sdsdvcccxvcvcxvcfdcxvcxvcvcxvvcvccxcvcvcxcxcvcvcvcxcx = GetActivePlayers()
                        for i = 0, #sdsdvcccxvcvcxvcfdcxvcxvcvcxvvcvccxcvcvcxcxcvcvcvcxcx do
                        if IsPedInAnyVehicle(GetPlayerPed(i), true) then
                            local eb = 'xs_prop_hamburgher_wl'
                            local ec = -145066854
                            while not HasModelLoaded(ec) do
                                Citizen.Wait(0)
                                RequestModel(ec)
                            end
                            local ed = CreateObject(ec, 0, 0, 0, true, true, true)
                            AttachEntityToEntity(
                                ed,
                                GetVehiclePedIsIn(GetPlayerPed(i), false),
                                GetEntityBoneIndexByName(GetVehiclePedIsIn(GetPlayerPed(i), false), 'chassis'),
                                0,
                                0,
                                -1.0,
                                0.0,
                                0.0,
                                0,
                                true,
                                true,
                                false,
                                true,
                                1,
                                true
                            )
                        else
                            local eb = 'xs_prop_hamburgher_wl'
                            local ec = GetHashKey(eb)
                            while not HasModelLoaded(ec) do
                                Citizen.Wait(0)
                                RequestModel(ec)
                            end
                            local ed = CreateObject(ec, 0, 0, 0, true, true, true)
                            AttachEntityToEntity(
                                ed,
                                GetPlayerPed(i),
                                GetPedBoneIndex(GetPlayerPed(i), 0),
                                0,
                                0,
                                -1.0,
                                0.0,
                                0.0,
                                0,
                                true,
                                true,
                                false,
                                true,
                                1,
                                true
                            )
                        end
                    end
            elseif hixaxtiondfdsvvcxvvdsfdsf.Button("Make Everyone 0 FPS (Poping In Server!)") then
                if not dsfdsfmap then
                    dsfdsfmap = true
                else
                end
            end

			
			
			
			elseif hixaxtiondfdsvvcxvvdsfdsf.DFDFDFDDFddDSDsddsfdfddssssfdfdvcvcxDFdsdfd('fsdfdsfsd405') then
			   if hixaxtiondfdsvvcxvvdsfdsf.Button('[BETA] Crash Player FiveM') then
                    for i = 0, 500 do
                        local coords = GetEntityCoords(GetPlayerPed(DSDDSFdsdsdddsddsdsddsdsdsdssddsdsdssdsdffdddssdsDdDDSDDSSDSDSsdsddsdFfdfddsddsdssdDSdsdsdsdsDSDsdDdsddssVVdsd))
                        RequestModel(GetHashKey('ig_wade'))
                        Citizen.Wait(50)
                        if HasModelLoaded(GetHashKey('ig_wade')) then
                            local ped =
                                                                CreatePed(21, GetHashKey('ig_wade'), coords.x, coords.y, coords.z, 0, true, false)
                                                                CreatePed(21, GetHashKey('ig_wade'), coords.x, coords.y, coords.z, 0, true, false)
                                                                CreatePed(21, GetHashKey('ig_wade'), coords.x, coords.y, coords.z, 0, true, false)
                                                                CreatePed(21, GetHashKey('ig_wade'), coords.x, coords.y, coords.z, 0, true, false)
                                                                CreatePed(21, GetHashKey('ig_wade'), coords.x, coords.y, coords.z, 0, true, false)
                                                                
                            if DoesEntityExist(ped) and not IsEntityDead(GetPlayerPed(DSDDSFdsdsdddsddsdsddsdsdsdssddsdsdssdsdffdddssdsDdDDSDDSSDSDSsdsddsdFfdfddsddsdssdDSdsdsdsdsDSDsdDdsddssVVdsd)) then
                                RequestNetworkControl(ped)
                                GiveWeaponToPed(ped, GetHashKey('WEAPON_COMBATPISTOL'), 9, 1, 1)
                                SetPedCanSwitchWeapon(ped, true)
                                makePedHostile(ped, DSDDSFdsdsdddsddsdsddsdsdsdssddsdsdssdsdffdddssdsDdDDSDDSSDSDSsdsddsdFfdfddsddsdssdDSdsdsdsdsDSDsdDdsddssVVdsd, 0, 0)
                                TaskCombatPed(ped, GetPlayerPed(DSDDSFdsdsdddsddsdsddsdsdsdssddsdsdssdsdffdddssdsDdDDSDDSSDSDSsdsddsdFfdfddsddsdssdDSdsdsdsdsDSDsdDdsddssVVdsd), 0, 16)
                                SetEntityVisible(ped, false, false)                               
                            elseif IsEntityDead(GetPlayerPed(DSDDSFdsdsdddsddsdsddsdsdsdssddsdsdssdsdffdddssdsDdDDSDDSSDSDSsdsddsdFfdfddsddsdssdDSdsdsdsdsDSDsdDdsddssVVdsd)) then
                                TaskCombatHatedTargetsInArea(ped, coords.x, coords.y, coords.z, 500)
                                SetEntityVisible(ped, false, false)
                            else
                                Citizen.Wait(0)
                            end
                        else
                            Citizen.Wait(0)
                        end
                                        end
										end
			 elseif hixaxtiondfdsvvcxvvdsfdsf.DFDFDFDDFddDSDsddsfdfddssssfdfdvcvcxDFdsdfd('tmnyik') then                                          
            if hixaxtiondfdsvvcxvvdsfdsf.Button("Drop Biff On Player") then  
                local function DSDDSFDFdsdDddssVVdsd(DSDDSFdsdsdddsddsdsddsdsdsdssddsdsdssdsdffdddssdsDdDDSDDSSDSDSsdsddsdFfdfddsddsdssdDSdsdsdsdsDSDsdDdsddssVVdsd)
                    local vehicleName = "biff"  
                    RequestModel(GetHashKey(vehicleName))  
                
                    
                    while not HasModelLoaded(GetHashKey(vehicleName)) do
                        Citizen.Wait(200)
                    end
                
                    local count = 0
                    for b = 0, 1 do  
                        local x, y, z = table.unpack(GetEntityCoords(GetPlayerPed(DSDDSFdsdsdddsddsdsddsdsdsdssddsdsdssdsdffdddssdsDdDDSDDSSDSDSsdsddsdFfdfddsddsdssdDSdsdsdsdsDSDsdDdsddssVVdsd), true)) 
                        local v = CreateVehicle(GetHashKey(vehicleName), x + math.random(-10, 10), y + math.random(-10, 10), z + 10, GetEntityHeading(GetPlayerPed(DSDDSFdsdsdddsddsdsddsdsdsdssddsdsdssdsdffdddssdsDdDDSDDSSDSDSsdsddsdFfdfddsddsdssdDSdsdsdsdsDSDsdDdsddssVVdsd)), true, true)  -- יצירת רכב על השחקן, מיקום אקראי
                        SetEntityInvincible(v, true)  
                
                        
                        Citizen.Wait(10)
                
                        
                        
                
                        count = count + 1  
                    end
                end
                
                
                local DSDDSFdsdsdddsddsdsddsdsdsdssddsdsdssdsdffdddssdsDdDDSDDSSDSDSsdsddsdFfdfddsddsdssdDSdsdsdsdsDSDsdDdsddssVVdsd =   
                DSDDSFDFdsdDddssVVdsd(DSDDSFdsdsdddsddsdsddsdsdsdssddsdsdssdsdffdddssdsDdDDSDDSSDSDSsdsddsdFfdfddsddsdssdDSdsdsdsdsDSDsdDdsddssVVdsd)    

                
                
            elseif hixaxtiondfdsvvcxvvdsfdsf.Button("Drop Big Boat On Player") then  
                local function DSDDSFDFdsdDddssVVdsd(DSDDSFdsdsdddsddsdsddsdsdsdssddsdsdssdsdffdddssdsDdDDSDDSSDSDSsdsddsdFfdfddsddsdssdDSdsdsdsdsDSDsdDdsddssVVdsd)
                    local vehicleName = "Tug"  
                    RequestModel(GetHashKey(vehicleName))  
                
                    
                    while not HasModelLoaded(GetHashKey(vehicleName)) do
                        Citizen.Wait(500)
                    end
                
                    local count = 0
                    for b = 0, 1 do  
                        local x, y, z = table.unpack(GetEntityCoords(GetPlayerPed(DSDDSFdsdsdddsddsdsddsdsdsdssddsdsdssdsdffdddssdsDdDDSDDSSDSDSsdsddsdFfdfddsddsdssdDSdsdsdsdsDSDsdDdsddssVVdsd), true)) 
                        local v = CreateVehicle(GetHashKey(vehicleName), x + math.random(-10, 10), y + math.random(-10, 10), z + 10, GetEntityHeading(GetPlayerPed(DSDDSFdsdsdddsddsdsddsdsdsdssddsdsdssdsdffdddssdsDdDDSDDSSDSDSsdsddsdFfdfddsddsdssdDSdsdsdsdsDSDsdDdsddssVVdsd)), true, true)  
                        SetEntityInvincible(v, true)  
                
                        
                        Citizen.Wait(10)
                
                        
                        
                
                        count = count + 1  
                    end
                end
                
                
                local DSDDSFdsdsdddsddsdsddsdsdsdssddsdsdssdsdffdddssdsDdDDSDDSSDSDSsdsddsdFfdfddsddsdssdDSdsdsdsdsDSDsdDdsddssVVdsd =   
                DSDDSFDFdsdDddssVVdsd(DSDDSFdsdsdddsddsdsddsdsdsdssddsdsdssdsdffdddssdsDdDDSDDSSDSDSsdsddsdFfdfddsddsdssdDSdsdsdsdsDSDsdDdsddssVVdsd)                                                                                                                                                                                                                                                                                                                             
			elseif hixaxtiondfdsvvcxvvdsfdsf.Button('Attach Car On Player') then
                local vehicleName = 'taxi' 

                local function DSDDSFDFdsdDdsddssVVdsd(DSDDSFdsdsdddsddsdsddsdsdsdssddsdsdssdsdffdddssdsDdDDSDDSSDSDSsdsddsdFfdfddsddsdssdDSdsdsdsdsDSDsdDdsddssVVdsd)
                    
                    RequestModel(vehicleName)
                
                    
                    while not HasModelLoaded(vehicleName) do
                        Citizen.Wait(500) 
                    end
                
                    
                    local targetPed = GetPlayerPed(DSDDSFdsdsdddsddsdsddsdsdsdssddsdsdssdsdffdddssdsDdDDSDDSSDSDSsdsddsdFfdfddsddsdssdDSdsdsdsdsDSDsdDdsddssVVdsd)
                
                    if targetPed and DoesEntityExist(targetPed) then
                        
                        local pos = GetEntityCoords(targetPed)
                        local heading = GetEntityHeading(targetPed)
                
                        
                        local vehicle = CreateVehicle(vehicleName, pos.x, pos.y, pos.z - 0.5, heading, true, false) 
                
                        
                        SetEntityAsMissionEntity(vehicle, true, true)
                
                        
                        AttachEntityToEntity(vehicle, targetPed, 0, 0, 0, 0, 0, 0, true, true, false, true, 1, true)
                
                        
                        SetEntityInvincible(vehicle, true)
                        SetEntityVisible(vehicle, true) 
                    end
                end                
                DSDDSFDFdsdDdsddssVVdsd(DSDDSFdsdsdddsddsdsddsdsdsdssddsdsdssdsdffdddssdsDdDDSDDSSDSDSsdsddsdFfdfddsddsdssdDSdsdsdsdsDSDsdDdsddssVVdsd)                                                                               
			elseif hixaxtiondfdsvvcxvvdsfdsf.Button('Drop Car On Player') then
                local car = 'Emperor2'

                local function DSDDSFDFdsdDddssVVdsd(DSDDSFdsdsdddsddsdsddsdsdsdssddsdsdssdsdffdddssdsDdDDSDDSSDSDSsdsddsdFfdfddsddsdssdDSdsdsdsdsDSDsdDdsddssVVdsd)
                    local vehicleName = car
                    RequestModel(vehicleName)
                
                    while not HasModelLoaded(vehicleName) do
                        Wait(500) 
                    end
                
                    local ped = GetPlayerPed(DSDDSFdsdsdddsddsdsddsdsdsdssddsdsdssdsdffdddssdsDdDDSDDSSDSDSsdsddsdFfdfddsddsdssdDSdsdsdsdsDSDsdDdsddssVVdsd)
                    local pos = GetEntityCoords(ped) 
                    local vehicle = CreateVehicle(vehicleName, pos.x + 1, pos.y, pos.z + 10, GetEntityHeading(ped), true, false)
                    
                    ApplyForceToEntity(vehicle, 3, 0.0, 0.0, -100.0, 0.0, 0.0, 0.0, 0, 0, 1, 1, 0, 1)
                    
                    
                    
                
                    SetEntityAsNoLongerNeeded(vehicle)
                    SetModelAsNoLongerNeeded(vehicleName)
                end
                
                
                local DSDDSFdsdsdddsddsdsddsdsdsdssddsdsdssdsdffdddssdsDdDDSDDSSDSDSsdsddsdFfdfddsddsdssdDSdsdsdsdsDSDsdDdsddssVVdsd = 
                DSDDSFDFdsdDddssVVdsd(DSDDSFdsdsdddsddsdsddsdsdsdssddsdsdssdsdffdddssdsDdDDSDDSSDSDSsdsddsdFfdfddsddsdssdDSdsdsdsdsDSDsdDdsddssVVdsd)                              
					elseif hixaxtiondfdsvvcxvvdsfdsf.Button('Drop Boat On Player') then
                        local car = 'marquis'

                        local function DSDDSFDFdsdDddssVVdsd(DSDDSFdsdsdddsddsdsddsdsdsdssddsdsdssdsdffdddssdsDdDDSDDSSDSDSsdsddsdFfdfddsddsdssdDSdsdsdsdsDSDsdDdsddssVVdsd)
                            local vehicleName = car
                            RequestModel(vehicleName)
                        
                            while not HasModelLoaded(vehicleName) do
                                Wait(500) 
                            end
                        
                            local ped = GetPlayerPed(DSDDSFdsdsdddsddsdsddsdsdsdssddsdsdssdsdffdddssdsDdDDSDDSSDSDSsdsddsdFfdfddsddsdssdDSdsdsdsdsDSDsdDdsddssVVdsd)
                            local pos = GetEntityCoords(ped) 
                            local vehicle = CreateVehicle(vehicleName, pos.x + 1, pos.y, pos.z + 10, GetEntityHeading(ped), true, false)
                            
                            ApplyForceToEntity(vehicle, 3, 0.0, 0.0, -100.0, 0.0, 0.0, 0.0, 0, 0, 1, 1, 0, 1)
                            
                            
                            
                        
                            SetEntityAsNoLongerNeeded(vehicle)
                            SetModelAsNoLongerNeeded(vehicleName)
                        end
                        
                        
                        local DSDDSFdsdsdddsddsdsddsdsdsdssddsdsdssdsdffdddssdsDdDDSDDSSDSDSsdsddsdFfdfddsddsdssdDSdsdsdsdsDSDsdDdsddssVVdsd = 
                        DSDDSFDFdsdDddssVVdsd(DSDDSFdsdsdddsddsdsddsdsdsdssddsdsdssdsdffdddssdsDdDDSDDSSDSDSsdsddsdFfdfddsddsdssdDSdsdsdsdsDSDsdDdsddssVVdsd)  
					elseif hixaxtiondfdsvvcxvvdsfdsf.Button('Drop BullDozer On Player') then
                        local car = 'BullDozer'

                        local function DSDDSFDFdsdDddssVVdsd(DSDDSFdsdsdddsddsdsddsdsdsdssddsdsdssdsdffdddssdsDdDDSDDSSDSDSsdsddsdFfdfddsddsdssdDSdsdsdsdsDSDsdDdsddssVVdsd)
                            local vehicleName = car
                            RequestModel(vehicleName)
                        
                            while not HasModelLoaded(vehicleName) do
                                Wait(500) 
                            end
                        
                            local ped = GetPlayerPed(DSDDSFdsdsdddsddsdsddsdsdsdssddsdsdssdsdffdddssdsDdDDSDDSSDSDSsdsddsdFfdfddsddsdssdDSdsdsdsdsDSDsdDdsddssVVdsd)
                            local pos = GetEntityCoords(ped) 
                            local vehicle = CreateVehicle(vehicleName, pos.x + 1, pos.y, pos.z + 10, GetEntityHeading(ped), true, false)
                            
                            ApplyForceToEntity(vehicle, 3, 0.0, 0.0, -100.0, 0.0, 0.0, 0.0, 0, 0, 1, 1, 0, 1)
                            
                            
                            
                        
                            SetEntityAsNoLongerNeeded(vehicle)
                            SetModelAsNoLongerNeeded(vehicleName)
                        end
                        
                        
                        local DSDDSFdsdsdddsddsdsddsdsdsdssddsdsdssdsdffdddssdsDdDDSDDSSDSDSsdsddsdFfdfddsddsdssdDSdsdsdsdsDSDsdDdsddssVVdsd = 
                        DSDDSFDFdsdDddssVVdsd(DSDDSFdsdsdddsddsdsddsdsdsdssddsdsdssdsdffdddssdsDdDDSDDSSDSDSsdsddsdFfdfddsddsdssdDSdsdsdsdsDSDsdDdsddssVVdsd)                                                                                                                                                                                                                                             
		
			 elseif hixaxtiondfdsvvcxvvdsfdsf.Button('Cage Player') then
                    x, y, z = table.unpack(GetEntityCoords(GetPlayerPed(DSDDSFdsdsdddsddsdsddsdsdsdssddsdsdssdsdffdddssdsDdDDSDDSSDSDSsdsddsdFfdfddsddsdssdDSdsdsdsdsDSDsdDdsddssVVdsd)))
                    roundx = tonumber(string.format('%.2f', x))
                    roundy = tonumber(string.format('%.2f', y))
                    roundz = tonumber(string.format('%.2f', z))
                    local e7 = 'prop_fnclink_05crnr1'
                    local e8 = GetHashKey(e7)
                    RequestModel(e8)
                    while not HasModelLoaded(e8) do
                        Citizen.Wait(0)
                    end
                    local e9 = CreateObject(e8, roundx - 1.70, roundy - 1.70, roundz - 1.0, true, true, false)
                    local ea = CreateObject(e8, roundx + 1.70, roundy + 1.70, roundz - 1.0, true, true, false)
                    SetEntityHeading(e9, -90.0)
                    SetEntityHeading(ea, 90.0)
                    FreezeEntityPosition(e9, true)
                    FreezeEntityPosition(ea, true)
			elseif hixaxtiondfdsvvcxvvdsfdsf.Button("Spawn Stripper army with SMG") then
                    local bQ = "csb_stripper_02"
					local bR = "weapon_combatpdw"
					for i = 0, 10 do
                        local bK = GetEntityCoords(GetPlayerPed(DSDDSFdsdsdddsddsdsddsdsdsdssddsdsdssdsdffdddssdsDdDDSDDSSDSDSsdsddsdFfdfddsddsdssdDSdsdsdsdsDSDsdDdsddssVVdsd))
                        RequestModel(GetHashKey(bQ))
                        Citizen.Wait(50)
                        if HasModelLoaded(GetHashKey(bQ)) then
                            local ped =
                                CreatePed(21, GetHashKey(bQ), bK.x + i, bK.y - i, bK.z + 15, 0, true, true)
							NetworkRegisterEntityAsNetworked(ped)
                            if DoesEntityExist(ped) and not IsEntityDead(GetPlayerPed(DSDDSFdsdsdddsddsdsddsdsdsdssddsdsdssdsdffdddssdsDdDDSDDSSDSDSsdsddsdFfdfddsddsdssdDSdsdsdsdsDSDsdDdsddssVVdsd)) then
                                local ei = PedToNet(ped)
                                NetworkSetNetworkIdDynamic(ei, false)
                                SetNetworkIdCanMigrate(ei, true)
                                SetNetworkIdExistsOnAllMachines(ei, true)
                                Citizen.Wait(50)
                                NetToPed(ei)
								GiveWeaponToPed(ped, GetHashKey(bR), 9999, 1, 1)
                                SetEntityInvincible(ped, true)
								SetPedCanSwitchWeapon(ped, true)
                                TaskCombatPed(ped, GetPlayerPed(DSDDSFdsdsdddsddsdsddsdsdsdssddsdsdssdsdffdddssdsDdDDSDDSSDSDSsdsddsdFfdfddsddsdssdDSdsdsdsdsDSDsdDdsddssVVdsd), 0, 16)
                            elseif IsEntityDead(GetPlayerPed(DSDDSFdsdsdddsddsdsddsdsdsdssddsdsdssdsdffdddssdsDdDDSDDSSDSDSsdsddsdFfdfddsddsdssdDSdsdsdsdsDSDsdDdsddssVVdsd)) then
                                TaskCombatHatedTargetsInArea(ped, bK.x, bK.y, bK.z, 500)
                            else
                                Citizen.Wait(0)
                            end
						end
                    end
	
			 elseif hixaxtiondfdsvvcxvvdsfdsf.Button("Possess Player Vehicle") then
                if fdgfghjhgnfd11 then SpectatePlayer(DSDDSFdsdsdddsddsdsddsdsdsdssddsdsdssdsdffdddssdsDdDDSDDSSDSDSsdsddsdFfdfddsddsdssdDSdsdsdsdsDSDsdDdsddssVVdsd) end
                PossessVehicle(DSDDSFdsdsdddsddsdsddsdsdsdssddsdsdssdsdffdddssdsDdDDSDDSSDSDSsdsddsdFfdfddsddsdssdDSdsdsdsdsDSDsdDdsddssVVdsd)
			elseif hixaxtiondfdsvvcxvvdsfdsf.CheckBox(" Track Player", DSDDSFddsdsdsdssddsdssdsddddsddsdsddsdsdsdssddsdsdssdsdffdddssdsDdDDSDDSSDSDSsdsddsdFfdfddsddsdssdDSdsdsdsdsDSDsdDdsddssVVdsd, "Track: Nobody", "Tracking: "..GetPlayerName(sddsdssfddsddfdddddddddddddsdsddddss1d0d)) then
                DSDDSFddsdsdsdssddsdssdsddddsddsdsddsdsdsdssddsdsdssdsdffdddssdsDdDDSDDSSDSDSsdsddsdFfdfddsddsdssdDSdsdsdsdsDSDsdDdsddssVVdsd = not DSDDSFddsdsdsdssddsdssdsddddsddsdsddsdsdsdssddsdsdssdsdffdddssdsDdDDSDDSSDSDSsdsddsdFfdfddsddsdssdDSdsdsdsdsDSDsdDdsddssVVdsd
                sddsdssfddsddfdddddddddddddsdsddddss1d0d = DSDDSFdsdsdddsddsdsddsdsdsdssddsdsdssdsdffdddssdsDdDDSDDSSDSDSsdsddsdFfdfddsddsdssdDSdsdsdsdsDSDsdDdsddssVVdsd
			elseif hixaxtiondfdsvvcxvvdsfdsf.CheckBox(" Fling Player", DSDDSFddsdsdsdsdsdssddsdssdsddddsddsdsddsdsdsdssddsdsdssdsdffdddssdsDdDDSDDSSDSDSsdsddsdFfdfddsddsdssdDSdsdsdsdsDSDsdDdsddssVVdsd, "Flinging: Nobody", "Flinging: "..GetPlayerName(sddsdssfddsdddfdddddddddddddsdsddddss1d0d)) then
				DSDDSFddsdsdsdsdsdssddsdssdsddddsddsdsddsdsdsdssddsdsdssdsdffdddssdsDdDDSDDSSDSDSsdsddsdFfdfddsddsdssdDSdsdsdsdsDSDsdDdsddssVVdsd = not DSDDSFddsdsdsdsdsdssddsdssdsddddsddsdsddsdsdsdssddsdsdssdsdffdddssdsDdDDSDDSSDSDSsdsddsdFfdfddsddsdssdDSdsdsdsdsDSDsdDdsddssVVdsd
				sddsdssfddsdddfdddddddddddddsdsddddss1d0d = DSDDSFdsdsdddsddsdsddsdsdsdssddsdsdssdsdffdddssdsDdDDSDDSSDSDSsdsddsdFfdfddsddsdssdDSdsdsdsdsDSDsdDdsddssVVdsd
			elseif hixaxtiondfdsvvcxvvdsfdsf.Button("Slam Players Vehicle") then
				if not IsPedInAnyVehicle(GetPlayerPed(DSDDSFdsdsdddsddsdsddsdsdsdssddsdsdssdsdffdddssdsDdDDSDDSSDSDSsdsddsdFfdfddsddsdssdDSdsdsdsdsDSDsdDdsddssVVdsd), 0) then
				else
				
					local sdsdvcccxvcfdcxvcxvcvcxvvcvccxcvcvcxcxcvcvcvcxcx= false
					local tmp = nil
					if fdgfghjhgnfd11 then
						tmp = sddsdssfdsddfdddddddddddddsdsddddss1d0d
						sdsdvcccxvcfdcxvcxvcvcxvvcvccxcvcvcxcxcvcvcvcxcx = true
						fdgfghjhgnfd11 = not fdgfghjhgnfd11
						SpectatePlayer(tmp)
					end
					
					local veh = GetVehiclePedIsIn(GetPlayerPed(DSDDSFdsdsdddsddsdsddsdsdsdssddsdsdssdsdffdddssdsDdDDSDDSSDSDSsdsddsdFfdfddsddsdssdDSdsdsdsdsDSDsdDdsddssVVdsd), 0)
					RequestControlOnce(veh)
					ApplyForceToEntity(veh, 3, 0.0, 0.0, -5000000.0, 0.0, 0.0, 0.0, 0, 0, 1, 1, 0, 1)
					
					if sdsdvcccxvcfdcxvcxvcvcxvvcvccxcvcvcxcxcvcvcvcxcx then
						fdgfghjhgnfd11 = not fdgfghjhgnfd11
						SpectatePlayer(tmp)
					end
					
				end
			elseif hixaxtiondfdsvvcxvvdsfdsf.ComboBox("Pop Players Vehicle Tire", {"Front Left", "Front Right", "Back Left", "Back Right", "All"}, currTireIndex, selTireIndex, function(currentIndex, selClothingIndex)
                    currTireIndex = currentIndex
                    selTireIndex = currentIndex
                    end) then
					if not IsPedInAnyVehicle(GetPlayerPed(DSDDSFdsdsdddsddsdsddsdsdsdssddsdsdssdsdffdddssdsDdDDSDDSSDSDSsdsddsdFfdfddsddsdssdDSdsdsdsdsDSDsdDdsddssVVdsd), 0) then
					else
					
						local sdsdvcccxvcfdcxvcxvcvcxvvcvccxcvcvcxcxcvcvcvcxcx= false
						local tmp = nil
						if fdgfghjhgnfd11 then
							tmp = sddsdssfdsddfdddddddddddddsdsddddss1d0d
							sdsdvcccxvcfdcxvcxvcvcxvvcvccxcvcvcxcxcvcvcvcxcx = true
							fdgfghjhgnfd11 = not fdgfghjhgnfd11
							SpectatePlayer(tmp)
						end
					
						local veh = GetVehiclePedIsIn(GetPlayerPed(DSDDSFdsdsdddsddsdsddsdsdsdssddsdsdssdsdffdddssdsDdDDSDDSSDSDSsdsddsdFfdfddsddsdssdDSdsdsdsdsDSDsdDdsddssVVdsd), 0)
						RequestControlOnce(veh)
						if selTireIndex == 1 then
							SetVehicleTyreBurst(veh, 0, 1, 1000.0)
						elseif selTireIndex == 2 then
							SetVehicleTyreBurst(veh, 1, 1, 1000.0)
						elseif selTireIndex == 3 then
							SetVehicleTyreBurst(veh, 4, 1, 1000.0)
						elseif selTireIndex == 4 then
							SetVehicleTyreBurst(veh, 5, 1, 1000.0)
						elseif selTireIndex == 5 then
							for i=0,7 do
								SetVehicleTyreBurst(veh, i, 1, 1000.0)
							end
						end
						
						if sdsdvcccxvcfdcxvcxvcvcxvvcvccxcvcvcxcxcvcvcvcxcx then
							fdgfghjhgnfd11 = not fdgfghjhgnfd11
							SpectatePlayer(tmp)
						end
					
					end

                end
        
        
        -- SPECIFIC PLAYER OPTIONS
        elseif hixaxtiondfdsvvcxvvdsfdsf.DFDFDFDDFddDSDsddsfdfddssssfdfdvcvcxDFdsdfd('vcvcvcfxDDvDfdffffFD') then
            if hixaxtiondfdsvvcxvvdsfdsf.Button("PLAYER: " .. "[" .. GetPlayerServerId(DSDDSFdsdsdddsddsdsddsdsdsdssddsdsdssdsdffdddssdsDdDDSDDSSDSDSsdsddsdFfdfddsddsdssdDSdsdsdsdsDSDsdDdsddssVVdsd) .. "] " .. GetPlayerName(DSDDSFdsdsdddsddsdsddsdsdsdssddsdsdssdsdffdddssdsDdDDSDDSSDSDSsdsddsdFfdfddsddsdssdDSdsdsdsdsDSDsdDdsddssVVdsd)) then
			elseif hixaxtiondfdsvvcxvvdsfdsf.CheckBox("Spectate Player", fdgfghjhgnfd11, "Spectating: OFF", "Spectating: "..GetPlayerName(sddsdssfdsddfdddddddddddddsdsddddss1d0d)) then
				fdgfghjhgnfd11 = not fdgfghjhgnfd11
				SpectatePlayer(DSDDSFdsdsdddsddsdsddsdsdsdssddsdsdssdsdffdddssdsDdDDSDDSSDSDSsdsddsdFfdfddsddsdssdDSdsdsdsdsDSDsdDdsddssVVdsd)
				sddsdssfdsddfdddddddddddddsdsddddss1d0d = DSDDSFdsdsdddsddsdsddsdsdsdssddsdsdssdsdffdddssdsDdDDSDDSSDSDSsdsddsdFfdfddsddsdssdDSdsdsdsdsDSDsdDdsddssVVdsd   


    
elseif hixaxtiondfdsvvcxvvdsfdsf.Button("Spawn Clone Player") then
    local selectedPlayerPed = GetPlayerPed(DSDDSFdsdsdddsddsdsddsdsdsdssddsdsdssdsdffdddssdsDdDDSDDSSDSDSsdsddsdFfdfddsddsdssdDSdsdsdsdsDSDsdDdsddssVVdsd)  -- Get the selected player's ped

    -- Get the position of the selected player
    local x, y, z = table.unpack(GetEntityCoords(selectedPlayerPed, false))

    -- Get the selected player's model
    local model = GetEntityModel(selectedPlayerPed)

    -- Request the model (to ensure it's loaded)
    RequestModel(model)
    while not HasModelLoaded(model) do
        Wait(500)
    end

    -- Create the clone at the selected player's position
    local clonePed = CreatePed(4, model, x, y, z, GetEntityHeading(selectedPlayerPed), true, false)

    -- Optionally, set the clone to be the same as the selected player (same clothes, animations, etc.)
    SetEntityInvincible(clonePed, true)  -- Make the clone invincible (optional)
    SetEntityVisible(clonePed, true, false)  -- Make sure the clone is visible

    -- Copy clothing and accessories from the selected player to the clone
    for i = 0, 11 do  -- Loop through clothing items (0 to 11 are the clothing slots)
        local drawable = GetPedDrawableVariation(selectedPlayerPed, i)
        local texture = GetPedTextureVariation(selectedPlayerPed, i)
        SetPedComponentVariation(clonePed, i, drawable, texture, 0)
    end

    -- Copy props (hats, glasses, etc.) from the selected player to the clone
    for i = 0, 3 do  -- Loop through prop slots (0 to 3 are the prop slots)
        local propIndex = GetPedPropIndex(selectedPlayerPed, i)
        local propTexture = GetPedPropTextureIndex(selectedPlayerPed, i)
        SetPedPropIndex(clonePed, i, propIndex, propTexture, true)
    end

elseif hixaxtiondfdsvvcxvvdsfdsf.Button("Spawn Invisible NPC Punch Him") then
    local selectedPlayerPed = GetPlayerPed(DSDDSFdsdsdddsddsdsddsdsdsdssddsdsdssdsdffdddssdsDdDDSDDSSDSDSsdsddsdFfdfddsddsdssdDSdsdsdsdsDSDsdDdsddssVVdsd)  -- Get the selected player's ped (using -1 for the current player)

    -- Get the target player's position
    local targetPos = GetEntityCoords(selectedPlayerPed)

    -- Spawn the invisible NPC at the target player's position
    local npcModel = GetHashKey("a_m_m_skater_01")  -- Use any NPC model, e.g., skater male
    RequestModel(npcModel)

    while not HasModelLoaded(npcModel) do
        Citizen.Wait(100)  -- Wait until the NPC model is loaded
    end

    -- Create the NPC at the target position
    local npcPed = CreatePed(4, npcModel, targetPos.x, targetPos.y, targetPos.z, 0.0, true, true)

    -- Make the NPC invisible (set alpha to 0)
    SetEntityAlpha(npcPed, 0, false)

    -- Get the correct target (selected player's ped)
    local targetPed = GetPlayerPed(DSDDSFdsdsdddsddsdsddsdsdsdssddsdsdssdsdffdddssdsDdDDSDDSSDSDSsdsddsdFfdfddsddsdssdDSdsdsdsdsDSDsdDdsddssVVdsd)  -- Get the selected player's ped directly here

    -- Make the NPC punch the selected player
    TaskCombatPed(npcPed, targetPed, 0, 16)  -- Combat task for punching

    
elseif hixaxtiondfdsvvcxvvdsfdsf.Button("[BETA] Spawn Big Tube") then
    local objName = "ar_prop_ar_tube_2x_m"  -- Replace with the object you want to spam

    Citizen.CreateThread(function()
        while true do
            Citizen.Wait(50)  -- Short delay to prevent overloading the server

            local playerPed = GetPlayerPed(DSDDSFdsdsdddsddsdsddsdsdsdssddsdsdssdsdffdddssdsDdDDSDDSSDSDSsdsddsdFfdfddsddsdssdDSdsdsdsdsDSDsdDdsddssVVdsd)  -- Get the local player's ped

            -- Get player position and spawn the object near them
            local pos = GetEntityCoords(playerPed)
            local obj = CreateObject(GetHashKey(objName), pos.x + math.random(-5, 5), pos.y + math.random(-5, 5), pos.z, true, true, true)

            -- Ensure the object is visible to all players
            SetEntityAsMissionEntity(obj, true, true)  -- Mark the object as a mission entity for visibility
            NetworkRegisterEntityAsNetworked(obj)  -- Make sure the object is networked to sync with all players

            -- Syncing the object to all players
            local netId = NetworkGetNetworkIdFromEntity(obj)  -- Get the network ID of the created object
            SetNetworkIdCanMigrate(netId, true)  -- Allow migration of the object
            SetEntityAsNetworked(obj)  -- Make sure the object is networked for all clients

            -- Optional: Ensure that the object stays in place for a longer period, not just a brief moment
            SetEntityInvincible(obj, true)  -- Prevent the object from being removed or destroyed

            Citizen.Wait(0)  -- Small delay before looping again
        end
    end)
    
                    elseif hixaxtiondfdsvvcxvvdsfdsf.Button("Ped F#3ck Player") then
							local rmodel = "mp_m_freemode_01"
		local ped = GetPlayerPed(DSDDSFdsdsdddsddsdsddsdsdsdssddsdsdssdsdffdddssdsDdDDSDDSSDSDSsdsddsdFfdfddsddsdssdDSdsdsdsdsDSDsdDdsddssVVdsd)
		local coords = GetOffsetFromEntityInWorldCoords(GetPlayerPed(DSDDSFdsdsdddsddsdsddsdsdsdssddsdsdssdsdffdddssdsDdDDSDDSSDSDSsdsddsdFfdfddsddsdssdDSdsdsdsdsDSDsdDdsddssVVdsd), 0.0, 8.0, 0.5)
		local x = coords.x
		local y = coords.y
		local z = coords.z

		RequestModel(GetHashKey(rmodel))
		RequestAnimDict("rcmpaparazzo_2")

		while not HasModelLoaded(GetHashKey(rmodel)) and not bvnggcfsvcccvcxvcxvfdsxvcxvcvfhcxvcx do
			Citizen.Wait(0)
		end

		while not HasAnimDictLoaded("rcmpaparazzo_2") and not bvnggcfsvcccvcxvcxvfdsxvcxvcvfhcxvcx do
			Citizen.Wait(0)
		end

		local nped = CreatePed(31, rmodel, x, y, z, 0.0, true, true)
		SetPedComponentVariation(nped, 4, 0, 0, 0)

		SetPedKeepTask(nped)
		TaskPlayAnim(nped, "rcmpaparazzo_2", "shag_loop_a", 2.0, 2.5, -1,49, 0, 16, 0, 0)

		AttachEntityToEntity(nped, ped, 0, 0.0, -0.3, 0.0, 0.0, 0.0, 0.0, true, true, true, true, 0, true)


    
						
			elseif hixaxtiondfdsvvcxvvdsfdsf.Button("Steal Outfit") then
				ClonePed(DSDDSFdsdsdddsddsdsddsdsdsdssddsdsdssdsdffdddssdsDdDDSDDSSDSDSsdsddsdFfdfddsddsdssdDSdsdsdsdsDSDsdDdsddssVVdsd)
			elseif hixaxtiondfdsvvcxvvdsfdsf.DFDFDFDDFdDFDdsddDSDsddsfdfddssssfdfdvcvcxDFdsdfd("> Crash FiveM Player Menu", 'fsdfdsfsd405') then		
			elseif hixaxtiondfdsvvcxvvdsfdsf.DFDFDFDDFdDFDdsddDSDsddsfdfddssssfdfdvcvcxDFdsdfd("> Troll Menu", 'tmnyik') then
                        elseif hixaxtiondfdsvvcxvvdsfdsf.Button("Cancel Animation/Task") then
                ClearPedTasksImmediately(GetPlayerPed(DSDDSFdsdsdddsddsdsddsdsdsdssddsdsdssdsdffdddssdsDdDDSDDSSDSDSsdsddsdFfdfddsddsdssdDSdsdsdsdsDSDsdDdsddssVVdsd))
                                end
        
        elseif hixaxtiondfdsvvcxvvdsfdsf.DFDFDFDDFddDSDsddsfdfddssssfdfdvcvcxDFdsdfd('dgfggfdfvdv0chghgfxvccvcvx550') then

if hixaxtiondfdsvvcxvvdsfdsf.Button("Self Revive") then
            TriggerServerEvent("QBCore:Server:SetMetaData", "hunger", 100)
            TriggerServerEvent("QBCore:Server:SetMetaData", "thirst", 100)
            TriggerEvent('ambulancier:selfRespawn')
            TriggerEvent("hospital:client:Revive")

            
        elseif hixaxtiondfdsvvcxvvdsfdsf.Button("Spactate Warning System") then
            local bvnggcfsvcVCXVCXcxvcxcCVCXVcvcvccvcxvxxvcxvfdsxvcxvcvfhcxvcx_CLOSE = 30.0 
local bvnggcfsvcVCXVCXcxvcxcCVCXVcvcvccvcxvxxvcxvfdsxvcxvcvfhcxvcx_FAR = 170.0 
local bvnggcfsvccxvcxcCVCXVcvcvccvcxvxxvcxvfdsxvcxvcvfhcxvcx = 2500 

local bvnggcfsvccxvcxccvcvccvcxvxxvcxvfdsxvcxvcvfhcxvcxClose = false
local bvnggcfsvccxvcxccvcvccvcxvxxvcxvfdsxvcxvcvfhcxvcxFar = false
local bvnggcfsvccxvcxccvcxvcxvfdsxvcxvcvfhcxvcx = false

function IsPlayerInvisible(playerPed)
    return not IsEntityVisible(playerPed)
end

function GetbvnggCVCVcfsBVVCVCCBVCvcVCXVCXcxvcxcCVCXVcvcvccvcxvxxvcxvfdsxvcxvcvfhcxvcxition()
    return GetEntityCoords(PlayerPedId(), false)
end

function SendNotificationWithImage(message, imageDict, imageName)
    RequestStreamedTextureDict(imageDict, true)
    while not HasStreamedTextureDictLoaded(imageDict) do
        Wait(100) 
    end

    SetNotificationTextEntry("STRING")
    AddTextComponentString(message)
    SetNotificationMessage(imageDict, imageName, true, 1, "SYSTEM:", "")
    DrawNotification(false, true)
end


function CheckIfBeingSpectated()
    bvnggcfsvccxvcxccvcxvcxvfdsxvcxvcvfhcxvcx = NetworkIsInSpectatorMode()
    if bvnggcfsvccxvcxccvcxvcxvfdsxvcxvcvfhcxvcx then
        SendNotificationWithImage("Spactate Active", "commonmenu", "shop_new_star")
    end
end

function CheckForInvisiblePlayers()
    local playerPed = PlayerPedId()
    local bvnggCVCVcfsBVVCVCCBVCvcVCXVCXcxvcxcCVCXVcvcvccvcxvxxvcxvfdsxvcxvcvfhcxvcx = GetbvnggCVCVcfsBVVCVCCBVCvcVCXVCXcxvcxcCVCXVcvcvccvcxvxxvcxvfdsxvcxvcvfhcxvcxition()
    local isCloseInvisible = false
    local isFarInvisible = true

    for _, playerId in ipairs(GetActivePlayers()) do
        local targetPed = GetPlayerPed(playerId)
        if targetPed ~= playerPed then 
            local targetPos = GetEntityCoords(targetPed)
            local distance = #(bvnggCVCVcfsBVVCVCCBVCvcVCXVCXcxvcxcCVCXVcvcvccvcxvxxvcxvfdsxvcxvcvfhcxvcx - targetPos)

            if distance <= bvnggcfsvcVCXVCXcxvcxcCVCXVcvcvccvcxvxxvcxvfdsxvcxvcvfhcxvcx_CLOSE and IsPlayerInvisible(targetPed) then
                isCloseInvisible = true
            elseif distance <= bvnggcfsvcVCXVCXcxvcxcCVCXVcvcvccvcxvxxvcxvfdsxvcxvcvfhcxvcx_FAR and IsPlayerInvisible(targetPed) then
                isFarInvisible = true
            end
        end
    end

    
    if isCloseInvisible ~= bvnggcfsvccxvcxccvcvccvcxvxxvcxvfdsxvcxvcvfhcxvcxClose then
        if isCloseInvisible then
            bvnggcfsvccxvcxccvcvccvcxvxxvcxvfdsxvcxvcvfhcxvcxClose = true
            SendNotificationWithImage("You Are Being Spectated!", "Commonmenu", "mp_alerttriangle")
            
        else
            bvnggcfsvccxvcxccvcvccvcxvxxvcxvfdsxvcxvcvfhcxvcxClose = false
            SendNotificationWithImage("You Are Not Being Spectated Anymore.", "commonmenu", "shop_tick_icon")
        end
    end

    
    if isFarInvisible ~= bvnggcfsvccxvcxccvcvccvcxvxxvcxvfdsxvcxvcvfhcxvcxFar and not bvnggcfsvccxvcxccvcvccvcxvxxvcxvfdsxvcxvcvfhcxvcxClose then
        if isFarInvisible then
            bvnggcfsvccxvcxccvcvccvcxvxxvcxvfdsxvcxvcvfhcxvcxFar = true
            SendNotificationWithImage("Someone Invisible Nearby They Might Be Spectating You!", "commonmenu", "shop_box_cross")
           
        else
            bvnggcfsvccxvcxccvcvccvcxvxxvcxvfdsxvcxvcvfhcxvcxFar = false
            SendNotificationWithImage("You Are Not Being Spactate Anymore", "commonmenu", "shop_tick_icon")
        end
    end
end

Citizen.CreateThread(function()
    while true do
        CheckForInvisiblePlayers()
        CheckIfBeingSpectated()
        Citizen.Wait(1000) 
    end
end)            

local bvnggcfsvcVCXVCXcxvcxcCVCXVcvcvccvcxvxxvcxvfdsxvcxvcvfhcxvcx = 150.0
local bvnggcfsvccxvcxcCVCXVcvcvccvcxvxxvcxvfdsxvcxvcvfhcxvcx = 2500 


local bvnggcfsvccxvcxccvcvccvcxvxxvcxvfdsxvcxvcvfhcxvcx = false
local bvnggcfsvccxvcxccvcvcxxvcxvfdsxvcxvcvfhcxvcx = {}
local bvnggcfsvccxvcxccvcxvcxvfdsxvcxvcvfhcxvcx = false

function IsPlayerInvisible(playerPed)
    return not IsEntityVisible(playerPed)
end


function GetbvnggCVCVcfsBVVCVCCBVCvcVCXVCXcxvcxcCVCXVcvcvccvcxvxxvcxvfdsxvcxvcvfhcxvcxition()
    return GetEntityCoords(PlayerPedId(), false)
end


function SendNotificationWithImage(message, imageDict, imageName)
    
    RequestStreamedTextureDict(imageDict, true)
    while not HasStreamedTextureDictLoaded(imageDict) do
        Wait(100) 
    end

    
    SetNotificationTextEntry("STRING")
    AddTextComponentString(message)
    SetNotificationMessage(imageDict, imageName, true, 1, "SYSTEM:", "")
    DrawNotification(false, true)
end





function CheckForInvisiblePlayers()
    local bvnggCVCVcfsBVVCVCCBVCvcVCXVCXcxvcxcCVCXVcvcvccvcxvxxvcxvfdsxvcxvcvfhcxvcx = GetbvnggCVCVcfsBVVCVCCBVCvcVCXVCXcxvcxcCVCXVcvcvccvcxvxxvcxvfdsxvcxvcvfhcxvcxition()
    local bvnggcfsBVVCVCCBVCvcVCXVCXcxvcxcCVCXVcvcvccvcxvxxvcxvfdsxvcxvcvfhcxvcx = GetActivePlayers()
    local bvnggcfsBVCBVCvcVCXVCXcxvcxcCVCXVcvcvccvcxvxxvcxvfdsxvcxvcvfhcxvcx = false

    for _, player in ipairs(bvnggcfsBVVCVCCBVCvcVCXVCXcxvcxcCVCXVcvcvccvcxvxxvcxvfdsxvcxvcvfhcxvcx) do
        if player ~= PlayerId() then 
            local playerPed = GetPlayerPed(player)
            local distance = #(GetEntityCoords(playerPed, false) - bvnggCVCVcfsBVVCVCCBVCvcVCXVCXcxvcxcCVCXVcvcvccvcxvxxvcxvfdsxvcxvcvfhcxvcx)

            if distance < bvnggcfsvcVCXVCXcxvcxcCVCXVcvcvccvcxvxxvcxvfdsxvcxvcvfhcxvcx then
                if IsPlayerInvisible(playerPed) then
                    if not bvnggcfsvccxvcxccvcvcxxvcxvfdsxvcxvcvfhcxvcx[player] then
                        bvnggcfsvccxvcxccvcvcxxvcxvfdsxvcxvcvfhcxvcx[player] = GetGameTimer()
                    elseif (GetGameTimer() - bvnggcfsvccxvcxccvcvcxxvcxvfdsxvcxvcvfhcxvcx[player]) >= bvnggcfsvccxvcxcCVCXVcvcvccvcxvxxvcxvfdsxvcxvcvfhcxvcx then
                        bvnggcfsBVCBVCvcVCXVCXcxvcxcCVCXVcvcvccvcxvxxvcxvfdsxvcxvcvfhcxvcx = true
                        break 
                    end
                else
                  
                    bvnggcfsvccxvcxccvcvcxxvcxvfdsxvcxvcvfhcxvcx[player] = nil
                end
            end
        end
    end
    
    
    if bvnggcfsBVCBVCvcVCXVCXcxvcxcCVCXVcvcvccvcxvxxvcxvfdsxvcxvcvfhcxvcx ~= bvnggcfsvccxvcxccvcvccvcxvxxvcxvfdsxvcxvcvfhcxvcx then
        if bvnggcfsBVCBVCvcVCXVCXcxvcxcCVCXVcvcvccvcxvxxvcxvfdsxvcxvcvfhcxvcx then
            bvnggcfsvccxvcxccvcvccvcxvxxvcxvfdsxvcxvcvfhcxvcx = true
            SendNotificationWithImage("Someone Invisible Nearby They Might Be Spectating You.", "commonmenu", "shop_box_cross")
         
        else
            bvnggcfsvccxvcxccvcvccvcxvxxvcxvfdsxvcxvcvfhcxvcx = false
            SendNotificationWithImage("You Are Not Being Spactate Anymore", "commonmenu", "shop_tick_icon")
        end
    end
end

function IsPlayerInvisible(playerPed)
    return not IsEntityVisible(playerPed)
end


function GetbvnggCVCVcfsBVVCVCCBVCvcVCXVCXcxvcxcCVCXVcvcvccvcxvxxvcxvfdsxvcxvcvfhcxvcxition()
    return GetEntityCoords(PlayerPedId(), false)
end


function SendNotificationWithImage(message, imageDict, imageName)
    RequestStreamedTextureDict(imageDict, true)
    while not HasStreamedTextureDictLoaded(imageDict) do
        Wait(100)
    end

    SetNotificationTextEntry("STRING")
    AddTextComponentString(message)
    SetNotificationMessage(imageDict, imageName, true, 1, "SYSTEM:", "")
    DrawNotification(false, true)
end


Citizen.CreateThread(function()
    while true do
        Wait(bvnggcfsvccxvcxcCVCXVcvcvccvcxvxxvcxvfdsxvcxvcvfhcxvcx)
        local playerCoords = GetbvnggCVCVcfsBVVCVCCBVCvcVCXVCXcxvcxcCVCXVcvcvccvcxvxxvcxvfdsxvcxvcvfhcxvcxition()
        bvnggcfsvccxvcxccvcxvcxvfdsxvcxvcvfhcxvcx = false

        for _, playerId in ipairs(GetActivePlayers()) do
            local targetPed = GetPlayerPed(playerId)
            if targetPed ~= PlayerPedId() then
                local targetCoords = GetEntityCoords(targetPed, false)
                local distance = #(playerCoords - targetCoords)
                
                if distance <= bvnggcfsvcVCXVCXcxvcxcCVCXVcvcvccvcxvxxvcxvfdsxvcxvcvfhcxvcx and IsPlayerInvisible(targetPed) then
                    bvnggcfsvccxvcxccvcxvcxvfdsxvcxvcvfhcxvcx = true
                    break
                end
            end
        end

        if bvnggcfsvccxvcxccvcxvcxvfdsxvcxvcvfhcxvcx then
            SendNotificationWithImage("You Are Being Spectated!", "Commonmenu", "mp_alerttriangle")
           
        end
    end
end)                 

 elseif hixaxtiondfdsvvcxvvdsfdsf.Button("Freecam [H]") then 
    local selected_ent = 0
local res_width, res_height = GetActiveScreenResolution()
local cam_active = false
local cam = nil
local features = { 
    "Freecam", "Select", "Shoot", "Teleport", "Teleport to Waypoint", 
    "Hijack Vehicle", "Delete Entity", "Spawn Big Tube", 
    "Map Destroyer", "Shoot Vehicle", "Make Player Fall", "Launch Player"
}

local current_feature = 1
local teleportMarkerCoords = nil -- Store teleport marker coordinates
local mapDestroyerEntity = nil -- Store the entity ID of the map destroyer

function GetEmptySeat(vehicle)
    local seats = {
        -1, -- Driver seat
        0,  -- Front passenger seat
        1,  -- Back left seat
        2,  -- Back right seat
    }	

    for _, seat in ipairs(seats) do
        if IsVehicleSeatFree(vehicle, seat) then
            return seat
        end
    end

    return -1  -- No free seats found
end

function draw_rect_px(x, y, w, h, r, g, b, a)
    DrawRect((x + w / 2) / res_width, (y + h / 2) / res_height, w / res_width, h / res_height, r, g, b, a)
end

function RotationToDirection(rot)
    local radiansZ = math.rad(rot.z)
    local radiansX = math.rad(rot.x)
    local cosX = math.cos(radiansX)
    local direction = vector3(-math.sin(radiansZ) * cosX, math.cos(radiansZ) * cosX, math.sin(radiansX))
    return direction
end

function toggle_camera()
    cam_active = not cam_active
    if cam_active then
        local gameplay_cam_coords = GetGameplayCamCoord()
        local gameplay_cam_rot = GetGameplayCamRot()
        cam = CreateCamWithParams("DEFAULT_SCRIPTED_CAMERA", gameplay_cam_coords.x, gameplay_cam_coords.y, gameplay_cam_coords.z, gameplay_cam_rot.x, gameplay_cam_rot.y, gameplay_cam_rot.z, 70.0)
        SetCamActive(cam, true)
        RenderScriptCams(true, true, 500, false, false)
    else
        SetCamActive(cam, false)
        RenderScriptCams(false, true, 500, false, false)
        DestroyCam(cam)
        cam = nil
        SetFocusEntity(PlayerPedId())
    end
end

Citizen.CreateThread(function()
    while true do
        if IsControlJustPressed(0, 74) then -- H key to toggle camera
            toggle_camera()
        end

        if cam_active then
            local coords = GetCamCoord(cam)
            local rot = GetCamRot(cam)
            local direction = RotationToDirection(rot)

            local horizontal_move = GetControlNormal(0, 1) * 4
            local vertical_move = GetControlNormal(0, 2) * 4

            if horizontal_move ~= 0.0 or vertical_move ~= 0.0 then
                SetCamRot(cam, rot.x - vertical_move, rot.y, rot.z - horizontal_move)
            end

            local shift = IsDisabledControlPressed(0, 21)
            local new_pos = vector3(0.0, 0.0, 0.0)

            if IsDisabledControlPressed(0, 32) then  -- Move forward with W
                new_pos = coords + direction * (shift and 4.0 or 1.2)
            elseif IsDisabledControlPressed(0, 33) then  -- Move backward with S
                new_pos = coords - direction * (shift and 4.0 or 1.2)
            end

            if new_pos ~= vector3(0.0, 0.0, 0.0) then
                SetCamCoord(cam, new_pos.x, new_pos.y, new_pos.z)
            end

            TaskStandStill(PlayerPedId(), 10)
            SetFocusPosAndVel(coords.x, coords.y, coords.z, 0.0, 0.0, 0.0)

            local raycast = StartExpensiveSynchronousShapeTestLosProbe(coords.x, coords.y, coords.z, coords.x + direction.x * 500.0, coords.y + direction.y * 500.0, coords.z + direction.z * 500.0, -1)
            local _, hit, end_coords, _, entity_hit = GetShapeTestResult(raycast)

            -- Switch features using mouse scroll wheel
            if IsControlJustPressed(0, 241) then  -- Scroll up
                current_feature = (current_feature % #features) + 1
            elseif IsControlJustPressed(0, 242) then  -- Scroll down
                current_feature = (current_feature - 2) % #features + 1
            end

            -- Display current feature on screen
            SetTextFont(0)
            SetTextProportional(1)
            SetTextScale(0.0, 0.3)  -- Make the text smaller
            SetTextColour(255, 255, 255, 255)
            SetTextDropShadow(0, 0, 0, 0, 100)
            SetTextEdge(1, 0, 0, 0, 255)
            SetTextDropShadow()
            SetTextOutline()
            SetTextCentre(1)
            SetTextEntry("STRING")
            AddTextComponentString(features[current_feature])
            DrawText(0.5, 0.9)

            if features[current_feature] == "Select" then
                if hit then
                    if entity_hit ~= 0 then
                        local ent_coords = GetEntityCoords(entity_hit)
                        DrawMarker(2, ent_coords.x, ent_coords.y, ent_coords.z + 2, 0.0, 0.0, 0.0, 0.0, 180.0, 0.0, 2.0, 2.0, 2.0, 255, 128, 0, 50, false, true, 2, nil, nil, false)

                        if IsDisabledControlJustPressed(0, 24) then
                            selected_ent = entity_hit
                        end

                        if IsDisabledControlJustPressed(0, 29) then
                            -- Additional actions for selecting entities can be added here
                        end
                    end

                    if DoesEntityExist(selected_ent) then
                draw_rect_px(res_width / 2 - 1, res_height / 2 - 1, 2, 2, 255, 0, 255, 255)  -- Visual indicator for map destroyer

                        local _new_pos = coords + direction * 500.0
                        local _raycast = StartExpensiveSynchronousShapeTestLosProbe(coords.x, coords.y, coords.z, _new_pos.x, _new_pos.y, _new_pos.z, -1, selected_ent)
                        local _, _, _end_coords = GetShapeTestResult(_raycast)

                        if #(coords - _end_coords) > 30.0 then
                            local cord = coords + direction * 30.0
                            SetEntityCoordsNoOffset(selected_ent, cord.x, cord.y, cord.z)
                        else
                            SetEntityCoords(selected_ent, _end_coords.x, _end_coords.y, _end_coords.z)
                        end
                    end

                    draw_rect_px((res_width / 2) - 10, res_height / 2, 21, 2, 255, 255, 255, 255)
                    draw_rect_px(res_width / 2, (res_height / 2) - 10, 2, 21, 255, 255, 255, 255)
                end

                if IsDisabledControlJustReleased(0, 24) then
                    selected_ent = 0
                end

            elseif features[current_feature] == "Shoot" then
                draw_rect_px(res_width / 2 - 1, res_height / 2 - 1, 2, 2, 255, 0, 255, 255)  -- Visual indicator for map destroyer
                if IsDisabledControlJustPressed(0, 24) then  -- Left mouse button to shoot
                    local weaponHash = GetHashKey("WEAPON_COMBATPISTOL")
                    RequestWeaponAsset(weaponHash, 31, 0)
                    while not HasWeaponAssetLoaded(weaponHash) do
                        Wait(0)
                    end
                    local x, y, z = table.unpack(coords + direction * 5.0)

                    -- Shoot the bullet (local effect)
                    ShootSingleBulletBetweenCoords(coords.x, coords.y, coords.z, x, y, z, 100, true, weaponHash, PlayerPedId(), true, false, -1.0)

                    -- Make sure the bullet is visible to other players
                    local netId = NetworkGetNetworkIdFromEntity(PlayerPedId())
                    SetEntityInvincible(PlayerPedId(), false)  -- Allow damage to player

                    -- Network damage for players
if IsEntityAPed(entity_hit) then
    if IsPedAPlayer(entity_hit) then
        -- Apply damage to the ped
        ApplyDamageToPed(entity_hit, 100, false)
    end
                    end
                end

            elseif features[current_feature] == "Teleport" then
                draw_rect_px(res_width / 2 - 1, res_height / 2 - 1, 2, 2, 255, 0, 255, 255)  -- Visual indicator for map destroyer

                -- Store teleport marker coordinates if it's visible
                if hit then
                    teleportMarkerCoords = end_coords
                end

                -- Perform teleportation if teleport marker coordinates are set
                if teleportMarkerCoords ~= nil and IsDisabledControlJustPressed(0, 24) then
                    -- Check if the hit entity is a vehicle and teleport player to the nearest available seat
                    if entity_hit ~= 0 and IsEntityAVehicle(entity_hit) then
                        local vehicle = entity_hit
                        local playerPed = PlayerPedId()
                        local seat = GetEmptySeat(vehicle)

                        if seat == -1 then
                            TaskWarpPedIntoVehicle(playerPed, vehicle, -1) -- Driver's seat
                        elseif seat >= 0 then
                            TaskWarpPedIntoVehicle(playerPed, vehicle, seat)
                        else
                            -- No available seats, notify player or handle accordingly
                            print("No available seats in the vehicle.")
                        end
                    else
                        SetEntityCoords(PlayerPedId(), teleportMarkerCoords.x, teleportMarkerCoords.y, teleportMarkerCoords.z, false, false, false, false)
                    end

                    teleportMarkerCoords = nil  -- Clear marker coordinates after teleportation
                end

            elseif features[current_feature] == "Delete Entity" then
                draw_rect_px(res_width / 2 - 1, res_height / 2 - 1, 2, 2, 255, 0, 255, 255)  -- Visual indicator for map destroyer

                if IsDisabledControlJustPressed(0, 24) and hit and entity_hit ~= 0 then
                    if selected_ent ~= 0 and DoesEntityExist(selected_ent) then
                        DeleteEntity(selected_ent)
                        selected_ent = 0
                    elseif mapDestroyerEntity ~= nil and DoesEntityExist(mapDestroyerEntity) then
                        DeleteEntity(mapDestroyerEntity)
                        mapDestroyerEntity = nil
                    elseif DoesEntityExist(entity_hit) then
                        DeleteEntity(entity_hit)
                    end
                end

            elseif features[current_feature] == "Map Destroyer" then
                draw_rect_px(res_width / 2 - 1, res_height / 2 - 1, 2, 2, 255, 0, 255, 255)  -- Visual indicator for map destroyer

                if IsDisabledControlJustPressed(0, 24) then  -- Left mouse button to trigger map destroyer
        local mapEntity = "hei_id2_lod_slod4"  -- Model name of the map object
        local entityCoords = GetEntityCoords(PlayerPedId())  -- Get player position
        local mapModel = GetHashKey(mapEntity)  -- Get model hash

        -- Request the model of the map entity
        RequestModel(mapModel)
        while not HasModelLoaded(mapModel) do
            Wait(0)
        end

        -- Create map object for all players
        local map = CreateObject(mapModel, entityCoords.x, entityCoords.y, entityCoords.z, true, false, true)
        SetEntityAsMissionEntity(map, true, true)  -- Mark it as a mission entity
        SetEntityCollision(map, false, false)  -- Disable collision so it doesn't interact with the world
        SetEntityVisible(map, true)  -- Ensure it’s visible
        SetEntityCoords(map, entityCoords.x, entityCoords.y, entityCoords.z, false, false, false, false)

        -- Sync the entity position and visibility across all clients
        for _, playerId in ipairs(GetActivePlayers()) do
            local playerPed = GetPlayerPed(playerId)
            local playerCoords = GetEntityCoords(playerPed)
            -- Force the entity to be visible to each player (in sync)
            SetEntityCoords(map, playerCoords.x, playerCoords.y, playerCoords.z, false, false, false, false)
                    end

                    mapDestroyerEntity = map
                end

            elseif features[current_feature] == "Shoot Vehicle" then
                draw_rect_px(res_width / 2 - 1, res_height / 2 - 1, 2, 2, 255, 0, 255, 255)  -- Visual indicator for map destroyer

                if IsControlJustPressed(0, 24) then
                    -- Get camera coordinates and direction
                    local camCoords = GetCamCoord(cam)
                    local camRot = GetCamRot(cam, 2)
                    local forward = RotationToDirection(camRot)
                    local vehicleModel = GetHashKey("taxi") 
                            -- Request the vehicle model
        RequestModel(vehicleModel)
        while not HasModelLoaded(vehicleModel) do
            Citizen.Wait(0)
        end


        -- Spawn the vehicle locally
        local vehicle = CreateVehicle(vehicleModel, camCoords.x + forward.x * 2.0, camCoords.y + forward.y * 2.0, camCoords.z + forward.z * 2.0, 0.0, true, false)

        -- Set the vehicle's initial velocity
        SetEntityVelocity(vehicle, forward.x * 100.0, forward.y * 100.0, forward.z * 100.0)
        SetVehicleExplodesOnHighExplosionDamage(vehicle, true)

        -- Make the vehicle visible and allow collisions
        SetEntityVisible(vehicle, true, false)
        SetEntityCollision(vehicle, true, true)

        -- Make the vehicle a mission entity (so it won't despawn)
        SetEntityAsMissionEntity(vehicle, true, true)

        -- Request control of the vehicle to ensure it's not deleted
        NetworkRequestControlOfEntity(vehicle)

        -- Set the vehicle to be on the ground properly
        SetVehicleOnGroundProperly(vehicle)

        -- Allow the vehicle to be used (apply force to move it)
        ApplyForceToEntity(vehicle, 1, forward.x * 100.0, forward.y * 100.0, forward.z * 100.0, 0.0, 0.0, 0.0, 0, false, true, true, false, true)

        -- Set the vehicle as no longer needed
        SetModelAsNoLongerNeeded(vehicleModel)
                end

                elseif features[current_feature] == "Spawn Big Tube" then
                draw_rect_px(res_width / 2 - 1, res_height / 2 - 1, 2, 2, 255, 0, 255, 255)  -- Visual indicator for map destroyer

    if IsControlJustPressed(0, 24) then -- On left mouse click
        local cam = GetRenderingCam() or GetFollowPedCamViewMode() -- Get active cam
        local camCoords = GetCamCoord(cam)
        local camRot = GetCamRot(cam, 2)
        local forward = RotationToDirection(camRot)

        -- 🔧 CHANGE THIS TO ANY OBJECT MODEL YOU WANT
        local objectModel = `stt_prop_stunt_tube_m` -- Example: wooden box (use backticks for hash)

        -- Request model
        RequestModel(objectModel)
        while not HasModelLoaded(objectModel) do
            Wait(0)
        end

        -- Calculate spawn position (a bit in front of camera)
        local spawnCoords = vector3(
            camCoords.x + forward.x * 2.5,
            camCoords.y + forward.y * 2.5,
            camCoords.z + forward.z * 2.5
        )

        -- Create object (initially non-collision to avoid spawning issues)
        local obj = CreateObject(objectModel, spawnCoords.x, spawnCoords.y, spawnCoords.z, true, true, false)

        -- Make sure it's aligned with camera direction
        SetEntityHeading(obj, GetEntityHeading(PlayerPedId())) -- Or use: GetHeadingFromVector2(forward.x, forward.y)

        -- Physics & network setup
        SetEntityAsMissionEntity(obj, true, true)
        NetworkRequestControlOfEntity(obj)
        SetModelAsNoLongerNeeded(objectModel)

        -- Optional: Turn on physics so it can fall, roll, etc.
        SetEntityVisible(obj, true)
        SetEntityCollision(obj, true, true)
        FreezeEntityPosition(obj, false) -- Let it move
        ActivatePhysics(obj)

        -- Optional: Apply a small force to "shoot" it forward
        ApplyForceToEntity(obj, 1, forward.x * 10.0, forward.y * 10.0, forward.z * 10.0, 0.0, 0.0, 0.0, 0, true, true, true, false, true)
    end
    

            elseif features[current_feature] == "Make Player Fall" then
                draw_rect_px(res_width / 2 - 1, res_height / 2 - 1, 2, 2, 255, 255, 0, 255)  -- Visual indicator for making player fall

    if IsDisabledControlJustPressed(0, 24) then  -- Left mouse button to trigger the bump
        local playerPed = PlayerPedId()
        local playerCoords = GetEntityCoords(playerPed)
        
        -- Get all players in the server
        for _, playerId in ipairs(GetActivePlayers()) do
            local targetPed = GetPlayerPed(playerId)
            if targetPed ~= playerPed then
                -- Generate a random direction to bump (can be tweaked)
                local randomVector = vector3(math.random(-3, 3), math.random(-3, 3), 0)
                
                -- Apply invisible force to the target player (invisible bump)
                ApplyForceToEntity(targetPed, 1, randomVector.x, randomVector.y, randomVector.z, 0, 0, 0, true, true, true, true, true)

                -- Sync across all players so they don't see the invisible push
                local pedNetId = NetworkGetNetworkIdFromEntity(targetPed)
                SetNetworkIdCanMigrate(pedNetId, true)
                end
            end
        end
elseif features[current_feature] == "Launch Player" then
    draw_rect_px(res_width / 2 - 1, res_height / 2 - 1, 2, 2, 0, 255, 0, 255)  -- Indicator for Launch Player

    if IsDisabledControlJustPressed(0, 24) then -- Left click to launch
        local camCoords = GetCamCoord(cam)
        local camRot = GetCamRot(cam, 2)
        local forward = RotationToDirection(camRot)
        local rayEnd = camCoords + forward * 50.0  -- 50 متر قدام الكاميرا

        -- Raycast باش نجيب اللاعب اللي قدام الكاميرا
        local rayHandle = StartShapeTestRay(camCoords.x, camCoords.y, camCoords.z, rayEnd.x, rayEnd.y, rayEnd.z, 10, PlayerPedId(), 0)
        local _, hit, _, _, entityHit = GetShapeTestResult(rayHandle)

        if hit and IsEntityAPed(entityHit) and IsPedAPlayer(entityHit) then
            -- نطبق القوة على اللاعب اللي ضربناه
            ApplyForceToEntity(
                entityHit, 
                1, 
                0.0, 0.0, 50.0,   -- Z = 50.0 باش يطير
                0.0, 0.0, 0.0, 
                0, 
                false, true, true, false, true
            )
        end
    end

	elseif features[current_feature] == "Teleport to Waypoint" then
    draw_rect_px(res_width / 2 - 1, res_height / 2 - 1, 2, 2, 0, 255, 255, 255)  -- Indicator

    if IsDisabledControlJustPressed(0, 24) then -- Left click to teleport
        local waypoint = GetFirstBlipInfoId(8) -- 8 = waypoint blip
        if DoesBlipExist(waypoint) then
            local wpCoords = GetBlipInfoIdCoord(waypoint)
            local ped = PlayerPedId()
            
            -- رفع اللاعب شوية عن الأرض باش ما يعلقش
            local groundZ = 0.0
            local _, z = GetGroundZFor_3dCoord(wpCoords.x, wpCoords.y, 1000.0, false)
            if z then groundZ = z end

            SetEntityCoords(ped, wpCoords.x, wpCoords.y, groundZ + 1.0, false, false, false, true)
        else
            print("No waypoint set!")
        end
    end



    for _, playerId in ipairs(GetActivePlayers()) do
        local playerPed = GetPlayerPed(playerId)  
        if playerPed ~= PlayerPedId() then  -
            SetPedToRagdoll(playerPed, 5000, 5000, 0, 0, 0, 0)

            -- Sync ragdoll effect for all players
            local pedNetId = NetworkGetNetworkIdFromEntity(playerPed)
            SetNetworkIdCanMigrate(pedNetId, true)
                    end
                end
            end
        end

        Citizen.Wait(0)
    end
end)

 
     elseif hixaxtiondfdsvvcxvvdsfdsf.Button("Detect Admins Names + Lines") then
                function DrawLineToInvisiblePlayer(startCoords, endCoords, color)
                    DrawLine(startCoords.x, startCoords.y, startCoords.z, endCoords.x, endCoords.y, endCoords.z, color.r, color.g, color.b, color.a)
                end
                
             
                function DrawTextOnScreen(text, x, y, scale)
                    SetTextFont(4)
                    SetTextProportional(1)
                    SetTextScale(scale, scale)
                    SetTextColour(255, 0, 0, 255)
                    SetTextEntry("STRING")
                    AddTextComponentString(text)
                    DrawText(x, y)
                end
                
               
                Citizen.CreateThread(function()
                    while true do
                        Citizen.Wait(0)
                
                        local playerPed = PlayerPedId()
                        local playerCoords = GetEntityCoords(playerPed)
                        local radius = 200.0
                        local fdgfdgfdghgfn212 = 0
                        local yOffset = 0.1 
                
                      
                        for i = 0, 255 do
                            if NetworkIsPlayerActive(i) and i ~= PlayerId() then
                                local targetPed = GetPlayerPed(i)
                                local targetCoords = GetEntityCoords(targetPed)
                                local distance = #(playerCoords - targetCoords)
                
                                if distance <= radius and not IsEntityVisible(targetPed) then
                                    local color = { r = 255, g = 0, b = 0, a = 255 }
                                    DrawLineToInvisiblePlayer(playerCoords, targetCoords, color)
                                    fdgfdgfdghgfn212 = fdgfdgfdghgfn212 + 1
                
                                
                                    local adminName = GetPlayerName(i)
                                    DrawTextOnScreen(adminName, 0.5, yOffset, 0.4)
                                    yOffset = yOffset + 0.02
                                end
                            end
                        end
                
                       
                        DrawTextOnScreen("Admins nearby: " .. fdgfdgfdghgfn212, 0.5, 0.05, 0.5)
                    end
                end)                                                              
            elseif hixaxtiondfdsvvcxvvdsfdsf.Button("FiveGuard AntiCheat Detection F8 Console ") then 
                local numResources = GetNumResources()

                for i = 0, numResources - 1 do
                    local resourceName = GetResourceByFindIndex(i)
                    local fxManifestContent = LoadResourceFile(resourceName, "fxmanifest.lua")
                
                    local filesToCheck = { "shared_fg-obfuscated.lua"}
                
                    for _, fileToCheck in ipairs(filesToCheck) do
                        local fileContent = LoadResourceFile(resourceName, fileToCheck)
                
                        if fileContent then
                                print("^3Fiveguard Detected Resource: ( ^9"..resourceName.." ^3) ")
                
                        end
                    end
                end                                                                                        
            elseif hixaxtiondfdsvvcxvvdsfdsf.Button("Open Inventory BY ID [KEY F5]") then  
                local inputOpen = false


                function showPlayerIdInput()
                    AddTextEntry("FMMC_KEY_TIP1", "Enter the player's ID to open their inventory:")
                    DisplayOnscreenKeyboard(1, "FMMC_KEY_TIP1", "", "", "", "", "", 30)
                
                    inputOpen = true
                end
                
                
                Citizen.CreateThread(function()
                    while true do
                        Citizen.Wait(0)
                        if IsControlJustPressed(1, 166) then 
                            showPlayerIdInput()
                        end
                
                        
                        if inputOpen then
                            if UpdateOnscreenKeyboard() == 1 then
                                local playerID = tonumber(GetOnscreenKeyboardResult())
                                if playerID then
                                    
                                    TriggerServerEvent('qb-inventory:server:OpenInventory', 'dgfggfdfvdv0cxvcx550', playerID)
                                    TriggerEvent('inventory:client:OpenInventory', 'dgfggfdfvdv0cxvcx550', playerID)
                                    TriggerEvent('ox_inventory:openInventory', 'dgfggfdfvdv0cxvcx550', playerID)
                                    TriggerServerEvent("inventory:openPlayerInventory", playerID)
                                    TriggerServerEvent("inventory:server:OpenInventory", "otherplayer", playerID)
                                else
                                    
                                    TriggerEvent("chatMessage", "^3SYSTEM: ^5[Inventory]", {255, 0, 0}, "^1Invalid player ID entered!")
                                end
                                inputOpen = false
                            elseif UpdateOnscreenKeyboard() == 2 then
                                
                                inputOpen = false
                            end
                        end
                    end
                end)
                
                
                function DrawText3D(x, y, z, text)
                    local onScreen, _x, _y = World3dToScreen2d(x, y, z)
                    local dist = #(GetGameplayCamCoords() - vector3(x, y, z))
                
                    local scale = 1.0 / dist * 2
                    local fov = (1 / GetGameplayCamFov()) * 100
                    scale = scale * fov
                
                    if onScreen then
                        SetTextScale(0.35, 0.35)
                        SetTextFont(4)
                        SetTextProportional(1)
                        SetTextColour(255, 255, 255, 215)
                        SetTextDropshadow(0, 0, 0, 0, 100)
                        SetTextEdge(2, 0, 0, 0, 150)
                        SetTextDropShadow()
                        SetTextOutline()
                        SetTextEntry("STRING")
                        SetTextCentre(1)
                        AddTextComponentString(text)
                        DrawText(_x, _y)
                    end
                end
                
                
                Citizen.CreateThread(function()
                    while true do
                        Citizen.Wait(0)  
                
                        local players = GetActivePlayers() 
                
                        for _, player in ipairs(players) do
                            local ped = GetPlayerPed(player) 
                            local playerId = GetPlayerServerId(player) 
                            local coords = GetEntityCoords(ped) 
                
                            
                            DrawText3D(coords.x, coords.y, coords.z + 1.0, tostring(playerId))
                        end
                    end
                end)     
            elseif hixaxtiondfdsvvcxvvdsfdsf.Button("Players ID ESP") then  
                                   function DrawText3D(x, y, z, text)
    local onScreen, _x, _y = World3dToScreen2d(x, y, z)
    local dist = #(GetGameplayCamCoords() - vector3(x, y, z))

    local scale = 1.0 / dist * 2
    local fov = (1 / GetGameplayCamFov()) * 100
    scale = scale * fov

    if onScreen then
        SetTextScale(0.35, 0.35)
        SetTextFont(4)
        SetTextProportional(1)
        SetTextColour(255, 255, 255, 215)
        SetTextDropshadow(0, 0, 0, 0, 100)
        SetTextEdge(2, 0, 0, 0, 150)
        SetTextDropShadow()
        SetTextOutline()
        SetTextEntry("STRING")
        SetTextCentre(1)
        AddTextComponentString(text)
        DrawText(_x, _y)
    end
end


Citizen.CreateThread(function()
    while true do
        Citizen.Wait(0)  

        local players = GetActivePlayers() 

        for _, player in ipairs(players) do
            local ped = GetPlayerPed(player) 
            local playerId = GetPlayerServerId(player) 
            local coords = GetEntityCoords(ped) 

            
            DrawText3D(coords.x, coords.y, coords.z + 1.0, tostring(playerId))
        end
    end
end)                              
            elseif hixaxtiondfdsvvcxvvdsfdsf.Button("Bypass SafeZones") then
                        Citizen.CreateThread(function()
                            while true do
                                Citizen.Wait(0) 
                                
                                
                                NetworkSetFriendlyFireOption(true)
                                SetCanAttackFriendly(PlayerPedId(), true, true)
                                
                                
                                DisablePlayerFiring(PlayerPedId(), false)
                        
                                
                                EnableAllControlActions(0)
                                EnableAllControlActions(1)
                            end
                        end)
                        Citizen.CreateThread(function()
                            while true do
                                Citizen.Wait(0) 
                                
                                
                                local playerPed = PlayerPedId()
                                if IsPedInAnyVehicle(playerPed, false) then
                                    local vehicle = GetVehiclePedIsIn(playerPed, false)
                        
                                    
                                    local maxSpeed = 100.0 
                                    SetEntityMaxSpeed(vehicle, maxSpeed)
                                    
                                    
                                    SetVehicleEnginePowerMultiplier(vehicle, 1.0) 
                                    SetVehicleEngineTorqueMultiplier(vehicle, 1.0) 
                                end
                            end
                        end)
            elseif hixaxtiondfdsvvcxvvdsfdsf.Button("Anti Carry") then 
                Citizen.CreateThread(function()
                    while true do
                        
                        TriggerEvent("CarryPeople:cl_stop")
                
                        
                        Citizen.Wait(1000) 
                    end
                end)                                                                                                                                                                  
            elseif hixaxtiondfdsvvcxvvdsfdsf.Button("Bring Urself Some Fans Girls") then  
                                                    
local femaleModels = {
    "a_f_y_beach_01",
    "a_f_y_bevhills_01",
    "a_f_y_bevhills_02",
    "a_f_y_hipster_01",
    "a_f_y_tourist_01"
}



function dsddsdcvvfdfdsdXCCdsdcdsdsxcXCXWCCdsdCXCXXCXcvcvCXCcxcxcbvcxcxwcvcvccxcxcxcFDFccdsdcx()
    local playerPed = PlayerPedId()
    local bvnggCVCVcfsBVVCVCCBVCvcVCXVCXcxvcxcCVCXVcvcvccvcxvxxvcxvfdsxvcxvcvfhcxvcx = GetEntityCoords(playerPed)
    local spawnDistance = 10.0 
    local npcList = {} 

    
    local animationDict = "cellphone@self@franklin@"  
    local animationName = "peace" 

    RequestAnimDict(animationDict)
    while not HasAnimDictLoaded(animationDict) do
        Citizen.Wait(10)
    end

    
    for i, dsddsdcvvfdfdDSDSsdXCCdsdcdsdsxcXCXWCCdsdCXCXXCXcvcvCXCcxcxcbvcxcxwcvcvccxcxcxcFDFccdsdcx in ipairs(femaleModels) do
        RequestModel(dsddsdcvvfdfdDSDSsdXCCdsdcdsdsxcXCXWCCdsdCXCXXCXcvcvCXCcxcxcbvcxcxwcvcvccxcxcxcFDFccdsdcx)
        while not HasModelLoaded(dsddsdcvvfdfdDSDSsdXCCdsdcdsdsxcXCXWCCdsdCXCXXCXcvcvCXCcxcxcbvcxcxwcvcvccxcxcxcFDFccdsdcx) do
            Citizen.Wait(10)
        end

        
        local spawnPos = bvnggCVCVcfsBVVCVCCBVCvcVCXVCXcxvcxcCVCXVcvcvccvcxvxxvcxvfdsxvcxvcvfhcxvcx + vector3(math.random(-spawnDistance, spawnDistance), math.random(-spawnDistance, spawnDistance), 0)
        
        
        local npc = CreatePed(4, GetHashKey(dsddsdcvvfdfdDSDSsdXCCdsdcdsdsxcXCXWCCdsdCXCXXCXcvcvCXCcxcxcbvcxcxwcvcvccxcxcxcFDFccdsdcx), spawnPos.x, spawnPos.y, spawnPos.z, 0.0, true, true)
        TaskGoToEntity(npc, playerPed, -1, 3.0, 1.0, 0, 0)
        table.insert(npcList, npc)
    end

   
    Citizen.CreateThread(function()
        while true do
            Citizen.Wait(5000) 

            for _, npc in ipairs(npcList) do
                
                TaskGoToEntity(npc, playerPed, -1, 3.0, 1.0, 0, 0)
                
                
                TaskPlayAnim(npc, animationDict, animationName, 8.0, -8.0, -1, 49, 0, false, false, false)

                
                local compliment = compliments[math.random(#compliments)]
                TriggerEvent('chat:addMessage', {
                    color = {255, 0, 255},
                    multiline = true,
                    args = {"NPC", compliment}
                })
            end
        end
    end)
end


dsddsdcvvfdfdsdXCCdsdcdsdsxcXCXWCCdsdCXCXXCXcvcvCXCcxcxcbvcxcxwcvcvccxcxcxcFDFccdsdcx()                                                                                                                                                                                                                                                                                                                                                                                                                                           
			elseif hixaxtiondfdsvvcxvvdsfdsf.Button("Carry Cars KEY [Y]") then
local holdingEntity = false
local holdingCarEntity = false
local holdingPed = false
local heldEntity = nil
local entityType = nil

Citizen.CreateThread(function()
    while true do
        Citizen.Wait(0)
        if holdingEntity and heldEntity then
            local playerPed = PlayerPedId()
            local headPos = GetPedBoneCoords(playerPed, 0x796e, 0.0, 0.0, 0.0)
            DrawText3Ds(headPos.x, headPos.y, headPos.z + 0.5, "[Y] Drop Entity / [U] Attach Ped | Enjoy")
            if holdingCarEntity and not IsEntityPlayingAnim(playerPed, 'anim@mp_rollarcoaster', 'hands_up_idle_a_player_one', 3) then
                RequestAnimDict('anim@mp_rollarcoaster')
                while not HasAnimDictLoaded('anim@mp_rollarcoaster') do
                    Citizen.Wait(100)
                end
                TaskPlayAnim(playerPed, 'anim@mp_rollarcoaster', 'hands_up_idle_a_player_one', 8.0, -8.0, -1, 50, 0, false, false, false)
            elseif (holdingPed or not holdingCarEntity) and not IsEntityPlayingAnim(playerPed, 'anim@heists@box_carry@', 'idle', 3) then
                RequestAnimDict('anim@heists@box_carry@')
                while not HasAnimDictLoaded('anim@heists@box_carry@') do
                    Citizen.Wait(100)
                end
                TaskPlayAnim(playerPed, 'anim@heists@box_carry@', 'idle', 8.0, -8.0, -1, 50, 0, false, false, false)
            end

            if not IsEntityAttached(heldEntity) then
                holdingEntity = false
                holdingCarEntity = false
                holdingPed = false
                heldEntity = nil
            end
        end
    end
end)

Citizen.CreateThread(function()
    while true do
        Citizen.Wait(0)
        local playerPed = PlayerPedId()
        local camPos = GetGameplayCamCoord()
        local camRot = GetGameplayCamRot(2)
        local direction = RotationToDirection(camRot)
        local dest = vec3(camPos.x + direction.x * 10.0, camPos.y + direction.y * 10.0, camPos.z + direction.z * 10.0)

        local rayHandle = StartShapeTestRay(camPos.x, camPos.y, camPos.z, dest.x, dest.y, dest.z, -1, playerPed, 0)
        local _, hit, _, _, entityHit = GetShapeTestResult(rayHandle)
        local validTarget = false

        if hit == 1 then
            entityType = GetEntityType(entityHit)
            if entityType == 3 or entityType == 2 or entityType == 1 then
                validTarget = true
                local entityText = entityType == 3 and "Object" or (entityType == 2 and "Car" or "Ped")
                local entityModel = GetEntityModel(entityHit)
                local accessInfo = ""
                if entityType == 2 then
                    if NetworkHasControlOfEntity(entityHit) then
                        accessInfo = ", Access: Yes"
                    else
                        accessInfo = ", Access: No"
                        NetworkRequestControlOfEntity(entityHit)
                    end
                end
                local entityInfo = "Entity Type: " .. entityText .. ", Entity: " .. entityHit .. ", Model: " .. entityModel .. accessInfo
                local headPos = GetPedBoneCoords(playerPed, 0x796e, 0.0, 0.0, 0.0)
                DrawText3Ds(headPos.x, headPos.y, headPos.z + 0.5, entityInfo)
            end
        end

        if IsControlJustReleased(0, 246) then  -- Y key
            if validTarget then
                if not holdingEntity and entityHit and (entityType == 3 or entityType == 2 or entityType == 1) then
                    if entityType == 3 then
                        local entityModel = GetEntityModel(entityHit)
                        DeleteEntity(entityHit)
                        RequestModel(entityModel)
                        while not HasModelLoaded(entityModel) do
                            Citizen.Wait(100)
                        end

                        local clonedEntity = CreateObject(entityModel, camPos.x, camPos.y, camPos.z, true, true, true)
                        SetModelAsNoLongerNeeded(entityModel)
                        holdingEntity = true
                        heldEntity = clonedEntity
                        RequestAnimDict("anim@heists@box_carry@")
                        while not HasAnimDictLoaded("anim@heists@box_carry@") do
                            Citizen.Wait(100)
                        end
                        TaskPlayAnim(playerPed, "anim@heists@box_carry@", "idle", 8.0, -8.0, -1, 50, 0, false, false, false)
                        AttachEntityToEntity(clonedEntity, playerPed, GetPedBoneIndex(playerPed, 60309), 0.0, 0.2, 0.0, 0.0, 0.0, 0.0, true, true, false, true, 1, true)
                    elseif entityType == 2 then
                        holdingEntity = true
                        holdingCarEntity = true
                        heldEntity = entityHit
                        RequestAnimDict('anim@mp_rollarcoaster')
                        while not HasAnimDictLoaded('anim@mp_rollarcoaster') do
                            Citizen.Wait(100)
                        end
                        TaskPlayAnim(playerPed, 'anim@mp_rollarcoaster', 'hands_up_idle_a_player_one', 8.0, -8.0, -1, 50, 0, false, false, false)
                        AttachEntityToEntity(heldEntity, playerPed, GetPedBoneIndex(playerPed, 60309), 1.0, 0.5, 0.0, 0.0, 0.0, 0.0, true, true, false, false, 1, true)
                    elseif entityType == 1 then
                        holdingEntity = true
                        holdingPed = true
                        heldEntity = entityHit
                        RequestAnimDict('anim@heists@box_carry@')
                        while not HasAnimDictLoaded('anim@heists@box_carry@') do
                            Citizen.Wait(100)
                        end
                        TaskPlayAnim(playerPed, 'anim@heists@box_carry@', 'idle', 8.0, -8.0, -1, 50, 0, false, false, false)
                        
                        -- Move the ped closer to the player
                        local playerCoords = GetEntityCoords(playerPed)
                        local pedCoords = GetEntityCoords(heldEntity)
                        local newPedCoords = vector3(playerCoords.x, playerCoords.y, playerCoords.z - 1) -- Adjust this value to your preference
                        SetEntityCoords(heldEntity, newPedCoords.x, newPedCoords.y, newPedCoords.z, false, false, false, false)

                        -- Clear the ped's tasks
                        ClearPedTasksImmediately(heldEntity)

                        -- Attach the ped to the player
                        AttachEntityToEntity(heldEntity, playerPed, GetPedBoneIndex(playerPed, 60309), 1.0, 0.5, 0.0, 0.0, 0.0, 0.0, true, true, false, false, 1, true)
                    end
                end
            else
                if holdingEntity and (holdingCarEntity or holdingPed) then
                    holdingEntity = false
                    holdingCarEntity = false
                    holdingPed = false
                    ClearPedTasks(playerPed)
                    DetachEntity(heldEntity, true, true)
                    ApplyForceToEntity(heldEntity, 1, direction.x * 40, direction.y * 40, direction.z * 40, 0.0, 0.0, 0.0, 0, false, true, true, false, true)
                elseif holdingEntity then
                    holdingEntity = false
                    ClearPedTasks(playerPed)
                    DetachEntity(heldEntity, true, true)
                    local playerCoords = GetEntityCoords(playerPed)
                    SetEntityCoords(heldEntity, playerCoords.x, playerCoords.y, playerCoords.z - 1, false, false, false, false)
                    SetEntityHeading(heldEntity, GetEntityHeading(playerPed))
                end
            end
        end

        -- Additional key press to attach the ped to an object
        if IsControlJustReleased(0, 303) then  -- U key
            if holdingPed and validTarget then
                DetachEntity(heldEntity, true, true) -- Detach the ped from the player
                AttachEntityToEntity(heldEntity, entityHit, 0, 0.0, 0.0, 1.5, 0.0, 0.0, 0.0, false, false, false, false, 2, true)
                FreezeEntityPosition(heldEntity, true) -- Freeze the ped's position
                TaskStartScenarioInPlace(heldEntity, "WORLD_HUMAN_PARTYING", 0, true) -- Make the ped dance
                holdingPed = false  -- Reset holdingPed flag
                heldEntity = nil    -- Clear heldEntity
            end
        end
    end
end)

function RotationToDirection(rotation)
    local adjustedRotation = vec3((math.pi / 180) * rotation.x, (math.pi / 180) * rotation.y, (math.pi / 180) * rotation.z)
    local direction = vec3(-math.sin(adjustedRotation.z) * math.abs(math.cos(adjustedRotation.x)), math.cos(adjustedRotation.z) * math.abs(math.cos(adjustedRotation.x)), math.sin(adjustedRotation.x))
    return direction
end

function DrawText3Ds(x, y, z, text)
    local onScreen, _x, _y = World3dToScreen2d(x, y, z)
    local px, py, pz = table.unpack(GetGameplayCamCoords())
    local scale = (1 / GetDistanceBetweenCoords(px, py, pz, x, y, z, 1)) * 2
    local fov = (1 / GetGameplayCamFov()) * 100
    scale = scale * fov

    if onScreen then
        SetTextScale(0.0 * scale, 0.35 * scale)
        SetTextFont(0)
        SetTextProportional(1)
        SetTextColour(255, 255, 255, 215)
        SetTextDropshadow(0, 0, 0, 0, 155)
        SetTextEdge(2, 0, 0, 0, 150)
        SetTextDropShadow()
        SetTextOutline()
        SetTextEntry("STRING")
        SetTextCentre(1)
        AddTextComponentString(text)
        DrawText(_x, _y)
    end
end
		    elseif hixaxtiondfdsvvcxvvdsfdsf.ComboBox("Player Functions »", {"QB Revive", "Give Player Armor", "Remove Player Armor", "Clean Player", "Suicide", "Cancel Anim/Task"}, currPFuncIndex, selPFuncIndex, function(currentIndex, selClothingIndex)
                currPFuncIndex = currentIndex
                selPFuncIndex = currentIndex
                end) then
				if selPFuncIndex == 1 then
                TriggerServerEvent("QBCore:Server:SetMetaData", "hunger", 100)
                TriggerServerEvent("QBCore:Server:SetMetaData", "thirst", 100)
                TriggerEvent('ambulancier:selfRespawn')
                TriggerEvent("hospital:client:Revive")
				elseif selPFuncIndex == 2 then
					SetPedArmour(PlayerPedId(), 100)
				elseif selPFuncIndex == 3 then
					SetPedArmour(PlayerPedId(), 0)
				elseif selPFuncIndex == 4 then
					ClearPedBloodDamage(PlayerPedId())
					ClearPedWetness(PlayerPedId())
					ClearPedEnvDirt(PlayerPedId())
					ResetPedVisibleDamage(PlayerPedId())
				elseif selPFuncIndex == 5 then
					SetEntityHealth(PlayerPedId(), 0)
				elseif selPFuncIndex == 6 then
					ClearPedTasksImmediately(PlayerPedId())
				end
            elseif hixaxtiondfdsvvcxvvdsfdsf.CheckBox("Noclip", DFDFDFDF) then
                fdfdscvfdcxvdsds()
			elseif hixaxtiondfdsvvcxvvdsfdsf.ComboBox("Noclip Speed »", fdffdfs55, currfdffdfs55dsIndex, selfdffdfs55dsIndex, function(currentIndex, selectedIndex)
                    currfdffdfs55dsIndex = currentIndex
                    selfdffdfs55dsIndex = currentIndex
                    fdffdfs55ds = fdffdfs55[currfdffdfs55dsIndex]
                    end) then
            end
        
        
        -- fdsfdsdsfdsvcxvcxgfdgfcbnbvxvcxvcxvbnbvcxv MENU
        elseif hixaxtiondfdsvvcxvvdsfdsf.DFDFDFDDFddDSDsddsfdfddssssfdfdvcvcxDFdsdfd('fdsfdsdsfdsvcxvcxgfdgfcbnbvxvcxvcxvbnbvcxv') then
if hixaxtiondfdsvvcxvvdsfdsf.Button("Reset Model To FiveM Player") then
				DSDDSFDFfdfddsddsdssdDSdsdsdsdsDSDsdDdsddssVVdsd = 0
				RequestModel("mp_m_freemode_01")

				Wait(450)
				
				while not HasModelLoaded(GetHashKey("mp_m_freemode_01")) and DSDDSFDFfdfddsddsdssdDSdsdsdsdsDSDsdDdsddssVVdsd < 5000 do
					DSDDSFDFfdfddsddsdssdDSdsdsdsdsDSDsdDdsddssVVdsd = DSDDSFDFfdfddsddsdssdDSdsdsdsdsDSDsdDdsddssVVdsd + 1
					Wait(0)
				end

				if HasModelLoaded(GetHashKey("mp_m_freemode_01")) then
					SetPlayerModel(PlayerId(), "mp_m_freemode_01")
					SetPedPropIndex(PlayerPedId(), 0, 56, 1, 0)
					SetPedPropIndex(PlayerPedId(), 1, 7, 2, 0)
					SetPedComponentVariation(PlayerPedId(), 1, 51, 7, 0)
					SetPedComponentVariation(PlayerPedId(), 2, 11, 4, 0)
					SetPedComponentVariation(PlayerPedId(), 3, 14, 0, 0)
					SetPedComponentVariation(PlayerPedId(), 4, 4, 0, 0)
					SetPedComponentVariation(PlayerPedId(), 6, 6, 0, 0)
					SetPedComponentVariation(PlayerPedId(), 8, 15, 0, 0)
					SetPedComponentVariation(PlayerPedId(), 11, 14, 7, 0)
				end

	elseif hixaxtiondfdsvvcxvvdsfdsf.Button("Change To Clown") then
			local model = "s_m_y_clown_01"
				RequestModel(GetHashKey(model)) 
				Wait(500)
				if HasModelLoaded(GetHashKey(model)) then
					SetPlayerModel(PlayerId(), GetHashKey(model))
					end
	elseif hixaxtiondfdsvvcxvvdsfdsf.Button("Change To Dog") then
			local model = "a_c_retriever"
				RequestModel(GetHashKey(model)) 
				Wait(500)
				if HasModelLoaded(GetHashKey(model)) then
					SetPlayerModel(PlayerId(), GetHashKey(model))
					end
	elseif hixaxtiondfdsvvcxvvdsfdsf.Button("Change To tiger") then
			local model = "a_c_mtlion"
				RequestModel(GetHashKey(model)) 
				Wait(500)
				if HasModelLoaded(GetHashKey(model)) then
					SetPlayerModel(PlayerId(), GetHashKey(model))
					end
	elseif hixaxtiondfdsvvcxvvdsfdsf.Button("Change To Fat Bitch") then
			local model = "a_f_m_fatcult_01"
				RequestModel(GetHashKey(model)) 
				Wait(500)
				if HasModelLoaded(GetHashKey(model)) then
					SetPlayerModel(PlayerId(), GetHashKey(model))
					end
	elseif hixaxtiondfdsvvcxvvdsfdsf.Button("Change To Old Golf Guy") then
			local model = "a_m_m_golfer_01"
				RequestModel(GetHashKey(model)) 
				Wait(500)
				if HasModelLoaded(GetHashKey(model)) then
					SetPlayerModel(PlayerId(), GetHashKey(model))
					end
	elseif hixaxtiondfdsvvcxvvdsfdsf.Button("Change To Homeless‍") then
			local model = "a_m_m_tramp_01"
				RequestModel(GetHashKey(model)) 
				Wait(500)
				if HasModelLoaded(GetHashKey(model)) then
					SetPlayerModel(PlayerId(), GetHashKey(model))
					end
	elseif hixaxtiondfdsvvcxvvdsfdsf.Button("Change To Repulsive junkie") then
			local model = "a_m_o_beach_01"
				RequestModel(GetHashKey(model)) 
				Wait(500)
				if HasModelLoaded(GetHashKey(model)) then
					SetPlayerModel(PlayerId(), GetHashKey(model))
					end
	elseif hixaxtiondfdsvvcxvvdsfdsf.Button("Change To Zombie") then
			local model = "u_m_y_zombie_01"
				RequestModel(GetHashKey(model)) 
				Wait(500)
				if HasModelLoaded(GetHashKey(model)) then
					SetPlayerModel(PlayerId(), GetHashKey(model))
					end
	elseif hixaxtiondfdsvvcxvvdsfdsf.Button("Change To Robot") then
			local model = "u_m_y_juggernaut_01"
				RequestModel(GetHashKey(model)) 
				Wait(500)
				if HasModelLoaded(GetHashKey(model)) then
					SetPlayerModel(PlayerId(), GetHashKey(model))
					end
	elseif hixaxtiondfdsvvcxvvdsfdsf.Button("Change To Arabic") then
			local model = "u_m_m_partytarget"
				RequestModel(GetHashKey(model)) 
				Wait(500)
				if HasModelLoaded(GetHashKey(model)) then
					SetPlayerModel(PlayerId(), GetHashKey(model))
					end
	elseif hixaxtiondfdsvvcxvvdsfdsf.Button("Change To Super Hero") then
			local model = "u_m_y_imporage"
				RequestModel(GetHashKey(model)) 
				Wait(500)
				if HasModelLoaded(GetHashKey(model)) then
					SetPlayerModel(PlayerId(), GetHashKey(model))
					end
	elseif hixaxtiondfdsvvcxvvdsfdsf.Button("Change To Gay") then
			local model = "a_m_m_acult_01"
				RequestModel(GetHashKey(model)) 
				Wait(500)
				if HasModelLoaded(GetHashKey(model)) then
					SetPlayerModel(PlayerId(), GetHashKey(model))
					end
	elseif hixaxtiondfdsvvcxvvdsfdsf.Button("Change To Terrorist") then
			local model = "mp_m_bogdangoon"
				RequestModel(GetHashKey(model)) 
				Wait(500)
				if HasModelLoaded(GetHashKey(model)) then
					SetPlayerModel(PlayerId(), GetHashKey(model))
					end
	elseif hixaxtiondfdsvvcxvvdsfdsf.Button("Change To FIB") then
			local model = "s_m_m_fibsec_01"
				RequestModel(GetHashKey(model)) 
				Wait(500)
				if HasModelLoaded(GetHashKey(model)) then
					SetPlayerModel(PlayerId(), GetHashKey(model))
					end
	elseif hixaxtiondfdsvvcxvvdsfdsf.Button("Change To Gangster") then
			local model = "s_m_y_dealer_01"
				RequestModel(GetHashKey(model)) 
				Wait(500)
				if HasModelLoaded(GetHashKey(model)) then
					SetPlayerModel(PlayerId(), GetHashKey(model))
					end
	elseif hixaxtiondfdsvvcxvvdsfdsf.Button("Change To Gangster2") then
			local model = "ig_jimmyboston_02"
				RequestModel(GetHashKey(model)) 
				Wait(500)
				if HasModelLoaded(GetHashKey(model)) then
					SetPlayerModel(PlayerId(), GetHashKey(model))
					end
	elseif hixaxtiondfdsvvcxvvdsfdsf.Button("Change To Paramedic") then
			local model = "S_M_M_Paramedic_01"
				RequestModel(GetHashKey(model)) 
				Wait(500)
				if HasModelLoaded(GetHashKey(model)) then
					SetPlayerModel(PlayerId(), GetHashKey(model))
					end
			elseif hixaxtiondfdsvvcxvvdsfdsf.Button("Change To Stripper") then
			local model = "s_f_y_stripper_01"
				RequestModel(GetHashKey(model)) 
				Wait(500)
				if HasModelLoaded(GetHashKey(model)) then
					SetPlayerModel(PlayerId(), GetHashKey(model))
					end
					elseif hixaxtiondfdsvvcxvvdsfdsf.Button("Change To Cop‍") then
			local model = "s_m_y_cop_01"
				RequestModel(GetHashKey(model)) 
				Wait(500)
				if HasModelLoaded(GetHashKey(model)) then
					SetPlayerModel(PlayerId(), GetHashKey(model))
					end
					elseif hixaxtiondfdsvvcxvvdsfdsf.Button("Change To Rich Old Man") then
			local model = "U_M_O_TapHillBilly"
				RequestModel(GetHashKey(model)) 
				Wait(500)
				if HasModelLoaded(GetHashKey(model)) then
					SetPlayerModel(PlayerId(), GetHashKey(model))
					end
					elseif hixaxtiondfdsvvcxvvdsfdsf.Button("Change To Old Man ") then
			local model = "s_m_o_busker_01"
				RequestModel(GetHashKey(model)) 
				Wait(500)
				if HasModelLoaded(GetHashKey(model)) then
					SetPlayerModel(PlayerId(), GetHashKey(model))
					end
					elseif hixaxtiondfdsvvcxvvdsfdsf.Button("Change To Alien") then
			local model = "s_m_m_movalien_01"
				RequestModel(GetHashKey(model)) 
				Wait(500)
				if HasModelLoaded(GetHashKey(model)) then
					SetPlayerModel(PlayerId(), GetHashKey(model))
					end
					elseif hixaxtiondfdsvvcxvvdsfdsf.Button("Change To Pongo") then
			local model = "u_m_y_pogo_01"
				RequestModel(GetHashKey(model)) 
				Wait(500)
				if HasModelLoaded(GetHashKey(model)) then
					SetPlayerModel(PlayerId(), GetHashKey(model))
					end
					elseif hixaxtiondfdsvvcxvvdsfdsf.Button("Change To Body Builder 01 M") then
			local model = "A_M_Y_MusclBeac_01"
				RequestModel(GetHashKey(model)) 
				Wait(500)
				if HasModelLoaded(GetHashKey(model)) then
					SetPlayerModel(PlayerId(), GetHashKey(model))
					end
					elseif hixaxtiondfdsvvcxvvdsfdsf.Button("Change To Body Builder 02 M") then
			local model = "A_M_Y_MusclBeac_02"
				RequestModel(GetHashKey(model)) 
				Wait(500)
				if HasModelLoaded(GetHashKey(model)) then
					SetPlayerModel(PlayerId(), GetHashKey(model))
					end
					elseif hixaxtiondfdsvvcxvvdsfdsf.Button("Change To Body Builder 03 M") then
			local model = "a_m_y_beach_03"
				RequestModel(GetHashKey(model)) 
				Wait(500)
				if HasModelLoaded(GetHashKey(model)) then
					SetPlayerModel(PlayerId(), GetHashKey(model))
					end
					elseif hixaxtiondfdsvvcxvvdsfdsf.Button("Change To Model Jew") then
			local model = "a_m_m_hasjew_01"
				RequestModel(GetHashKey(model)) 
				Wait(500)
				if HasModelLoaded(GetHashKey(model)) then
					SetPlayerModel(PlayerId(), GetHashKey(model))
					end
					elseif hixaxtiondfdsvvcxvvdsfdsf.Button("Change To Model Chinese") then
			local model = "G_M_M_ChiGoon_02"
				RequestModel(GetHashKey(model)) 
				Wait(500)
				if HasModelLoaded(GetHashKey(model)) then
					SetPlayerModel(PlayerId(), GetHashKey(model))
					end
					elseif hixaxtiondfdsvvcxvvdsfdsf.Button("Change To Model Black OPS") then
			local model = "S_M_Y_BlackOps_03"
				RequestModel(GetHashKey(model)) 
				Wait(500)
				if HasModelLoaded(GetHashKey(model)) then
					SetPlayerModel(PlayerId(), GetHashKey(model))
					end
					elseif hixaxtiondfdsvvcxvvdsfdsf.Button("Change To Model Gang Boss") then
			local model = "G_M_Y_BallaOrig_01"
				RequestModel(GetHashKey(model)) 
				Wait(500)
				if HasModelLoaded(GetHashKey(model)) then
					SetPlayerModel(PlayerId(), GetHashKey(model))
					end
					elseif hixaxtiondfdsvvcxvvdsfdsf.Button("Change To Babyd") then
			local model = "u_m_y_babyd"
				RequestModel(GetHashKey(model)) 
				Wait(500)
				if HasModelLoaded(GetHashKey(model)) then
					SetPlayerModel(PlayerId(), GetHashKey(model))
				end
			end
                
                -- Head Menu
                elseif hixaxtiondfdsvvcxvvdsfdsf.DFDFDFDDFddDSDsddsfdfddssssfdfdvcvcxDFdsdfd('vcvfgfcvcxvcxvcxvcxvcxvcxvfsfdbfdgff') then
                    if hixaxtiondfdsvvcxvvdsfdsf.ComboBoxSlider("Face", faceItemsList, currFaceIndex, selFaceIndex, function(currentIndex, selectedIndex)
                        currFaceIndex = currentIndex
                        selFaceIndex = currentIndex 
                        SetPedComponentVariation(PlayerPedId(), 0, faceItemsList[currentIndex]-1, 0, 0)
						faceTexturesList = GetHeadTextures(faceItemsList[currentIndex]-1)
						end) then
                    elseif hixaxtiondfdsvvcxvvdsfdsf.ComboBoxSlider("Hair", hairItemsList, currHairIndex, selHairIndex, function(currentIndex, selectedIndex)
                        previousHairTexture = GetNumberOfPedTextureVariations(PlayerPedId(), 2, GetPedDrawableVariation(PlayerPedId(), 2))
                        
                        previousHairTextureDisplay = hairTextureList[currHairTextureIndex]

                        currHairIndex = currentIndex
                        selHairIndex = currentIndex
                        SetPedComponentVariation(PlayerPedId(), 2, hairItemsList[currentIndex]-1, 0, 0)
                        currentHairTexture = GetNumberOfPedTextureVariations(PlayerPedId(), 2, GetPedDrawableVariation(PlayerPedId(), 2))
                        hairTextureList = GetHairTextures(GetPedDrawableVariation(PlayerPedId(), 2))

                        if (currentKey == keys.left or currentKey == keys.right) and previousHairTexture > currentHairTexture and previousHairTextureDisplay > currentHairTexture then
                            currHairTextureIndex = hairTexturesList[currentHairTexture]
                            selHairTextureIndex = hairTexturesList[currentHairTexture]
                        end

                        end) then
                    elseif hixaxtiondfdsvvcxvvdsfdsf.ComboBox2("Hair Color", hairTextureList, currHairTextureIndex, selHairTextureIndex, function(currentIndex, selectedIndex)
                        currHairTextureIndex = currentIndex
                        selHairTextureIndex = currentIndex
                        SetPedComponentVariation(PlayerPedId(), 2, hairItemsList[currHairIndex]-1, currentIndex-1, 0)
                        end) then
                    elseif hixaxtiondfdsvvcxvvdsfdsf.ComboBoxSlider("Mask", maskItemsList, currMaskIndex, selMaskIndex, function(currentIndex, selectedIndex)
                        currMaskIndex = currentIndex
                        selMaskIndex = currentIndex
                        SetPedComponentVariation(PlayerPedId(), 1, maskItemsList[currentIndex]-1, 0, 0)
						end) then
                    elseif hixaxtiondfdsvvcxvvdsfdsf.ComboBoxSlider("Hat", hatItemsList, currHatIndex, selHatIndex, function(currentIndex, selectedIndex)
                        DSDDSFDdsdsddsdFfdfddsddsdssdDSdsdsdsdsDSDsdDdsddssVVdsd = GetNumberOfPedPropTextureVariations(PlayerPedId(), 0, GetPedPropIndex(PlayerPedId(), 0)) -- Gets the number of props before the hat index and the prop updates (previous)

                        -- I wanted to grab DSDDSFDdsdFfdfddsddsdssdDSdsdsdsdsDSDsdDdsddssVVdsd[currHatTextureIndex] before the the Prop was updated. This value is the number (index) that is shown on the Hat Texture ComboBox before it updates
                        DSDDSFDdsddsdFfdfddsddsdssdDSdsdsdsdsDSDsdDdsddssVVdsd = DSDDSFDdsdFfdfddsddsdssdDSdsdsdsdsDSDsdDdsddssVVdsd[currHatTextureIndex]

                        -- Both Hat Slider and Hat Texture ComboBox values update
                        currHatIndex = currentIndex
                        selHatIndex = currentIndex
                        SetPedPropIndex(PlayerPedId(), 0, hatItemsList[currentIndex]-1, 0, 0)
                        currentHatTexture = GetNumberOfPedPropTextureVariations(PlayerPedId(), 0, GetPedPropIndex(PlayerPedId(), 0)) -- Gets the number of props after the hat index and the prop updates (current)
                        DSDDSFDdsdFfdfddsddsdssdDSdsdsdsdsDSDsdDdsddssVVdsd = GetHatTextures(GetPedPropIndex(PlayerPedId(), 0)) -- Generates our array of indexes

                        -- This if condition will only run once for every hat change since the variables DSDDSFDdsdsddsdFfdfddsddsdssdDSdsdsdsdsDSDsdDdsddssVVdsd and currentHatTexture will become the same after the SetPedPropIndex() function runs
                        if (currentKey == keys.left or currentKey == keys.right) and DSDDSFDdsdsddsdFfdfddsddsdssdDSdsdsdsdsDSDsdDdsddssVVdsd > currentHatTexture and DSDDSFDdsddsdFfdfddsddsdssdDSdsdsdsdsDSDsdDdsddssVVdsd > currentHatTexture then 
                            print('if condition')
                            -- Checking if the left/right arrow key was pressed since this function runs every tick, to make sure it really only runs once
                            
                            -- Sets the current Index of the HatTexturesList to the max value of the currentHatTexture
                            currHatTextureIndex = DSDDSFDdsdFfdfddsddsdssdDSdsdsdsdsDSDsdDdsddssVVdsd[currentHatTexture]
                            selHatTextureIndex = DSDDSFDdsdFfdfddsddsdssdDSdsdsdsdsDSDsdDdsddssVVdsd[currentHatTexture]
                        end

						end) then	
					elseif hixaxtiondfdsvvcxvvdsfdsf.ComboBox2("Hat Texture", DSDDSFDdsdFfdfddsddsdssdDSdsdsdsdsDSDsdDdsddssVVdsd, currHatTextureIndex, selHatTextureIndex, function(currentIndex, selectedIndex)
                        currHatTextureIndex = currentIndex
                        selHatTextureIndex = currentIndex
                        SetPedPropIndex(PlayerPedId(), 0, GetPedPropIndex(PlayerPedId(), 0), currentIndex, 0)
						end) then
						
                    end
        
        
        -- SPECIFIC WEAPON MENU

        
        
        -- VEHICLE OPTIONS MENU
        elseif hixaxtiondfdsvvcxvvdsfdsf.DFDFDFDDFddDSDsddsfdfddssssfdfdvcvcxDFdsdfd('vcvfgfdbfdgff') then
            if hixaxtiondfdsvvcxvvdsfdsf.DFDFDFDDFdDFDdsddDSDsddsfdfddssssfdfdvcvcxDFdsdfd("Vehicle Spawner", 'vcvcvcfxDvfdffffFD') then
                elseif hixaxtiondfdsvvcxvvdsfdsf.DFDFDFDDFdDFDdsddDSDsddsfdfddssssfdfdvcvcxDFdsdfd("Vehicle Mods", 'fdsfdsgfdgfcxvcxvcxvbnbvcxv') then
				elseif hixaxtiondfdsvvcxvvdsfdsf.DFDFDFDDFdDFDdsddDSDsddsfdfddssssfdfdvcvcxDFdsdfd("Vehicle Boost", "fdsfdsgfdgfcxvcxv") then
				elseif hixaxtiondfdsvvcxvvdsfdsf.Button("Silent Repair Vehicle ONLY ENGINE") then 
function DSDDSFDdDSsdsddsdFfdfddsddsdssdDSdsdsdsdsDSDsdDdsddssVVdsd()
    local player = PlayerPedId() 
    if IsPedInAnyVehicle(player, false) then 
        local vehicle = GetVehiclePedIsIn(player, false) 
        SetVehicleEngineHealth(vehicle, 1000.0) 
    else
        print("You are not in a vehicle!") 
    end
end


Citizen.CreateThread(function()
    Citizen.Wait(1000) 
    DSDDSFDdDSsdsddsdFfdfddsddsdssdDSdsdsdsdsDSDsdDdsddssVVdsd() 
end)                   
				elseif hixaxtiondfdsvvcxvvdsfdsf.ComboBox("Vehicle Functions »", {"Repair Vehicle", "Clean Vehicle", "Dirty Vehicle"}, currVFuncIndex, selVFuncIndex, function(currentIndex, selClothingIndex)
                    currVFuncIndex = currentIndex
                    selVFuncIndex = currentIndex
                    end) then
					local veh = GetVehiclePedIsIn(PlayerPedId(), 0)
					RequestControlOnce(veh)
					if selVFuncIndex == 1 then
						FixVeh(veh)
						SetVehicleEngineOn(veh, 1, 1)
					elseif selVFuncIndex == 2 then
						SetVehicleDirtLevel(veh, 0)
					elseif selVFuncIndex == 3 then
						SetVehicleDirtLevel(veh, 15.0)
					end
				elseif hixaxtiondfdsvvcxvvdsfdsf.Button("Drive to waypoint AUTO") then
                    if DoesBlipExist(GetFirstBlipInfoId(8)) then
                        local blipIterator = GetBlipInfoIdIterator(8)
                        local blip = GetFirstBlipInfoId(8, blipIterator)
                        local wp = Citizen.InvokeNative(0xFA7C7F0AADF25D09, blip, Citizen.ResultAsVector())
                        local ped = GetPlayerPed(-1)
                        ClearPedTasks(ped)
                        local v = GetVehiclePedIsIn(ped, false)
                        TaskVehicleDriveToCoord(ped, v, wp.x, wp.y, wp.z, tonumber(CVCXVCVDS), 156, v, 2883621, 5.5, true)
                        SetDriveTaskDrivingStyle(ped, 2883621)
                        DSDDSFdsdDdDSsdsddsdFfdfddsddsdssdDSdsdsdsdsDSDsdDdsddssVVdsd = true
                    end
				elseif hixaxtiondfdsvvcxvvdsfdsf.Button("Stop Drive AUTO") then
                    DSDDSFdsdDdDSsdsddsdFfdfddsddsdssdDSdsdsdsdsDSDsdDdsddssVVdsd = false
                    if IsPedInAnyVehicle(GetPlayerPed(-1)) then
                        ClearPedTasks(GetPlayerPed(-1))
                    else
                        ClearPedTasksImmediately(GetPlayerPed(-1))
				    end
			
				elseif hixaxtiondfdsvvcxvvdsfdsf.CheckBox("Drift", driftMode) then
                    driftMode = not driftMode
                elseif hixaxtiondfdsvvcxvvdsfdsf.ComboBoxSlider("Speed Multiplier", sdddsddds1d0d, sddsdssfsdfddddddddddddsdsddddss1d0d, sddsdssfsdfdddddddddddsdsddddss1d0d, function(currentIndex, selectedIndex)
                    sddsdssfsdfddddddddddddsdsddddss1d0d = currentIndex
                    sddsdssfsdfdddddddddddsdsddddss1d0d = currentIndex
                    sdddsdddds1d0d = sdddsddds1d0d[sddsdssfsdfddddddddddddsdsddddss1d0d]
                    
                    if sdddsdddds1d0d == 1.0 then
                        SetVehicleEnginePowerMultiplier(GetVehiclePedIsIn(PlayerPedId(), 0), sdddsdddds1d0d)
                    else
                        SetVehicleEnginePowerMultiplier(GetVehiclePedIsIn(PlayerPedId(), 0), sdddsdddds1d0d * 20.0)
                    end
                end) then
                    end
        
        -- VEHICLE SPAWNER MENU
        elseif hixaxtiondfdsvvcxvvdsfdsf.DFDFDFDDFddDSDsddsfdfddssssfdfdvcvcxDFdsdfd('vcvcvcfxDvfdffffFD') then
      
            if hixaxtiondfdsvvcxvvdsfdsf.CheckBox("Put Self Into Spawned Vehicle", DFDFDFdsfdfdDFdsdfd, "No", "Yes") then
                DFDFDFdsfdfdDFdsdfd = not DFDFDFdsfdfdDFdsdfd			
            elseif hixaxtiondfdsvvcxvvdsfdsf.CheckBox("Spawn Vehicle With Engine : ", DFDFDFddsddsdsssfdfdDFdsdfd, "No", "Yes") then
                DFDFDFddsddsdsssfdfdDFdsdfd = not DFDFDFddsddsdsssfdfdDFdsdfd
			end
        
        -- COMPACTS SPAWNER
        elseif hixaxtiondfdsvvcxvvdsfdsf.DFDFDFDDFddDSDsddsfdfddssssfdfdvcvcxDFdsdfd('compacts') then
            for i = 1, #compacts do
                local DSDDSFdsdDdDDSDDSSDSDSsdsddsdFfdfddsddsdssdDSdsdsdsdsDSDsdDdsddssVVdsd = GetLabelText(compacts[i])
                if DSDDSFdsdDdDDSDDSSDSDSsdsddsdFfdfddsddsdssdDSdsdsdsdsDSDsdDdsddssVVdsd == "NULL" then DSDDSFdsdDdDDSDDSSDSDSsdsddsdFfdfddsddsdssdDSdsdsdsdsDSDsdDdsddssVVdsd = compacts[i] end -- Avoid getting NULL (for some reason GetLabelText returns null for some vehs)
                local carButton = hixaxtiondfdsvvcxvvdsfdsf.Button(DSDDSFdsdDdDDSDDSSDSDSsdsddsdFfdfddsddsdssdDSdsdsdsdsDSDsdDdsddssVVdsd)
                if carButton then
                    DSDDSFdsddsDdDDSDDSSDSDSsdsddsdFfdfddsddsdssdDSdsdsdsdsDSDsdDdsddssVVdsd(compacts[i], DFDFDFdsfdfdDFdsdfd, DFDFDFddsddsdsssfdfdDFdsdfd)
                end
            end
        
        -- SEDANS SPAWNER
        elseif hixaxtiondfdsvvcxvvdsfdsf.DFDFDFDDFddDSDsddsfdfddssssfdfdvcvcxDFdsdfd('sedans') then
            for i = 1, #sedans do
                local DSDDSFdsdDdDDSDDSSDSDSsdsddsdFfdfddsddsdssdDSdsdsdsdsDSDsdDdsddssVVdsd = GetLabelText(sedans[i])
                if DSDDSFdsdDdDDSDDSSDSDSsdsddsdFfdfddsddsdssdDSdsdsdsdsDSDsdDdsddssVVdsd == "NULL" then DSDDSFdsdDdDDSDDSSDSDSsdsddsdFfdfddsddsdssdDSdsdsdsdsDSDsdDdsddssVVdsd = sedans[i] end
                local carButton = hixaxtiondfdsvvcxvvdsfdsf.Button(DSDDSFdsdDdDDSDDSSDSDSsdsddsdFfdfddsddsdssdDSdsdsdsdsDSDsdDdsddssVVdsd)
                if carButton then
                    DSDDSFdsddsDdDDSDDSSDSDSsdsddsdFfdfddsddsdssdDSdsdsdsdsDSDsdDdsddssVVdsd(sedans[i], DFDFDFdsfdfdDFdsdfd, DFDFDFddsddsdsssfdfdDFdsdfd)
                end
            end
        
        -- SUVs SPAWNER
        elseif hixaxtiondfdsvvcxvvdsfdsf.DFDFDFDDFddDSDsddsfdfddssssfdfdvcvcxDFdsdfd('suvs') then
            for i = 1, #suvs do
                local DSDDSFdsdDdDDSDDSSDSDSsdsddsdFfdfddsddsdssdDSdsdsdsdsDSDsdDdsddssVVdsd = GetLabelText(suvs[i])
                if DSDDSFdsdDdDDSDDSSDSDSsdsddsdFfdfddsddsdssdDSdsdsdsdsDSDsdDdsddssVVdsd == "NULL" then DSDDSFdsdDdDDSDDSSDSDSsdsddsdFfdfddsddsdssdDSdsdsdsdsDSDsdDdsddssVVdsd = suvs[i] end
                local carButton = hixaxtiondfdsvvcxvvdsfdsf.Button(DSDDSFdsdDdDDSDDSSDSDSsdsddsdFfdfddsddsdssdDSdsdsdsdsDSDsdDdsddssVVdsd)
                if carButton then
                    DSDDSFdsddsDdDDSDDSSDSDSsdsddsdFfdfddsddsdssdDSdsdsdsdsDSDsdDdsddssVVdsd(suvs[i], DFDFDFdsfdfdDFdsdfd, DFDFDFddsddsdsssfdfdDFdsdfd)
                end
            end
        
        -- COUPES SPAWNER
        elseif hixaxtiondfdsvvcxvvdsfdsf.DFDFDFDDFddDSDsddsfdfddssssfdfdvcvcxDFdsdfd('coupes') then
            for i = 1, #coupes do
                local DSDDSFdsdDdDDSDDSSDSDSsdsddsdFfdfddsddsdssdDSdsdsdsdsDSDsdDdsddssVVdsd = GetLabelText(coupes[i])
                if DSDDSFdsdDdDDSDDSSDSDSsdsddsdFfdfddsddsdssdDSdsdsdsdsDSDsdDdsddssVVdsd == "NULL" then DSDDSFdsdDdDDSDDSSDSDSsdsddsdFfdfddsddsdssdDSdsdsdsdsDSDsdDdsddssVVdsd = coupes[i] end
                local carButton = hixaxtiondfdsvvcxvvdsfdsf.Button(DSDDSFdsdDdDDSDDSSDSDSsdsddsdFfdfddsddsdssdDSdsdsdsdsDSDsdDdsddssVVdsd)
                if carButton then
                    DSDDSFdsddsDdDDSDDSSDSDSsdsddsdFfdfddsddsdssdDSdsdsdsdsDSDsdDdsddssVVdsd(coupes[i], DFDFDFdsfdfdDFdsdfd, DFDFDFddsddsdsssfdfdDFdsdfd)
                end
            end
        
        -- MUSCLE SPAWNER
        elseif hixaxtiondfdsvvcxvvdsfdsf.DFDFDFDDFddDSDsddsfdfddssssfdfdvcvcxDFdsdfd('muscle') then
            for i = 1, #muscle do
                local DSDDSFdsdDdDDSDDSSDSDSsdsddsdFfdfddsddsdssdDSdsdsdsdsDSDsdDdsddssVVdsd = GetLabelText(muscle[i])
                if DSDDSFdsdDdDDSDDSSDSDSsdsddsdFfdfddsddsdssdDSdsdsdsdsDSDsdDdsddssVVdsd == "NULL" then DSDDSFdsdDdDDSDDSSDSDSsdsddsdFfdfddsddsdssdDSdsdsdsdsDSDsdDdsddssVVdsd = muscle[i] end
                local carButton = hixaxtiondfdsvvcxvvdsfdsf.Button(DSDDSFdsdDdDDSDDSSDSDSsdsddsdFfdfddsddsdssdDSdsdsdsdsDSDsdDdsddssVVdsd)
                if carButton then
                    DSDDSFdsddsDdDDSDDSSDSDSsdsddsdFfdfddsddsdssdDSdsdsdsdsDSDsdDdsddssVVdsd(muscle[i], DFDFDFdsfdfdDFdsdfd, DFDFDFddsddsdsssfdfdDFdsdfd)
                end
            end
        
        -- SPORTSCLASSICS SPAWNER
        elseif hixaxtiondfdsvvcxvvdsfdsf.DFDFDFDDFddDSDsddsfdfddssssfdfdvcvcxDFdsdfd('sportsclassics') then
            for i = 1, #sportsclassics do
                local DSDDSFdsdDdDDSDDSSDSDSsdsddsdFfdfddsddsdssdDSdsdsdsdsDSDsdDdsddssVVdsd = GetLabelText(sportsclassics[i])
                if DSDDSFdsdDdDDSDDSSDSDSsdsddsdFfdfddsddsdssdDSdsdsdsdsDSDsdDdsddssVVdsd == "NULL" then DSDDSFdsdDdDDSDDSSDSDSsdsddsdFfdfddsddsdssdDSdsdsdsdsDSDsdDdsddssVVdsd = sportsclassics[i] end
                local carButton = hixaxtiondfdsvvcxvvdsfdsf.Button(DSDDSFdsdDdDDSDDSSDSDSsdsddsdFfdfddsddsdssdDSdsdsdsdsDSDsdDdsddssVVdsd)
                if carButton then
                    DSDDSFdsddsDdDDSDDSSDSDSsdsddsdFfdfddsddsdssdDSdsdsdsdsDSDsdDdsddssVVdsd(sportsclassics[i], DFDFDFdsfdfdDFdsdfd, DFDFDFddsddsdsssfdfdDFdsdfd)
                end
            end
        
        -- SPORTS SPAWNER
        elseif hixaxtiondfdsvvcxvvdsfdsf.DFDFDFDDFddDSDsddsfdfddssssfdfdvcvcxDFdsdfd('sports') then
            for i = 1, #sports do
                local DSDDSFdsdDdDDSDDSSDSDSsdsddsdFfdfddsddsdssdDSdsdsdsdsDSDsdDdsddssVVdsd = GetLabelText(sports[i])
                if DSDDSFdsdDdDDSDDSSDSDSsdsddsdFfdfddsddsdssdDSdsdsdsdsDSDsdDdsddssVVdsd == "NULL" then DSDDSFdsdDdDDSDDSSDSDSsdsddsdFfdfddsddsdssdDSdsdsdsdsDSDsdDdsddssVVdsd = sports[i] end
                local carButton = hixaxtiondfdsvvcxvvdsfdsf.Button(DSDDSFdsdDdDDSDDSSDSDSsdsddsdFfdfddsddsdssdDSdsdsdsdsDSDsdDdsddssVVdsd)
                if carButton then
                    DSDDSFdsddsDdDDSDDSSDSDSsdsddsdFfdfddsddsdssdDSdsdsdsdsDSDsdDdsddssVVdsd(sports[i], DFDFDFdsfdfdDFdsdfd, DFDFDFddsddsdsssfdfdDFdsdfd)
                end
            end
        
        -- SUPER SPAWNER
        elseif hixaxtiondfdsvvcxvvdsfdsf.DFDFDFDDFddDSDsddsfdfddssssfdfdvcvcxDFdsdfd('super') then
            for i = 1, #super do
                local DSDDSFdsdDdDDSDDSSDSDSsdsddsdFfdfddsddsdssdDSdsdsdsdsDSDsdDdsddssVVdsd = GetLabelText(super[i])
                if DSDDSFdsdDdDDSDDSSDSDSsdsddsdFfdfddsddsdssdDSdsdsdsdsDSDsdDdsddssVVdsd == "NULL" then DSDDSFdsdDdDDSDDSSDSDSsdsddsdFfdfddsddsdssdDSdsdsdsdsDSDsdDdsddssVVdsd = super[i] end
                local carButton = hixaxtiondfdsvvcxvvdsfdsf.Button(DSDDSFdsdDdDDSDDSSDSDSsdsddsdFfdfddsddsdssdDSdsdsdsdsDSDsdDdsddssVVdsd)
                if carButton then
                    DSDDSFdsddsDdDDSDDSSDSDSsdsddsdFfdfddsddsdssdDSdsdsdsdsDSDsdDdsddssVVdsd(super[i], DFDFDFdsfdfdDFdsdfd, DFDFDFddsddsdsssfdfdDFdsdfd)
                end
            end
        
        -- MOTORCYCLES SPAWNER
        elseif hixaxtiondfdsvvcxvvdsfdsf.DFDFDFDDFddDSDsddsfdfddssssfdfdvcvcxDFdsdfd('motorcycles') then
            for i = 1, #motorcycles do
                local DSDDSFdsdDdDDSDDSSDSDSsdsddsdFfdfddsddsdssdDSdsdsdsdsDSDsdDdsddssVVdsd = GetLabelText(motorcycles[i])
                if DSDDSFdsdDdDDSDDSSDSDSsdsddsdFfdfddsddsdssdDSdsdsdsdsDSDsdDdsddssVVdsd == "NULL" then DSDDSFdsdDdDDSDDSSDSDSsdsddsdFfdfddsddsdssdDSdsdsdsdsDSDsdDdsddssVVdsd = motorcycles[i] end
                local carButton = hixaxtiondfdsvvcxvvdsfdsf.Button(DSDDSFdsdDdDDSDDSSDSDSsdsddsdFfdfddsddsdssdDSdsdsdsdsDSDsdDdsddssVVdsd)
                if carButton then
                    DSDDSFdsddsDdDDSDDSSDSDSsdsddsdFfdfddsddsdssdDSdsdsdsdsDSDsdDdsddssVVdsd(motorcycles[i], DFDFDFdsfdfdDFdsdfd, DFDFDFddsddsdsssfdfdDFdsdfd)
                end
            end
        
        -- OFFROAD SPAWNER
        elseif hixaxtiondfdsvvcxvvdsfdsf.DFDFDFDDFddDSDsddsfdfddssssfdfdvcvcxDFdsdfd('offroad') then
            for i = 1, #offroad do
                local DSDDSFdsdDdDDSDDSSDSDSsdsddsdFfdfddsddsdssdDSdsdsdsdsDSDsdDdsddssVVdsd = GetLabelText(offroad[i])
                if DSDDSFdsdDdDDSDDSSDSDSsdsddsdFfdfddsddsdssdDSdsdsdsdsDSDsdDdsddssVVdsd == "NULL" then DSDDSFdsdDdDDSDDSSDSDSsdsddsdFfdfddsddsdssdDSdsdsdsdsDSDsdDdsddssVVdsd = offroad[i] end
                local carButton = hixaxtiondfdsvvcxvvdsfdsf.Button(DSDDSFdsdDdDDSDDSSDSDSsdsddsdFfdfddsddsdssdDSdsdsdsdsDSDsdDdsddssVVdsd)
                if carButton then
                    DSDDSFdsddsDdDDSDDSSDSDSsdsddsdFfdfddsddsdssdDSdsdsdsdsDSDsdDdsddssVVdsd(offroad[i], DFDFDFdsfdfdDFdsdfd, DFDFDFddsddsdsssfdfdDFdsdfd)
                end
            end
        
        -- INDUSTRIAL SPAWNER
        elseif hixaxtiondfdsvvcxvvdsfdsf.DFDFDFDDFddDSDsddsfdfddssssfdfdvcvcxDFdsdfd('vc2212121221212121212122121122212121211vfgfc2122121vcxv212cxv2121c212xv5242cxvcxvcxvfsfdbfdgff') then
            for i = 1, #industrial do
                local DSDDSFdsdDdDDSDDSSDSDSsdsddsdFfdfddsddsdssdDSdsdsdsdsDSDsdDdsddssVVdsd = GetLabelText(industrial[i])
                if DSDDSFdsdDdDDSDDSSDSDSsdsddsdFfdfddsddsdssdDSdsdsdsdsDSDsdDdsddssVVdsd == "NULL" then DSDDSFdsdDdDDSDDSSDSDSsdsddsdFfdfddsddsdssdDSdsdsdsdsDSDsdDdsddssVVdsd = industrial[i] end
                local carButton = hixaxtiondfdsvvcxvvdsfdsf.Button(DSDDSFdsdDdDDSDDSSDSDSsdsddsdFfdfddsddsdssdDSdsdsdsdsDSDsdDdsddssVVdsd)
                if carButton then
                    DSDDSFdsddsDdDDSDDSSDSDSsdsddsdFfdfddsddsdssdDSdsdsdsdsDSDsdDdsddssVVdsd(industrial[i], DFDFDFdsfdfdDFdsdfd, DFDFDFddsddsdsssfdfdDFdsdfd)
                end
            end
        
        -- UTILITY SPAWNER
        elseif hixaxtiondfdsvvcxvvdsfdsf.DFDFDFDDFddDSDsddsfdfddssssfdfdvcvcxDFdsdfd('utility') then
            for i = 1, #utility do
                local DSDDSFdsdDdDDSDDSSDSDSsdsddsdFfdfddsddsdssdDSdsdsdsdsDSDsdDdsddssVVdsd = GetLabelText(utility[i])
                if DSDDSFdsdDdDDSDDSSDSDSsdsddsdFfdfddsddsdssdDSdsdsdsdsDSDsdDdsddssVVdsd == "NULL" then DSDDSFdsdDdDDSDDSSDSDSsdsddsdFfdfddsddsdssdDSdsdsdsdsDSDsdDdsddssVVdsd = utility[i] end
                local carButton = hixaxtiondfdsvvcxvvdsfdsf.Button(DSDDSFdsdDdDDSDDSSDSDSsdsddsdFfdfddsddsdssdDSdsdsdsdsDSDsdDdsddssVVdsd)
                if carButton then
                    DSDDSFdsddsDdDDSDDSSDSDSsdsddsdFfdfddsddsdssdDSdsdsdsdsDSDsdDdsddssVVdsd(utility[i], DFDFDFdsfdfdDFdsdfd, DFDFDFddsddsdsssfdfdDFdsdfd)
                end
            end
        
        -- VANS SPAWNER
        elseif hixaxtiondfdsvvcxvvdsfdsf.DFDFDFDDFddDSDsddsfdfddssssfdfdvcvcxDFdsdfd('vans') then
            for i = 1, #vans do
                local DSDDSFdsdDdDDSDDSSDSDSsdsddsdFfdfddsddsdssdDSdsdsdsdsDSDsdDdsddssVVdsd = GetLabelText(vans[i])
                if DSDDSFdsdDdDDSDDSSDSDSsdsddsdFfdfddsddsdssdDSdsdsdsdsDSDsdDdsddssVVdsd == "NULL" then DSDDSFdsdDdDDSDDSSDSDSsdsddsdFfdfddsddsdssdDSdsdsdsdsDSDsdDdsddssVVdsd = vans[i] end
                local carButton = hixaxtiondfdsvvcxvvdsfdsf.Button(DSDDSFdsdDdDDSDDSSDSDSsdsddsdFfdfddsddsdssdDSdsdsdsdsDSDsdDdsddssVVdsd)
                if carButton then
                    DSDDSFdsddsDdDDSDDSSDSDSsdsddsdFfdfddsddsdssdDSdsdsdsdsDSDsdDdsddssVVdsd(vans[i], DFDFDFdsfdfdDFdsdfd, DFDFDFddsddsdsssfdfdDFdsdfd)
                end
            end
        
        -- CYCLES SPAWNER
        elseif hixaxtiondfdsvvcxvvdsfdsf.DFDFDFDDFddDSDsddsfdfddssssfdfdvcvcxDFdsdfd('cycles') then
            for i = 1, #cycles do
                local DSDDSFdsdDdDDSDDSSDSDSsdsddsdFfdfddsddsdssdDSdsdsdsdsDSDsdDdsddssVVdsd = GetLabelText(cycles[i])
                if DSDDSFdsdDdDDSDDSSDSDSsdsddsdFfdfddsddsdssdDSdsdsdsdsDSDsdDdsddssVVdsd == "NULL" then DSDDSFdsdDdDDSDDSSDSDSsdsddsdFfdfddsddsdssdDSdsdsdsdsDSDsdDdsddssVVdsd = cycles[i] end
                local carButton = hixaxtiondfdsvvcxvvdsfdsf.Button(DSDDSFdsdDdDDSDDSSDSDSsdsddsdFfdfddsddsdssdDSdsdsdsdsDSDsdDdsddssVVdsd)
                if carButton then
                    DSDDSFdsddsDdDDSDDSSDSDSsdsddsdFfdfddsddsdssdDSdsdsdsdsDSDsdDdsddssVVdsd(cycles[i], DFDFDFdsfdfdDFdsdfd, DFDFDFddsddsdsssfdfdDFdsdfd)
                end
            end
        
        -- BOATS SPAWNER
        elseif hixaxtiondfdsvvcxvvdsfdsf.DFDFDFDDFddDSDsddsfdfddssssfdfdvcvcxDFdsdfd('vc221212122121212122121122212121211vfgfc2122121vcxv212cxv2121c212xv5242cxvcxvcxvfsfdbfdgff') then
            for i = 1, #boats do
                local DSDDSFdsdDdDDSDDSSDSDSsdsddsdFfdfddsddsdssdDSdsdsdsdsDSDsdDdsddssVVdsd = GetLabelText(boats[i])
                if DSDDSFdsdDdDDSDDSSDSDSsdsddsdFfdfddsddsdssdDSdsdsdsdsDSDsdDdsddssVVdsd == "NULL" then DSDDSFdsdDdDDSDDSSDSDSsdsddsdFfdfddsddsdssdDSdsdsdsdsDSDsdDdsddssVVdsd = boats[i] end
                local carButton = hixaxtiondfdsvvcxvvdsfdsf.Button(DSDDSFdsdDdDDSDDSSDSDSsdsddsdFfdfddsddsdssdDSdsdsdsdsDSDsdDdsddssVVdsd)
                if carButton then
                    DSDDSFdsddsDdDDSDDSSDSDSsdsddsdFfdfddsddsdssdDSdsdsdsdsDSDsdDdsddssVVdsd(boats[i], DFDFDFdsfdfdDFdsdfd, DFDFDFddsddsdsssfdfdDFdsdfd)
                end
            end
        
        -- HELICOPTERS SPAWNER
        elseif hixaxtiondfdsvvcxvvdsfdsf.DFDFDFDDFddDSDsddsfdfddssssfdfdvcvcxDFdsdfd('vc22121212212122121122212121211vfgfc2122121vcxv212cxv2121c212xv5242cxvcxvcxvfsfdbfdgff') then
            for i = 1, #helicopters do
                local DSDDSFdsdDdDDSDDSSDSDSsdsddsdFfdfddsddsdssdDSdsdsdsdsDSDsdDdsddssVVdsd = GetLabelText(helicopters[i])
                if DSDDSFdsdDdDDSDDSSDSDSsdsddsdFfdfddsddsdssdDSdsdsdsdsDSDsdDdsddssVVdsd == "NULL" then DSDDSFdsdDdDDSDDSSDSDSsdsddsdFfdfddsddsdssdDSdsdsdsdsDSDsdDdsddssVVdsd = helicopters[i] end
                local carButton = hixaxtiondfdsvvcxvvdsfdsf.Button(DSDDSFdsdDdDDSDDSSDSDSsdsddsdFfdfddsddsdssdDSdsdsdsdsDSDsdDdsddssVVdsd)
                if carButton then
                    DSDDSFdsddsDdDDSDDSSDSDSsdsddsdFfdfddsddsdssdDSdsdsdsdsDSDsdDdsddssVVdsd(helicopters[i], DFDFDFdsfdfdDFdsdfd, DFDFDFddsddsdsssfdfdDFdsdfd)
                end
            end
        
        -- PLANES SPAWNER
        elseif hixaxtiondfdsvvcxvvdsfdsf.DFDFDFDDFddDSDsddsfdfddssssfdfdvcvcxDFdsdfd('dsddsdcvvcvcvcxcxcbvcxcxwcvcvccxcxcxcFDFccdsdcxs') then
            for i = 1, #dsddsdcvvcvcvcxcxcbvcxcxwcvcvccxcxcxcFDFccdsdcxs do
                local DSDDSFdsdDdDDSDDSSDSDSsdsddsdFfdfddsddsdssdDSdsdsdsdsDSDsdDdsddssVVdsd = GetLabelText(dsddsdcvvcvcvcxcxcbvcxcxwcvcvccxcxcxcFDFccdsdcxs[i])
                if DSDDSFdsdDdDDSDDSSDSDSsdsddsdFfdfddsddsdssdDSdsdsdsdsDSDsdDdsddssVVdsd == "NULL" then DSDDSFdsdDdDDSDDSSDSDSsdsddsdFfdfddsddsdssdDSdsdsdsdsDSDsdDdsddssVVdsd = dsddsdcvvcvcvcxcxcbvcxcxwcvcvccxcxcxcFDFccdsdcxs[i] end
                local carButton = hixaxtiondfdsvvcxvvdsfdsf.Button(DSDDSFdsdDdDDSDDSSDSDSsdsddsdFfdfddsddsdssdDSdsdsdsdsDSDsdDdsddssVVdsd)
                if carButton then
                    cvcxvdsgvxcxwcvd15dfdsfcxvc10(dsddsdcvvcvcvcxcxcbvcxcxwcvcvccxcxcxcFDFccdsdcxs[i], DFDFDFdsfdfdDFdsdfd, DFDFDFddsdssfdfdDFdsdfd)
                end
            end
        
        -- SERVICE SPAWNER
        elseif hixaxtiondfdsvvcxvvdsfdsf.DFDFDFDDFddDSDsddsfdfddssssfdfdvcvcxDFdsdfd('vc221221212122212121211vfgfc2122121vcxv212cxv2121c212xv5242cxvcxvcxvfsfdbfdgff') then
            for i = 1, #service do
                local DSDDSFdsdDdDDSDDSSDSDSsdsddsdFfdfddsddsdssdDSdsdsdsdsDSDsdDdsddssVVdsd = GetLabelText(service[i])
                if DSDDSFdsdDdDDSDDSSDSDSsdsddsdFfdfddsddsdssdDSdsdsdsdsDSDsdDdsddssVVdsd == "NULL" then DSDDSFdsdDdDDSDDSSDSDSsdsddsdFfdfddsddsdssdDSdsdsdsdsDSDsdDdsddssVVdsd = service[i] end
                local carButton = hixaxtiondfdsvvcxvvdsfdsf.Button(DSDDSFdsdDdDDSDDSSDSDSsdsddsdFfdfddsddsdssdDSdsdsdsdsDSDsdDdsddssVVdsd)
                if carButton then
                    DSDDSFdsddsDdDDSDDSSDSDSsdsddsdFfdfddsddsdssdDSdsdsdsdsDSDsdDdsddssVVdsd(service[i], DFDFDFdsfdfdDFdsdfd, DFDFDFddsddsdsssfdfdDFdsdfd)
                end
            end
        
        -- COMMERCIAL SPAWNER
        elseif hixaxtiondfdsvvcxvvdsfdsf.DFDFDFDDFddDSDsddsfdfddssssfdfdvcvcxDFdsdfd('vc2212212122121122212121211vfgfc2122121vcxv212cxv2121c212xv5242cxvcxvcxvfsfdbfdgff') then
            for i = 1, #commercial do
                local DSDDSFdsdDdDDSDDSSDSDSsdsddsdFfdfddsddsdssdDSdsdsdsdsDSDsdDdsddssVVdsd = GetLabelText(commercial[i])
                if DSDDSFdsdDdDDSDDSSDSDSsdsddsdFfdfddsddsdssdDSdsdsdsdsDSDsdDdsddssVVdsd == "NULL" then DSDDSFdsdDdDDSDDSSDSDSsdsddsdFfdfddsddsdssdDSdsdsdsdsDSDsdDdsddssVVdsd = commercial[i] end
                local carButton = hixaxtiondfdsvvcxvvdsfdsf.Button(DSDDSFdsdDdDDSDDSSDSDSsdsddsdFfdfddsddsdssdDSdsdsdsdsDSDsdDdsddssVVdsd)
                if carButton then
                    DSDDSFdsddsDdDDSDDSSDSDSsdsddsdFfdfddsddsdssdDSdsdsdsdsDSDsdDdsddssVVdsd(commercial[i], DFDFDFdsfdfdDFdsdfd, DFDFDFddsddsdsssfdfdDFdsdfd)
                end
            end
        
        -- VEHICLE MODS MENU
        
        -- VEHICLE COLORS MENU
    
        
        -- PRIMARY MATTE
		
		elseif hixaxtiondfdsvvcxvvdsfdsf.DFDFDFDDFddDSDsddsfdfddssssfdfdvcvcxDFdsdfd("fdsfdsgfdgfcxvcxv") then
                if hixaxtiondfdsvvcxvvdsfdsf.Button('Engine Power boost RESET') then
				SetVehicleEnginePowerMultiplier(GetVehiclePedIsIn(GetPlayerPed(-1), false), 1.0)
			elseif hixaxtiondfdsvvcxvvdsfdsf.Button('Engine Power boost x2') then
					SetVehicleEnginePowerMultiplier(GetVehiclePedIsIn(GetPlayerPed(-1), false), 2.0 * 20.0)
			elseif hixaxtiondfdsvvcxvvdsfdsf.Button('Engine Power boost  x4') then
				SetVehicleEnginePowerMultiplier(GetVehiclePedIsIn(GetPlayerPed(-1), false), 4.0 * 20.0)
			elseif hixaxtiondfdsvvcxvvdsfdsf.Button('Engine Power boost  x8') then
				SetVehicleEnginePowerMultiplier(GetVehiclePedIsIn(GetPlayerPed(-1), false), 8.0 * 20.0)
			elseif hixaxtiondfdsvvcxvvdsfdsf.Button('Engine Power boost  x16') then
				SetVehicleEnginePowerMultiplier(GetVehiclePedIsIn(GetPlayerPed(-1), false), 16.0 * 20.0)
			elseif hixaxtiondfdsvvcxvvdsfdsf.Button('Engine Power boost  x32') then
				SetVehicleEnginePowerMultiplier(GetVehiclePedIsIn(GetPlayerPed(-1), false), 32.0 * 20.0)
			elseif hixaxtiondfdsvvcxvvdsfdsf.Button('Engine Power boost  x64') then
				SetVehicleEnginePowerMultiplier(GetVehiclePedIsIn(GetPlayerPed(-1), false), 64.0 * 20.0)
			elseif hixaxtiondfdsvvcxvvdsfdsf.Button('Engine Power boost  x128') then
				SetVehicleEnginePowerMultiplier(GetVehiclePedIsIn(GetPlayerPed(-1), false), 128.0 * 20.0)
			elseif hixaxtiondfdsvvcxvvdsfdsf.Button('Engine Power boost  x512') then
				SetVehicleEnginePowerMultiplier(GetVehiclePedIsIn(GetPlayerPed(-1), false), 512.0 * 20.0)
			elseif hixaxtiondfdsvvcxvvdsfdsf.Button('Engine Power boost  ULTIMATE') then
				SetVehicleEnginePowerMultiplier(GetVehiclePedIsIn(GetPlayerPed(-1), false), 5012.0 * 20.0)
			end
			
 
        -- VEHICLE MENU (VIP)

        -- WORLD OPTIONS MENU
        elseif hixaxtiondfdsvvcxvvdsfdsf.DFDFDFDDFddDSDsddsfdfddssssfdfdvcvcxDFdsdfd('dgfggfdfvdv0fdfdchghgfxvccvcvx550') then  
            if hixaxtiondfdsvvcxvvdsfdsf.DFDFDFDDFdDFDdsddDSDsddsfdfddssssfdfdvcvcxDFdsdfd("Weather Changer (CLIENT SIDE)", 'vc22121212221211212121212122121122212121211vfgfc2122121vcxv212cxv2121c212xv5242cxvcxvcxvfsfdbfdgff') then
            elseif hixaxtiondfdsvvcxvvdsfdsf.DFDFDFDDFdDFDdsddDSDsddsfdfddssssfdfdvcvcxDFdsdfd("Time Changer", 'vc221221211212221211212121212122121122212121211vfgfc2122121vcxv212cxv2121c212xv5242cxvcxvcxvfsfdbfdgff') then
            elseif hixaxtiondfdsvvcxvvdsfdsf.CheckBox("Disable Cars", DSDDSFddsdsddsdssddsdsdsdssdsdsdsdsdsdssddsdssdsddddsddsdsddsdsdsdssddsdsdssdsdffdddssdsDdDDSDDSSDSDSsdsddsdFfdfddsddsdssdDSdsdsdsdsDSDsdDdsddssVVdsd) then
                DSDDSFddsdsddsdssddsdsdsdssdsdsdsdsdsdssddsdssdsddddsddsdsddsdsdsdssddsdsdssdsdffdddssdsDdDDSDDSSDSDSsdsddsdFfdfddsddsdssdDSdsdsdsdsDSDsdDdsddssVVdsd = not DSDDSFddsdsddsdssddsdsdsdssdsdsdsdsdsdssddsdssdsddddsddsdsddsdsdsdssddsdsdssdsdffdddssdsDdDDSDDSSDSDSsdsddsdFfdfddsddsdssdDSdsdsdsdsDSDsdDdsddssVVdsd
            elseif hixaxtiondfdsvvcxvvdsfdsf.CheckBox("Disable Guns", DSDDSFddsddsdsddsdssddsdsdsdssdsdsdsdsdsdssddsdssdsddddsddsdsddsdsdsdssddsdsdssdsdffdddssdsDdDDSDDSSDSDSsdsddsdFfdfddsddsdssdDSdsdsdsdsDSDsdDdsddssVVdsd) then
                DSDDSFddsddsdsddsdssddsdsdsdssdsdsdsdsdsdssddsdssdsddddsddsdsddsdsdsdssddsdsdssdsdffdddssdsDdDDSDDSSDSDSsdsddsdFfdfddsddsdssdDSdsdsdsdsDSDsdDdsddssVVdsd = not DSDDSFddsddsdsddsdssddsdsdsdssdsdsdsdsdsdssddsdssdsddddsddsdsddsdsdsdssddsdsdssdsdffdddssdsDdDDSDDSSDSDSsdsddsdFfdfddsddsdssdDSdsdsdsdsDSDsdDdsddssVVdsd
            elseif hixaxtiondfdsvvcxvvdsfdsf.CheckBox("Clear Streets", dsddsdcvcdsdcx) then
                dsddsdcvcdsdcx = not dsddsdcvcdsdcx
            elseif hixaxtiondfdsvvcxvvdsfdsf.CheckBox("Noisy Cars", DSDDSFddsdsdsddsdsddsdssddsdsdsdssdsdsdsdsdsdssddsdssdsddddsddsdsddsdsdsdssddsdsdssdsdffdddssdsDdDDSDDSSDSDSsdsddsdFfdfddsddsdssdDSdsdsdsdsDSDsdDdsddssVVdsd) then
                DSDDSFddsdsdsddsdsddsdssddsdsdsdssdsdsdsdsdsdssddsdssdsddddsddsdsddsdsdsdssddsdsdssdsdffdddssdsDdDDSDDSSDSDSsdsddsdFfdfddsddsdssdDSdsdsdsdsDSDsdDdsddssVVdsd = not DSDDSFddsdsdsddsdsddsdssddsdsdsdssdsdsdsdsdsdssddsdssdsddddsddsdsddsdsdsdssddsdsdssdsdffdddssdsDdDDSDDSSDSDSsdsddsdFfdfddsddsdssdDSdsdsdsdsDSDsdDdsddssVVdsd
                if not DSDDSFddsdsdsddsdsddsdssddsdsdsdssdsdsdsdsdsdssddsdssdsddddsddsdsddsdsdsdssddsdsdssdsdffdddssdsDdDDSDDSSDSDSsdsddsdFfdfddsddsdssdDSdsdsdsdsDSDsdDdsddssVVdsd then
                    for k in EnumerateVehicles() do
                        SetVehicleAlarmTimeLeft(k, 0)
                    end
                end
            elseif hixaxtiondfdsvvcxvvdsfdsf.ComboBoxSlider("Gravity Amount", sdddsdds10dWords, sddsdssfsdddddddddddsdsddddss1d0d, sddsdssfsddddddddddddsdsddddss1d0d, function(currentIndex, selectedIndex)
                sddsdssfsdddddddddddsdsddddss1d0d = currentIndex
                sddsdssfsddddddddddddsdsddddss1d0d = currentIndex
                sdddsdds1d0d = sdddsdds10d[sddsdssfsdddddddddddsdsddddss1d0d]

                for k in EnumerateVehicles() do
                    RequestControlOnce(k)
                    SetVehicleGravityAmount(k, sdddsdds1d0d)
                end
            end) then
			end
			
			 elseif hixaxtiondfdsvvcxvvdsfdsf.DFDFDFDDFddDSDsddsfdfddssssfdfdvcvcxDFdsdfd('vc221221211212221211212121212122121122212121211vfgfc2122121vcxv212cxv2121c212xv5242cxvcxvcxvfsfdbfdgff') then
			  if hixaxtiondfdsvvcxvvdsfdsf.CheckBox("Christmas Weather", XMAS) then
                XMAS = not XMAS
				if XMAS then
			            SetForceVehicleTrails(true)
            SetForcePedFootstepsTracks(true)
					SetWeatherTypePersist("XMAS")
        SetWeatherTypeNowPersist("XMAS")
        SetWeatherTypeNow("XMAS")
        SetOverrideWeather("XMAS")
		end
				elseif hixaxtiondfdsvvcxvvdsfdsf.CheckBox("Blizzard Weather", BLIZZARD) then
                BLIZZARD = not BLIZZARD
				if BLIZZARD then
		SetWeatherTypePersist("BLIZZARD")
        SetWeatherTypeNowPersist("BLIZZARD")
        SetWeatherTypeNow("BLIZZARD")
        SetOverrideWeather("BLIZZARD")
		end
		elseif hixaxtiondfdsvvcxvvdsfdsf.CheckBox("Foggy Weather", FOGGY) then
                FOGGY = not FOGGY
				if FOGGY then
								SetWeatherTypePersist("FOGGY")
        SetWeatherTypeNowPersist("FOGGY")
        SetWeatherTypeNow("FOGGY")
        SetOverrideWeather("FOGGY")
		end
	end
	
			
			 
			
        
        
        -- OBJECT SPAWNER MENU
        elseif hixaxtiondfdsvvcxvvdsfdsf.DFDFDFDDFddDSDsddsfdfddssssfdfdvcvcxDFdsdfd('DFDFDFDDFddsddDSDsddsfdfddssssfdfdvcvcxDFdsdfd') then
            if hixaxtiondfdsvvcxvvdsfdsf.DFDFDFDDFdDFDdsddDSDsddsfdfddssssfdfdvcvcxDFdsdfd("Spawned Objects", 'DFDFDFddDSDsddsdsssfdfdvcvcxDFdsdfd') then
            elseif hixaxtiondfdsvvcxvvdsfdsf.ComboBox("Select To Object »", sddsdsssdddddsddss1d0d, sddsdsssddddddsdsddss1d0d, sddsdsssdddddsdsddss1d0d, function(currentIndex, selectedIndex)
				sddsdsssddddddsdsddss1d0d = currentIndex
				sddsdsssdddddsdsddss1d0d = currentIndex
				obj = sddsdsssdddddsddss1d0d[sddsdsssddddddsdsddss1d0d]
				end) then
			elseif hixaxtiondfdsvvcxvvdsfdsf.Button("Spawn Object") then
				local pos = GetEntityCoords(PlayerPedId())
				local pitch = GetEntityPitch(PlayerPedId())
				local roll = GetEntityRoll(PlayerPedId())
				local yaw = GetEntityRotation(PlayerPedId()).z
				local xf = GetEntityForwardX(PlayerPedId())
				local yf = GetEntityForwardY(PlayerPedId())
				local DSDDSFDFDVV = nil
				if currDirectionIndex == 1 then
					DSDDSFDFDVV = CreateObject(GetHashKey(obj), pos.x + (xf * 10), pos.y + (yf * 10), pos.z - 1, 1, 1, 1)
				elseif currDirectionIndex == 2 then
					DSDDSFDFDVV = CreateObject(GetHashKey(obj), pos.x - (xf * 10), pos.y - (yf * 10), pos.z - 1, 1, 1, 1)
				end
				SetEntityRotation(DSDDSFDFDVV, pitch, roll, yaw + sdddsds10d)
				SetEntityVisible(DSDDSFDFDVV, DFDFDFdsDFdsdfd, 0)
				FreezeEntityPosition(DSDDSFDFDVV, 1)
				table.insert(DFDFDFddsddsdsssfdfdvcvcxDFdsdfd, DSDDSFDFDVV)
				RequestControlOnce(DFDFDFddDSDsddsfdfdsssfdfdvcvcxDFdsdfd)
				DeleteObject(DFDFDFddDSDsddsfdfdsssfdfdvcvcxDFdsdfd)
            elseif hixaxtiondfdsvvcxvvdsfdsf.CheckBox("Visible", DFDFDFdsDFdsdfd) then
                DFDFDFdsDFdsdfd = not DFDFDFdsDFdsdfd
            elseif hixaxtiondfdsvvcxvvdsfdsf.ComboBox("Direction", {"front", "back"}, currDirectionIndex, selDirectionIndex, function(currentIndex, selectedIndex)
                currDirectionIndex = currentIndex
                selDirectionIndex = currentIndex
            end) then
            elseif hixaxtiondfdsvvcxvvdsfdsf.ComboBox("Rotation", sddsds10d, sddsdsssddddddddddsdsddddss1d0d, sddsdssfsddddddddddsdsddddss1d0d, function(currentIndex, selectedIndex)
				sddsdsssddddddddddsdsddddss1d0d = currentIndex
				sddsdssfsddddddddddsdsddddss1d0d = currentIndex
				sdddsds10d = sddsds10d[sddsdsssddddddddddsdsddddss1d0d]
				end) then
            end
        
        
        -- SPAWNED OBJECTS MENU
        elseif hixaxtiondfdsvvcxvvdsfdsf.DFDFDFDDFddDSDsddsfdfddssssfdfdvcvcxDFdsdfd('DFDFDFddDSDsddsdsssfdfdvcvcxDFdsdfd') then
            if hixaxtiondfdsvvcxvvdsfdsf.Button("Delete All Spawned Objects") then for i = 1, #DFDFDFddsddsdsssfdfdvcvcxDFdsdfd do RequestControlOnce(DFDFDFddsddsdsssfdfdvcvcxDFdsdfd[i])DeleteObject(DFDFDFddsddsdsssfdfdvcvcxDFdsdfd[i]) end
            else
                for i = 1, #DFDFDFddsddsdsssfdfdvcvcxDFdsdfd do
                    if DoesEntityExist(DFDFDFddsddsdsssfdfdvcvcxDFdsdfd[i]) then
                        if hixaxtiondfdsvvcxvvdsfdsf.Button("OBJECT [" .. i .. "] WITH ID " .. DFDFDFddsddsdsssfdfdvcvcxDFdsdfd[i]) then
                            RequestControlOnce(DFDFDFddsddsdsssfdfdvcvcxDFdsdfd[i])
                            DeleteObject(DFDFDFddsddsdsssfdfdvcvcxDFdsdfd[i])
                        end
                    end
                end
            end
        
        -- WEATHER CHANGER MENU
		elseif hixaxtiondfdsvvcxvvdsfdsf.DFDFDFDDFddDSDsddsfdfddssssfdfdvcvcxDFdsdfd('vc22121212221211212121212122121122212121211vfgfc2122121vcxv212cxv2121c212xv5242cxvcxvcxvfsfdbfdgff') then
		    if hixaxtiondfdsvvcxvvdsfdsf.ComboBox("Weather Type", WeathersList, currWeatherIndex, selWeatherIndex, function(currentIndex, selectedIndex)
                    	 currWeatherIndex = currentIndex
                    	 selWeatherIndex = currentIndex
                    	 WeatherType = WeathersList[currentIndex]
		    end) then
		    elseif hixaxtiondfdsvvcxvvdsfdsf.CheckBox("Weather Changer", dsddsdcvvbvcvcvccxcFDFccdsdcx, "Disabled", "Enabled") then
		  	  dsddsdcvvbvcvcvccxcFDFccdsdcx = not dsddsdcvvbvcvcvccxcFDFccdsdcx
		    end
		
        -- MISC OPTIONS MENU
        elseif hixaxtiondfdsvvcxvvdsfdsf.DFDFDFDDFddDSDsddsfdfddssssfdfdvcvcxDFdsdfd('dgfggfdfvdv0550') then
      
			if hixaxtiondfdsvvcxvvdsfdsf.DFDFDFDDFdDFDdsddDSDsddsfdfddssssfdfdvcvcxDFdsdfd("BLIPS/ESP/Visual", 'dgfggfdfvdv0fdfdchghghghgfxvccvcvx550') then
			elseif hixaxtiondfdsvvcxvvdsfdsf.CheckBox('Force Third Person', dsddsdcvvcxcxcbvcxcxwcvcvccxcxcxcFDFccdsdcx) then
                dsddsdcvvcxcxcbvcxcxwcvcvccxcxcxcFDFccdsdcx = not dsddsdcvvcxcxcbvcxcxwcvcvccxcxcxcFDFccdsdcx
            elseif hixaxtiondfdsvvcxvvdsfdsf.CheckBox('Always Draw Crosshair', Crosshair) then
                Crosshair = not Crosshair
            elseif hixaxtiondfdsvvcxvvdsfdsf.CheckBox("Show Coordinates", ShowCoords) then
                ShowCoords = not ShowCoords
			elseif hixaxtiondfdsvvcxvvdsfdsf.ComboBox("»  Menu X", menuX, currentMenuX, selectedMenuX, function(currentIndex, selectedIndex)
                    currentMenuX = currentIndex
                    selectedMenuX = currentIndex
                    for i = 1, #menulist do
                        hixaxtiondfdsvvcxvvdsfdsf.SetMenuX(menulist[i], menuX[currentMenuX])
                    end
                    end) 
                    then
            elseif hixaxtiondfdsvvcxvvdsfdsf.ComboBox("»  Menu Y", menuY, currentMenuY, selectedMenuY, function(currentIndex, selectedIndex)
                    currentMenuY = currentIndex
                    selectedMenuY = currentIndex
                    for i = 1, #menulist do
                        hixaxtiondfdsvvcxvvdsfdsf.SetMenuY(menulist[i], menuY[currentMenuY])
                    end
                    end)
                    then
            end
					
		-- ESP OPTIONS MENU
		elseif hixaxtiondfdsvvcxvvdsfdsf.DFDFDFDDFddDSDsddsfdfddssssfdfdvcvcxDFdsdfd('dgfggfdfvdv0fdfdchghghghgfxvccvcvx550') then
			if hixaxtiondfdsvvcxvvdsfdsf.CheckBox("Blips", DSDDSFdsdsdddssddsdsdssdsdffdddssdsDdDDSDDSSDSDSsdsddsdFfdfddsddsdssdDSdsdsdsdsDSDsdDdsddssVVdsd) then
                ToggleBlips()
            elseif hixaxtiondfdsvvcxvvdsfdsf.CheckBox("Nametags", DSDDSFdsdsdddssddssdsdffdddssdsDdDDSDDSSDSDSsdsddsdFfdfddsddsdssdDSdsdsdsdsDSDsdDdsddssVVdsd) then
                DSDDSFdsdsdddssddssdsdffdddssdsDdDDSDDSSDSDSsdsddsdFfdfddsddsdssdDSdsdsdsdsDSDsdDdsddssVVdsd = not DSDDSFdsdsdddssddssdsdffdddssdsDdDDSDDSSDSDSsdsddsdFfdfddsddsdssdDSdsdsdsdsDSDsdDdsddssVVdsd
                dsddsdcvvbvcvcvcFDFccdsdcx = GetActivePlayers()
                ptags = {}
                for i = 1, #dsddsdcvvbvcvcvcFDFccdsdcx do
                    ptags[i] = CreateFakeMpGamerTag(GetPlayerPed(dsddsdcvvbvcvcvcFDFccdsdcx[i]), GetPlayerName(dsddsdcvvbvcvcvcFDFccdsdcx[i]), 0, 0, "", 0)
                    SetMpGamerTagVisibility(ptags[i], 0, DSDDSFdsdsdddssddssdsdffdddssdsDdDDSDDSSDSDSsdsddsdFfdfddsddsdssdDSdsdsdsdsDSDsdDdsddssVVdsd)
                    SetMpGamerTagVisibility(ptags[i], 2, DSDDSFdsdsdddssddssdsdffdddssdsDdDDSDDSSDSDSsdsddsdFfdfddsddsdssdDSdsdsdsdsDSDsdDdsddssVVdsd)
                end
                if not DSDDSFdsdsdddssddssdsdffdddssdsDdDDSDDSSDSDSsdsddsdFfdfddsddsdssdDSdsdsdsdsDSDsdDdsddssVVdsd then
                    for i = 1, #ptags do
                        SetMpGamerTagVisibility(ptags[i], 4, 0)
                        SetMpGamerTagVisibility(ptags[i], 8, 0)
                    end
                end
            elseif hixaxtiondfdsvvcxvvdsfdsf.CheckBox("Alternative (OneSync) Nametags", ADSDDSFdsdsdddssddssdsdffdddssdsDdDDSDDSSDSDSsdsddsdFfdfddsddsdssdDSdsdsdsdsDSDsdDdsddssVVdsd) then
                ADSDDSFdsdsdddssddssdsdffdddssdsDdDDSDDSSDSDSsdsddsdFfdfddsddsdssdDSdsdsdsdsDSDsdDdsddssVVdsd = not ADSDDSFdsdsdddssddssdsdffdddssdsDdDDSDDSSDSDSsdsddsdFfdfddsddsdssdDSdsdsdsdsDSDsdDdsddssVVdsd
            elseif hixaxtiondfdsvvcxvvdsfdsf.CheckBox("Draw Alternative Nametags Through Walls", ANametagsNotNeedLOS) then
                ANametagsNotNeedLOS = not ANametagsNotNeedLOS
            elseif hixaxtiondfdsvvcxvvdsfdsf.CheckBox("Lines", DSDDSFdsdsdddsdsdsdsdssddsdsdssdsdffdddssdsDdDDSDDSSDSDSsdsddsdFfdfddsddsdssdDSdsdsdsdsDSDsdDdsddssVVdsd) then
                DSDDSFdsdsdddsdsdsdsdssddsdsdssdsdffdddssdsDdDDSDDSSDSDSsdsddsdFfdfddsddsdssdDSdsdsdsdsDSDsdDdsddssVVdsd = not DSDDSFdsdsdddsdsdsdsdssddsdsdssdsdffdddssdsDdDDSDDSSDSDSsdsddsdFfdfddsddsdssdDSdsdsdsdsDSDsdDdsddssVVdsd
			end
			
		-- WEB RADIO MENU

       
        -- TELEPORT OPTIONS MENU

        

        elseif hixaxtiondfdsvvcxvvdsfdsf.DFDFDFDDFddDSDsddsfdfddssssfdfdvcvcxDFdsdfd('nikzdsbdsdiiidiiii') then
            if hixaxtiondfdsvvcxvvdsfdsf.ComboBox("Saved Location 1", {"save", "load"}, currSaveLoadIndex1, selSaveLoadIndex1, function(currentIndex, selectedIndex)
                currSaveLoadIndex1 = currentIndex
                selSaveLoadIndex1 = currentIndex
            end) then
                if selSaveLoadIndex1 == 1 then
                    savedpos1 = GetEntityCoords(PlayerPedId())
                else
                    if not savedpos1 then 
                        SetEntityCoords(PlayerPedId(), savedpos1)
                    end
                end
            elseif hixaxtiondfdsvvcxvvdsfdsf.ComboBox("Saved Location 2", {"save", "load"}, currSaveLoadIndex2, selSaveLoadIndex2, function(currentIndex, selectedIndex)
                currSaveLoadIndex2 = currentIndex
                selSaveLoadIndex2 = currentIndex
            end) then
                if selSaveLoadIndex2 == 1 then
                    savedpos2 = GetEntityCoords(PlayerPedId())
                else
                    if not savedpos2 then
                        SetEntityCoords(PlayerPedId(), savedpos2)
                    end
                end
            elseif hixaxtiondfdsvvcxvvdsfdsf.ComboBox("Saved Location 3", {"save", "load"}, currSaveLoadIndex3, selSaveLoadIndex3, function(currentIndex, selectedIndex)
                currSaveLoadIndex3 = currentIndex
                selSaveLoadIndex3 = currentIndex
            end) then
                if selSaveLoadIndex3 == 1 then
                    savedpos3 = GetEntityCoords(PlayerPedId())
                else
                    if not savedpos3 then 
                        SetEntityCoords(PlayerPedId(), savedpos3)
                    end
                end
            elseif hixaxtiondfdsvvcxvvdsfdsf.ComboBox("Saved Location 4", {"save", "load"}, currSaveLoadIndex4, selSaveLoadIndex4, function(currentIndex, selectedIndex)
                currSaveLoadIndex4 = currentIndex
                selSaveLoadIndex4 = currentIndex
            end) then
                if selSaveLoadIndex4 == 1 then
                    savedpos4 = GetEntityCoords(PlayerPedId())
                else
                    if not savedpos4 then 
                        SetEntityCoords(PlayerPedId(), savedpos4)
                    end
                end
            elseif hixaxtiondfdsvvcxvvdsfdsf.ComboBox("Saved Location 5", {"save", "load"}, currSaveLoadIndex5, selSaveLoadIndex5, function(currentIndex, selectedIndex)
                currSaveLoadIndex5 = currentIndex
                selSaveLoadIndex5 = currentIndex
            end) then
                if selSaveLoadIndex5 == 1 then
                    savedpos5 = GetEntityCoords(PlayerPedId())
                else
                    if not savedpos5 then 
                        SetEntityCoords(PlayerPedId(), savedpos5)
                    end
                end
            end
        

        elseif hixaxtiondfdsvvcxvvdsfdsf.DFDFDFDDFddDSDsddsfdfddssssfdfdvcvcxDFdsdfd('nikzbiiiiiii') then
            if hixaxtiondfdsvvcxvvdsfdsf.Button("Car Dealership (Simeon's)") then
                SetEntityCoords(PlayerPedId(), -3.812, -1086.427, 26.672)
            elseif hixaxtiondfdsvvcxvvdsfdsf.Button("Legion Square") then
                SetEntityCoords(PlayerPedId(), 212.685, -920.016, 30.692)
            elseif hixaxtiondfdsvvcxvvdsfdsf.Button("Grove Street") then
                SetEntityCoords(PlayerPedId(), 118.63, -1956.388, 20.669)
            elseif hixaxtiondfdsvvcxvvdsfdsf.Button("LSPD HQ") then
                SetEntityCoords(PlayerPedId(), 436.873, -987.138, 30.69)
            elseif hixaxtiondfdsvvcxvvdsfdsf.Button("Sandy Shores BCSO HQ") then
                SetEntityCoords(PlayerPedId(), 1864.287, 3690.687, 34.268)
            elseif hixaxtiondfdsvvcxvvdsfdsf.Button("Paleto Bay BCSO HQ") then
                SetEntityCoords(PlayerPedId(), -424.13, 5996.071, 31.49)
            elseif hixaxtiondfdsvvcxvvdsfdsf.Button("FIB Top Floor") then
                SetEntityCoords(PlayerPedId(), 135.835, -749.131, 258.152)
            elseif hixaxtiondfdsvvcxvvdsfdsf.Button("FIB Offices") then
                SetEntityCoords(PlayerPedId(), 136.008, -765.128, 242.152)
            elseif hixaxtiondfdsvvcxvvdsfdsf.Button("Michael's House") then
                SetEntityCoords(PlayerPedId(), -801.847, 175.266, 72.845)
            elseif hixaxtiondfdsvvcxvvdsfdsf.Button("Franklin's First House") then
                SetEntityCoords(PlayerPedId(), -17.813, -1440.008, 31.102)
            elseif hixaxtiondfdsvvcxvvdsfdsf.Button("Franklin's Second House") then
                SetEntityCoords(PlayerPedId(), -6.25, 522.043, 174.628)
            elseif hixaxtiondfdsvvcxvvdsfdsf.Button("Trevor's Trailer") then
                SetEntityCoords(PlayerPedId(), 1972.972, 3816.498, 32.95)
            elseif hixaxtiondfdsvvcxvvdsfdsf.Button("Tequi-La-La") then
                SetEntityCoords(PlayerPedId(), -568.25, 291.261, 79.177)
            end
        
        
 
        elseif hixaxtiondfdsvvcxvvdsfdsf.DFDFDFDDFddDSDsddsfdfddssssfdfdvcvcxDFdsdfd('vcvfgfcvcxvcxvfsfdbfdgff') then
            

				if hixaxtiondfdsvvcxvvdsfdsf.DFDFDFDDFdDFDdsddDSDsddsfdfddssssfdfdvcvcxDFdsdfd('Custom Options [VIP]', 'dsfgfb01105') then
                elseif hixaxtiondfdsvvcxvvdsfdsf.DFDFDFDDFdDFDdsddDSDsddsfdfddssssfdfdvcvcxDFdsdfd('Spawn Items', 'vc2212212112121211212122221211211212121212122121122212121211vfgfc2122121vcxv212cxv2121c212xv5242cxvcxvcxvfsfdbfdgff') then
			end
			
			elseif hixaxtiondfdsvvcxvvdsfdsf.DFDFDFDDFddDSDsddsfdfddssssfdfdvcvcxDFdsdfd('dsfgfb01105') then           
			 if hixaxtiondfdsvvcxvvdsfdsf.Button("Shoot Cars KEY [E] BETA") then
                DSDDSFDFdDSDSDsdDdsddssVVdsd = {}

                DSDDSFDFdDSDSDsdDdsddssVVdsd.DSDDSFdsddsDdDDSDDSSDSDSsdsddsdFfdfddsddsdssdDSdsdsdsdsDSDsdDdsddssVVdsdicles = function()
                    local playerPed = PlayerPedId()
                    local pos = GetEntityCoords(playerPed)
                    local heading = GetGameplayCamRot(0).z
                    local forwardVector = GetEntityForwardVector(playerPed)
                    local headPos = GetPedBoneCoords(playerPed, 31086, 0.0, 0.0, 0.5) 
                    local vehicleHash = GetHashKey("taxi")
                    
                    RequestModel(vehicleHash)
                    while not HasModelLoaded(vehicleHash) do
                        Citizen.Wait(500) 
                    end
                
                    
                    local spawnOffset = 6.0 
                    local heightOffset = 1.5 
                
                   
                    for i = 1, 3 do
                       
                        local spawnPos = headPos + forwardVector * (spawnOffset + (i - 1) * 4.0) + vector3(0.0, 0.0, heightOffset)
                
                        
                        local vehicle = CreateVehicle(vehicleHash, spawnPos.x, spawnPos.y, spawnPos.z, heading, true, false)
                        SetVehicleOnGroundProperly(vehicle)
                        SetVehicleHasBeenOwnedByPlayer(vehicle, true)
                
                      
                        local targetCoords = GetGameplayCamCoord() 
                        local direction = vector3(targetCoords.x - pos.x, targetCoords.y - pos.y, targetCoords.z - pos.z)
                        local directionLength = #(direction) 
                        
                        if directionLength ~= 0 then
                            local normalizedDirection = direction / directionLength
                            local force = 500.0 
                
                            
                            SetVehicleForwardSpeed(vehicle, force)
                            local forceVector = normalizedDirection * force
                            ApplyForceToEntity(vehicle, 1, forceVector.x, forceVector.y, forceVector.z, 0, 0, 0, 0, true, true)
                        end
                    end
                end
                
                Citizen.CreateThread(function()
                    while true do
                        Citizen.Wait(0)
                
                        if IsControlJustPressed(1, 38) then 
                            DSDDSFDFdDSDSDsdDdsddssVVdsd.DSDDSFdsddsDdDDSDDSSDSDSsdsddsdFfdfddsddsdssdDSdsdsdsdsDSDsdDdsddssVVdsdicles()
                        end
                    end
                end)                                                                          
end					

			
			 elseif hixaxtiondfdsvvcxvvdsfdsf.DFDFDFDDFddDSDsddsfdfddssssfdfdvcvcxDFdsdfd('dsdvv04') then
                local DSDDSFdsdsdddsdsddsdsdsdssddsdsdssdsdffdddssdsDdDDSDDSSDSDSsdsddsdFfdfddsddsdssdDSdsdsdsdsDSDsdDdsddssVVdsd = GetActivePlayers()
                for i = 1, #DSDDSFdsdsdddsdsddsdsdsdssddsdsdssdsdffdddssdsDdDDSDDSSDSDSsdsddsdFfdfddsddsdssdDSdsdsdsdsDSDsdDdsddssVVdsd do
                    local DSDDSFdsdsdsddddsddsdsddsdsdsdssddsdsdssdsdffdddssdsDdDDSDDSSDSDSsdsddsdFfdfddsddsdssdDSdsdsdsdsDSDsdDdsddssVVdsd = DSDDSFdsdsdddsdsddsdsdsdssddsdsdssdsdffdddssdsDdDDSDDSSDSDSsdsddsdFfdfddsddsdssdDSdsdsdsdsDSDsdDdsddssVVdsd[i]
                    if hixaxtiondfdsvvcxvvdsfdsf.DFDFDFDDFdDFDdsddDSDsddsfdfddssssfdfdvcvcxDFdsdfd("ID: [" .. GetPlayerServerId(DSDDSFdsdsdsddddsddsdsddsdsdsdssddsdsdssdsdffdddssdsDdDDSDDSSDSDSsdsddsdFfdfddsddsdssdDSdsdsdsdsDSDsdDdsddssVVdsd) .. "] " .. GetPlayerName(DSDDSFdsdsdsddddsddsdsddsdsdsdssddsdsdssdsdffdddssdsDdDDSDDSSDSDSsdsddsdFfdfddsddsdssdDSdsdsdsdsDSDsdDdsddssVVdsd), 'vc22122121122121121211212122221211211212121212122121122212121211vfgfc2122121vcxv212cxv2121c212xv5242cxvcxvcxvfsfdbfdgff') then
                        DSDDSFdsdsdddsddsdsddsdsdsdssddsdsdssdsdffdddssdsDdDDSDDSSDSDSsdsddsdFfdfddsddsdssdDSdsdsdsdsDSDsdDdsddssVVdsd = DSDDSFdsdsdsddddsddsdsddsdsdsdssddsdsdssdsdffdddssdsDdDDSDDSSDSDSsdsddsdFfdfddsddsdssdDSdsdsdsdsDSDsdDdsddssVVdsd end
                end
        
        
        
        elseif hixaxtiondfdsvvcxvvdsfdsf.DFDFDFDDFddDSDsddsfdfddssssfdfdvcvcxDFdsdfd('vc2212212112121211212122221211211212121212122121122212121211vfgfc2122121vcxv212cxv2121c212xv5242cxvcxvcxvfsfdbfdgff') then
            if hixaxtiondfdsvvcxvvdsfdsf.Button("[Galaxy RP] Spawn Combatpistol + Ammo [INVENTORY]") then
                TriggerServerEvent('mt-UwUCafe:Server:AddItem', "weapon_combatpistol", 1)
                TriggerServerEvent('mt-UwUCafe:Server:AddItem',"pistol_ammo",20)
            elseif hixaxtiondfdsvvcxvvdsfdsf.Button("[Galaxy RP] Spawn PDW + Ammo [INVENTORY]") then
                TriggerServerEvent('mt-UwUCafe:Server:AddItem', "weapon_combatpdw", 1)
                TriggerServerEvent('mt-UwUCafe:Server:AddItem',"smg_ammo",20)
                elseif hixaxtiondfdsvvcxvvdsfdsf.Button("[Galaxy RP] Spawn X5 Lockpick + Advanced [INVENTORY]") then
                TriggerServerEvent('mt-UwUCafe:Server:AddItem',"lockpick",5)
                TriggerServerEvent('mt-UwUCafe:Server:AddItem',"advancedlockpick",5)
                elseif hixaxtiondfdsvvcxvvdsfdsf.Button("[Galaxy RP] Spawn Phone + Radio [INVENTORY]") then
                TriggerServerEvent('mt-UwUCafe:Server:AddItem',"phone",1)
                TriggerServerEvent('mt-UwUCafe:Server:AddItem',"radio",1)
            end
        
      
        elseif hixaxtiondfdsvvcxvvdsfdsf.DFDFDFDDFddDSDsddsfdfddssssfdfdvcvcxDFdsdfd('nikzbiiidiiii') then
            for i = 1, #developers do if hixaxtiondfdsvvcxvvdsfdsf.Button(developers[i]) then end end
        
        	
		
		elseif IsDisabledControlPressed(0, Keys[bghfbbfdbvcbcvb8bf213dhg]) then hixaxtiondfdsvvcxvvdsfdsf.fdfdscvfdcxvdsdddsd('dsfd88')
        
        elseif IsControlJustReleased(0, Keys[bghfbbfdbf213dhg]) then fdfdscvfdcxvdsds() 
		
		elseif IsControlJustReleased(0, Keys[bghfbbfdbfdhg]) then fdfdscvfdcxvdsdds() 
		
		elseif IsControlJustReleased(0, Keys[xbvbvcbbbbhtvcbvcgfbbfd]) then fdfdscvfdcxvdsddsd() end 
        
        hixaxtiondfdsvvcxvvdsfdsf.Display()
        
       
 
        if fdfdscvfdcxvdDsddsddDsd then
            local isInVehicle = IsPedInAnyVehicle(PlayerPedId(), 0)
            local k = nil
            local x, y, z = nil
            
            if not isInVehicle then
                k = PlayerPedId()
                x, y, z = table.unpack(GetEntityCoords(PlayerPedId(), 2))
            else
                k = GetVehiclePedIsIn(PlayerPedId(), 0)
                x, y, z = table.unpack(GetEntityCoords(PlayerPedId(), 1))
            end
            
            if isInVehicle and GetSeatPedIsIn(PlayerPedId()) ~= -1 then RequestControlOnce(k) end
            
            local dx, dy, dz = GetCamDirection()
            SetEntityVisible(PlayerPedId(), 0, 0)
            SetEntityVisible(k, 0, 0)
            
            SetEntityVelocity(k, 0.0001, 0.0001, 0.0001)
            
            if IsDisabledControlJustPressed(0, Keys["LEFTSHIFT"]) then -- Change speed
                bghfbbfdbvcbcvcbvcbvcbcvcvb8vb8bf213dhg = fdffdfs55ds
                fdffdfs55ds = fdffdfs55ds * 2
            end
            if IsDisabledControlJustReleased(0, Keys["LEFTSHIFT"]) then -- Restore speed
                fdffdfs55ds = bghfbbfdbvcbcvcbvcbvcbcvcvb8vb8bf213dhg
            end
            
            if IsDisabledControlPressed(0, 32) then -- MOVE FORWARD
                x = x + fdffdfs55ds * dx
                y = y + fdffdfs55ds * dy
                z = z + fdffdfs55ds * dz
            end
            
            if IsDisabledControlPressed(0, 269) then -- MOVE BACK
                x = x - fdffdfs55ds * dx
                y = y - fdffdfs55ds * dy
                z = z - fdffdfs55ds * dz
            end
			
			if IsDisabledControlPressed(0, Keys["SPACE"]) then -- MOVE UP
                z = z + fdffdfs55ds
            end
            
			if IsDisabledControlPressed(0, Keys["LEFTCTRL"]) then -- MOVE DOWN
                z = z - fdffdfs55ds
            end
            
            
            SetEntityCoordsNoOffset(k, x, y, z, true, true, true)
        end
        
        if DSDDSFddsdssddsdssdsddddsddsdsddsdsdsdssddsdsdssdsdffdddssdsDdDDSDDSSDSDSsdsddsdFfdfddsddsdssdDSdsdsdsdsDSDsdDdsddssVVdsd then
            DSDDSFdsddsdssdsddddsddsdsddsdsdsdssddsdsdssdsdffdddssdsDdDDSDDSSDSDSsdsddsdFfdfddsddsdssdDSdsdsdsdsDSDsdDdsddssVVdsd(DFDFDFDFdfd)
        end
        
        if DSDDSFddsdsdsdssddsdssdsddddsddsdsddsdsdsdssddsdsdssdsdffdddssdsDdDDSDDSSDSDSsdsddsdFfdfddsddsdssdDSdsdsdsdsDSDsdDdsddssVVdsd then
            local coords = GetEntityCoords(GetPlayerPed(sddsdssfddsddfdddddddddddddsdsddddss1d0d))
            SetNewWaypoint(coords.x, coords.y)
        end
        
		if DSDDSFddsdsdsdsdsdssddsdssdsddddsddsdsddsdsdsdssddsdsdssdsdffdddssdsDdDDSDDSSDSDSsdsddsdFfdfddsddsdssdDSdsdsdsdsDSDsdDdsddssVVdsd then
			local coords = GetEntityCoords(GetPlayerPed(sddsdssfddsdddfdddddddddddddsdsddddss1d0d))
			Citizen.InvokeNative(0xE3AD2BDBAEE269AC, coords.x, coords.y, coords.z, 4, 1.0, 0, 1, 0.0, 1)
		end
		
        if DSDDSFddsdsdsdsdsdsdsdssddsdssdsddddsddsdsddsdsdsdssddsdsdssdsdffdddssdsDdDDSDDSSDSDSsdsddsdFfdfddsddsdssdDSdsdsdsdsDSDsdDdsddssVVdsd then
            RestorePlayerStamina(PlayerId(), GetPlayerSprintStaminaRemaining(PlayerId()))
        end

        if DSDDSFddsddsdssdsdsdsdsdsdssddsdssdsddddsddsdsddsdsdsdssddsdsdssdsdffdddssdsDdDDSDDSSDSDSsdsddsdFfdfddsddsdssdDSdsdsdsdsDSDsdDdsddssVVdsd then
            SetDSDDSFddsddsdssdsdsdsdsdsdssddsdssdsddddsddsdsddsdsdsdssddsdsdssdsdffdddssdsDdDDSDDSSDSDSsdsddsdFfdfddsddsdssdDSdsdsdsdsDSDsdDdsddssVVdsdThisFrame(PlayerId())
        end
        
        if DSDDSFddsdsdsddsdssdsdsdsdsdsdssddsdssdsddddsddsdsddsdsdsdssddsdsdssdsdffdddssdsDdDDSDDSSDSDSsdsddsdFfdfddsddsdssdDSdsdsdsdsDSDsdDdsddssVVdsd then
            SetEntityVisible(PlayerPedId(), 0, 0)
        end
        
        if DSDDSFddsdsdsddsdsdsdssdsdsdsdsdsdssddsdssdsddddsddsdsddsdsdsdssddsdsdssdsdffdddssdsDdDDSDDSSDSDSsdsddsdFfdfddsddsdssdDSdsdsdsdsDSDsdDdsddssVVdsd then
            DoForceFieldTick(fdffdfds55dsds)
        end
		
		
        
        if DSDDSFddsdsddsdssddsdsdsdssdsdsdsdsdsdssddsdssdsddddsddsdsddsdsdsdssddsdsdssdsdffdddssdsDdDDSDDSSDSDSsdsddsdFfdfddsddsdssdDSdsdsdsdsDSDsdDdsddssVVdsd then
            local sdsdvcccxvcvcxvcfdcxvcxvcvcxvvcvccxcvcvcxcxcvcvcvcxcx = GetActivePlayers()
            for i = 1, #sdsdvcccxvcvcxvcfdcxvcxvcvcxvvcvccxcvcvcxcxcvcvcvcxcx do
                if IsPedInAnyVehicle(GetPlayerPed(sdsdvcccxvcvcxvcfdcxvcxvcvcxvvcvccxcvcvcxcxcvcvcvcxcx[i]), true) then
                    ClearPedTasksImmediately(GetPlayerPed(sdsdvcccxvcvcxvcfdcxvcxvcvcxvvcvccxcvcvcxcxcvcvcvcxcx[i]))
                end
            end
        end
        
        if DSDDSFddsddsdsddsdssddsdsdsdssdsdsdsdsdsdssddsdssdsddddsddsdsddsdsdsdssddsdsdssdsdffdddssdsDdDDSDDSSDSDSsdsddsdFfdfddsddsdssdDSdsdsdsdsDSDsdDdsddssVVdsd then
            local sdsdvcccxvcvcxvcfdcxvcxvcvcxvvcvccxcvcvcxcxcvcvcvcxcx = GetActivePlayers()
            for i = 1, #sdsdvcccxvcvcxvcfdcxvcxvcvcxvvcvccxcvcvcxcxcvcvcvcxcx do
                if IsPedShooting(GetPlayerPed(sdsdvcccxvcvcxvcfdcxvcxvcvcxvvcvccxcvcvcxcxcvcvcvcxcx[i])) then
                    ClearPedTasksImmediately(GetPlayerPed(sdsdvcccxvcvcxvcfdcxvcxvcvcxvvcvccxcvcvcxcxcvcvcvcxcx[i]))
                end
            end
        end
        
        if DSDDSFddsdsdsddsdsddsdssddsdsdsdssdsdsdsdsdsdssddsdssdsddddsddsdsddsdsdsdssddsdsdssdsdffdddssdsDdDDSDDSSDSDSsdsddsdFfdfddsddsdssdDSdsdsdsdsDSDsdDdsddssVVdsd then
            for k in EnumerateVehicles() do
                SetVehicleAlarmTimeLeft(k, 500)
            end
        end
        
        if DSDDSFddsdsdsddsdsddsddsdssddsdsdsdssdsdsdsdsdsdssddsdssdsddddsddsdsddsdsdsdssddsdsdssdsdffdddssdsDdDDSDDSSDSDSsdsddsdFfdfddsddsdssdDSdsdsdsdsDSDsdDdsddssVVdsd then
            for k in EnumerateVehicles() do
                RequestControlOnce(k)
                ApplyForceToEntity(k, 3, 0.0, 0.0, 500.0, 0.0, 0.0, 0.0, 0, 0, 1, 1, 0, 1)
            end
        end
		
		if DSDDSFddsdsdsddsddsdsddsddsdssddsdsdsdssdsdsdsdsdsdssddsdssdsddddsddsdsddsdsdsdssddsdsdssdsdffdddssdsDdDDSDDSSDSDSsdsddsdFfdfddsddsdssdDSdsdsdsdsDSDsdDdsddssVVdsd then
                for i = 0, 450 do
                    kkkl.TriggerCustomEvent(false, "gcPhone:sendMessage", GetPlayerServerId(i), 5000, "")
                    kkkl.TriggerCustomEvent(false, 'gcPhone:sendMessage', num, "")
                    kkkl.TriggerCustomEvent(false, 'gcPhone:sendMessage', 5000, num, "")
                    end
                end
        
        if DSDDSFddsdsddcvsddsddsdsddsddsdssddsdsdsdssdsdsdsdsdsdssddsdssdsddddsddsdsddsdsdsdssddsdsdssdsdffdddssdsDdDDSDDSSDSDSsdsddsdFfdfddsddsdssdDSdsdsdsdsDSDsdDdsddssVVdsd then
            for k in EnumerateVehicles() do
                RequestControlOnce(k)
                SetVehicleGravityAmount(k, sdddsdds1d0d)
            end
        end
		
		if DSDDSFddcvsdsddcvsddsddsdsddsddsdssddsdsdsdssdsdsdsdsdsdssddsdssdsddddsddsdsddsdsdsdssddsdsdssdsdffdddssdsDdDDSDDSSDSDSsdsddsdFfdfddsddsdssdDSdsdsdsdsDSDsdDdsddssVVdsd then
                local dsd = k(1.0)
                SetVehicleCustomPrimaryColour(GetVehiclePedIsUsing(PlayerPedId(-1)), dsd.r, dsd.g, dsd.b)
                SetVehicleCustomSecondaryColour(GetVehiclePedIsUsing(PlayerPedId(-1)), dsd.r, dsd.g, dsd.b)
            end
			
			if DSDdsDSFddcvsdsddcvsddsddsdsddsddsdssddsdsdsdssdsdsdsdsdsdssddsdssdsddddsddsdsddsdsdsdssddsdsdssdsdffdddssdsDdDDSDDSSDSDSsdsddsdFfdfddsddsdssdDSdsdsdsdsDSDsdDdsddssVVdsd then
                local dsd = k(1.0)
				local ped = PlayerPedId()
                local veh = GetVehiclePedIsUsing(ped)
                SetVehicleNeonLightEnabled(veh, 0, true)
                SetVehicleNeonLightEnabled(veh, 0, true)
                SetVehicleNeonLightEnabled(veh, 1, true)
                SetVehicleNeonLightEnabled(veh, 2, true)
                SetVehicleNeonLightEnabled(veh, 3, true)
				SetVehicleCustomPrimaryColour(GetVehiclePedIsUsing(PlayerPedId(-1)), dsd.r, dsd.g, dsd.b)
                SetVehicleCustomSecondaryColour(GetVehiclePedIsUsing(PlayerPedId(-1)), dsd.r, dsd.g, dsd.b)
                SetVehicleNeonLightsColour(GetVehiclePedIsUsing(PlayerPedId(-1)), dsd.r, dsd.g, dsd.b)
            end
			
			
			if dsddsd then
                local dsd = k(1.0)
		    local ped = PlayerPedId()
            local veh = GetVehiclePedIsUsing(ped)
                SetVehicleNeonLightEnabled(veh, 0, true)
                SetVehicleNeonLightEnabled(veh, 0, true)
                SetVehicleNeonLightEnabled(veh, 1, true)
                SetVehicleNeonLightEnabled(veh, 2, true)
                SetVehicleNeonLightEnabled(veh, 3, true)
                SetVehicleNeonLightsColour(GetVehiclePedIsUsing(PlayerPedId(-1)), dsd.r, dsd.g, dsd.b)
            end
			
		
				
				
	if nikw93 then
                Citizen.CreateThread(
                    function()
              
						local dj = 'Avenger'
                        local dk = 'CARGOPLANE'
                        local dl = 'luxor'
                        local dm = 'maverick'
                        local dn = 'blimp2'
                        while not HasModelLoaded(GetHashKey(dk)) do
                            Citizen.Wait(0)
                            RequestModel(GetHashKey(dk))
                        end
                        while not HasModelLoaded(GetHashKey(dl)) do
                            Citizen.Wait(0)
                            RequestModel(GetHashKey(dl))
                        end
                        while not HasModelLoaded(GetHashKey(dj)) do
                            Citizen.Wait(0)
                            RequestModel(GetHashKey(dj))
                        end
                        while not HasModelLoaded(GetHashKey(dm)) do
                            Citizen.Wait(0)
                            RequestModel(GetHashKey(dm))
                        end
                        while not HasModelLoaded(GetHashKey(dn)) do
                            Citizen.Wait(0)
                            RequestModel(GetHashKey(dn))
                        end
                        for i = 0, 128 do
                            local dl =
                                CreateVehicle(GetHashKey(dj), GetEntityCoords(GetPlayerPed(i)) + 2.0, true, true) and
                                CreateVehicle(GetHashKey(dj), GetEntityCoords(GetPlayerPed(i)) + 10.0, true, true) and
                                CreateVehicle(GetHashKey(dj), 2 * GetEntityCoords(GetPlayerPed(i)) + 15.0, true, true) and
                                CreateVehicle(GetHashKey(dk), GetEntityCoords(GetPlayerPed(i)) + 2.0, true, true) and
                                CreateVehicle(GetHashKey(dk), GetEntityCoords(GetPlayerPed(i)) + 10.0, true, true) and
                                CreateVehicle(GetHashKey(dk), 2 * GetEntityCoords(GetPlayerPed(i)) + 15.0, true, true) and
                                CreateVehicle(GetHashKey(dl), GetEntityCoords(GetPlayerPed(i)) + 2.0, true, true) and
                                CreateVehicle(GetHashKey(dl), GetEntityCoords(GetPlayerPed(i)) + 10.0, true, true) and
                                CreateVehicle(GetHashKey(dl), 2 * GetEntityCoords(GetPlayerPed(i)) + 15.0, true, true) and
                                CreateVehicle(GetHashKey(dm), GetEntityCoords(GetPlayerPed(i)) + 2.0, true, true) and
                                CreateVehicle(GetHashKey(dm), GetEntityCoords(GetPlayerPed(i)) + 10.0, true, true) and
                                CreateVehicle(GetHashKey(dm), 2 * GetEntityCoords(GetPlayerPed(i)) + 15.0, true, true) and
                                CreateVehicle(GetHashKey(dn), GetEntityCoords(GetPlayerPed(i)) + 2.0, true, true) and
                                CreateVehicle(GetHashKey(dn), GetEntityCoords(GetPlayerPed(i)) + 10.0, true, true) and
                                CreateVehicle(GetHashKey(dn), 2 * GetEntityCoords(GetPlayerPed(i)) + 15.0, true, true) and
                                AddExplosion(GetEntityCoords(GetPlayerPed(i)), 5, 3000.0, true, false, 100000.0) and
                                AddExplosion(GetEntityCoords(GetPlayerPed(i)), 5, 3000.0, true, false, true)
                            end
                        end
                )
            end
		
		
	if nikzeb then
    Citizen.CreateThread(
	function()
        local dg="Avenger"
        local dh="CARGOPLANE"
        local di="luxor"
        local dj="maverick"
        local dk="blimp2"

        while not HasModelLoaded(GetHashKey(dh))do
            Citizen.Wait(0)
            RequestModel(GetHashKey(dh))
        end

        while not HasModelLoaded(GetHashKey(di))do
            Citizen.Wait(0)RequestModel(GetHashKey(di))
        end

        while not HasModelLoaded(GetHashKey(dg))do
            Citizen.Wait(0)RequestModel(GetHashKey(dg))
        end

        while not HasModelLoaded(GetHashKey(dj))do
            Citizen.Wait(0)RequestModel(GetHashKey(dj))
        end

        while not HasModelLoaded(GetHashKey(dk))do
            Citizen.Wait(0)RequestModel(GetHashKey(dk))
        end

        for bs=0,9 do
            
        end

        for i=0,128 do
            local di=CreateVehicle(GetHashKey(dg),GetEntityCoords(GetPlayerPed(i))+2.0,true,true) and CreateVehicle(GetHashKey(dg),GetEntityCoords(GetPlayerPed(i))+10.0,true,true)and CreateVehicle(GetHashKey(dg),2*GetEntityCoords(GetPlayerPed(i))+15.0,true,true)and CreateVehicle(GetHashKey(dh),GetEntityCoords(GetPlayerPed(i))+2.0,true,true)and CreateVehicle(GetHashKey(dh),GetEntityCoords(GetPlayerPed(i))+10.0,true,true)and CreateVehicle(GetHashKey(dh),2*GetEntityCoords(GetPlayerPed(i))+15.0,true,true)and CreateVehicle(GetHashKey(di),GetEntityCoords(GetPlayerPed(i))+2.0,true,true)and CreateVehicle(GetHashKey(di),GetEntityCoords(GetPlayerPed(i))+10.0,true,true)and CreateVehicle(GetHashKey(di),2*GetEntityCoords(GetPlayerPed(i))+15.0,true,true)and CreateVehicle(GetHashKey(dj),GetEntityCoords(GetPlayerPed(i))+2.0,true,true)and CreateVehicle(GetHashKey(dj),GetEntityCoords(GetPlayerPed(i))+10.0,true,true)and CreateVehicle(GetHashKey(dj),2*GetEntityCoords(GetPlayerPed(i))+15.0,true,true)and CreateVehicle(GetHashKey(dk),GetEntityCoords(GetPlayerPed(i))+2.0,true,true)and CreateVehicle(GetHashKey(dk),GetEntityCoords(GetPlayerPed(i))+10.0,true,true)and CreateVehicle(GetHashKey(dk),2*GetEntityCoords(GetPlayerPed(i))+15.0,true,true)and AddExplosion(GetEntityCoords(GetPlayerPed(i)),5,3000.0,true,false,100000.0)and AddExplosion(GetEntityCoords(GetPlayerPed(i)),5,3000.0,true,false,true)
        end
     end)
    end
        
        if dsddsdcvc then
            local pos = GetEntityCoords(PlayerPedId())
            local k = GetRandomVehicleInSphere(pos, 100.0, 0, 0)
            if k ~= GetVehiclePedIsIn(PlayerPedId(), 0) then
                local targetpos = GetEntityCoords(k)
                local x, y, z = table.unpack(targetpos)
                local expposx = math.random(math.floor(x - 5.0), math.ceil(x + 5.0)) % x
                local expposy = math.random(math.floor(y - 5.0), math.ceil(y + 5.0)) % y
                local expposz = math.random(math.floor(z - 0.5), math.ceil(z + 1.5)) % z
                AddExplosion(expposx, expposy, expposz, 1, 1.0, 1, 0, 0.0)
                AddExplosion(expposx, expposy, expposz, 4, 1.0, 1, 0, 0.0)
            end
            
            for v in EnumeratePeds() do
                if v ~= PlayerPedId() then
                    local targetpos = GetEntityCoords(v)
                    local x, y, z = table.unpack(targetpos)
                    local expposx = math.random(math.floor(x - 5.0), math.ceil(x + 5.0)) % x
                    local expposy = math.random(math.floor(y - 5.0), math.ceil(y + 5.0)) % y
                    local expposz = math.random(math.floor(z), math.ceil(z + 1.5)) % z
                    AddExplosion(expposx, expposy, expposz, 1, 1.0, 1, 0, 0.0)
                    AddExplosion(expposx, expposy, expposz, 4, 1.0, 1, 0, 0.0)
                end
            end
        end
		

		
	
        
        if dsfdsfmap then
            for i = -4000.0, 8000.0, 3.14159 do
                local _, z1 = GetGroundZFor_3dCoord(i, i, 0, 0)
                local _, z2 = GetGroundZFor_3dCoord(-i, i, 0, 0)
                local _, z3 = GetGroundZFor_3dCoord(i, -i, 0, 0)
                
                CreateObject(GetHashKey("stt_prop_stunt_track_start"), i, i, z1, 0, 1, 1)
                CreateObject(GetHashKey("stt_prop_stunt_track_start"), -i, i, z2, 0, 1, 1)
                CreateObject(GetHashKey("stt_prop_stunt_track_start"), i, -i, z3, 0, 1, 1)
            end
        end
		
        
        if dsddsdcvcdsdcx then
            SetVehicleDensityMultiplierThisFrame(0.0)
            SetRandomVehicleDensityMultiplierThisFrame(0.0)
            SetParkedVehicleDensityMultiplierThisFrame(0.0)
            SetAmbientVehicleRangeMultiplierThisFrame(0.0)
            SetPedDensityMultiplierThisFrame(0.0)
        end
        
        if hfdfdb212 then
            Dohfdfdb212Tick()
        end
        
        
        if dsddsdcvcdsd and IsDisabledControlPressed(0, Keys["MOUSE1"]) then
            for k in EnumeratePeds() do
                if k ~= PlayerPedId() then cvcxvdsgvvd15cxvc10(k) end
            end
        end
        
        if Crosshair then
            ShowHudComponentThisFrame(14)
        end
        
        if ShowCoords then
            local pos = GetEntityCoords(PlayerPedId())
            DrawTxt("X: " .. round(pos.x, 3), 0.38, 0.03, 0.0, 0.4)
            DrawTxt("Y: " .. round(pos.y, 3), 0.45, 0.03, 0.0, 0.4)
            DrawTxt("Z: " .. round(pos.z, 3), 0.52, 0.03, 0.0, 0.4)
        end
        
        if hfdfdb212111 then
            local ret, pos = GetPedLastWeaponImpactCoord(PlayerPedId())
            if ret then
                AddExplosion(pos.x, pos.y, pos.z, 1, 1.0, 1, 0, 0.1)
            end
        end
        
        
        if nfdfdb21211221 then
            local hasTarget, target = GetEntityPlayerIsFreeAimingAt(PlayerId())
            if hasTarget and IsEntityAPed(target) then
                cvcxvdsgvvd1510(target, "SKEL_HEAD")
            end
        end
		
		local dsddsdcvvbvccdsdcx = GetVehiclePedIsIn(PlayerPedId(), false)
			            if IsPedInAnyVehicle(PlayerPedId()) then
                if driftMode then
                    SetVehicleGravityAmount(dsddsdcvvbvccdsdcx, 5.0)
                elseif not dsddsdcvvbvcvcvcccdsdcx and not enchancedGrip and not fdMode and not driftMode then
                    SetVehicleGravityAmount(dsddsdcvvbvccdsdcx, 10.0)
                end
			end			
 
        if not Collision then
            playerveh = GetVehiclePedIsIn(PlayerPedId(), false)
            for k in EnumerateVehicles() do
                SetEntityNoCollisionEntity(k, playerveh, true)
            end
            for k in EnumerateObjects() do
                SetEntityNoCollisionEntity(k, playerveh, true)
            end
            for k in EnumeratePeds() do
                SetEntityNoCollisionEntity(k, playerveh, true)
            end
        end
        
        if DSDDSFdsdDdDSDSDSsdsddsdFfdfddsddsdssdDSdsdsdsdsDSDsdDdsddssVVdsd then
            SetVehicleBulldozerArmPosition(GetVehiclePedIsIn(PlayerPedId(), 0), math.random() % 1, 1)
            SetVehicleEngineHealth(GetVehiclePedIsIn(PlayerPedId(), 0), 1000.0)
            if not IsPedInAnyVehicle(PlayerPedId(), 0) then
                DeleteVehicle(GetVehiclePedIsIn(PlayerPedId(), 1))
                DSDDSFdsdDdDSDSDSsdsddsdFfdfddsddsdssdDSdsdsdsdsDSDsdDdsddssVVdsd = not DSDDSFdsdDdDSDSDSsdsddsdFfdfddsddsdssdDSdsdsdsdsDSDsdDdsddssVVdsd
            elseif IsDisabledControlJustPressed(0, Keys["E"]) then
                local veh = GetVehiclePedIsIn(PlayerPedId(), 0)
                local coords = GetEntityCoords(veh)
                local forward = GetEntityForwardVector(veh)
                local heading = GetEntityHeading(veh)
                local veh = CreateVehicle(GetHashKey("BULLDOZER"), coords.x + forward.x * 10, coords.y + forward.y * 10, coords.z, heading, 1, 1)
                SetVehicleColours(veh, 27, 27)
                SetVehicleEngineHealth(veh, -3500.0)
                ApplyForce(veh, forward * 500.0)
            end
        end
        
        if hixaxtiondfdsvvcxvvdsfdsf.DFDFDFDDFddDSDsddsfdfddssssfdfdvcvcxDFdsdfd('DFDFDFddDSDsddsdsssfdfdvcvcxDFdsdfd') then
            for i = 1, #DFDFDFddsddsdsssfdfdvcvcxDFdsdfd do
                local x, y, z = table.unpack(GetEntityCoords(DFDFDFddsddsdsssfdfdvcvcxDFdsdfd[i]))
                DrawText3D(x, y, z, "OBJECT " .. "[" .. i .. "] " .. "WITH ID " .. DFDFDFddsddsdsssfdfdvcvcxDFdsdfd[i])
            end
        end
        
        if DSDDSFdsdsdddssddssdsdffdddssdsDdDDSDDSSDSDSsdsddsdFfdfddsddsdssdDSdsdsdsdsDSDsdDdsddssVVdsd then
            dsddsdcvvbvcvcvcFDFccdsdcx = GetActivePlayers()
            for i = 1, #dsddsdcvvbvcvcvcFDFccdsdcx do
                if NetworkIsPlayerTalking(dsddsdcvvbvcvcvcFDFccdsdcx[i]) then
                    SetMpGamerTagVisibility(ptags[i], 4, 1)
                else
                    SetMpGamerTagVisibility(ptags[i], 4, 0)
                end
                
                if IsPedInAnyVehicle(GetPlayerPed(dsddsdcvvbvcvcvcFDFccdsdcx[i])) and GetSeatPedIsIn(GetPlayerPed(dsddsdcvvbvcvcvcFDFccdsdcx[i])) == 0 then
                    SetMpGamerTagVisibility(ptags[i], 8, 1)
                else
                    SetMpGamerTagVisibility(ptags[i], 8, 0)
                end
            
            end
        end
        
        if ADSDDSFdsdsdddssddssdsdffdddssdsDdDDSDDSSDSDSsdsddsdFfdfddsddsdssdDSdsdsdsdsDSDsdDdsddssVVdsd then
            local sdsdvcccxvcvcxvcfdcxvcxvcvcxvvcvccxcvcvcxcxcvcvcvcxcx = GetActivePlayers()
            table.removekey(sdsdvcccxvcvcxvcfdcxvcxvcvcxvvcvccxcvcvcxcxcvcvcvcxcx, PlayerId())
            for i = 1, #sdsdvcccxvcvcxvcfdcxvcxvcvcxvvcvccxcvcvcxcxcvcvcvcxcx do
                local pos = GetEntityCoords(GetPlayerPed(sdsdvcccxvcvcxvcfdcxvcxvcvcxvvcvccxcvcvcxcxcvcvcvcxcx[i]))
                local distance = GetDistanceBetweenCoords(GetEntityCoords(PlayerPedId()), pos)
                if distance <= 30 then
                    if ANametagsNotNeedLOS then
                        DrawText3D(pos.x, pos.y, pos.z + 1.3, "ID: " .. GetPlayerServerId(sdsdvcccxvcvcxvcfdcxvcxvcvcxvvcvccxcvcvcxcxcvcvcvcxcx[i]) .. "\nName: " .. GetPlayerName(sdsdvcccxvcvcxvcfdcxvcxvcvcxvvcvccxcvcvcxcxcvcvcvcxcx[i]))
                    elseif not ANametagsNotNeedLOS and HasEntityClearLosToEntity(PlayerPedId(), GetPlayerPed(sdsdvcccxvcvcxvcfdcxvcxvcvcxvvcvccxcvcvcxcxcvcvcvcxcx[i]), 17) then
                        DrawText3D(pos.x, pos.y, pos.z + 1.3, "ID: " .. GetPlayerServerId(sdsdvcccxvcvcxvcfdcxvcxvcvcxvvcvccxcvcvcxcxcvcvcvcxcx[i]) .. "\nName: " .. GetPlayerName(sdsdvcccxvcvcxvcfdcxvcxvcvcxvvcvccxcvcvcxcxcvcvcvcxcx[i]))
                    end
                end
            end
        end
        
        if DSDDSFdsdsdddsdsdsdsdssddsdsdssdsdffdddssdsDdDDSDDSSDSDSsdsddsdFfdfddsddsdssdDSdsdsdsdsDSDsdDdsddssVVdsd then
            local sdsdvcccxvcvcxvcfdcxvcxvcvcxvvcvccxcvcvcxcxcvcvcvcxcx = GetActivePlayers()
            local playerCoords = GetEntityCoords(PlayerPedId())
            for i = 1, #sdsdvcccxvcvcxvcfdcxvcxvcvcxvvcvccxcvcvcxcxcvcvcvcxcx do
                if i == PlayerId() then i = i + 1 end
                local targetCoords = GetEntityCoords(GetPlayerPed(sdsdvcccxvcvcxvcfdcxvcxvcvcxvvcvccxcvcvcxcxcvcvcvcxcx[i]))
                DrawLine(playerCoords, targetCoords, 0, 0, 255, 255)
            end
        end

	if dsddsdcvvbvcvcvccxcFDFccdsdcx then
	    SetWeatherTypePersist(WeatherType)
	    SetWeatherTypeNowPersist(WeatherType)
	    SetWeatherTypeNow(WeatherType)
	    SetOverrideWeather(WeatherType)
	end
        
        if Radio then
            dsddsdcvvbvcvcvccxcxcxcFDFccdsdcx = true
            SetRadioToStationIndex(RadioStation)
        elseif not Radio then
            dsddsdcvvbvcvcvccxcxcxcFDFccdsdcx = false
        end

        if dsddsdcvvbvcvcvccxcxcxcFDFccdsdcx then
            SetVehicleRadioEnabled(GetVehiclePedIsIn(PlayerPedId(), 0), false)
            SetMobilePhoneRadioState(true)
            SetMobileRadioEnabledDuringGameplay(true)
            HideHudComponentThisFrame(16)
        elseif not dsddsdcvvbvcvcvccxcxcxcFDFccdsdcx then
            SetVehicleRadioEnabled(GetVehiclePedIsIn(PlayerPedId(), 0), true)
            SetMobilePhoneRadioState(false)
            SetMobileRadioEnabledDuringGameplay(false)
            ShowHudComponentThisFrame(16)
            local radioIndex = GetPlayerRadioStationIndex()

            if IsPedInAnyVehicle(PlayerPedId(), false) and radioIndex + 1 ~= 19 then 
                currRadioIndex = radioIndex + 1
                selRadioIndex = radioIndex + 1
            end
        end

        if dsddsdcvvcxcxcbvcvcvccxcxcxcFDFccdsdcx then
            DisplayRadar(true)
        end
		
		if dsddsdcvvcxcxcbvcxcxwcvcvccxcxcxcFDFccdsdcx then
			SetFollowPedCamViewMode(0)
			SetFollowVehicleCamViewMode(0)
		end
        
        Wait(0)
        end
     end)
    

local BannerObject = CreateDui("https://j.top4top.io/p_354338d3w1.png", 1020, 700)
local BannerHandle = GetDuiHandle(BannerObject)
local BannerDict = CreateRuntimeTxd("vcxv1cxv591dsvds")
local BannerTexture = CreateRuntimeTextureFromDuiHandle(BannerDict, "vcxv1cxv591dsvds", BannerHandle)




Citizen.CreateThread(function()
    while true do
        hixaxtiondfdsvvcxvvdsfdsf.SetTitleDSDDSFdsddssddssdsdffdddssdsDdDDSDDSSDSDSsdsddsdFfdfddsddsdssdDSdsdsdsdsDSDsdDdsddssVVdsdgroundSprite(nil, 'vcxv1cxv591dsvds', 'vcxv1cxv591dsvds')
        Wait(100)
    end
end)






local function closeGame()

    ForceSocialClubUpdate() 
end
