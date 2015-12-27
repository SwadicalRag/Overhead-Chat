hook.Add("FinishChat","swadical.OverheadChat.ResetChatStore",function()
    OverheadChat:CommitChatText("")
end)

hook.Add("ChatTextChanged","swadical.OverheadChat.UpdateChatStore",function(text)
    OverheadChat:CommitChatText(text)
end)
