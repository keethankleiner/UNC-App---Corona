--[[ 
			This Class will handle all the functions and variables associated with 
			the webvies and navigating through them
]] 

module(..., package.seeall)
print("Web View Handler is active")


-------------------------------------------
--				Variables				 --
-------------------------------------------

-- Home URL
local homeUrl = "http://ec2-54-200-99-167.us-west-2.compute.amazonaws.com/home/"
local mainUrl = "unc.edu"
-------------------------------------------
--				Functions				 --
-------------------------------------------

-- Initialize Web View
local function initWebView()

end
initWebView()

-- New Web View
function newWebView(webUrl)
	local webView = native.newWebView( 0, 0, display.contentWidth, display.contentHeight )	
	webView.isVisible = false
	webView:request(webUrl)
	webView.isVisible = true
	
	-- Listen to URL
	local function webListener(e)
		local url = e.url
		if url == homeUrl then
			webView.isVisible = false
			director:changeScene("menu")
		end
	end
	webView:addEventListener("urlRequest", webListener)
	
	return webView
end