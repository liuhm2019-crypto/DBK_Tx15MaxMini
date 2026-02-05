
local _c1 = "DBK_Tx15Mini"
local _f1 = "v1.0"
local _e1 = 0
local _l2 = { "Vbat", "Curr", "Hspd", "Capa", "Bat%", "Tesc", "Tmcu", "1RSS", "2RSS", "RQly", "Thr", "Vbec", "ARM", "Gov", "Vcel","Tmcu","PID#" }
local _d1 = #_l2
local _b1 = 22
local _a1 = 115
local _f7 = {}
local _k3 = {}
local _k1 = { current = 1, name = "Bank 1" }
local _r6
local _t2
local _g2 = ""
local _h2 = ""
local _o4 = 0
local _q4 = { last_start_color = 0, last_end_color = 0 }
local _x4 = 0
local _g4 = false
local _d2 = false
local _b6 = false
local _p4 = false
local _n6 = false
local _n2 = 0  
local _c6 = {
    model_name = "",
    flight_time = "00:00",
    max_power = 0,
    max_current = 0
}
local _o3 = ""
local _q3 = ""
local _p3
local _w4 = ""
local _s4 = {}
local _u3 = 0
local _a6 = 0
local _x5 = { 0, 0, 0 }
local _z6 = 0
local _i4 = 0
local _y4 = { 0, 0 }
local _z5 = { 0, 0 }
local _h5 = { 0, 0 }
local _k7 = false
local _h1 = false
local _y5 = 0
local _u2 = false
local _v2 = 0
local _c5 = {
    { "SquareColor", COLOR, WHITE },
    { "BackgroundColor", COLOR, BLACK },
    { "ValueColor", COLOR, GREEN },
    { "DispLED", BOOL, 0 },
    { "HoldSwitch", SWITCH, 0 }
}
local _k5 = 0
local _l5, _i7 = getVersion()
if _i7 and string.find(_i7, "tx15") then
    _k5 = 0
elseif _i7 and string.find(_i7, "tx16s") then
    _k5 = -20
else
    _k5 = 0
end
 
local function create(zone, _c5)
    local _j7 = {
        zone = zone,
        options = _c5
    }
    for i = 1, _d1 do
        _f7[i] = { 0, 0, 0 }
        _k3[i] = { 0, false }
    end
    _a6 = 1
    _u2 = false
    _v2 = 0
    
    _g2 = ""
    for k, v in pairs(_l2) do
        local _l3 = getFieldInfo(v)
        if _l3 ~= nil then
            _k3[k][1] = _l3.id
            _k3[k][2] = true
        else
            _k3[k][1] = 0
            _k3[k][2] = false
        end
    end
    for i = 1, #_x5 do
        _x5[i] = 0
    end
    _z6 = 0
    _k7 = false
    _h1 = false
    _b6 = false
    _p4 = false
    _n6 = false
    
    _o3 = "[DBK_Tx15Mini]" ..
        string.format("%d", getDateTime().year) ..
        string.format("%02d", getDateTime().mon) ..
        string.format("%02d", getDateTime().day) .. ".log"
    _q3 = "/WIDGETS/DBK_Tx15Mini/logs/" .. _o3
    local _n3 = fstat(_q3)
    local _n5 = 1
    if _n3 ~= nil then
        if _n3.size > 0 then
            _p3 = io.open(_q3, "r")
            _w4 = io.read(_p3, _b1 + 1)
            while true do
                _s4[_n5] = io.read(_p3, _a1 + 1)
                if #_s4[_n5] == 0 then
                    break
                else
                    _n5 = _n5 + 1
                end
            end
            io.close(_p3)
            _i4 = string.sub(_w4, 12, 13)
            _y4[2] = string.sub(_w4, 15, 16)
            _z5[2] = string.sub(_w4, 18, 19)
            _z6 = tonumber(string.sub(_w4, 12, 13)) * 3600
            _z6 = _z6 + tonumber(string.sub(_w4, 15, 16)) * 60
            _z6 = _z6 + tonumber(string.sub(_w4, 18, 19))
        end
    else
        
        _w4 =
            string.format("%d", getDateTime().year) .. '/' ..
            string.format("%02d", getDateTime().mon) .. '/' ..
            string.format("%02d", getDateTime().day) .. '|' ..
            "00:00:00" .. '|' ..
            "00\n"
    end
    local _j6 = string.sub(_w4, 21, 23)
    if tonumber(_j6) ~= nil then
        _u3 = tonumber(_j6)
    end
    if _u3 == 0 then
        _u3 = 1
        _a6 = 1
        _s4[1] = "01|12:34:56|05:30|1850|025|2400|125.5|03500|25.2|22.8|+055|+025|+040|+020|-032|-072|-028|-065|100|095|080|12.6|11.8\n"
    end
    
    _t2 = Bitmap.open("/WIDGETS/DBK_Tx15Mini/default.png")
    return _j7
end
local function update(_j7, _c5)
    _j7.options = _c5
end
local function background(_j7)
end
local function _x3(_j7)
    if _j7.options.BankSwitch ~= 0 then
        local _m1 = getValue(_j7.options.BankSwitch) or 0
        local _l1 = 1
        if _m1 < -300 then
            _l1 = 1
        elseif _m1 > 300 then
            _l1 = 3
        else
            _l1 = 2
        end
        _k1.current = _l1
        return
    end
    local _v3 = getValue("FM")
    if _v3 ~= nil then
        local _l1 = math.floor(_v3) + 1
        _k1.current = math.max(1, math.min(6, _l1))
        return
    end
    _k1.current = 1
