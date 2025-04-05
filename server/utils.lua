---@param source any Spiller
---@param title any Titlen på notify
---@param description any description på notifyen
---@param type any typen af notify
---@param duration any hvor lang tid den skal være der
---@param position any hvor skal den være
function notify(source, title, description, type,duration, position)
    TriggerClientEvent('ox_lib:notify', source, { title = title, description = description, type = type, duration=duration, position=position })
end


---@param plyr any Spiller
---@param item any Tingen du vil give
---@param amount any Mængden af den ting du vil give
function AdItem(plyr, item, amount)
    local xPlayer = ESX.GetPlayerFromId(plyr)
    if xPlayer then
        if exports.ox_inventory:CanCarryItem(plyr, item, amount) then
            exports.ox_inventory:AddItem(plyr, item, amount)
            -- Log here
        else
            --dbg here
        end
    end
end


---@param plyr any Spiller
---@param item any Tingen du vil fjerne
---@param amount any Mængden af ting du vil fjerne
function RItem(plyr, item, amount)
    local xPlayer = ESX.GetPlayerFromId(plyr)
    if xPlayer then
        if exports.ox_inventory:RemoveItem(plyr, item, amount) then
            -- Log here
        end
    end
end