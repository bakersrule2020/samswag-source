/*
ooooooooooo ooooo  oooo ooooooooo   ooooooooooo ooooooooooo ooooo ooooo      o        oooooooo8 oooo   oooo
 888    88    888  88    888    88o  888    88   888    88   888   888      888     o888     88  888  o88
 888ooo8        888      888    888  888ooo8     888ooo8     888ooo888     8  88    888          888888
 888    oo     88 888    888    888  888    oo   888    oo   888   888    8oooo88   888o     oo  888  88o
o888ooo8888 o88o  o888o o888ooo88   o888ooo8888 o888ooo8888 o888o o888o o88o  o888o  888oooo88  o888o o888o

Code made by brainbread people :D

Created By Kuno, Jumpy, Dante$.

Private Codens, do not leak thanks.

Leaked By Akuski

*/

local next = next;
local player = player;
local pm = FindMetaTable("Player")
local em = FindMetaTable("Entity")
local table = table;
local surface = surface;
local render = render;
local cam = cam;
local game = game;
local Material = Material;
local engine = engine;
local CurTime = CurTime;
local IsFirstTimePredicted = IsFirstTimePredicted;
local math = math;
local string = string;
local input = input;
local util = util;
local GetConVar = GetConVar;
local Vector = Vector;
local Angle = Angle;
local insertdown = false;
local menuframe = nil;
local mousedown = false;
local team = team or {};
//////////////////////////////////////////////////////////////////////////////////////////////
------------------------------------ Draw Functions ----------------------------------------
//////////////////////////////////////////////////////////////////////////////////////////////



local function InBox(minx, miny, w, h)local menux, menuy = menuframe:GetPos();
minx = minx + menux;
miny = miny + menuy;
local mousex, mousey = input.GetCursorPos();
return(mousex < (minx + w) && mousex > minx && mousey < (miny + h) && mousey > miny);
end

local function Base(x, y, w, h)
--menu
    surface.SetDrawColor(48,48,48, 255)
    surface.DrawRect(x+1, y+1, w-135, h)
    surface.SetDrawColor(GetConVarNumber("Menu-R"), GetConVarNumber("Menu-G"), GetConVarNumber("Menu-B"), 255)
    surface.DrawOutlinedRect( x, y, w-133, h+27)
    surface.SetDrawColor(38, 38, 38, 255)
    surface.DrawRect(x+1, y+25, w-135, y+1)
    surface.SetDrawColor(GetConVarNumber("Menu-R"),GetConVarNumber("Menu-G"),GetConVarNumber("Menu-B"), 255)

    --aimbot
    surface.SetDrawColor(46, 46, 46, 255)
    surface.DrawRect(x+8, y+28, w-496, h-223)
    surface.SetDrawColor(16, 16, 16, 160)
    surface.DrawRect(x+8, y+28, w-496, h-385)
    --esp
    surface.SetDrawColor(46, 46, 46, 255)
    surface.DrawRect(x+180, y+28, w-496, h-223)
    surface.SetDrawColor(16, 16, 16, 160)
    surface.DrawRect(x+180, y+28, w-496, h-385)
    --misc
    surface.SetDrawColor(46, 46, 46, 255)
    surface.DrawRect(x+355, y+28, w-496, h-223)
    surface.SetDrawColor(16, 16, 16, 160)
    surface.DrawRect(x+355, y+28, w-496, h-385)
    --empty
    surface.SetDrawColor(46, 46, 46, 255)
    surface.DrawRect(x+8, y+242, w-496, h-223)
    surface.SetDrawColor(16, 16, 16, 160)
    surface.DrawRect(x+8, y+242, w-496, h-385)
    --midline
    surface.SetDrawColor(GetConVarNumber("Menu-R"),GetConVarNumber("Menu-G"),GetConVarNumber("Menu-B"), 255)
    surface.DrawOutlinedRect( x, y, w-133, h-175)
    --empty
    surface.SetDrawColor(46, 46, 46, 255)
    surface.DrawRect(x+180, y+242, w-496, h-223)
    surface.SetDrawColor(16, 16, 16, 160)
    surface.DrawRect(x+180, y+242, w-496, h-385)
    --empty
    surface.SetDrawColor(46, 46, 46, 255)
    surface.DrawRect(x+355, y+242, w-496, h-223)
    surface.SetDrawColor(16, 16, 16, 160)
    surface.DrawRect(x+355, y+242, w-496, h-385)



--texts
    draw.SimpleText("SAMSWAG HACK", "MenuLabel", 720,406, Color(GetConVarNumber("Menu-R"),GetConVarNumber("Menu-G"),GetConVarNumber("Menu-B"), 255))
    draw.SimpleText("Aimbot", "MenuLabel", 568,429, Color(255,255,255, 255))
    draw.SimpleText("Visuals", "MenuLabel", 742,429, Color(255,255,255, 255))
    draw.SimpleText("Miscellaneous", "MenuLabel", 900,429, Color(255,255,255, 255))
    draw.SimpleText("Empty", "MenuLabel", 568,644, Color(255,255,255, 255))
    draw.SimpleText("Color", "MenuLabel", 742,644, Color(255,255,255, 255))
    draw.SimpleText("Empty", "MenuLabel", 917,644, Color(255,255,255, 255))


