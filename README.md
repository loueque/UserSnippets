# User-Snippets
Snippet name(s) that generate code, good for modules.

NOTE: I WILL NOT ADD THE ABILITY FOR USERS TO ADD / REMOVE SNIPPETS, ALL ARE HAND WRITTEN ATM.

---

User snippets are easy, type down a specific word and it generates code, type down `class` will generate a whole module of a class.

From this:

```lua
class
```
...to:

```lua
local Class = {}
Class.__index = Class

function Class.new()
	local self = setmetatable({
		
	}, Class)
	return self
 end

function Class:method(a: string)
	return print(a)
end

return Class
```

:)
