local modRep = require "VAB_modRep"
local mdlTool = require "VAB_mdlTool"

function data()
	return {
		info = {
			name = "Vehicle Asset Builder",
			description = _("mod_desc"),
			minorVersion = 1,
			severityAdd = "NONE",
			severityRemove = "WARNING",
			tags = {"Vehicle", "Asset", "Track Asset", "Brush Asset", "Script Mod"},
			authors = {
				{
					name = "VacuumTube",
					role = "CREATOR",
					tfnetId = 29264,
				},
			},
		},
		runFn = function (settings)
			addModifier("loadModel", function(file, model) 
				--print(file)
				mdlTool.iterateNodes(model, function(node)
					--print(node.name)
					if node.materials then
						local logo = false
						for i,material in pairs(node.materials) do
							if material:ends("logo.mtl") then
								--print("MATERIAL ...logo.mtl", material)
								logo = true
							end
						end
						if logo then  -- remove invisible logos (from TPF1)
							--print("REMOVE MESH", file, node.mesh)
							node.mesh = nil
							node.materials = nil
						end
					end
				end)
				return model
			end)
		end,
		postRunFn = function (settings, modparams)
			
			local modelIds, modelNames = modRep.getModelsVehicles()
			
			local vehicles = {
				locomotive = {},
				waggon = {},
				multiple = {},
				bus = {},
				truck = {},
				tram = {},
				ship = {},
				plane = {},
			}
			
			for vehicle,_ in pairs(vehicles) do
				
				local con = api.res.constructionRep.get(api.res.constructionRep.find("Vehicle_Asset_Builder_"..vehicle..".con"))
				con.updateScript.fileName = "construction/Vehicle_Asset_Builder.updateFn"
				con.updateScript.params = {
					modelIds = modelIds[vehicle], 
					type = vehicle 
				}
				
				for _,p in pairs(con.params) do 
					if p.key=="VAB"..vehicle.."modelID" then 
						p.values = modelNames[vehicle]
					end
				end
				
			end
			
		end
	}
end