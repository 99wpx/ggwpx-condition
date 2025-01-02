--  _______   ______ ____    __    ____  ______   ___   ___ 
-- /  _____| /  ____|\   \  /  \  /   / |   _  \  \  \ /  / 
--|  |  __  |  |  __  \   \/    \/   /  |  |_)  |  \  V  /  
--|  | |_ | |  | |_ |  \            /   |   ___/    >   <   
--|  |__| | |  |__| |   \    /\    /    |  |       /  .  \  
-- \______|  \______|    \__/  \__/     |__|      /__/ \__\ 
--=========================================================
--      JOIN DISCORD : https://discord.gg/Q6AbZgkJFq
--=========================================================

Config = {}

-- Choose the notification method: 'qb', 'okok', 'mythic', 'ox'
Config.NotificationType = 'qb'

-- Thresholds for notifications
Config.HealthThreshold = 20 -- Health below this threshold
Config.HungerThreshold = 20 -- Hunger below this threshold
Config.ThirstThreshold = 20 -- Thirst below this threshold

-- Check interval (in milliseconds)
Config.CheckInterval = 10000 -- 10 seconds

-- Default values if metadata is missing or not available
Config.DefaultHunger = 100 -- Default hunger level
Config.DefaultThirst = 100 -- Default thirst level

-- Enable/disable individual notifications
Config.EnableHealthNotification = true  -- Set to true to enable health notifications
Config.EnableHungerNotification = true  -- Set to true to enable hunger notifications
Config.EnableThirstNotification = true  -- Set to true to enable thirst notifications

-- Notifications
Config.Notifications = {
    HealthLow = "Your health is critically low!",
    HungerLow = "You are feeling very hungry!",
    ThirstLow = "You are feeling very thirsty!",
    HealthAndHungerLow = "Your health and hunger are critically low!",
    HealthAndThirstLow = "Your health and thirst are critically low!",
    HungerAndThirstLow = "Your hunger and thirst are critically low!",
    AllLow = "You are critically low on health, food, and water!"
}


