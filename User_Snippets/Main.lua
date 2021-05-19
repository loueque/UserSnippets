local ChangeHistoryService = game:GetService("ChangeHistoryService")
local SoundService = game:GetService("SoundService")
local RunService = game:GetService("RunService")
local user = UserSettings()

local Props = require(script:WaitForChild("Properties"))

local toolbar = plugin:CreateToolbar("User Snippets")
local genScript = toolbar:CreateButton("Generate Sippet", "Type a specific command like 'class' to generate a snippet!", "rbxassetid://6827337191")
local packScript = toolbar:CreateButton("Settings", "Set custom snippets, or configure code", "rbxassetid://6827337139")

function main()
	local selection = game:GetService("Selection")
	local current = selection:Get()

	local function f(int: any)
		return Props:GetProperties(int)
	end

	if current[1] then
		local s = Instance.new("ModuleScript")
		s.Name = "UserSnippets"
		s.Parent =  current[1]

		plugin:OpenScript(s)

		while true do
			wait(0.1)
			if s.Source == "class" then
				s.Source = "local Class = {}\nClass.__index = Class\n\nfunction Class.new()\n\tlocal self = setmetatable({\n\t\t\n\t}, Class)\n\treturn self\n end\n\nfunction Class:method(a: string)\n\treturn print(a)\nend\n\nreturn Class"
				s.Name = "Class"
				wait(0.05)

				f(s)
				warn(s, "has been converted to: Class")
			end

			if s.Source == "oop" then
				s.Source = "local oop = {}\noop.__index = oop\noop.ClassName = 'UserSnippets'\n\nfunction oop.new()\n\treturn setmetatable({}, oop)\nend\n\nfunction oop:create(a, b)\n\treturn self.a, self.b or string.upper(a), string.upper(b)\nend\n\nfunction oop:doSomething()\n\treturn print(self.Name)\nend\n\nfunction oop:method()\n\treturn self.Name\nend\n\nreturn oop"
				s.Name = "OOP"
				wait(0.05)

				f(s)
				warn(s, " has been converted to: OOP")
			end

			if s.Source == "map" then
				s.Source = "local module = {}\nmodule.__index = module\n\nfunction f()\n\t\nend\n\nreturn module"
				s.Name = "Map"
				wait(0.05)

				f(s)
				warn(s, "has been converted to: Mapping(s)")
			end

			if s.Source == "afg" then
				s.Source = "local controller = {}\n\nfunction controller:Start()\n\t\nend\n\nfunction controller:Init()\n\t\nend\n\nreturn controller"
				s.Name = "Aero"
				wait(0.05)

				f(s)
				warn(s, " has been converted to: AFG_Controller")
			end

			if s.Source == "setget" then
				s.Source = "local lets = {}\nlets.__index = lets\n\nfunction lets:set(a: any, b: any?)\n\treturn a, b\nend\n\nfunction lets:get(a)\n\treturn self.a\nend\n\nreturn lets"
				s.Name = "Lets"
				wait(0.05)

				f(s)
				warn(s, " has been converted to: Setters & Getters")
			end
		end
	end
end

function settingMain()

end

genScript.Click:Connect(main)
packScript.Click:Connect(settingMain)

