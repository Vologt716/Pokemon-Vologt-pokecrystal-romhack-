	object_const_def
	const ROUTE22_GRAMPS

Route22_MapScripts:
	def_scene_scripts

	def_callbacks

Route22GrampsScript:
	jumptextfaceplayer Route22GrampsText

VictoryRoadEntranceSign:
	jumptext VictoryRoadEntranceSignText

Route22GrampsText:
	text "Normally, players"
	line "cannot enter here."

	para "But Ulysses warned"
	line "us about your"
	cont "visit."
	done

VictoryRoadEntranceSignText:
	text "ROUTE 52"

	para "CITY B -"
	line "CITY C"
	done

Route22_MapEvents:
	db 0, 0 ; filler

	def_warp_events
	warp_event 21,  3, FARM_GATE, 3
	warp_event 28,  3, EMPLOYEES_ONLY, 4

	def_coord_events

	def_bg_events
	bg_event 23,  5, BGEVENT_READ, VictoryRoadEntranceSign

	def_object_events
	object_event 20,  4, SPRITE_GRAMPS, SPRITEMOVEDATA_STANDING_DOWN, 0, 0, -1, -1, PAL_NPC_BROWN, OBJECTTYPE_SCRIPT, 0, Route22GrampsScript, -1
