OverheadChat:logDebug("Setting up ChatStore library...")

function OverheadChat:NewChatStore(ply)
    local chatStore = {}
    chatStore.ply = ply
    chatStore.text = ""

    function chatStore:SetText(text)
        self.text = text:sub(1,33)
    end

    function chatStore:isOverflowed()
        return #self.text == 33
    end

    function chatStore:GetText()
        if self:isOverflowed() then
            return self.text:sub(1,32).."..."
        else
            return self.text
        end
    end

    return chatStore
end

do
    local Player = FindMetaTable("Player")

    function Player:GetChatStore()
        if not self.chatStore then
            self.chatStore = OverheadChat:NewChatStore(self)
            OverheadChat:logDebug("A ChatStore object was created for "..self:Nick())
        end
        return self.chatStore
    end
end
