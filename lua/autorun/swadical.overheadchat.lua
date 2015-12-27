OverheadChat = {}

OverheadChat.DEBUG = false
OverheadChat.VERSION = "0.1.0"
OverheadChat.startTime = SysTime()

function OverheadChat:log(msg)
    MsgC(Color(0,255,255),("[OverheadChat] [OUT] [T+%.02fs] "):format(SysTime() - self.startTime),Color(255,255,255),msg,"\n")
end

function OverheadChat:logDebug(msg)
    if not self.DEBUG then return end
    MsgC(Color(255,255,0),("[OverheadChat] [DBG] [T+%.02fs] "):format(SysTime() - self.startTime),Color(255,255,255),msg,"\n")
end

function OverheadChat:logError(msg)
    MsgC(Color(255,0,0),("[OverheadChat] [ERR] [T+%.02fs] "):format(SysTime() - self.startTime),Color(255,255,255),msg,"\n")
end

OverheadChat:log("Initialising...")

include("overheadchat/shared/constants.lua")
include("overheadchat/shared/chatstorage.lua")

include("overheadchat/"..((SERVER and "server") or "client").."/init.lua")

OverheadChat:log("OverheadChat "..OverheadChat.VERSION.." has successfully initialised.")