end


local function DrawSlider(x, y, optionname, max, convar)
local d = 119/max
local inbox = InBox(x, y, 120, 15);
local cvar = GetConVar(convar);
local cvarN = cvar:GetInt()

surface.SetDrawColor(20, 20, 20, 255)
surface.DrawRect(x- 2, y - 2, 123, 19);


surface.SetDrawColor(25, 25, 25, 255)
surface.DrawRect(x, y, 116, 7,5);
surface.SetDrawColor(25, 25, 25, 220)
surface.DrawRect(x, y+7.5, 116, 7,5);




surface.SetDrawColor(GetConVarNumber("Menu-R"),GetConVarNumber("Menu-G"),GetConVarNumber("Menu-B"), 255)
surface.DrawRect(x, y,cvarN* d, 7,5)


surface.SetDrawColor(GetConVarNumber("Menu-R"),GetConVarNumber("Menu-G"),GetConVarNumber("Menu-B"), 210)
surface.DrawRect(x, y+7.5,cvarN* d, 7,5)


surface.SetTextColor(255, 255, 255, 255);
	surface.SetFont("MenuLabel");

	local textinside = string.format("%s:  %d", optionname, cvarN)

	local tw, th = surface.GetTextSize(textinside);

	surface.SetTextPos(x + 60 - tw / 2, y + 7 - th / 2);
	surface.DrawText(textinside);


if(inbox && input.IsMouseDown(MOUSE_LEFT)) then
	local mousex, mousey = input.GetCursorPos();
	local Z = math.ceil((mousex- x)/d )
	cvar:SetInt(Z)
 end
end

local function DrawGroupBox(x, y, w, h)

  surface.SetDrawColor(54, 54, 54, 255);
    surface.DrawOutlinedRect(x, y , w ,h);

end

local function DrawCheckbox(x, y, convar, text)

  surface.SetDrawColor(25, 25, 25);
  surface.DrawRect(x - 2, y - 2, 24, 24);


  surface.SetDrawColor(35, 35, 35);
  surface.DrawRect(x, y,20, 20);



    local cvar = GetConVar(convar);

    local inbox = InBox(x, y, 20, 20);

    if(cvar:GetBool()) then

        surface.SetDrawColor(GetConVarNumber("Menu-R"),GetConVarNumber("Menu-G"),GetConVarNumber("Menu-B"), 255)
        surface.DrawRect(x+1, y,19, 9.6);
        surface.SetDrawColor(GetConVarNumber("Menu-R")-30,GetConVarNumber("Menu-G")-30,GetConVarNumber("Menu-B")-30, 255)
        surface.DrawRect(x+1, y+9, 19, 11);
        surface.SetDrawColor(GetConVarNumber("Menu-R")-30,GetConVarNumber("Menu-G")-30,GetConVarNumber("Menu-B")-30, 255)
        surface.DrawOutlinedRect(x+1, y+9, 19, 11);




    elseif(inbox) then
      surface.SetDrawColor(255,255,255, 50)
      surface.DrawRect(x + 1, y + 1, 19, 19);

      surface.SetDrawColor(1, 1, 1, 50)
      surface.DrawOutlinedRect(x + 1, y + 1, 19, 19);
    end

    surface.SetFont("CheckboxLabel");
    local tw, th = surface.GetTextSize(text);
    surface.SetTextColor(GetConVarNumber("Menu-R"), GetConVarNumber("Menu-G"), GetConVarNumber("Menu-B"), 255);
    surface.SetTextPos(x+30, y + 11 - th / 2);
    surface.DrawText(text);

    if(inbox && input.IsMouseDown(MOUSE_LEFT) && !mousedown) then
        cvar:SetBool(!cvar:GetBool());
    end
end


//////////////////////////////////////////////////////////////////////////////////////////////
----------------------------------------------------------------------------------------------
//////////////////////////////////////////////////////////////////////////////////////////////

            rainbow = {}
            rainbow.R = math.sin(CurTime() * 4) * 127 + 128
            rainbow.G = math.sin(CurTime() * 4 + 2) * 127 + 128
            rainbow.B = math.sin(CurTime() * 4 + 4) * 127 + 128

                        chat.AddText(Color(255,0,0),"     [ SAMSWAG HACK LOADED ] ")
                        chat.AddText(Color(199,0,0),"[ Press INSERT to open menu. ] ")

