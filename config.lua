Config = {}

Config.Debug = true

--[[
    GENERAL SETTINGS | THESE WILL AFFECT YOUR ENTIRE SERVER SO BE SURE TO SET THESE CORRECTLY
    MaxHp : Maximum HP Allowed, set to -1 if you want to disable mythic_hospital from setting this
    RegenRate : 
]]
Config.MaxHp = 200
Config.RegenRate = 0

Config.HiddenRevChance = 65
Config.HiddenCooldown = 30

--[[
    Pricing
]]
Config.InjuryBase = 100
Config.HiddenInjuryBase = 1000

--[[

]]
Config.Hospital = {
    Location = { x = 308.06161499023, y = -595.19683837891, z = 43.291839599609, h = 180.4409942627 },
    ShowBlip = true,
}
Config.Hospital.Blip = { name = "Pillbox Medical Center", color = 38, id = 153, scale = 1.0, short = false, x = Config.Hospital.Location.x, y = Config.Hospital.Location.y, z = Config.Hospital.Location.z }

--[[
    Hidden: Location of the hidden location where you can heal and no alert of GSW's will be made.
]]

Config.Hidden = {
    Location = { x = 1969.2971191406, y = 3815.6735839844, z = 33.428680419922 },
    ShowBlip = true,
}
Config.Hidden.Blip = { name = 'Hidden Medic', color = 12, id = 153, scale = 1.0, short = false, x = Config.Hidden.Location.x, y = Config.Hidden.Location.y, z = Config.Hidden.Location.z }


-- Keys
Config.Keys = {}
Config.Keys.GetUp = 73 -- Key Used To Get Out Of Bed When Using /bed Command