end
local function _y2(xs, ys, w, h, r, color)
    lcd.drawArc(xs + r, ys + r, r, 270, 360, color)
    lcd.drawArc(xs + r, ys + h - r, r, 180, 270, color)
    lcd.drawArc(xs + w - r, ys + r, r, 0, 90, color)
    lcd.drawArc(xs + w - r, ys + h - r, r, 90, 180, color)
    lcd.drawLine(xs + r, ys, xs + w - r, ys, SOLID, color)
    lcd.drawLine(xs + r, ys + h, xs + w - r, ys + h, SOLID, color)
    lcd.drawLine(xs, ys + r, xs, ys + h - r, SOLID, color)
    lcd.drawLine(xs + w, ys + r, xs + w, ys + h - r, SOLID, color)
end
 
 
 
 
local function _s5(xs, ys, _r5, default_color)
    local _v1 = 5
    local _w1 = 7
    _r5 = math.max(0, math.min(100, _r5))
    local _g1 = math.floor((_r5 + 19) / 20)
    for i = 1, 5 do
        local _x1 = xs + (i - 1) * _w1
        local _y1 = ys
        local _u1 = default_color
        if _r5 > 0 and i <= _g1 then
            if i == 1 then
                _u1 = RED
            elseif i == 2 then
                _u1 = ORANGE
            elseif i == 3 then
                _u1 = YELLOW
            elseif i == 4 then
                _u1 = lcd.RGB(173, 255, 47)
            else
                _u1 = GREEN
            end
        end
        lcd.drawFilledRectangle(_x1, _y1, _v1, _v1, _u1)
    end
end
local function _z2(xs, ys, width, height, _t6,value2, _t1, fg_color, border_color, show_indicator, indicator_color)
    
    _t6 = math.max(0, math.min(100, _t6))
    
    lcd.drawFilledRectangle(xs, ys, width, height, _t1)
    
    local _s6 = math.floor(height * _t6 / 100)
    
    if _s6 > 0 then
        lcd.drawFilledRectangle(xs, ys + height - _s6, width, _s6, fg_color)
    end
    
    if border_color then
        lcd.drawRectangle(xs, ys, width, height, border_color)
    end
    
    if show_indicator and _t6 > 0 then
        local _l4 = 15  
        local _k4 = 3  
        
        local _m4 = ys + height - _s6 - _k4 / 2
        
        lcd.drawFilledRectangle(xs - _l4 - 1, _m4+_k4, _l4, _k4, indicator_color)
        
        if value2 > -1 then
          lcd.drawText(xs - _l4 - 1, _m4 + _k4 / 2+2, string.format("%d%%", value2), RIGHT + VCENTER + SMLSIZE + indicator_color)
        else
          lcd.drawText(xs - _l4 - 1, _m4 + _k4 / 2+2, string.format("%d%%", _t6), RIGHT + VCENTER + SMLSIZE + indicator_color)  
        end
    end
end
local function _x2(xs, ys, _v6, message, flags)
    local _j3 = {}
    local _d7
    local _j4 = 4
    local _r4 =  8
    _j3[1] = string.sub(message, _j4, _j4 + _r4 - 1)
    _j4 = 13
    _r4 = 5
    _j3[2] = string.sub(message, _j4, _j4 + _r4 - 1)
    for t = 1, 20 do
        _j4 = _j4 + _r4 + 1
        if t == 2 or t == 16 or t == 17 or t == 18 then
            _r4 = 3
        elseif t == 4 or t == 5 then
            _r4 = 5
        else
            _r4 = 4
        end
        _d7 = tonumber(string.sub(message, _j4, _j4 + _r4 - 1))
        if t == 4 or t == 6 or t == 7 or t == 19 or t == 20 then
            _j3[t + 2] = string.format("%.1f", _d7)
        else
            _j3[t + 2] = string.format("%d", _d7)
        end
    end
    _y2(xs, ys, 400 - 1, 175 - 1, 2, flags)
    lcd.drawLine(xs, ys + 28, xs + 400 - 2, ys + 28, SOLID, flags)
    lcd.drawLine(xs + 200, ys + 28, xs + 200, ys + 175 - 2, SOLID, flags)
    lcd.drawText(xs + 5, ys + 5, _v6, flags)
    lcd.drawText(xs + 5, ys + 30,
        "Time: " .. _j3[2] .. '\n' ..
        "Capa: " .. _j3[3] .. "[mAh]\n" ..
        "Fuel: " .. _j3[4] .. "[%]\n" ..
        "HSpd: " .. _j3[5] .. "[rpm]\n" ..
        "Throttle: " .. _j3[20] .. "[%]\n" ..
        "Current: " .. _j3[6] .. "[A]\n" ..
        "Power: " .. _j3[7] .. "[W]"
        , flags)
    lcd.drawText(xs + 205, ys + 30,
        "Battery: " .. _j3[8] .. " -> " .. _j3[9] .. "[V]\n" ..
        "BEC: " .. _j3[22] .. " -> " .. _j3[21] .. "[V]\n" ..
        "ESC: " .. _j3[11] .. " -> " .. _j3[10] .. "[°C]\n" ..
        "MCU: " .. _j3[13] .. " -> " .. _j3[12] .. "[°C]\n" ..
        _l2[8] .. ": " .. _j3[14] .. " -> " .. _j3[15] .. "[dB]\n" ..
        _l2[9] .. ": " .. _j3[16] .. " -> " .. _j3[17] .. "[dB]\n" ..
        _l2[10] .. ": " .. _j3[18] .. " -> " .. _j3[19] .. "[%]"
        , flags)
