	object_const_def

GammaTown_MapScripts:
	def_scene_scripts
	scene_script GammaTownNoop1Scene, SCENE_GAMMATOWN_NOOP

	def_callbacks
	callback MAPCALLBACK_NEWMAP, GammaTownFlypointCallback

GammaTownNoop1Scene:
	end

GammaTownFlypointCallback:
	setflag ENGINE_FLYPOINT_GAMMA
	endcallback


GammaTown_MapEvents:
	db 0, 0 ; filler

