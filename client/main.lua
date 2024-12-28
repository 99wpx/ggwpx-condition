local QBCore = exports['qb-core']:GetCoreObject()
local hunger, thirst = Config.DefaultHunger, Config.DefaultThirst

local function sendNotification(message)
    if Config.NotificationType == 'qb' then
        QBCore.Functions.Notify(message, 'warning', 5000)
    elseif Config.NotificationType == 'okok' then
        exports['okokNotify']:Alert('Notification', message, 5000, 'error')
    elseif Config.NotificationType == 'mythic' then
        exports['mythic_notify']:DoHudText('error', message)
    elseif Config.NotificationType == 'ox' then
        exports['ox_lib']:notify({title = "Notification", message = message, type = "error", length = 5000})
    end
end


CreateThread(function()
    while true do
        local playerPed = PlayerPedId()
        local health = GetEntityHealth(playerPed) - 100
        
        -- Ambil data player secara aman
        local playerData = QBCore.Functions.GetPlayerData()

        -- Periksa apakah metadata 'hunger' dan 'thirst' ada sebelum diakses
        if playerData.metadata and playerData.metadata['hunger'] and playerData.metadata['thirst'] then
            hunger = playerData.metadata['hunger']
            thirst = playerData.metadata['thirst']
        else
            -- Jika metadata tidak ditemukan, gunakan nilai dari config
            hunger = Config.DefaultHunger
            thirst = Config.DefaultThirst
        end

        -- Cek kondisi hanya jika notifikasi diaktifkan di config
        local isHealthLow = Config.EnableHealthNotification and (health < Config.HealthThreshold)
        local isHungerLow = Config.EnableHungerNotification and (hunger < Config.HungerThreshold)
        local isThirstLow = Config.EnableThirstNotification and (thirst < Config.ThirstThreshold)

        -- Cek kondisi dan kirim notifikasi sesuai kondisi
        if isHealthLow and isHungerLow and isThirstLow then
            sendNotification(Config.Notifications.AllLow)
        elseif isHealthLow and isHungerLow then
            sendNotification(Config.Notifications.HealthAndHungerLow)
        elseif isHealthLow and isThirstLow then
            sendNotification(Config.Notifications.HealthAndThirstLow)
        elseif isHungerLow and isThirstLow then
            sendNotification(Config.Notifications.HungerAndThirstLow)
        elseif isHealthLow then
            sendNotification(Config.Notifications.HealthLow)
        elseif isHungerLow then
            sendNotification(Config.Notifications.HungerLow)
        elseif isThirstLow then
            sendNotification(Config.Notifications.ThirstLow)
        end

        -- Interval pengecekan
        Wait(Config.CheckInterval)
    end
end)