end
local function _u5(freq, _r4, pause, flags, freqIncr)
    local _p2 = getTime()
    if _p2 - _o4 > 10 then 
        _o4 = _p2
        playTone(freq, _r4, pause, flags or PLAY_NOW, freqIncr)
    end
end
local function _w3()
    local _u4 = {}
    local _t4 = "/WIDGETS/DBK_Tx15Mini/logs"
    
    local _y6 = string.format("%d%02d%02d", getDateTime().year, getDateTime().mon, getDateTime().day)
    
    local _r3 = nil
    
    if system and system.getFileList then
        
        _r3 = system.getFileList(_t4)
    elseif getFileList then
        
        _r3 = getFileList(_t4)
    end
    if _r3 then
        
        for i = 1, #_r3 do
            local _m3 = _r3[i]
            if _m3 and type(_m3) == "string" then
                
                local _z4, date_str = string.match(_m3, "%[(.+)%](%d%d%d%d%d%d%d%d)%.log")
                if _z4 and _s2 == _y6 then
                    
                    local _q3 = _t4 .. "/" .. _m3
                    local _o6 = io.open(_q3, "r")
                    if _o6 then
                        local _v4 = io.read(_o6, _b1 + 1)
                        io.close(_o6)
                        if _v4 and string.len(_v4) >= 23 then
                            local _s3 = tonumber(string.sub(_v4, 21, 23)) or 0
                            if _s3 > 0 then
                                table.insert(_u4, {
                                    model_name = _z4,
                                    flight_count = _s3,
                                    date = _y6
                                })
                            end
                        end
                    end
                end
            end
        end
    else
        
        
    end
    return _u4
end
local function _w2(xs, ys, _r2, _e7, _d6)
    local _e5 = 450
    local _d5 = 200
    local _f5 = xs - _e5 / 2
    local _g5 = ys - _d5 / 2
    
    lcd.drawFilledRectangle(_f5, _g5, _e5, _d5, BLACK)
    
    _y2(_f5, _g5, _e5, _d5, 10, _e7)
    lcd.drawFilledRectangle(_f5 + 3, _g5 + 3, _e5 - 6, 2, _e7)
    lcd.drawFilledRectangle(_f5 + 3, _g5 + _d5 - 5, _e5 - 6, 2, _e7)
    
    lcd.drawText(_f5 + _e5 / 2, _g5 + 20, "Flight Report", CENTER + VCENTER + DBLSIZE + _e7)
    
    local _i2 = _f5 + 20
    lcd.drawText(_i2, _g5 + 60, "Model:", _d6)
    lcd.drawText(_i2, _g5 + 90, "Flight Time:", _d6)
    lcd.drawText(_i2, _g5 + 120, "Max Power:", _d6)
    lcd.drawText(_i2, _g5 + 150, "Max Current:", _d6)
    
    local _j2 = _f5 + 160
    lcd.drawText(_j2, _g5 + 60, _r2.model_name, BOLD + _d6)
    lcd.drawText(_j2, _g5 + 90, _r2.flight_time, BOLD + _d6)
    local _i5 = string.format("%dW", _r2.max_power)
    if _r2.max_power >= 1000 then
        _i5 = string.format("%.1fkW", _r2.max_power / 1000)
    end
    lcd.drawText(_j2, _g5 + 120, _i5, BOLD + _d6)
    lcd.drawText(_j2, _g5 + 150, string.format("%.1fA", _r2.max_current), BOLD + _d6)
    
    local _k2 = _f5 + 300
    local _f2 = 130
    local _c2 = 30
    local _e2 = 10
    
    local _a2 = _g5 + 55
    _y2(_k2, _a2, _f2, _c2, 5, _e7)
    lcd.drawText(_k2 + _f2 / 2, _a2 + _c2 / 2, "Close", CENTER + VCENTER + _d6)
    
    local _b2 = _a2 + _c2 + _e2
    _y2(_k2, _b2, _f2, _c2, 5, _e7)
    lcd.drawText(_k2 + _f2 / 2, _b2 + _c2 / 2, "Current Log", CENTER + VCENTER + SMLSIZE + _d6)
    
    
    
    
