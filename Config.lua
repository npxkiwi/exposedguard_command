Config = {}
Config.Debug = true

function dbg(text)
	if Config.Debug then
		print("[Debug] : " .. text)
	end
end