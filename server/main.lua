---@diagnostic disable: lowercase-global

if not lib.checkDependency('ox_lib', '3.30.0', true) then return end

if Config.VersionCheck then
    lib.versionCheck('AdamaStark-N7/stark_harness_v3')
end

local QBCore = exports['qb-core']:GetCoreObject()

function hasHarness(plate)
    local result = MySQL.query.await('SELECT * FROM player_vehicles WHERE plate = ?', { plate })
    harnessInfo = nil
    if result ~= nil then
        if #(result) > 0 then
            harnessInfo = json.decode(result[1].harness)
        end
    end
    return harnessInfo
end

lib.callback.register('stark_harness:server:getHarnessInfo', function(source, plate, harnessInfo)
    if plate == nil then return end
    local harnessInfo = hasHarness(plate)
    return harnessInfo
end)

RegisterNetEvent('stark_harness:server:installHarness', function(harnessInfo, plate)
    local src = source
    if plate == nil then return end
    local Player = QBCore.Functions.GetPlayer(src)
    local result = MySQL.query.await('SELECT * FROM player_vehicles WHERE plate = ?', { plate })
    if result ~= nil and #(result) > 0 then
        if not Config.MechanicOnly then
            if harnessInfo ~= nil then
                MySQL.update('UPDATE player_vehicles SET harness = ? WHERE plate = ?', { json.encode(harnessInfo), plate })
                if Config.Inventory == 'qb' then
                    exports['qb-inventory']:RemoveItem(src, 'harness', 1, false)
                elseif Config.Inventory == 'ps' then
                    exports['ps-inventory']:RemoveItem(src, 'harness', 1, false)
                elseif Config.Inventory == 'ox' then
                    local ox_inventory = exports.ox_inventory
                    ox_inventory:RemoveItem(src, 'harness', 1)
                end
                if Config.Notify == 'qb' then
                    TriggerClientEvent('QBCore:Notify', src, locale('info.successful_install_description'), 'success')
                elseif Config.Notify == 'ox' then
                    TriggerClientEvent('ox_lib:notify', src, {
                        title = locale('info.successful_install_title'),
                        description = locale('info.successful_install_description'),
                        postion = 'center-right',
                        type = 'success'
                    })
                elseif Config.Notify == 'lation' then
                    exports.lation_ui:notify({
                        title = locale('info.successful_install_title'),
                        message = locale('info.successful_install_description'),
                        type = 'success',
                        postion = 'center-right'
                    })
                end
            end
        else
            if (result[1].citizenid == player.PlayerData.citizenid) then
                if harnessInfo ~= nil then
                    MySQL.update('UPDATE player_vehicles SET harness = ? WHERE plate = ?', { json.encode(harnessInfo), plate })
                    if Config.Inventory == 'qb' then
                        exports['qb-inventory']:RemoveItem(src, 'harness', 1, false)
                    elseif Config.Inventory == 'ps' then
                        exports['ps-inventory']:RemoveItem(src, 'harness', 1, false)
                    elseif Config.Inventory == 'ox' then
                        local ox_inventory = exports.ox_inventory
                        ox_inventory:RemoveItem(src, 'harness', 1)
                    end
                    if Config.Notify == 'qb' then
                        TriggerClientEvent('QBCore:Notify', src, locale('info.successful_install_description'), 'success')
                    elseif Config.Notify == 'ox' then
                        TriggerClientEvent('ox_lib:notify', src, {
                            title = locale('info.successful_install_title'),
                            description = locale('info.successful_install_description'),
                            postion = 'center-right',
                            type = 'success'
                        })
                    elseif Config.Notify == 'lation' then
                        exports.lation_ui:notify({
                            title = locale('info.successful_install_title'),
                            message = locale('info.successful_install_description'),
                            type = 'success',
                            postion = 'center-right'
                        })
                    end
                end
            elseif (Player.PlayerData.job.type == Config.MechanicJobType) then
                if harnessInfo ~= nil then
                    MySQL.update('UPDATE player_vehicles SET harness = ? WHERE plate = ?', { json.encode(harnessInfo), plate })
                    if Config.Inventory == 'qb' then
                        exports['qb-inventory']:RemoveItem(src, 'harness', 1, false)
                    elseif Config.Inventory == 'ps' then
                        exports['ps-inventory']:RemoveItem(src, 'harness', 1, false)
                    elseif Config.Inventory == 'ox' then
                        local ox_inventory = exports.ox_inventory
                        ox_inventory:RemoveItem(src, 'harness', 1)
                    end
                    if Config.Notify == 'qb' then
                        TriggerClientEvent('QBCore:Notify', src, locale('info.successful_install_description'), 'success')
                    elseif Config.Notify == 'ox' then
                        TriggerClientEvent('ox_lib:notify', src, {
                            title = locale('info.successful_install_title'),
                            description = locale('info.successful_install_description'),
                            postion = 'center-right',
                            type = 'success'
                        })
                    elseif Config.Notify == 'lation' then
                        exports.lation_ui:notify({
                            title = locale('info.successful_install_title'),
                            message = locale('info.successful_install_description'),
                            type = 'success',
                            postion = 'center-right'
                        })
                    end
                end
            else
                if Config.Notify == 'qb' then
                    TriggerClientEvent('QBCore:Notify', src, locale('error.unsuccessful_install_description'), 'error')
                elseif Config.Notify == 'ox' then
                    TriggerClientEvent('ox_lib:notify', src {
                        title = locale('error.unsuccessful_install_title'),
                        description = locale('error.unsuccessful_install_description'),
                        postion = 'center-right',
                        type = 'error'
                    })
                elseif Config.Notify == 'lation' then
                    exports.lation_ui:notify({
                        title = locale('error.unsuccessful_install_title'),
                        message = locale('error.unsuccessful_install_description'),
                        type = 'error',
                        postion = 'center-right'
                    })
                end
            end
        end
    elseif #(result) <= 0 then
        if Config.Notify == 'qb' then
            TriggerClientEvent('QBCore:Notify', src, locale('error.unsuccessful_install_description'), 'error')
        elseif Config.Notify == 'ox' then
            TriggerClientEvent('ox_lib:notify', src {
                title = locale('error.unsuccessful_install_title'),
                description = locale('error.unsuccessful_install_description'),
                postion = 'center-right',
                type = 'error'
            })
        elseif Config.Notify == 'lation' then
            exports.lation_ui:notify({
                title = locale('error.unsuccessful_install_title'),
                message = locale('error.unsuccessful_install_description'),
                type = 'error',
                postion = 'center-right'
            })
        end
    else
        if Config.Notify == 'qb' then
            TriggerClientEvent('QBCore:Notify', src, locale('error.installation_error_description'), 'error')
        elseif Config.Notify == 'ox' then
            TriggerClientEvent('ox_lib:notify', src, {
                title = locale('error.installlation_error_title'),
                description = locale('error.installation_error_description'),
                postion = 'center-right',
                type = 'error'
            })
        elseif Config.Notify == 'lation' then
            exports.lation_ui:notify({
                title = locale('error.installlation_error_title'),
                message = locale('error.installation_error_description'),
                type = 'error',
                postion = 'center-right'
            })
        end
    end
end)
