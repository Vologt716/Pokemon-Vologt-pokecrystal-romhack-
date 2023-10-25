	object_const_def

StartersFarm_MapScripts:
	def_scene_scripts

	def_callbacks

StartersFarmSignpost:
	jumptext StartersFarmSignpostText

StartersFarmSignpostText:
	text "Catching #mon"
	line "is strictly"
	cont "prohibited."
	done

StartersFarm_MapEvents:
	db 0, 0 ; filler

	def_warp_events
	warp_event  3,  5, MR_POKEMONS_HOUSE, 1
	warp_event 29, 28, FARM_GATE, 1
	warp_event 29, 29, FARM_GATE, 2

	def_coord_events

	def_bg_events
	bg_event 13, 29, BGEVENT_READ, StartersFarmSignpost

	def_object_events
