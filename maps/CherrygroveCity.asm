	object_const_def

CherrygroveCity_MapScripts:
	def_scene_scripts
	scene_script CherrygroveCityNoop1Scene, SCENE_CHERRYGROVECITY_NOOP

	def_callbacks
	callback MAPCALLBACK_NEWMAP, CherrygroveCityFlypointCallback

CherrygroveCityNoop1Scene:
	end

CherrygroveCityNoop2Scene:
	end

CherrygroveCityFlypointCallback:
	setflag ENGINE_FLYPOINT_CHERRYGROVE
	endcallback

CherrygroveCitySign:
	jumptext CherrygroveCitySignText

CherrygroveCityPokecenterSign:
	jumpstd PokecenterSignScript

CherrygroveCityMartSign:
	jumpstd MartSignScript

CherrygroveCity_UnusedMovementData: ; unreferenced
	step LEFT
	turn_head DOWN
	step_end

CherrygroveCitySignText:
	text "CITY B"

	para "Passage yard"
	done

CherrygroveCity_MapEvents:
	db 0, 0 ; filler

	def_warp_events
	warp_event  5,  7, CHERRYGROVE_MART, 2
	warp_event 13,  7, CHERRYGROVE_POKECENTER_1F, 1

	def_coord_events

	def_bg_events
	bg_event 11,  7, BGEVENT_READ, CherrygroveCitySign
	bg_event  6,  7, BGEVENT_READ, CherrygroveCityMartSign
	bg_event 14,  7, BGEVENT_READ, CherrygroveCityPokecenterSign

	def_object_events
