	object_const_def

BetaTown_MapScripts:
	def_scene_scripts
	scene_script BetaTownNoop1Scene, SCENE_BETATOWN_NOOP

	def_callbacks
	callback MAPCALLBACK_NEWMAP, BetaTownFlypointCallback

BetaTownNoop1Scene:
	end

BetaTownFlypointCallback:
	setflag ENGINE_FLYPOINT_BETA
	endcallback


BetaTown_MapEvents:
	db 0, 0 ; filler

