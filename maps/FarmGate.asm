	object_const_def
	const FARMGATE_OFFICER

FarmGate_MapScripts:
	def_scene_scripts

	def_callbacks

FarmGateOfficerScript:
	jumptextfaceplayer FarmGateOfficerText

FarmGateOfficerText:
	text "Please do not use"
	line "#balls inside"
	cont "this area."
	done

FarmGate_MapEvents:
	db 0, 0 ; filler

	def_warp_events
	warp_event  0,  8, STARTERS_FARM, 2
	warp_event  0,  9, STARTERS_FARM, 3
	warp_event  8, 17, ROUTE_22, 1
	warp_event  9, 17, ROUTE_22, 1

	def_coord_events

	def_bg_events

	def_object_events
	object_event 12,  5, SPRITE_OFFICER, SPRITEMOVEDATA_STANDING_RIGHT, 0, 0, -1, -1, PAL_NPC_RED, OBJECTTYPE_SCRIPT, 0, FarmGateOfficerScript, -1