//////////////////////////////////////////////////////////////////////////////////////////////
------------------------------------------- TABLE --------------------------------------------
//////////////////////////////////////////////////////////////////////////////////////////////
CreateClientConVar("AIMBOT_enabled", "1", true, false);
CreateClientConVar("AIMBOTRAGE_enabled", "1", true, false);
CreateClientConVar("TEAMCHECK_enabled", "1", true, false);
CreateClientConVar("FRIENDCHECK_enabled", "1", true, false);
CreateClientConVar("BABYGODCHECK_enabled", "1", true, false);
CreateClientConVar("AIMBOTAUTO_enabled", "1", true, false);
CreateClientConVar("WATERMARK_enabled", "1", true, false);
CreateClientConVar("NAMEESP_enabled", "1", true, false);
CreateClientConVar("RAINBOWNAMEESP_enabled", "1", true, false);
CreateClientConVar("BHOP_enabled", "1", true, false)
CreateClientConVar("ESPBOX_enabled", "1", true, false)
CreateClientConVar("ENTESPBOX_enabled", "1", true, false)
CreateClientConVar("WEPESP_enabled", "1", true, false)
CreateClientConVar("AUTOSTRAFE_enabled", "1", true, false);
CreateClientConVar("RECOIL_enabled", "1", true, false);
CreateClientConVar("fieldofview", "1", true, false);
CreateClientConVar("ASUS", "1", true, false);
CreateClientConVar("pSilent", "1", true, false);
CreateClientConVar("Menu-R", "1", true, false);
CreateClientConVar("Menu-G", "1", true, false);
CreateClientConVar("Menu-B", "1", true, false);
CreateClientConVar("ESP-R", "1", true, false);
CreateClientConVar("ESP-G", "1", true, false);
CreateClientConVar("ESP-B", "1", true, false);



    local table = {}
    Cvars =
    {
        {"AIMBOT_enabled", "1"},
        {"AIMBOTRAGE_enabled", "1"},
        {"AIMBOTAUTO_enabled", "1"},
      	{"TEAMCHECK_enabled", "1"},
        {"FRIENDCHECK_enabled", "1"},
        {"BABYGODCHECK_enabled", "1"},
      	{"RAGEAIMBOT_enabled", "1"},
        {"NAMEESP_enabled", "1"},
        {"RAINBOWNAMEESP_enabled", "1"},
        {"ESPBOX_enabled", "1"},
        {"ENTESPBOX_enabled", "1"},
        {"pSilent", "1"},
        {"WEPESP_enabled", "1"},
        {"BHOP_enabled", "1"},
        {"AUTOSTRAFE_enabled", "1"},
        {"RECOIL_enabled", "1"},
        {"WATERMARK_enabled", "1"},
        {"fieldofview", "1"},
        {"ASUS", "1"},
				{"Menu-R", "1"},
				{"Menu-G", "1"},
				{"Menu-B", "1"},
				{"ESP-R", "1"},
				{"ESP-G", "1"},
				{"ESP-B", "1"},
    };

//////////////////////////////////////////////////////////////////////////////////////////////
------------------------------------------ FONTS ---------------------------------------------
//////////////////////////////////////////////////////////////////////////////////////////////

surface.CreateFont( "MenuLabel", {font = "DermaDefaultBold", extended = false, size = 12, weight = 20000,blursize = 0,scanlines = 0,antialias = false,underline = false,italic = false,strikeout = false,symbol = false,shadow = false,outline = true} )
surface.CreateFont( "CheckboxLabel", {font = "DermaDefaultBold", extended = false, size = 11, weight = 90000,blursize = 0,scanlines = 0,antialias = false,underline = false,italic = false,strikeout = false,symbol = false,shadow = true,outline = true} )
surface.CreateFont( "WatermarkFont", {font = "Trebuchet24", extended = false, size = 25, weight = 2000,blursize = 0,scanlines = 0,antialias = true,underline = false,italic = false,strikeout = false,symbol = false,shadow = false,outline = false} )
surface.CreateFont( "WatermarkFont2", {font = "Trebuchet24", extended = false, size = 12, weight = 2000,blursize = 0,scanlines = 0,antialias = true,underline = false,italic = false,strikeout = false,symbol = false,shadow = false,outline = false} )
surface.CreateFont( "NameESPFont", {font = "DermaDefaultBold", extended = false, size = 12, weight = 100,blursize = 0,scanlines = 0,antialias = true,underline = false,italic = false,strikeout = false,symbol = false,shadow = true,outline = false} )
surface.CreateFont( "SmallText", {font = "DermaDefaultBold", extended = false, size = 12, weight = 100,blursize = 0,scanlines = 0,antialias = true,underline = false,italic = false,strikeout = false,symbol = false,shadow = true,outline = false} )
surface.CreateFont( "ESPFont", {font = "DermaDefaultBold", extended = false, size = 11, weight = 10,blursize = 0,scanlines = 0,antialias = false,underline = false,italic = false,strikeout = false,symbol = false,shadow = false,outline = false} )


