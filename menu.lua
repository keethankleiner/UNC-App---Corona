module(..., package.seeall)
local widget = require "widget"

function new()

	local localGroup = display.newGroup()

-------------- ABOVE DIRECTOR -------------

display.setStatusBar(display.HiddenStatusBar)
-------------------------------------------
--				Variables				 --
-------------------------------------------

-- Icon Table (file url, scene of icon)
local iconTable =  {
	{"people.png", "Directory"},
	{"news.png", "News"},
	{"calendar.png", "Calendar"},
	{"athletics.png", "Athletics"},
	{"dining.png", "Dining"},
	{"virtualpit.png", "Virtual Pit",}, 
	{"map.png", "Campus", "Map"},
	{"video.png", "Video"},
	{"photos.png", "Photos"},
	{"emergency.png", "Emergency", "Info"},
}

-- Secondary icons
local iconTable2 = {
	{"about.png", "About"},
	{"customize.png", "Customize"}, 
	{"links.png", "Links"},
	{"fullweb.png", "Main Website"}
}

-- Screen Variables
local iconWidth = 120;
local iconsOnRow = math.floor((display.contentWidth-30)/(30+iconWidth))
local totalIconSpace = display.contentWidth-(iconsOnRow*iconWidth)
local indivIconSpace = totalIconSpace/(iconsOnRow+1)
local verticalSpace = 190

-- Icon Set (Table for)
local iconSet = {}

-- Icon Allignment Variables
local verticalSpace = 180

-- Scroll View
local scrollView = widget.newScrollView
{
   	left = 0,
   	top = 0,
   	width = display.contentWidth,
   	height = display.contentHeight,
   	scrollWidth = display.contentWidth,
   	scrollHeight = display.contentHeight,
	horizontalScrollDisabled = true,
	hideScrollBar = true,
}

-------------------------------------------
--			Display Objects				 --
-------------------------------------------

-- Static background
local background = display.newRect(0, 0, display.contentWidth, display.contentHeight)
background:setFillColor(255, 255, 255)
localGroup:insert(background)
scrollView:insert(background)

-- Static Banner (Replaced if internet)


-- First get image size
local temp = display.newImage("images/logo_home.png")
local w = temp.width
local h = temp.height
display.remove(temp)
local height = h*display.contentWidth/w

-- Banner
local banner = display.newImageRect("images/logo_home.png", display.contentWidth, height)
banner:setReferencePoint(display.TopLeftReferencePoint)
banner.x, banner.y = 0, 0
banner:setReferencePoint(display.CenterReferencePoint)
localGroup:insert(banner) 
scrollView:insert(banner)

-------------------------------------------
--				Functions				 --
-------------------------------------------

-- Make Background Stripes
local function makeStripes()
	for i=1, 120, 1 do
		local stripe = display.newImageRect("images/bodyback.png", display.contentWidth/120, display.contentHeight)
		stripe:setReferencePoint(display.TopLeftReferencePoint)
		stripe.y = 0
		stripe.x = (display.contentWidth/120)*i
		localGroup:insert(stripe)	
		
		scrollView:insert(stripe)
	end
	banner:toFront() 

end
makeStripes()

-- Icon Tap
local iconTap = function(e)
	print(e.phase)
	if e.phase == "began" then
		e.target.alpha = 0.5	
	elseif e.phase == "ended" then
		e.target.alpha = 1
		director:changeScene("modules."..e.target.scene)	
	elseif e.phase == "cancelled" then
		e.target.alpha = 1
	end
end

-- Placer Functions
local placePrimaryIcons = function()
	local row = 0;
	for i=1, #iconTable do
		
		--local row = math.ceil(i/iconsOnRow)
		--local temp, col = math.modf(i/iconsOnRow)
		--col = col*iconsOnRow
		
		local icon = widget.newButton
		{
		    left = indivIconSpace+(iconWidth+indivIconSpace)*(i-1)-row*(display.contentWidth-indivIconSpace),
		    top = (banner.y*2+indivIconSpace)+(row*verticalSpace),
			height = 120,
			width = 120,
		    id = "button1",
			defaultFile = "images/"..iconTable[i][1],
			onEvent = iconTap,
		}		
		icon.scene = iconTable[i][2]
		icon:setReferencePoint(display.TopLeftReferencePoint)
		localGroup:insert(icon)
		scrollView:insert(icon)		

		-- Text
		local text1 = display.newText(iconTable[i][2], 0, 0, native.systemFont,23)
		text1:setTextColor(100, 100, 100)
		text1.x, text1.y = icon.x+60, icon.y+140
		localGroup:insert(text1)
		
		scrollView:insert(text1)
		
		-- Text 2?
		if iconTable[i][3] then
			local text2 = display.newText(iconTable[i][3], 0, 0, native.systemFont,23)
			text2:setTextColor(100, 100, 100)
			text2.x, text2.y = icon.x+60, icon.y+170
			localGroup:insert(text2)
			
			scrollView:insert(text2)
		end
		
		-- Increment row
		if i%iconsOnRow == 0 then 
			row = row + 1; 
		end
		
	end
end
placePrimaryIcons()

-------------- BELOW DIRECTOR -------------
	return localGroup
end

