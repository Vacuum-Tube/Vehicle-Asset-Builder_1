local ParamBuilder = require "parambuilder_v1_1"

return function(vehicle)
	
	local keyprefix = "VAB"..vehicle
	local slope = {
		locomotive = 75,
		waggon = 75,
		multiple = 75,
		bus = 200,
		truck = 200,
		tram = 100,
		ship = 50,
		plane = 200,
	}
	local offz_def = {  -- rail height: 1.05
		locomotive = 105,
		waggon = 105,
		multiple = 105,
	}
	local offz_tt = {
		locomotive = _("offz_tt"),
		waggon = _("offz_tt"),
		multiple = _("offz_tt"),
	}
	
	local params = {
		Model = ParamBuilder.Combobox(keyprefix.."modelID", _("Model"), {"dummy"} ),  -- values are set dynamically in postRunFn
		OffsetX = ParamBuilder.Slider(keyprefix.."OffsetX", "Offset X [m]", ParamBuilder.rangeSymm(1,0.01), 1/0.01 ),
		--OffsetY = ParamBuilder.Slider(keyprefix.."OffsetY", "Offset Y [m]", ParamBuilder.rangeSymm(1,0.01), 1/0.01 ),
		OffsetZ = ParamBuilder.Slider(keyprefix.."OffsetZ", "Offset Z [m]", ParamBuilder.range(0,1.5,0.01), offz_def[vehicle], offz_tt[vehicle] ),
		--RotationZ = ParamBuilder.Slider(keyprefix.."RotationZ", "Rotation Z (Ebene) [°]", ParamBuilder.range(0,360,5) ),
		RotationY = ParamBuilder.Slider(keyprefix.."RotationY", "Rotation Y (".._("Slope")..") [‰]", ParamBuilder.rangeSymm(slope[vehicle]), slope[vehicle] ),
		Mirror = ParamBuilder.Checkbox(keyprefix.."Mirror", _("Mirror"), false),
	}

	params.paramsDef = { -- for definition in .con
		params.Model.params,
		params.OffsetX.params,
		--params.OffsetY.params,
		params.OffsetZ.params,
		--params.RotationZ.params,
		params.RotationY.params,
		params.Mirror.params,
	}

	return params
end