//////////////////////////////////////////////////////////////////////////////////////////////
------------------------------------------- MENU ---------------------------------------------
//////////////////////////////////////////////////////////////////////////////////////////////
    local function Menu()
    local mainframe =  vgui.Create("DFrame")
            mainframe:SetPos(0, 0)
            mainframe:SetSize(1920, 1080);
            mainframe:SetTitle("");
            mainframe:ShowCloseButton(false);
            mainframe:MakePopup()
            mainframe:SetDraggable(true)
            function mainframe:Paint( x, y )
            Base(500, 400, 651, 400)
                     DrawCheckbox(515, 455, "AIMBOT_enabled", "Aimbot")
                     DrawCheckbox(515, 480, "AIMBOTAUTO_enabled", "Auto-Shoot")
                     DrawCheckbox(515, 505, "AIMBOTRAGE_enabled", "Rage-Aimbot")
                     DrawCheckbox(515, 530, "TEAMCHECK_enabled", "Team-Check")
                     DrawCheckbox(515, 555, "FRIENDCHECK_enabled", "Friend-Check (Might)")
                     DrawCheckbox(687, 455, "NAMEESP_enabled", "Name-ESP")
                     DrawCheckbox(687, 480, "RAINBOWNAMEESP_enabled", "Rainbow Name-ESP")
                     DrawCheckbox(687, 505, "ESPBOX_enabled", "Player ESP-Box")
                     DrawCheckbox(687, 530, "ENTESPBOX_enabled", "Prop ESP-Box")
                     DrawCheckbox(687, 555, "WATERMARK_enabled", "Watermark")
                     DrawCheckbox(687, 580, "WEPESP_enabled", "Weapon ESP-Box")
                     DrawCheckbox(863, 455, "BHOP_enabled", "Bunny-Hop")
                     DrawCheckbox(863, 480, "AUTOSTRAFE_enabled", "Autostrafer")
                     DrawCheckbox(863, 505, "RECOIL_enabled", "No-Recoil")
                     DrawSlider(863, 530, "FoV", 330,"fieldofview")
                     DrawSlider(863, 555, "ASUS", 100,"ASUS")

                     DrawSlider(697, 675, "Menu-R", 255,"Menu-R")
										 DrawSlider(697, 700, "Menu-G", 255,"Menu-G")
										 DrawSlider(697, 725, "Menu-B", 255,"Menu-B")

										 DrawSlider(697, 750, "ESP-R", 255,"ESP-R")
										 DrawSlider(697, 775, "ESP-G", 255,"ESP-G")
										 DrawSlider(697, 800, "ESP-B", 255,"ESP-B")

                    mousedown = input.IsMouseDown(MOUSE_LEFT);
                end
                    return mainframe;
                end

//////////////////////////////////////////////////////////////////////////////////////////////
--------------------------------------- WATERMARK --------------------------------------------
//////////////////////////////////////////////////////////////////////////////////////////////

    local function watermark()
        if GetConVarNumber("WATERMARK_enabled") == 1 then
            rainbow = {}
                        rainbow.R = math.sin(CurTime() * 4) * 127 + 128
            rainbow.G = math.sin(CurTime() * 4 + 2) * 127 + 128
            rainbow.B = math.sin(CurTime() * 4 + 4) * 127 + 128

        local h = ScrH() / 1
        local w = ScrW() / 5
        draw.SimpleText("SAMSWAG HACK", "WatermarkFont", 870, 50, Color(GetConVarNumber("Menu-R"), GetConVarNumber("Menu-G"), GetConVarNumber("Menu-B"), 255), TEXT_ALIGN_CENTER, TEXT_ALIGN_BOTTOM)
        draw.SimpleText("Jumpy // John // Sam", "WatermarkFont2", 870, 65, Color(GetConVarNumber("Menu-R"), GetConVarNumber("Menu-G"), GetConVarNumber("Menu-B"), 255), TEXT_ALIGN_CENTER, TEXT_ALIGN_BOTTOM)
      end
    end
        hook.Add("HUDPaint", "WaterMark", watermark)
//////////////////////////////////////////////////////////////////////////////////////////////
----------------------------------------- AIMBOT ---------------------------------------------
//////////////////////////////////////////////////////////////////////////////////////////////

    local function aimbot()
        if GetConVarNumber("AIMBOT_enabled") == 1 then
            local ply = LocalPlayer()
            local trace = util.GetPlayerTrace( ply )
            local traceRes = util.TraceLine( trace )
            if traceRes.HitNonWorld then
                local target = traceRes.Entity
                if target:IsPlayer() then
                    local targethead = target:LookupBone("ValveBiped.Bip01_Head1")
                    local targetheadpos,targetheadang = target:GetBonePosition(targethead)
                    ply:SetEyeAngles((targetheadpos - ply:GetShootPos()):Angle())
                end

                    if GetConVarNumber("AIMBOTAUTO_enabled") == 1 then
                    RunConsoleCommand("+attack")
                                        RunConsoleCommand("+attack")
                                        RunConsoleCommand("+attack")
                                        RunConsoleCommand("+attack")
                                        RunConsoleCommand("+attack")
                                        RunConsoleCommand("+attack")
                                        RunConsoleCommand("+attack")
                                        RunConsoleCommand("+attack")
                                        RunConsoleCommand("+attack")
                                        RunConsoleCommand("+attack")
                    timer.Simple(0.25,function()
                    RunConsoleCommand("-attack")
                    end)
                end
            end
        end
    end
        hook.Add("Think","aimbot",aimbot)

