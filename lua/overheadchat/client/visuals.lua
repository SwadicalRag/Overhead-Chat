local chatIcon = Material("icon16/comment.png","noclamp smooth")

hook.Add("PostDrawTranslucentRenderables","swadical.OverheadChat.Draw",function()
    local font = "DermaDefault"
    for _,ply in ipairs(player.GetAll()) do
        local text = ply:GetChatStore():GetText()
        if text == "" then continue end

        local ang = ply:EyeAngles()
        ang.p = 0
        ang.y = ang.y + 90
        ang.r = ang.r + 90


        cam.Start3D2D(ply:GetPos() + Vector(0,0,85),ang,1)
        	surface.SetFont(font)
        	local w,h = surface.GetTextSize(text)
            local extra = 14
            draw.RoundedBox(1,-w/2-extra,0,w+extra + 1,h,Color(0,0,0,150))
            draw.DrawText(text,font,0,-1,Color(255,255,255),TEXT_ALIGN_CENTER)
            surface.SetMaterial(chatIcon)
            surface.SetDrawColor(255,255,255)
	        surface.DrawTexturedRect(-13-w/2,(h-h/1.1),h/1.1,h/1.1)
        cam.End3D2D()
    end
end)
