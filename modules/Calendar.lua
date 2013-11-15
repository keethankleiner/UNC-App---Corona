module(..., package.seeall)

function new()

	local localGroup = display.newGroup()
-------------- ABOVE DIRECTOR -------------
print("Calendar Module")


-- Module URL
local moduleUrl = "http://ec2-54-200-99-167.us-west-2.compute.amazonaws.com/calendar/index"

-- Calling the Web Handler
local webVeiw = webHandler.newWebView(moduleUrl)

-------------- BELOW DIRECTOR -------------
	return localGroup
end