//////////////////////////////////////////////////////////////////////////////////////////////
----------------------------------------- RAGEAIMBOT------------------------------------------
//////////////////////////////////////////////////////////////////////////////////////////////

                local function rageaimbot()
                        if GetConVarNumber("AIMBOTRAGE_enabled") == 1 then
                                local util = util;
                                local player = player;
                                local input = input;
                                local bit = bit;
                                local hook = hook;
                                local me = LocalPlayer();
                                local aimtarget;
                                local KEY_E = KEY_E;
                                local MASK_SHOT = MASK_SHOT;

                                local function GetPos(v)
                                                local eyes = v:LookupAttachment("eyes");
                                                return(eyes && v:GetAttachment(eyes).Pos || v:LocalToWorld(v:OBBCenter()));
                                end

                                local function Valid(v)
                                                if(!v || !v:IsValid() || v:Health() < 1 || v:IsDormant() || v == me) then return false; end
                                                local trace = {
                                                                mask = MASK_SHOT,
                                                                endpos = GetPos(v),
                                                                start = me:EyePos(),
                                                                filter = {me, v},
                                                };
                                                return(util.TraceLine(trace).Fraction == 1);
                                end

                                local function GetTarget()
                                    if GetConVarNumber("AIMBOTRAGE_enabled") == 1 then
                                                if (Valid(aimtarget)) then return; end
                                                aimtarget = nil;
                                                local allplys = player.GetAll();
                                                for i = 1, #allplys do
                                                                local v = allplys[i];
                                                                local pm = FindMetaTable("Player")
                                                                if GetConVarNumber("TEAMCHECK_enabled") == 1 then
                                                                    if(pm.Team(v) == pm.Team(me)) then return false end
                                                                    else
                                                                if GetConVarNumber("FRIENDCHECK_enabled") == 1 then
                                                                    if(pm.GetFriendStatus(v) == "friend") then return false end
                                                                    else
                                                                if (!Valid(v)) then continue; end
                                                                aimtarget = v;
                                                                return;
                                                            end
                                                          end
                                                        end
                                                      end
                                                    end

                                hook.Add("CreateMove", "", function(ucmd)
                                                GetTarget();
                                                 if(!ang) then ang = ucmd:GetViewAngles(); end
                                                 ang = ang + Angle(ucmd:GetMouseY() * .023, ucmd:GetMouseX() * -.023, 0);
                                                 ang.x = math.NormalizeAngle(ang.x);
                                                 ang.p = math.Clamp(ang.p, -89, 89);
                                                if(ucmd:CommandNumber() == 0) then
                                                ucmd:SetViewAngles(ang);
                                               return;
                                             end

                                                if (input.IsKeyDown(KEY_E) && aimtarget) then
                                                                ucmd:SetButtons(bit.bor(ucmd:GetButtons(), 1));
                                                                local pos = (GetPos(aimtarget) - me:EyePos()):Angle();
                                                                ucmd:SetViewAngles(pos);
                                                              end
                                                            end)
                                                          end
                                                        end
                        hook.Add("Think","rageaimbot",rageaimbot)
                        hook.Add("CreateMove", "rageaimbot", rageaimbot)


------------------

//////////////////////////////////////////////////////////////////////////////////////////////
------------------------------------------ ESP -----------------------------------------------
//////////////////////////////////////////////////////////////////////////////////////////////


        local function espbox()
            if GetConVarNumber("ESPBOX_enabled") == 1 then
                local function coordinates( ent )
                local min, max = ent:OBBMins(), ent:OBBMaxs()
                local corners = {
                     Vector( min.x, min.y, min.z ),
                     Vector( min.x, min.y, max.z ),
                     Vector( min.x, max.y, min.z ),
                     Vector( min.x, max.y, max.z ),
                     Vector( max.x, min.y, min.z ),
                     Vector( max.x, min.y, max.z ),
                     Vector( max.x, max.y, min.z ),
                     Vector( max.x, max.y, max.z )
                    }

                    local minX, minY, maxX, maxY = ScrW() * 2, ScrH() * 2, 0, 0
                    for _, corner in pairs( corners ) do
                     local onScreen = ent:LocalToWorld( corner ):ToScreen()
                     minX, minY = math.min( minX, onScreen.x ), math.min( minY, onScreen.y )
                     maxX, maxY = math.max( maxX, onScreen.x ), math.max( maxY, onScreen.y )
                    end

                    return minX, minY, maxX, maxY
                    end

                     for k,v in pairs(player.GetAll()) do
                         if v ~=LocalPlayer() and v:Alive() and v:IsValid() and v:Health() > 0 then
                      local x1,y1,x2,y2 = coordinates(v)
                       surface.SetDrawColor(rainbow.R,rainbow.G,rainbow.B)

                            local diff = math.abs(x2 - x1);
                            local diff2 = math.abs(y2 - y1);

                             surface.SetDrawColor(0,0,0)
                             surface.DrawLine(x1,y1,x1+(diff*0.225),y1)
                             surface.DrawLine(x1,y1,x1,y1+(diff2*0.225))
                             surface.DrawLine(x1,y2,x1+(diff*0.225),y2)
                             surface.DrawLine(x1,y2,x1,y2-(diff2*0.225))
                             surface.DrawLine(x2,y1,x2-(diff*0.225),y1)
                             surface.DrawLine(x2,y1,x2,y1+(diff2*0.225))
                             surface.DrawLine(x2,y2,x2-(diff*0.225),y2)
                             surface.DrawLine(x2,y2,x2,y2-(diff2*0.225))
                             surface.SetDrawColor(GetConVarNumber("ESP-R"), GetConVarNumber("ESP-G"), GetConVarNumber("ESP-B"))
                             surface.DrawLine(x1+1,y1+1,x1+(diff*0.225),y1+1)
                             surface.DrawLine(x1+1,y1+1,x1+1,y1+(diff2*0.225))
                             surface.DrawLine(x1+1,y2-1,x1+(diff*0.225),y2-1)
                             surface.DrawLine(x1+1,y2-1,x1+1,y2-(diff2*0.225))
                             surface.DrawLine(x2-1,y1+1,x2-(diff*0.225),y1+1)
                             surface.DrawLine(x2-1,y1+1,x2-1,y1+(diff2*0.225))
                             surface.DrawLine(x2-1,y2-1,x2-(diff*0.225),y2-1)
                             surface.DrawLine(x2-1,y2-1,x2-1,y2-(diff2*0.225))
                    end
                end
            end
        end
        hook.Add("HUDPaint", "espbox", espbox)

