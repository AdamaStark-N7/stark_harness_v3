---@diagnostic disable: lowercase-global

if not lib.checkDependency('ox_lib', '3.30.0', true) then return end

if Config.VersionCheck then
    lib.versionCheck('AdamaStark-N7/stark_harness_v3')
end

local QBCore = exports['qb-core']:GetCoreObject()