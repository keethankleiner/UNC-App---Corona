-------------------------------
		 -- MAIN --
-------------------------------

-- DIRECTOR
director = require "director"
webHandler = require "webViewHandler"

-- MAIN GROUP
local mainGroup = display.newGroup();


-- MAIN FUNCTION
local function main()
	mainGroup:insert(director.directorView);
	-- WHERE TO GO FIRST
	director:changeScene("menu");
	
	
	return true;
end
main();

