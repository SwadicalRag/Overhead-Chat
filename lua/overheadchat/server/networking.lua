util.AddNetworkString(OverheadChat.NetMessageID)

net.Receive(OverheadChat.NetMessageID,function(len,ply)
    ply:GetChatStore():SetText(net.ReadString())
    net.Start(OverheadChat.NetMessageID)
        net.WriteEntity(ply)
        net.WriteString(ply:GetChatStore():GetText())
    net.Broadcast()
end)
