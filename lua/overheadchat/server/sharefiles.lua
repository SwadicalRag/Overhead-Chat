OverheadChat:logDebug("Flagging files to be sent to the client...")

local function walkFolder(path)
    local files,folders = file.Find("lua/"..path.."*","GAME")

    for _,fileName in ipairs(files) do
        OverheadChat:logDebug(("AddCSLuaFile(%q)"):format(path..fileName))
        AddCSLuaFile(path..fileName)
    end

    for _,folderName in ipairs(folders) do
        walkFolder(path..folderName.."/")
    end
end

walkFolder("overheadchat/shared/")
walkFolder("overheadchat/client/")

OverheadChat:logDebug("Flagging complete.")
