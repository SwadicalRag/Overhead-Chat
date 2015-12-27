net.Receive(OverheadChat.NetMessageID,function(len)
    local ply = net.ReadEntity()

    ply:GetChatStore():SetText(net.ReadString())
end)

function OverheadChat:CommitChatText(text)
    if not IsValid(LocalPlayer()) then return end
    net.Start(self.NetMessageID)
        net.WriteString(text)
    net.SendToServer()
    LocalPlayer():GetChatStore():SetText(text)
end
