-- adapted from https://github.com/dmikalova/factorio-mods/blob/main/mklv-lib/combined-entity.lua [MIT]
local fakerailpole = table.deepcopy(data.raw["electric-pole"]["substation"])
fakerailpole.collision_box = { { -0, -0 }, { 0, 0 } }
fakerailpole.collision_mask = {
  colliding_with_tiles_only = true,
  layers = {},
  not_colliding_with_itself = true
}
fakerailpole.flags = {
  "hide-alt-info",
  "no-copy-paste",
  "not-blueprintable",
  "not-deconstructable",
  "not-flammable",
  "not-on-map",
  "not-selectable-in-game",
  "placeable-off-grid",
  "placeable-player",
}
fakerailpole.hidden = true
fakerailpole.hidden_in_factoriopedia = true
fakerailpole.max_health = 2147483648
fakerailpole.name = "rail-energy-transfer-fake-pole"
fakerailpole.next_upgrade = nil
fakerailpole.order = "z"
fakerailpole.selection_box = nil
fakerailpole.maximum_wire_distance = data.raw["rail-support"]["rail-support"].support_range * 2
fakerailpole.supply_area_distance = 0
fakerailpole.water_reflection = nil
fakerailpole.pictures = nil
fakerailpole.active_picture = nil

data:extend{fakerailpole}
