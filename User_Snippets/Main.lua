local plugin: Plugin = plugin

local ChangeHistoryService = game:GetService("ChangeHistoryService")
local SoundService = game:GetService("SoundService")
local RunService = game:GetService("RunService")

local toolbar = plugin:CreateToolbar("User Snippets")
local activation = toolbar:CreateButton("Activate", "Activates protocall of user snippets", "rbxassetid://6841215820")
activation.ClickableWhenViewportHidden = true

function main()
	local selection = game:GetService("Selection")
	local current = selection:Get()
	if current[1] then
		local currentScript = current[1]
		if currentScript:IsA("LuaSourceContainer") then
			while true do
				task.wait(.05)
				if (currentScript.Source == '--class') then
					currentScript.Source = [[
local class = {}
class.__index = class

function class.new(x, y, z)
	local self = {}
	self.x = x
	self.y = y
	self.z = z

	return setmetatable(self, class)
end

function class:print()
	return print(self.x, self.y, self.z)
end

function class:combine()
	return self.x+self.y+self.z
end

return class
]]
					currentScript.Name = "Class"
				end

				if (currentScript.Source == '--oop') then
					currentScript.Source = [[
local OOP = {}
OOP.__index = OOP

function OOP.new()
	local self = {}
	self.statement = "object oriented programming"
	return setmetatable(self, OOP)
end

function OOP:statement()
	return self.statement
end

return OOP
]]
					currentScript.Name = "OOP"
				end
			end
		end
	end
end

activation.Click:Connect(main)

