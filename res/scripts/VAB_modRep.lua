local mr = {}

local function isRailVehicle(model)
	return model.metadata.railVehicle~=nil
end

local function isRoadVehicle(model)
	return model.metadata.roadVehicle~=nil
end

local function isAirVehicle(model)
	return model.metadata.airVehicle~=nil
end

local function isWaterVehicle(model)
	return model.metadata.waterVehicle~=nil
end

local function isWaggon(model)
	return #model.metadata.railVehicle.engines == 0
end

local function isMultipleUnit(model)
	return model.metadata.transportVehicle.multipleUnitOnly == true
end

local function isTram(model)
	return model.metadata.transportVehicle.carrier == api.type.enum.Carrier.TRAM
end

local function isBus(model)
	return model.metadata.seatProvider.drivingLicense == 0  -- cargo not accessible...
end


local function getVehicleType(model)
	if isRailVehicle(model) then
		if isTram(model) then
			return "tram"
		elseif isMultipleUnit(model) then
			return "multiple"
		elseif isWaggon(model) then
			return "waggon"
		else 
			return "locomotive"
		end
	elseif isRoadVehicle(model) then
		if isBus(model) then
			return "bus"
		else
			return "truck"
		end
	elseif isAirVehicle(model) then
		return "plane"
	elseif isWaterVehicle(model) then
		return "ship"
	end
	return "unknown"
end

function mr.getModelsVehicles()
	local modelRep = api.res.modelRep.getAll()
	--debugPrint(modelRep)
	local vehicles = {}
	for idx,id in pairs(modelRep) do
		local model = api.res.modelRep.get(idx-1)  -- modelRep starts with 1 ???
		if model.metadata.transportVehicle and not id:starts("placeholders/") then
			table.insert(vehicles, { model=model, id=id } )  -- seperate list for sorting
			-- if model.metadata.particleSystem then
				-- model.metadata.particleSystem.emitters = {}  -- no smoke at all
			-- end
		end
	end
	
	table.sort(vehicles, function (a,b) 
		return a.model.metadata.availability.yearFrom > b.model.metadata.availability.yearFrom
	end )
	
	local ids = {
		locomotive = {},
		waggon = {},
		multiple = {},
		bus = {},
		truck = {},
		tram = {},
		ship = {},
		plane = {},
	}
	local names = {
		locomotive = {},
		waggon = {},
		multiple = {},
		bus = {},
		truck = {},
		tram = {},
		ship = {},
		plane = {},
	}
	
	for i,vehicle in pairs(vehicles) do  -- categorize
		--print(vehicle.id)
		--local carr = vehicle.model.metadata.transportVehicle.carrier
		local vtype = getVehicleType(vehicle.model)
		--print(vtype)
		local name = vehicle.model.metadata.description.name
		if name == "" then
			name = string.strip(vehicle.id, "vehicle/")
		else
			local region
			if vehicle.id:find("/usa/") then
				region = "Usa"
			elseif vehicle.id:find("/asia/") then
				region = "Asia"
			end
			name = string.format("%s (%s%s)", name, vehicle.model.metadata.availability.yearFrom, region and (", "..region) or "" )
			--name = string.format("%s (%s)", name, string.strip(vehicle.id, "vehicle/") )
		end
		table.insert(ids[vtype], vehicle.id)
		table.insert(names[vtype], name)
	end
	
	return ids, names
end

return mr