//////////////////////////////////////////////////////////////////////////////////////////////
------------------------------------------ ENTESP --------------------------------------------
//////////////////////////////////////////////////////////////////////////////////////////////


        local function entespbox()
          if GetConVarNumber("ENTESPBOX_enabled") == 1 then
              local function coordinates( ent )
              local min, max = ent:OBBMins(), ent:OBBMaxs()
              local corners = {
                  Vector( min.x, min.y, min.z ),
                  Vector( min.x, min.y, max.z ),
                  Vector( min.x, max.y, min.z ),
                  Vector( min.x, max.y, max.z ),
                  Vector( max.x, min.y, min.z ),
                  Vector( max.x, min.y, max.z ),
                  Vector( max.x, max.y, min.z ),
                  Vector( max.x, max.y, max.z )
                }

                local minX, minY, maxX, maxY = ScrW() * 2, ScrH() * 2, 0, 0
                for _, corner in pairs( corners ) do
                  local onScreen = ent:LocalToWorld( corner ):ToScreen()
                  minX, minY = math.min( minX, onScreen.x ), math.min( minY, onScreen.y )
                  maxX, maxY = math.max( maxX, onScreen.x ), math.max( maxY, onScreen.y )
                end

                return minX, minY, maxX, maxY
              end

              for k,v in pairs(ents.FindByClass("prop_*")) do
                local x1,y1,x2,y2 = coordinates(v)

                local diff = math.abs(x2 - x1);
                local diff2 = math.abs(y2 - y1);

                 surface.SetDrawColor(0,0,0)
                 draw.SimpleText("Prop", "MenuLabel", x1+(diff*0.225), y1-(diff*0.225), Color(GetConVarNumber("Menu-R"), GetConVarNumber("Menu-G"), GetConVarNumber("Menu-B"), 255), TEXT_ALIGN_BOTTOM)
                 surface.DrawLine(x1,y1,x1+(diff*0.225),y1)
                 surface.DrawLine(x1,y1,x1,y1+(diff2*0.225))
                 surface.DrawLine(x1,y2,x1+(diff*0.225),y2)
                 surface.DrawLine(x1,y2,x1,y2-(diff2*0.225))
                 surface.DrawLine(x2,y1,x2-(diff*0.225),y1)
                 surface.DrawLine(x2,y1,x2,y1+(diff2*0.225))
                 surface.DrawLine(x2,y2,x2-(diff*0.225),y2)
                 surface.DrawLine(x2,y2,x2,y2-(diff2*0.225))
                 surface.SetDrawColor(GetConVarNumber("ESP-R"), GetConVarNumber("ESP-G"), GetConVarNumber("ESP-B"))
                 surface.DrawLine(x1+1,y1+1,x1+(diff*0.225),y1+1)
                 surface.DrawLine(x1+1,y1+1,x1+1,y1+(diff2*0.225))
                 surface.DrawLine(x1+1,y2-1,x1+(diff*0.225),y2-1)
                 surface.DrawLine(x1+1,y2-1,x1+1,y2-(diff2*0.225))
                 surface.DrawLine(x2-1,y1+1,x2-(diff*0.225),y1+1)
                 surface.DrawLine(x2-1,y1+1,x2-1,y1+(diff2*0.225))
                 surface.DrawLine(x2-1,y2-1,x2-(diff*0.225),y2-1)
                 surface.DrawLine(x2-1,y2-1,x2-1,y2-(diff2*0.225))
              end
            end
          end
          hook.Add("HUDPaint", "entespbox", entespbox)


