resource_manifest_version '44febabe-d386-4d18-afbe-5e627f4af937'

description 'Mythic Framework Hospital & Damage System'

version '2.0.0'

client_scripts {
	-- Config Files
	'definitions.lua',
	'config.lua',
	
	'client/shared/defines.lua',

	-- Wound Files
	'client/wound/defines.lua',
	'client/wound/functions.lua',
	'client/wound/events.lua',
	'client/wound/threads.lua',

	-- Hospital Files
	'client/hospital/defines.lua',
	'client/hospital/functions.lua',
	'client/hospital/teleports.lua',
	'client/hospital/events.lua',
	'client/hospital/threads.lua',
	
	'client/items.lua',
}

server_scripts {
	'server/wound.lua',
	'server/main.lua',
}

dependencies {
	'mythic_progbar',
	'mythic_notify',
}

exports {
    'IsInjuredOrBleeding',
	'DoLimbAlert',
	'DoBleedAlert',
}

server_exports {
    'GetCharsInjuries',
}