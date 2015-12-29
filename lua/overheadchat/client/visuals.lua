local chatIcon = Material("icon16/comment.png","noclamp smooth")
local rainbowCVarOverride = CreateClientConVar("overheadchat_rainbow","0",true,false)

hook.Add("PostDrawTranslucentRenderables","swadical.OverheadChat.Draw",function()
    OverheadChat.Rainbow = rainbowCVarOverride:GetBool()
    local font = "DermaLarge"
    local textDrawCol,backgroundDrawCol

    if OverheadChat.Rainbow then
        textDrawCol,backgroundDrawCol = HSVToColor((SysTime()*100)%360,0.65,0.9),Color(255,255,255,50)
    else
        textDrawCol,backgroundDrawCol = Color(0,0,0,240),Color(255,255,255,50)
    end

    for _,ply in ipairs(player.GetAll()) do
        local text = ply:GetChatStore():GetText()
        if text == "" then continue end

        local ang = ply:EyeAngles()
        ang.p = 0
        ang.y = ang.y + 90
        ang.r = ang.r + 90


        cam.Start3D2D(ply:GetPos() + Vector(0,0,85),ang,0.1)
        	surface.SetFont(font)
        	local w,h = surface.GetTextSize(text)
            local padding = 30
            local extra = 10
            render.PushFilterMag(TEXFILTER.ANISOTROPIC)
                draw.RoundedBox(1,-w/2-padding,0,w+padding + extra,h,backgroundDrawCol)
                draw.DrawText(text,font,4,-1,textDrawCol,TEXT_ALIGN_CENTER)
            render.PopFilterMag(TEXFILTER.ANISOTROPIC)
            surface.SetMaterial(chatIcon)
            surface.SetDrawColor(255,255,255)
	        surface.DrawTexturedRect(-padding+1-w/2,(h-h/1.1),h/1.1,h/1.1)
        cam.End3D2D()
    end
end)
