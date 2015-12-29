hook.Add("FinishChat","swadical.OverheadChat.ResetChatStore",function()
    OverheadChat:CommitChatText("")
end)

local echoCommandsOverride = CreateClientConVar("overheadchat_echocommands","0",true,false)
hook.Add("ChatTextChanged","swadical.OverheadChat.UpdateChatStore",function(text)
    if text:sub(1,1):match("[^%!%/]") or echoCommandsOverride:GetBool() then
        OverheadChat:CommitChatText(text)
    end
end)