//////////////////////////////////////////////////////////////////////////////////////////////
------------------------------------------ weapon --------------------------------------------
//////////////////////////////////////////////////////////////////////////////////////////////

        local function wepespbox()
                if GetConVarNumber("WEPESP_enabled") == 1 then
                  local function coordinates( ent )
                  local min, max = ent:OBBMins(), ent:OBBMaxs()
                  local corners = {
                       Vector( min.x, min.y, min.z ),
                       Vector( min.x, min.y, max.z ),
                       Vector( min.x, max.y, min.z ),
                       Vector( min.x, max.y, max.z ),
                       Vector( max.x, min.y, min.z ),
                       Vector( max.x, min.y, max.z ),
                       Vector( max.x, max.y, min.z ),
                       Vector( max.x, max.y, max.z )
                      }

                      local minX, minY, maxX, maxY = ScrW() * 2, ScrH() * 2, 0, 0
                      for _, corner in pairs( corners ) do
                       local onScreen = ent:LocalToWorld( corner ):ToScreen()
                       minX, minY = math.min( minX, onScreen.x ), math.min( minY, onScreen.y )
                       maxX, maxY = math.max( maxX, onScreen.x ), math.max( maxY, onScreen.y )
                      end

                      return minX, minY, maxX, maxY
                      end

                       for k,v in pairs(ents.FindByClass("m9k_*")) do

                        local x1,y1,x2,y2 = coordinates(v)
                         surface.SetDrawColor(255,0,0)

                         local diff = math.abs(x2 - x1);
                         local diff2 = math.abs(y2 - y1);
                         local weapon = v:GetPrintName()

                          surface.SetDrawColor(0,0,0)
                          draw.SimpleText(weapon, "MenuLabel", x1+(diff*0.225), y1-(diff*0.225), Color(255,0,0,255), TEXT_ALIGN_BOTTOM)
                          surface.DrawLine(x1,y1,x1+(diff*0.225),y1)
                          surface.DrawLine(x1,y1,x1,y1+(diff2*0.225))
                          surface.DrawLine(x1,y2,x1+(diff*0.225),y2)
                          surface.DrawLine(x1,y2,x1,y2-(diff2*0.225))
                          surface.DrawLine(x2,y1,x2-(diff*0.225),y1)
                          surface.DrawLine(x2,y1,x2,y1+(diff2*0.225))
                          surface.DrawLine(x2,y2,x2-(diff*0.225),y2)
                          surface.DrawLine(x2,y2,x2,y2-(diff2*0.225))
                          surface.SetDrawColor(255,0,0)
                          surface.DrawLine(x1+1,y1+1,x1+(diff*0.225),y1+1)
                          surface.DrawLine(x1+1,y1+1,x1+1,y1+(diff2*0.225))
                          surface.DrawLine(x1+1,y2-1,x1+(diff*0.225),y2-1)
                          surface.DrawLine(x1+1,y2-1,x1+1,y2-(diff2*0.225))
                          surface.DrawLine(x2-1,y1+1,x2-(diff*0.225),y1+1)
                          surface.DrawLine(x2-1,y1+1,x2-1,y1+(diff2*0.225))
                          surface.DrawLine(x2-1,y2-1,x2-(diff*0.225),y2-1)
                          surface.DrawLine(x2-1,y2-1,x2-1,y2-(diff2*0.225))
                     end
                   end
                 end

          hook.Add("HUDPaint", "wepespbox", wepespbox)

//////////////////////////////////////////////////////////////////////////////////////////////
---------------------------------------- NAMEESP ---------------------------------------------
//////////////////////////////////////////////////////////////////////////////////////////////

    local function nameesp()
        if GetConVarNumber("NAMEESP_enabled") == 1 then
            for k,v in pairs ( player.GetAll() ) do
                if v ~=LocalPlayer() and v:Alive() and v:IsValid() and v:Health() > 0 then
                    local origin = v:GetPos()
                    local pos = ( origin + Vector( 0, 0, 90 )):ToScreen()
                    local getName = "N: " .. v:Nick()
                    local getHealth = "H: " .. v:Health()
                    local getGroup = "G: " .. v:GetUserGroup()
                    local ply = LocalPlayer()
                    draw.SimpleTextOutlined(getName, "ESPFont", pos.x, pos.y-30, Color( GetConVarNumber("ESP-R"),GetConVarNumber("ESP-G"),GetConVarNumber("ESP-B") ), 1, 1, 1, Color(0, 0, 0 ))
                    draw.SimpleTextOutlined(getGroup, "ESPFont", pos.x, pos.y-15, Color( GetConVarNumber("ESP-R"),GetConVarNumber("ESP-G"),GetConVarNumber("ESP-B") ), 1, 1, 1, Color(0, 0, 0 ))
                    draw.SimpleTextOutlined(getHealth, "ESPFont", pos.x, pos.y, Color( GetConVarNumber("ESP-R"),GetConVarNumber("ESP-G"),GetConVarNumber("ESP-B") ), 1, 1, 1, Color(0, 0, 0))
                end
            end
        end
    end
    hook.Add("HUDPaint", "nameesp", nameesp)
