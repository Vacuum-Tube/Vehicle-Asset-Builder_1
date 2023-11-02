local mdlTool = require "VAB_mdlTool"

local lf = {}

local function isLogo(node)
	if node.materials then
		if node.name=="logo_body" or node.name=="body_logo" then
			return true
		end
		if #node.materials==1 and node.materials[1]:ends("logo.mtl") then  -- nodes with more than 1 materials shouldnt be removed
			return true
		end
		-- for i,material in pairs(node.materials) do
			-- if material:ends("logo.mtl") then
				-- print("LOGOMTL", material)
				-- print("MATERIALS", #node.materials, node.name and ("name: "..node.name) )
				-- debugPrint(node.materials)
			-- end
		-- end
	end
	return false
end

lf.filtermdl = function(model, printt)  -- remove invisible logos (from TPF1)
	mdlTool.iterateNodes(model, function(node)
		if isLogo(node) then
			if printt then
				print("MATERIAL LOGO", node.materials[1], string.format("(%d Materials)", #node.materials ))
				print("REMOVE MESH", node.name and ("name: "..node.name), node.mesh )
			end
			node.mesh = nil
			node.materials = nil
		end
	end)
end

return lf