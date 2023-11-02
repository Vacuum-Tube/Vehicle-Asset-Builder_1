local m = {}

function m.iterateLods(model,fcn)
	for i,lod in pairs(model.lods) do
		fcn(lod)
	end
end

local function iterateNode(node,fcn)
	fcn(node)
	if node.children then
		for i,child in pairs(node.children) do
			iterateNode(child,fcn)
		end
	end
end

function m.iterateNodes(model,fcn)
	m.iterateLods(model,function(lod)
		if lod.node then
			iterateNode(lod.node,fcn)
		end
	end)
end

function m.sizeFac(model,fac)
	m.iterateLods(model,function(lod)
		lod.node.transf = { fac, 0, 0, 0, 0, fac, 0, 0, 0, 0, fac, 0, 0, 0, 0, 1 }
	end)
end

return m