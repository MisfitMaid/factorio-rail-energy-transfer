-- adapted from https://github.com/dmikalova/factorio-mods/blob/main/utility-station-mk2/control.lua [MIT]

local entities_rails = { --unused, keeping here because lazy and might implement in the future
    ["legacy-straight-rail"] = true,
    ["legacy-curved-rail"] = true,
    ["straight-rail"] = true,
    ["curved-rail-a"] = true,
    ["curved-rail-b"] = true,
    ["half-diagonal-rail"] = true,
    ["rail-ramp"] = true,
    ["elevated-straight-rail"] = true,
    ["elevated-curved-rail-a"] = true,
    ["elevated-curved-rail-b"] = true,
    ["elevated-half-diagonal-rail"] = true,
    ["elevated-straight-rail"] = true,
    ["elevated-curved-rail-a"] = true,
    ["elevated-curved-rail-b"] = true,
    ["elevated-half-diagonal-rail"] = true,
}

local entities = {
    ["rail-support"] = true,
--    ["rail-ramp"] = true,
}

local function build_entity(event, name)
  local e = event.entity
  local s = e.surface
  local x = e.position.x
  local y = e.position.y
  local l = s.create_entity {
    force = game.forces.neutral,
    name = name,
    position = { x, y },
    quality = e.quality,
  }
  l.destructible = false
end

local function build(event)
  if entities[event.entity.name] then
    build_entity(event, "rail-energy-transfer-fake-pole")
  end
end

local function destroy_entity(event, name)
  local e = event.entity
  local x = e.position.x
  local y = e.position.y
  local entity = e.surface.find_entity({ name = name, quality = e.quality.name }, { x, y })
  if entity ~= nil then
    entity.destroy()
  end
end

local function destroy(event)
  if entities[event.entity.name] then
    destroy_entity(event, "rail-energy-transfer-fake-pole")
  end
end

local filters = {};
for entity, _ in pairs(entities) do
  filters[#filters + 1] = {
    filter = "name",
    name = entity
  }
end

script.on_event(defines.events.on_built_entity, build, filters)
script.on_event(defines.events.on_robot_built_entity, build, filters)

script.on_event(defines.events.on_entity_died, destroy, filters)
script.on_event(defines.events.on_player_mined_entity, destroy, filters)
script.on_event(defines.events.on_robot_pre_mined, destroy, filters)
script.on_event(defines.events.script_raised_destroy, destroy, filters)