//////////////////////////////////////////////////////////////////////////////////////////////
-------------------------------- RAINBOWNAMEESP ---------------------------------------------
//////////////////////////////////////////////////////////////////////////////////////////////


    local function rainbownameesp()
        if GetConVarNumber("RAINBOWNAMEESP_enabled") == 1 then
            for k,v in pairs ( player.GetAll() ) do
                if v ~=LocalPlayer() and v:Alive() and v:IsValid() and v:Health() > 0 then
                    local origin = v:GetPos()
                    local pos = ( origin + Vector( 0, 0, 90 )):ToScreen()
                    local getName = "N: " .. v:Nick()
                    local getHealth = "H: " .. v:Health()
                                        local getGroup = "G: " .. v:GetUserGroup()
                    local ply = LocalPlayer()
                    draw.SimpleTextOutlined(getName, "ESPFont", pos.x, pos.y-30, Color( rainbow.R,rainbow.G,rainbow.B ), 1, 1, 1, Color(0, 0, 0 ))
                                        draw.SimpleTextOutlined(getGroup, "ESPFont", pos.x, pos.y-15, Color( rainbow.R,rainbow.G,rainbow.B ), 1, 1, 1, Color(0, 0, 0 ))
                    draw.SimpleTextOutlined(getHealth, "ESPFont", pos.x, pos.y, Color( rainbow.R,rainbow.G,rainbow.B ), 1, 1, 1, Color(0, 0, 0))
                end
            end
        end
    end
    hook.Add("HUDPaint", "rainbownameesp", rainbownameesp)

//////////////////////////////////////////////////////////////////////////////////////////////
-------------------------------------- CROSSHAIR ---------------------------------------------
//////////////////////////////////////////////////////////////////////////////////////////////

    hook.Add( "HUDPaint", "crosshair", function()
      rainbow = {}
      rainbow.R = math.sin(CurTime() * 4) * 127 + 128
      rainbow.G = math.sin(CurTime() * 4 + 2) * 127 + 128
      rainbow.B = math.sin(CurTime() * 4 + 4) * 127 + 128

      surface.SetDrawColor(199,0,0)
      local x = ScrW() * 0.5
      local y = ScrH() * 0.5
      surface.DrawLine( x + 5, y, x - 5, y )
      surface.DrawLine( x, y + 5, x, y - 5 )
      end)

//////////////////////////////////////////////////////////////////////////////////////////////
------------------------------------------ ASUS ----------------------------------------------
//////////////////////////////////////////////////////////////////////////////////////////////
    local function asus()
        local mattable = {};

        	if(#mattable == 0) then
        		for k,v in next, game.GetWorld():GetMaterials() do
        			mattable[#mattable + 1] = Material(v);
        		end

        	for k,v in next, mattable do
        		v:SetFloat("$alpha", GetConVarNumber("ASUS")/100 + 0.01 || 1);
        end
      end
    end
        hook.Add("RenderScene", "asus", asus)
//////////////////////////////////////////////////////////////////////////////////////////////
------------------------------------------ FOV -----------------------------------------------
//////////////////////////////////////////////////////////////////////////////////////////////

      local function fieldofview()
        view = {}
        view.fov = GetConVarNumber("fieldofview")
        return view
      end
      hook.Add("CalcView", "fov", fieldofview)

//////////////////////////////////////////////////////////////////////////////////////////////
----------------------------------------- NORECOIL -------------------------------------------
//////////////////////////////////////////////////////////////////////////////////////////////
    local function norec(ang)
	     if GetConVarNumber("RECOIL_enabled") == 1 then
         return ang + pm.GetPunchAngle(me); end
	        return ang;
        end

//////////////////////////////////////////////////////////////////////////////////////////////
--------------------------------------- WEAPONDUPE -------------------------------------------
//////////////////////////////////////////////////////////////////////////////////////////////
    function dupeweapon()
            timer.Simple( 0.4744, function()
            RunConsoleCommand("say", "/drop")
        end)
        timer.Simple( 1.4135, function()
            RunConsoleCommand("say", "/sleep")
        end)
        timer.Simple( 7, function()
            RunConsoleCommand("say", "/sleep")
        end)
      end
//////////////////////////////////////////////////////////////////////////////////////////////
--------------------------------------- BHOP -------------------------------------------------
//////////////////////////////////////////////////////////////////////////////////////////////

    local function BHOP(ply)
        if(GetConVarNumber("BHOP_enabled") == 1) then
            if(ply:KeyDown(IN_JUMP) && !LocalPlayer():IsOnGround()) then
              ply:RemoveKey(IN_JUMP);
                if(GetConVarNumber("AUTOSTRAFE_enabled") == 1) then
                    if(ply:GetMouseX() > 1 || ply:GetMouseX() < -1) then
                        ply:SetSideMove(ply:GetMouseX() > 1 && 400 || -400);
                      else
                        ply:SetForwardMove(5850 / LocalPlayer():GetVelocity():Length2D());
                        ply:SetSideMove((ply:CommandNumber() % 2 == 0) && -400 || 400);
                      end
                    end
                  elseif(ply:KeyDown(IN_JUMP) && GetConVarNumber("AUTOSTRAFE_enabled") == 1) then
                    ply:SetForwardMove(10000)
                  end
                end
              end
                hook.Add("CreateMove", "bhopp", function(ply)
                  BHOP(ply);
                end);

//////////////////////////////////////////////////////////////////////////////////////////////
--------------------------------------- OPEN MENU ---------------------------------------------
//////////////////////////////////////////////////////////////////////////////////////////////


hook.Add("Think", "menu", function()
    if(input.IsKeyDown(KEY_INSERT) && !insertdown) then
        if(menuframe) then
            menuframe:Close();
            menuframe = nil;
        else
            menuframe = Menu();
        end
    end
    insertdown = input.IsKeyDown(KEY_INSERT);
end);
