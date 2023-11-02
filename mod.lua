local modRep = require "VAB_modRep"
local LogoFilter = require "VAB_LogoFilter"
local ParamBuilder = require "parambuilder_v1_1"

local paramLogoFilter = ParamBuilder.Checkbox("VAB_LogoFilter", _("Filter Vanilla Logos (from TPF1)") )

function data()
	return {
		info = {
			name = "Vehicle Asset Builder",
			description = _("mod_desc"),
			minorVersion = 2,
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
			params = {
				paramLogoFilter.params,
			}
		},
		runFn = function (settings, modparams)
			if paramLogoFilter.getBool(modparams[getCurrentModId()]) then
				addModifier("loadModel", function(file, model) 
					--print(file)
					LogoFilter.filtermdl(model, false) -- 2nd: print
					return model
				end)
			end
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