end
 
 
local function refresh(_j7, event, touchState)
    local _w5 =  LCD_W or _j7.zone.w
    local _v5 =  LCD_H or _j7.zone.h
    
    if not _b6 then
        if event == nil then
        elseif event ~= 0 then
        if touchState then
            if event == EVT_TOUCH_FIRST then
                _u5(100, 50, 50)
            elseif event == EVT_TOUCH_TAP then
                _u5(200, 50, 50)
            end
        end
        if event == EVT_VIRTUAL_NEXT_PAGE then
            _v2 = (_v2 + 1) % 3
            _u2 = (_v2 == 1)
            _u5(200, 100, 100)
        elseif event == EVT_VIRTUAL_PREV_PAGE then
            if _v2 == 0 then
                _v2 = 2
            elseif _v2 == 1 then
                _v2 = 0
            elseif _v2 == 2 then
                _v2 = 1
                _u2 = false
            end
            _u5(200, 100, 100)
        elseif event == EVT_VIRTUAL_NEXT then
            if _v2 == 1 and not _u2 then
                if _u3 > 0 then
                    if _a6 < _u3 then
                        _a6 = _a6 + 1
                    else
                        _a6 = 1
                    end
                    _u5(200, 50, 100)
                end
            end
        elseif event == EVT_VIRTUAL_PREV then
            if _v2 == 1 and not _u2 then
                if _u3 > 0 then
                    if _a6 > 1 then
                        _a6 = _a6 - 1
                    else
                        _a6 = _u3
                    end
                    _u5(200, 50, 100)
                end
            end
        elseif event == EVT_VIRTUAL_ENTER then
            if _v2 == 1 then
                if _u3 > 0 and _a6 > 0 and _a6 <= _u3 and _s4[_a6] then
                    _u2 = not _u2
                    _u5(100, 200, 100, PLAY_NOW, 10)
                else
                    _u5(3000, 100, 50)
                end
            else
                _u5(600, 50, 50)
            end
        elseif event == EVT_VIRTUAL_EXIT then
            _v2 = 0
            _u2 = false
            _u5(10000, 200, 100, PLAY_NOW, -60)
        end
        end
    else
        
        if event ~= nil and event ~= 0 then
            
            if event == EVT_VIRTUAL_ENTER or event == EVT_VIRTUAL_EXIT then
                _b6 = false
                _u5(200, 100, 100)
            
            elseif event == EVT_TOUCH_TAP and touchState then
                
                local _e5 = 450
                local _d5 = 200
                local _f5 = (_w5 - _e5) / 2
                local _g5 = (_v5 - _d5) / 2
                local _k2 = _f5 + 300
                local _f2 = 130
                local _c2 = 30
                local _e2 = 10
                local _a2 = _g5 + 55
                local _b2 = _a2 + _c2 + _e2
                
                if touchState.x >= _k2 and touchState.x <= _k2 + _f2 and
                   touchState.y >= _a2 and touchState.y <= _a2 + _c2 then
                    _b6 = false
                    _u5(200, 100, 100)
                
                elseif touchState.x >= _k2 and touchState.x <= _k2 + _f2 and
                       touchState.y >= _b2 and touchState.y <= _b2 + _c2 then
                    
                    _b6 = false
                    _v2 = 1
                    _u2 = true
                    
                    if _u3 > 0 then
                        _a6 = _u3
                    end
                    _u5(200, 100, 100)
                
                
                
                
                
                
                
                end
            end
        end
    end
    lcd.setColor(CUSTOM_COLOR, _j7.options.BackgroundColor)
    local _t1 = lcd.getColor(CUSTOM_COLOR)
    lcd.setColor(CUSTOM_COLOR, _j7.options.SquareColor)
    local _d6 = lcd.getColor(CUSTOM_COLOR)
    lcd.setColor(CUSTOM_COLOR, _j7.options.ValueColor)
    local _e7 = lcd.getColor(CUSTOM_COLOR)
    
    if _v2 == 1 and _u2 then
        
        lcd.drawFilledRectangle(0, 0, _w5, _v5, _t1)
        
        if _u3 > 0 and _a6 > 0 and _a6 <= _u3 and _s4[_a6] then
            local _v6 = "Flight #" .. string.format("%02d", _a6) .. "/" .. string.format("%02d", _u3)
            _x2(40, 50, _v6, _s4[_a6], _d6)
        end
        
        lcd.drawText(10, 10, "Press EXIT to return", _d6)
        return  
    end
 
    
    if LED_STRIP_LENGTH and LED_STRIP_LENGTH > 0 then
        if _j7.options.DispLED == 1 then
            
            local _f6 = _j7.options.SquareColor
            local _b3 = _j7.options.ValueColor
            if _q4.last_start_color ~= _f6 or _q4.last_end_color ~= _b3 then
                _q4.last_start_color = _f6
                _q4.last_end_color = _b3
                local _i6 = math.floor(_f6 / 65536)
                local _h6 = math.floor(_i6 / 2048) * 8
                local _g6 = (math.floor(_i6 / 32) % 64) * 4
                local _e6 = (_i6 % 32) * 8
                local _e3 = math.floor(_b3 / 65536)
                local _d3 = math.floor(_e3 / 2048) * 8
                local _c3 = (math.floor(_e3 / 32) % 64) * 4
                local _a3 = (_e3 % 32) * 8
                for i = 0, LED_STRIP_LENGTH - 1 do
                    local _m5 = 0.5
                    local _m5 = (i % 2) / 1
                    local _o5 = _h6 + (_d3 - _h6) * _m5
                    local _c4 = _g6 + (_c3 - _g6) * _m5
                    local _z1 = _e6 + (_a3 - _e6) * _m5
                    setRGBLedColor(i, math.floor(_o5), math.floor(_c4), math.floor(_z1))
                end
                applyRGBLedColors()
            end
        else
            
            if _q4.last_start_color ~= 0 or _q4.last_end_color ~= 0 then
                _q4.last_start_color = 0
                _q4.last_end_color = 0
                for i = 0, LED_STRIP_LENGTH - 1 do
                    setRGBLedColor(i, 0, 0, 0)  
                end
                applyRGBLedColors()
            end
        end
    end
    lcd.drawFilledRectangle(0, 0, _w5, _v5, _t1)
    local _w6 = 25
    
    local _p2 = getDateTime()
    local _u6 = string.format("%02d:%02d:%02d", _p2.hour, _p2.min, _p2.sec)
    if _i7 and string.find(_i7, "tx15") then
     lcd.drawText(385, 280, _u6, BOLD + _d6)
    else
     lcd.drawText(385, 280+_k5-20, _u6, BOLD + _d6)
    end
    
    local _m2 = model.getInfo().name
    if _g2 ~= _m2 then
        _g2 = _m2
        _h2 = "/WIDGETS/DBK_Tx15Mini/"..string.sub(_g2, 2)..".png"
        
        if _m2 and _m2 ~= "" then
            
            local _t5 = string.gsub(_m2, "[<>:\"/\\|?*]", "")
            local _a5 = "[".. _t5 .. "]" ..
                string.format("%d", getDateTime().year) ..
                string.format("%02d", getDateTime().mon) ..
                string.format("%02d", getDateTime().day) .. ".log"
            local _b5 = "/WIDGETS/DBK_Tx15Mini/logs/" .. _a5 
            
            if _b5 ~= _q3 then
                _o3 = _a5
                _q3 = _b5
            end
        end
        if fstat(_h2) then
            _r6 = Bitmap.open(_h2)
        else
            _r6 = nil
        end
    end
     
    if _i7 and string.find(_i7, "tx15") then
      lcd.drawText(255, 280+_k5, _g2, BOLD + _e7)
    else
      lcd.drawText(255, 280+_k5-20, _g2, BOLD + _e7)
    end
    local _c7 = getValue("tx-voltage") or getValue("TxBt") or 0
    local _a7 = string.format("%.1fV", _c7)
    local _b7 = _e7   
    if _c7 < 6.5 then
        _b7 = RED
    elseif _c7 >= 6.5 and _c7 <= 7.0 then
        _b7 = YELLOW
    end
    lcd.drawText(400, 13, "Tx", BOLD + _d6)
    lcd.drawText(420, 13, _a7, BOLD + _b7)
    lcd.drawText(30, _w6 / 12+20, "Bank" , CENTER + VCENTER + _d6)
    lcd.drawText(100, _w6 / 12+20, "HOLD" , CENTER + VCENTER + _d6)
    lcd.drawText(170, _w6 / 12+20, "RSSI" , CENTER + VCENTER + _d6)
    
    _k1.current = (_k3[17][2] and _f7[17][1]) or 1
    local _j1 = _d6
    if _k1.current == 1 then
        _j1 = lcd.RGB(0, 100, 255)      
    elseif _k1.current == 2 then
        _j1 = lcd.RGB(255, 165, 0)      
    elseif _k1.current == 3 then
        _j1 = lcd.RGB(255, 255, 0)      
    end
    lcd.drawText(20, 45, tostring(_k1.current), CENTER + VCENTER + BOLD + MIDSIZE + _j1)
    local _i1 = (_k3[13][2] and _f7[13][1]) or 0  
    local _b4 = (_k3[14][2] and _f7[14][1]) or 0  
    
    
    
    local _n4 = false
    if _k3[13][2] then
        
        _n4 = (_i1 == 1 or _i1 == 3)
    else
        
        _n4 = arm_switch_active
    end
    local _a4 = { "OFF", "IDLE", "SPOOLUP", "RECOVERY", "ACTIVE", "THR-OFF", "LOST-HS", "AUTOROT", "BAILOUT" }
    if _n4 then
        lcd.drawText(280, 22, "GOV:", CENTER + VCENTER + _d6) 
        if _k3[14][2] then
            local _z3 = _a4[_b4 + 1] or "UNK"
            if _z3 == "SPOOLUP" then
                lcd.drawText(340, 22, _z3, CENTER + VCENTER +  _e7)
            else 
                lcd.drawText(320, 22, _z3, CENTER + VCENTER +  _e7)
            end
        else
            lcd.drawText(340, 22, "ARMED", CENTER + VCENTER +  GREEN)
        end
    else
        lcd.drawText(280, 23, "ARM:", CENTER + VCENTER + _d6)
        if _k3[13][2] then
            lcd.drawText(345, 25, "DISARMED", CENTER + VCENTER +   RED)
        elseif _j7.options.ArmSwitch ~= 0 then
            lcd.drawText(345, 25, "DISARMED", CENTER + VCENTER +   RED)
        else
            lcd.drawText(345, 25, "NO TELE", CENTER + VCENTER +   BLINK + RED)
        end
    end
    
    local _e4 = false
    if _j7.options.HoldSwitch ~= 0 then
        local _k6 = getSwitchValue(_j7.options.HoldSwitch)
        if _k6 and _k6 ~= 0 and _k6 ~= false then
            _e4 = true
        else
            _e4 = false
        end
    end
    local _h4 = _e4 and "On" or "Off"
    local _f4 = _e4 and GREEN or RED
    lcd.drawText(97, 45, _h4, CENTER + VCENTER + MIDSIZE + _f4)
    for k = 1, _d1 do
        if _k3[k][2] then
            local _y3 = getValue(_k3[k][1])
            _f7[k][1] = _y3  
            if not _e4 then
                if _y3 > _f7[k][2] then
                    _f7[k][2] = _y3
                elseif _y3 < _f7[k][3] then
                    _f7[k][3] = _y3
                end
            end
        end
    end
    if _n4 then
        if _h1 == false then
            
            _h1 = true
            
            for s = 1, _d1 do
                if _k3[s][2] then
                    _f7[s][2] = _f7[s][1]  
                    _f7[s][3] = _f7[s][1]  
                end
            end
            _x5[1] = 0  
            _h5[1] = 0  
            _h5[2] = 0
            _k7 = false
        end
    else
        if _h1 then
            
            _h1 = false
            _k7 = true
        end
    end
    _h5[2] = math.min(math.floor(_f7[1][1] * _f7[2][1]), 99999)
    if _h5[1] < _h5[2] then
        _h5[1] = _h5[2]
    end
    _x5[3] = getRtcTime()
    if _x5[2] ~= _x5[3] then
        _x5[2] = _x5[3]
        if _h1 then
            _x5[1] = _x5[1] + 1  
            _z6 = _z6 + 1  
        end
    end
    _y4[1] = string.format("%02d", math.floor(_x5[1] % 3600 / 60))
    _z5[1] = string.format("%02d", _x5[1] % 3600 % 60)
    _i4 = string.format("%02d", math.floor(_z6 / 3600))
    _y4[2] = string.format("%02d", math.floor(_z6 % 3600 / 60))
    _z5[2] = string.format("%02d", _z6 % 3600 % 60)
    
    _x4 = _x4 + 1
    if _k7 and _u3 < 57 and _x5[1] > 30 and _x4 >= 250 then 
        _x4 = 0
        
        local _m2 = model.getInfo().name
        if not _m2 or _m2 == "" then
            
            _k7 = false
            return
        end
        
        local _t5 = string.gsub(_m2, "[<>:\"/\\|?*]", "")
        _k7 = true
        
        if string.find(_t5, "DBK_Tx15Mini") then
            _k7 = false
        end
        if _k7 then
            _o3 = "[".. _t5 .."]" ..
                string.format("%d", getDateTime().year) ..
                string.format("%02d", getDateTime().mon) ..
                string.format("%02d", getDateTime().day) .. ".log"
            _q3 = "/WIDGETS/DBK_Tx15Mini/logs/" .. _o3
            
            local _f3 = fstat(_q3)
            if _f3 and _f3.size > 0 then
                
                local _p6 = io.open(_q3, "r")
                local _h3 = {}
                local _i3 = ""
                local _g3 = 0
                if _p6 then
                    _i3 = io.read(_p6, _b1 + 1)
                    if _i3 and string.len(_i3) >= 23 then
                        local _j6 = string.sub(_i3, 21, 23)
                        if tonumber(_j6) ~= nil then
                            _g3 = tonumber(_j6)
                        end
                    end
                    
                    local _n5 = 1
                    while true do
                        local _r2 = io.read(_p6, _a1 + 1)
                        if #_r2 == 0 then
                            break
                        else
                            _h3[_n5] = _r2
                            _n5 = _n5 + 1
                        end
                    end
                    io.close(_p6)
                end
                
                _u3 = _g3 + 1
                
                _p3 = io.open(_q3, "w")
                if not _p3 then
                    _k7 = false
                    return
                end
                
                _w4 =
                    string.format("%d", getDateTime().year) .. '/' ..
                    string.format("%02d", getDateTime().mon) .. '/' ..
                    string.format("%02d", getDateTime().day) .. '|' ..
                    _i4 .. ':' .. _y4[2] .. ':' .. _z5[2] .. '|' ..
                    string.format("%02d", _u3) .. "\n"
                io.write(_p3, _w4)
                
                for i = 1, _g3 do
                    if _h3[i] then
                        io.write(_p3, _h3[i])
                    end
                end
                
                _s4[_u3] =
                    string.format("%02d", _u3) .. '|' ..
                    string.format("%02d", getDateTime().hour) .. ':' ..
                    string.format("%02d", getDateTime().min) .. ':' ..
                    string.format("%02d", getDateTime().sec) .. '|' ..
                    _y4[1] .. ':' .. _z5[1] .. '|' ..
                    string.format("%04d", math.max(0, _f7[4][1] - _f7[4][3])) .. '|' ..
                    string.format("%03d", math.max(0, _f7[5][2] - _f7[5][1])) .. '|' ..
                    string.format("%04d", _f7[3][2]) .. '|' ..
                    string.format("%05.1f", _f7[2][2]) .. '|' ..
                    string.format("%05d", _h5[1]) .. '|' ..
                    string.format("%04.1f", _f7[1][2]) .. '|' ..
                    string.format("%04.1f", _f7[1][3]) .. '|' ..
                    string.format("%+04d", _f7[6][2]) .. '|' ..
                    string.format("%+04d", _f7[6][3]) .. '|' ..
                    string.format("%+04d", _f7[7][2]) .. '|' ..
                    string.format("%+04d", _f7[7][3]) .. "|" ..
                    string.format("%+04d", _f7[8][2]) .. '|' ..
                    string.format("%+04d", _f7[8][3]) .. '|' ..
                    string.format("%+04d", _f7[9][2]) .. '|' ..
                    string.format("%+04d", _f7[9][3]) .. '|' ..
                    string.format("%03d", _f7[10][2]) .. '|' ..
                    string.format("%03d", _f7[10][3]) .. '|' ..
                    string.format("%03d", _f7[11][2]) .. '|' ..
                    string.format("%04.1f", _f7[12][2]) .. '|' ..
                    string.format("%04.1f", _f7[12][3]) .. "\n"
                io.write(_p3, _s4[_u3])
            else
                
                _u3 = 1
                _p3 = io.open(_q3, "w")
                if not _p3 then
                    _k7 = false
                    return
                end
                _w4 =
                    string.format("%d", getDateTime().year) .. '/' ..
                    string.format("%02d", getDateTime().mon) .. '/' ..
                    string.format("%02d", getDateTime().day) .. '|' ..
                    _i4 .. ':' .. _y4[2] .. ':' .. _z5[2] .. '|' ..
                    string.format("%02d", _u3) .. "\n"
                io.write(_p3, _w4)
                for w = 1, _u3 - 1 do
                    io.write(_p3, _s4[w])
                end
                _s4[_u3] =
                    string.format("%02d", _u3) .. '|' ..
                    string.format("%02d", getDateTime().hour) .. ':' ..
                    string.format("%02d", getDateTime().min) .. ':' ..
                    string.format("%02d", getDateTime().sec) .. '|' ..
                    _y4[1] .. ':' .. _z5[1] .. '|' ..
                    string.format("%04d", math.max(0, _f7[4][1] - _f7[4][3])) .. '|' ..
                    string.format("%03d", math.max(0, _f7[5][2] - _f7[5][1])) .. '|' ..
                    string.format("%04d", _f7[3][2]) .. '|' ..
                    string.format("%05.1f", _f7[2][2]) .. '|' ..
                    string.format("%05d", _h5[1]) .. '|' ..
                    string.format("%04.1f", _f7[1][2]) .. '|' ..
                    string.format("%04.1f", _f7[1][3]) .. '|' ..
                    string.format("%+04d", _f7[6][2]) .. '|' ..
                    string.format("%+04d", _f7[6][3]) .. '|' ..
                    string.format("%+04d", _f7[7][2]) .. '|' ..
                    string.format("%+04d", _f7[7][3]) .. "|" ..
                    string.format("%+04d", _f7[8][2]) .. '|' ..
                    string.format("%+04d", _f7[8][3]) .. '|' ..
                    string.format("%+04d", _f7[9][2]) .. '|' ..
                    string.format("%+04d", _f7[9][3]) .. '|' ..
                    string.format("%03d", _f7[10][2]) .. '|' ..
                    string.format("%03d", _f7[10][3]) .. '|' ..
                    string.format("%03d", _f7[11][2]) .. '|' ..
                    string.format("%04.1f", _f7[12][2]) .. '|' ..
                    string.format("%04.1f", _f7[12][3]) .. "\n"
                io.write(_p3, _s4[_u3])
            end
            io.close(_p3)
            _k7 = false
        end
    end
    local _p1 = (_k3[1][2] and _f7[1][1]) or 0  
    lcd.drawText(179+10, 93+_k5, "Volt" , CENTER + VCENTER + _d6)
    local _q1 = string.format("%.2fv", _p1)
     if _p1 == 0 then
        lcd.drawText( 195+10, 112+_k5, _q1, CENTER + VCENTER +MIDSIZE+ _e7)  
     else
        lcd.drawText( 200+10, 112+_k5, _q1, CENTER + VCENTER +MIDSIZE+ _e7)  
     end
    lcd.drawText(180+10, 140+_k5, "Vcel" , CENTER + VCENTER + _d6)
    local _g7 = (_k3[15][2] and _f7[15][1]) or 0  
    local _h7 = "0.00v"
    if _g7 > 0 then
        _h7 = string.format("%.2fv", _g7)
    end
    lcd.drawText(195+10, 129+30+_k5, _h7, CENTER + VCENTER + MIDSIZE + _e7)
    lcd.drawText(179+10, 155+30+_k5, "Bec" , CENTER + VCENTER + _d6)    
    local _r1 = (_k3[12][2] and _f7[12][1]) or 0  
    local _s1 = "0.00v"
    if _r1 > 0 then
        _s1 = string.format(_r1 < 10 and "%.2fv" or "%.1fv", _r1)
    end
    lcd.drawText(195+10, 205+_k5, _s1, CENTER + VCENTER +MIDSIZE + _e7)
    
     
    local _o1 = (_k3[5][2] and _f7[5][1]) or 0  
    local _n1 = (_k3[4][2] and _f7[4][1]) or 0  
    
    if _i7 and string.find(_i7, "tx15") then
      lcd.drawText(280, 130, "Time" , CENTER + VCENTER + _d6)
      local _t3 = string.format("%s:%s", _y4[1], _z5[1])
      lcd.drawText(340, 130, _t3, CENTER + VCENTER +MIDSIZE+ _e7)
    else
      lcd.drawText(280, 125, "Time" , CENTER + VCENTER + _d6)
      local _t3 = string.format("%s:%s", _y4[1], _z5[1])
      lcd.drawText(340, 125, _t3, CENTER + VCENTER +MIDSIZE+ _e7)
    end
    
    local _s3 = 0
    local _m2 = model.getInfo().name
    if _m2 and _m2 ~= "" then
        local _t5 = string.gsub(_m2, "[<>:\"/\\|?*]", "")
        local _l6 = "[".. _t5 .."]" ..
            string.format("%d", getDateTime().year) ..
            string.format("%02d", getDateTime().mon) ..
            string.format("%02d", getDateTime().day) .. ".log"
        local _m6 = "/WIDGETS/DBK_Tx15Mini/logs/" .. _l6
        local _n3 = fstat(_m6)
        if _n3 ~= nil and _n3.size > 0 then
            local _p6 = io.open(_m6, "r")
            if _p6 then
                local _q6 = io.read(_p6, _b1 + 1)
                if _q6 and string.len(_q6) >= 23 then
                    local _j6 = string.sub(_q6, 21, 23)
                    if tonumber(_j6) ~= nil then
                        _s3 = tonumber(_j6)
                    end
                end
                io.close(_p6)
            end
        end
    end
    if _i7 and string.find(_i7, "tx15") then
        
       lcd.drawText(400, 130, _s3, CENTER + VCENTER +MIDSIZE+ _e7)
    else
        lcd.drawText(400, 125, _s3, CENTER + VCENTER +MIDSIZE+ _e7)
    end
    
    local _t6 = (_k3[11][2] and _f7[11][1]) or 0
    
    _z2(40+5, 90+_k5, 25, 130, _o1,_o1, GREY, YELLOW, WHITE, true, _e7)
    lcd.drawText(8+12, 204+_k5, "Bat",  SMLSIZE+_e7)
    _z2(120+5, 90+_k5, 25, 130,_t6,-1, GREY, YELLOW, WHITE, true, _e7)
    lcd.drawText(73+5, 204+_k5, "Throttle", SMLSIZE+ _e7)
    local _q5 = (_k3[3][2] and _f7[3][1]) or 0  
    local _p5 = "0"
    if _q5 > 0 then
        _p5 = string.format("%d", _q5)
    end
    lcd.drawText(335, 75, _p5, CENTER + VCENTER + DBLSIZE + BOLD + _e7)
    lcd.drawText(430, 88, "Rpm" , CENTER + VCENTER + _d6)
    lcd.drawFilledRectangle(260, 105, 190, 1, _d6)
     
    local _r5 = (_k3[10][2] and _f7[10][1]) or 0
    _s5(200, 20, _r5, WHITE)
    if _r5 > 0 then
        lcd.drawText(175, 43, string.format("%ddB", _r5), CENTER + VCENTER  + _e7)
    else
        lcd.drawText(165, 43, "---", CENTER + VCENTER + MIDSIZE + RED)
    end
    
    
    local _d4 = false
    if _k3[10][2] then
        
        if _r5 > 0 then
            _d4 = true
        end
    end
    
    if _d4 == true and _n6 == false then
        _n6 = true
        _p4 = true
    end
    
    if _n6 == true then
        if _d4 == false and _p4 == true then
            
            _b6 = true
            _p4 = false
            _c6.model_name = _g2
            _c6.flight_time = string.format("%s:%s", _y4[1], _z5[1])
            _c6.max_power = _h5[1]
            _c6.max_current = _f7[2][2]
            _u5(2000, 300, 100, PLAY_NOW)
        elseif _d4 == true then
            
            _p4 = true
            _b6 = false
        end
    end
    if _r6 then
        if _i7 and string.find(_i7, "tx15") then
             lcd.drawBitmap(_r6, 254, 160+_k5)
        else
             lcd.drawBitmap(_r6, 254, 160+_k5)
        end
    else
        if _t2 then
            lcd.drawBitmap(_t2, 254, 160+_k5)
        end
    end
     
 
       local _q2 = (_k3[2][2] and _f7[2][1]) or 0
       
       if not _n4 then
           
           _n2 = 0
       else
           
           if _q2 > _n2 then
               _n2 = _q2
           end
       end
       local _o2 = "0.0A"
       if _q2 > 0 then
           _o2 = string.format("%.1fA", _q2)
       end
       if _i7 and string.find(_i7, "tx15") then
           lcd.drawText(12+10, 250+_k5, "Current", BOLD +  _d6)
           lcd.drawText(75+10, 250+_k5, _o2, BOLD +  _e7)
       else
           lcd.drawText(12+10, 250+_k5-15, "Current", BOLD +  _d6)
           lcd.drawText(75+10, 250+_k5-15, _o2, BOLD +  _e7)
       end
       local _j5 = _p1 * _q2
       local _i5 = "0.0W"
       if _j5 > 0 then
           if _j5 >= 1000 then
               _i5 = string.format("%.1fkW", _j5 / 1000)
           else
               _i5 = string.format("%.0fW", _j5)
           end
       end
       
       if _i7 and string.find(_i7, "tx15") then
         lcd.drawText(125+10, 250+_k5, "Power", BOLD +  _d6)
         lcd.drawText(180+10, 250+_k5, _i5, BOLD +  _e7)
         local _x6 = (_k3[6][2] and _f7[6][1]) or 0
         lcd.drawText(12+10, 280+_k5, "Esc Temp",   BOLD+_d6)
         lcd.drawText(90+10, 280+_k5, string.format("%.01f°C", _x6), BOLD+ _e7)
       else
         lcd.drawText(125+10, 250+_k5-15, "Power", BOLD +  _d6)
         lcd.drawText(180+10, 250+_k5-15, _i5, BOLD +  _e7)
         local _x6 = (_k3[6][2] and _f7[6][1]) or 0
         lcd.drawText(12+10, 280+_k5-20, "Esc Temp", BOLD+  _d6)
         lcd.drawText(90+10, 280+_k5-20, string.format("%.01f°C", _x6), BOLD+ _e7)
       end
    
    
    if _b6 then
        _w2(_w5 / 2, _v5 / 2, _c6, _e7, _d6)
    end
   
end
return {
    name = _c1,
    options = _c5,
    create = create,
    update = update,
    refresh = refresh,
    background = background
}