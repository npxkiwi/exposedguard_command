ESX = exports["es_extended"]:getSharedObject()

RegisterCommand('search', function(source, args)
    if not args[1] or not args[2] then
        return notify(source, "Exposedguard", "\n/search discord <discord_id>  \n /search id <server_id>", NotifyCFG.Type["Error"], 5000, NotifyCFG.Pos["top"])
    end
    local function handleLeakResponse(playerSrc, discordId)
        PerformHttpRequest("https://api.exposedguard.dk/leak/get/" .. discordId, function(status, response)
            if status ~= 200 then return dbg("HTTP Error: " .. status) end

            local data = json.decode(response)
            if data.leak and #data.leak > 0 then
                for _, leak in ipairs(data.leak) do
                    TriggerClientEvent('ox_lib:alertDialog', playerSrc, {
                        header = 'Exposedguard Not Clean',
                        content = ('Cheat: %s  \nUsername: %s  \nDiscord ID: %s'):format(
                            leak.cheat, leak.discord_user_name, leak.discord_user_id),
                        centered = true, cancel = false
                    })
                    log(DsCfg.Colors["Red"], "Exposedguard Not Clean", ('Cheat: %s  \nUsername: %s  \nDiscord ID: %s'):format(leak.cheat, leak.discord_user_name, leak.discord_user_id), DsCfg.CheaterDetected)
                end
            else
                notify(playerSrc, "Exposedguard", "Clean. No leaks found on that player.", NotifyCFG.Type["Success"], 5000, NotifyCFG.Pos["top"])
            end
        end, "GET")
    end
    if args[1]:lower() == "discord" then
        handleLeakResponse(source, args[2])
    elseif args[1]:lower() == "id" then
        local targetId = tonumber(args[2])
        if not targetId or not GetPlayerName(targetId) then
            return notify(source, "Exposedguard", "Invalid player ID.", NotifyCFG.Type["Error"], 5000, NotifyCFG.Pos["top"])
        end
        local discord
        for i = 0, GetNumPlayerIdentifiers(targetId) - 1 do
            local identifier = GetPlayerIdentifier(targetId, i)
            if identifier and identifier:find("discord:") then
                discord = identifier:sub(9)
                break
            end
        end
        if not discord then
            return notify(source, "Exposedguard", "Discord ID not found for that player.", NotifyCFG.Type["Error"], 5000, NotifyCFG.Pos["top"])
        end
        handleLeakResponse(source, discord)
    else
        notify(source, "Exposedguard", "Invalid search type. Use 'discord' or 'id'.", NotifyCFG.Type["Error"], 5000, NotifyCFG.Pos["top"])
    end
end, false)
