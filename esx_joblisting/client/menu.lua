_menuPool = NativeUI.CreatePool()
mainMenu = NativeUI.CreateMenu(GetPlayerName(PlayerId()), "Bienvenue au pole emploi !", Config.MenuX, Config.MenuY,nil,nil,nil,Config.MenuColor.r,Config.MenuColor.g,Config.MenuColor.b,Config.MenuColor.a)
_menuPool:Add(mainMenu)

function AddMenuJobMenu(menu)
    local jobmenu = _menuPool:AddSubMenu(menu, "Pôle emploi : ~r~Métiers intérimaires", "", Config.MenuX, Config.MenuY,nil,nil,nil,Config.MenuColor.r,Config.MenuColor.g,Config.MenuColor.b,Config.MenuColor.a, 5, 50)
	
	for i = 1 , #Jobs, 1 do
		local job = NativeUI.CreateItem(Jobs[i].label, "")
		jobmenu.SubMenu:AddItem(job)
	end

	jobmenu.SubMenu.OnItemSelect = function(_,_,Index)
		TriggerServerEvent("esx_joblisting:setJob", Jobs[Index].value)
	end

	menu.OnMenuClosed = function()
		onmenu = false
	end
end

_menuPool:MouseEdgeEnabled(false);
_menuPool:RefreshIndex()
