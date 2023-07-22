	object_const_def
	const ROUTEPSI_POKE_BALL


RoutePsi_MapScripts:
	def_scene_scripts
	scene_script RoutePsiNoop1Scene, SCENE_ROUTEPSI_NOOP

RoutePsiNoop1Scene:
	end

RoutePsiPotion:
	itemball POTION

RoutePsi_MapEvents:
	db 0, 0 ; filler

	def_object_events
	object_event 12, 22, SPRITE_POKE_BALL, SPRITEMOVEDATA_STILL, 0, 0, -1, -1, 0, OBJECTTYPE_ITEMBALL, 0, RoutePsiPotion, EVENT_ROUTE_PSI_POTION
