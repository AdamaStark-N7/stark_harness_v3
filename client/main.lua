---@diagnostic disable: lowercase-global

if not lib.checkDependency('ox_lib', '3.30.0', true) then return end

local QBCore = exports['qb-core']:GetCoreObject()

RegisterNetEvent('stark_harness:client:InstallHarness', function(ItemData)
    local Player = PlayerPedId()
    local Vehicle = GetVehiclePedIsIn(Player, false)
    if GetPedInVehicleSeat(Vehicle, -1) == Player then
        local Class = GetVehicleClass(Vehicle)
        local Plate = lib.getVehicleProperties(Vehicle).plate
        if Vehicle and Class ~= 8 and Class ~= 13 and Class ~= 14 then
            lib.callback('stark_harness:server:GetHarnessInfo', false, function(harnessInfo)
                if harnessInfo == nil then
                    if Config.Progress == 'qb' then
                        QBCore.Functions.Progressbar(locale('info.progress_name'), locale('info.progress_label'), Config.InstallTime, false, true, {
                                disableMovement = true,
                                disableCarMovement = true,
                                disableMouse = false,
                                disableCombat = true,
                            }, {}, {}, {}, function() -- DONE
                                if exports['qb-smallresources']:hasSeatbelt() then
                                    TriggerEvent('seatbelt:client:UseSeatbelt')
                                end
                                if Config.Inventory == 'qb' then
                                    harnessUses = ItemData.info.uses
                                    harnessDamage = ItemData.info.damage
                                elseif Config.Inventory == 'ps' then
                                    harnessUses = ItemData.info.uses
                                    harnessDamage = ItemData.info.damage
                                elseif Config.Inventory == 'ox' then
                                    harnessUses = ItemData.metadata.uses
                                    harnessDamage = ItemData.metadata.damage
                                end
                                if harnessUses == nil then
                                    harnessUses = Config.HarnessUses
                                end

                                damage = 100

                                if harnessDamage ~= nil then
                                    damage = harnessDamage
                                else
                                    if Config.Inventory == 'qb' then
                                        ItemData.info.damage = damage
                                    elseif Config.Inventory == 'ps' then
                                        ItemData.info.damage = damage
                                    elseif Config.Inventory == 'ox' then
                                        ItemData.metadata.damage = damage
                                    end
                                end
                                installedHarnessInfo = { uses = harnessUses, damage = damage }
                                TriggerServerEvent('stark_harness:server:InstallHarness', installedHarnessInfo, Plate)
                            end, function() -- CANCELLED
                                if Config.Notify == 'qb' then
                                    QBCore.Functions.Notify(locale('error.cancel_installation_description'), 'error')
                                elseif Config.Notify == 'ox' then
                                    lib.notify({
                                        title = locale('error.cancel_installation_title'),
                                        description = locale('error.cancel_installation_description'),
                                        position = 'center-right',
                                        type = 'error'
                                    })
                                elseif Config.Notify == 'lation' then
                                    exports.lation_ui:notify({
                                        title = locale('error.cancel_installation_title'),
                                        message = locale('error.cancel_installation_description'),
                                        type = 'error',
                                        position = 'center-right'
                                    })
                                end
                            end)
                    elseif Config.Progress == 'ox_bar' then
                        if lib.progressBar({
                                duration = Config.InstallTime,
                                label = locale('info.progress_label'),
                                useWhileDead = false,
                                canCancel = true,
                                disable = {
                                    move = true,
                                    car = true,
                                    mouse = false,
                                    combat = true
                                }
                            }) then -- DONE
                            if exports['qb-smallresources']:hasSeatbelt() then
                                TriggerEvent('seatbelt:client:UseSeatbelt')
                            end
                            if Config.Inventory == 'qb' then
                                harnessUses = ItemData.info.uses
                                harnessDamage = ItemData.info.damage
                            elseif Config.Inventory == 'ps' then
                                harnessUses = ItemData.info.uses
                                harnessDamage = ItemData.info.damage
                            elseif Config.Inventory == 'ox' then
                                harnessUses = ItemData.metadata.uses
                                harnessDamage = ItemData.metadata.damage
                            end
                            if harnessUses == nil then
                                harnessUses = Config.HarnessUses
                            end

                            damage = 100

                            if harnessDamage ~= nil then
                                damage = harnessDamage
                            else
                                if Config.Inventory == 'qb' then
                                    ItemData.info.damage = damage
                                elseif Config.Inventory == 'ps' then
                                    ItemData.info.damage = damage
                                elseif Config.Inventory == 'ox' then
                                    ItemData.metadata.damage = damage
                                end
                            end
                            installedHarnessInfo = { uses = harnessUses, damage = damage }
                            TriggerServerEvent('stark_harness:server:InstallHarness', installedHarnessInfo, Plate)
                        else -- CANCELLED
                            if Config.Notify == 'qb' then
                                QBCore.Functions.Notify(locale('error.cancel_installation_description'), 'error')
                            elseif Config.Notify == 'ox' then
                                lib.notify({
                                    title = locale('error.cancel_installation_title'),
                                    description = locale('error.cancel_installation_description'),
                                    position = 'center-right',
                                    type = 'error'
                                })
                            elseif Config.Notify == 'lation' then
                                exports.lation_ui:notify({
                                    title = locale('error.cancel_installation_title'),
                                    message = locale('error.cancel_installation_description'),
                                    type = 'error',
                                    position = 'center-right'
                                })
                            end
                        end
                    elseif Config.Progress == 'ox_circle' then
                        if lib.progressCircle({
                                duration = Config.InstallTime,
                                label = locale('info.progress_label'),
                                position = 'bottom',
                                useWhileDead = false,
                                canCancel = true,
                                disable = {
                                    move = true,
                                    car = true,
                                    mouse = false,
                                    combat = true
                                }
                            }) then
                            if exports['qb-smallresources']:hasSeatbelt() then
                                TriggerEvent('seatbelt:client:UseSeatbelt')
                            end
                            if Config.Inventory == 'qb' then
                                harnessUses = ItemData.info.uses
                                harnessDamage = ItemData.info.damage
                            elseif Config.Inventory == 'ps' then
                                harnessUses = ItemData.info.uses
                                harnessDamage = ItemData.info.damage
                            elseif Config.Inventory == 'ox' then
                                harnessUses = ItemData.metadata.uses
                                harnessDamage = ItemData.metadata.damage
                            end
                            if harnessUses == nil then
                                harnessUses = Config.HarnessUses
                            end

                            damage = 100

                            if harnessDamage ~= nil then
                                damage = harnessDamage
                            else
                                if Config.Inventory == 'qb' then
                                    ItemData.info.damage = damage
                                elseif Config.Inventory == 'ps' then
                                    ItemData.info.damage = damage
                                elseif Config.Inventory == 'ox' then
                                    ItemData.metadata.damage = damage
                                end
                            end
                            installedHarnessInfo = { uses = harnessUses, damage = damage }
                            TriggerServerEvent('stark_harness:server:InstallHarness', installedHarnessInfo, Plate)
                        else
                            if Config.Notify == 'qb' then
                                QBCore.Functions.Notify(locale('error.cancel_installation_description'), 'error')
                            elseif Config.Notify == 'ox' then
                                lib.notify({
                                    title = locale('error.cancel_installation_title'),
                                    description = locale('error.cancel_installation_description'),
                                    position = 'center-right',
                                    type = 'error'
                                })
                            elseif Config.Notify == 'lation' then
                                exports.lation_ui:notify({
                                    title = locale('error.cancel_installation_title'),
                                    message = locale('error.cancel_installation_description'),
                                    type = 'error',
                                    position = 'center-right'
                                })
                            end
                        end
                    elseif Config.Progress == 'lation' then
                        if exports.lation_ui:progressBar({
                                label = locale('info.progress_label'),
                                duration = Config.InstallTime,
                                icon = 'fas fa-wrench',
                                iconColor = '#FFFFFF',
                                color = '#0000FF',
                                -- steps = {}, -- FEATURE COMING SOON
                                canCancel = true,
                                useWhileDead = false,
                                disable = {
                                    move = true,
                                    sprint = true,
                                    car = true,
                                    combat = true,
                                    mouse = false
                                }
                            }) then
                            if exports['qb-smallresources']:hasSeatbelt() then
                                TriggerEvent('seatbelt:client:UseSeatbelt')
                            end
                            if Config.Inventory == 'qb' then
                                harnessUses = ItemData.info.uses
                                harnessDamage = ItemData.info.damage
                            elseif Config.Inventory == 'ps' then
                                harnessUses = ItemData.info.uses
                                harnessDamage = ItemData.info.damage
                            elseif Config.Inventory == 'ox' then
                                harnessUses = ItemData.metadata.uses
                                harnessDamage = ItemData.metadata.damage
                            end
                            if harnessUses == nil then
                                harnessUses = Config.HarnessUses
                            end

                            damage = 100

                            if harnessDamage ~= nil then
                                damage = harnessDamage
                            else
                                if Config.Inventory == 'qb' then
                                    ItemData.info.damage = damage
                                elseif Config.Inventory == 'ps' then
                                    ItemData.info.damage = damage
                                elseif Config.Inventory == 'ox' then
                                    ItemData.metadata.damage = damage
                                end
                            end
                            installedHarnessInfo = { uses = harnessUses, damage = damage }
                            TriggerServerEvent('stark_harness:server:InstallHarness', installedHarnessInfo, Plate)
                        else
                            if Config.Notify == 'qb' then
                                QBCore.Functions.Notify(locale('error.cancel_installation_description'), 'error')
                            elseif Config.Notify == 'ox' then
                                lib.notify({
                                    title = locale('error.cancel_installation_title'),
                                    description = locale('error.cancel_installation_description'),
                                    position = 'center-right',
                                    type = 'error'
                                })
                            elseif Config.Notify == 'lation' then
                                exports.lation_ui:notify({
                                    title = locale('error.cancel_installation_title'),
                                    message = locale('error.cancel_installation_description'),
                                    type = 'error',
                                    position = 'center-right'
                                })
                            end
                        end
                    end
                else
                    if Config.Notify == 'qb' then
                        QBCore.Functions.Notify(locale('error.installation_error_description'), 'error')
                    elseif Config.Notify == 'ox' then
                        lib.notify({
                            title = locale('error.installlation_error_title'),
                            description = locale('error.installation_error_description'),
                            position = 'center-right',
                            type = 'error'
                        })
                    elseif Config.Notify == 'lation' then
                        exports.lation_ui:notify({
                            title = locale('error.installlation_error_title'),
                            message = locale('error.installation_error_description'),
                            type = 'error',
                            position = 'center-right'
                        })
                    end
                end
            end, Plate)
        end
    else
        if Config.Notify == 'qb' then
            QBCore.Functions.Notify(locale('error.driver_seat_error_description'), 'error')
        elseif Config.Notify == 'ox' then
            lib.notify({
                title = locale('error.driver_seat_error_title'),
                description = locale('error.driver_seat_error_description'),
                position = 'center-right',
                type = 'error'
            })
        elseif Config.Notify == 'lation' then
            exports.lation_ui:notify({
                title = locale('error.driver_seat_error_title'),
                message = locale('error.driver_seat_error_description'),
                type = 'error',
                position = 'center-right'
            })
        end
    end
end)
