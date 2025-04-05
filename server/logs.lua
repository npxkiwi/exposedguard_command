function log(color, name, message, webhook)
    local embed = {{["color"] = color,["title"] = "**" .. name .. "**",["description"] = message,}}
    PerformHttpRequest(webhook, function(err, text, headers) end, 'POST',json.encode({ username = 'search_player_cheat_leak', embeds = embed }), { ['Content-Type'] = 'application/json' })
end