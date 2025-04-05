---@param title string Titlen på notify
---@param description string Description på notify
---@param type string Typen af notify (Success, error, info, warn)
function notify(title, description, type, duration, position)
    lib.notify({
        title = title,
        description = description,
        type = type,
        duration = duration,
        position = position
    })
end

---@param ent any
---@param options any
---@param distance any
function targetlocalEntity(ent, options, distance)
    for _, option in ipairs(options) do
        option.distance = distance
        option.onSelect = option.action
        option.action = nil
    end
    exports.ox_target:addLocalEntity(ent, options)
end

---@param text string Text på job blippen
---@param sprite number Sprite på job blippen
---@param colour number Farven på job blippen
---@param scale number Størelse på job blippen
function CreateJobBlip(text, sprite, colour, scale, x, y, z)
    local blip = AddBlipForCoord(x, y, z)
    SetBlipSprite(blip, sprite)
    SetBlipColour(blip, colour)
    AddTextEntry('MYBLIP', text)
    BeginTextCommandSetBlipName('MYBLIP')
    AddTextComponentSubstringPlayerName(name)
    EndTextCommandSetBlipName(blip)
    SetBlipScale(blip, scale)
    SetBlipAsShortRange(blip, true)
    SetBlipRoute(blip, true)
    SetBlipRouteColour(blip, 5)
    return blip
end
---@param ped any NPCen der skal sige noget
function Speech(ped, speechName, speechParam)
    PlayAmbientSpeech1(ped, speechName, speechParam)
end
