	object_const_def
	const ALPHATOWN_SALIONY

AlphaTown_MapScripts:
	def_scene_scripts
	scene_script AlphaTownNoop1Scene, SCENE_ALPHATOWN_SALIONY_STOPS_YOU
	scene_script AlphaTownNoop2Scene, SCENE_ALPHATOWN_NOOP

	def_callbacks
	callback MAPCALLBACK_NEWMAP, AlphaTownFlypointCallback

AlphaTownNoop1Scene:
	end

AlphaTownNoop2Scene:
	end

AlphaTownFlypointCallback:
	setflag ENGINE_FLYPOINT_ALPHA
	clearevent EVENT_FIRST_TIME_BANKING_WITH_MOM
	endcallback

AlphaTown_SalionyStopsYouScene1:
	playmusic MUSIC_MOM
	turnobject ALPHATOWN_SALIONY, DOWN
	opentext
	writetext Text_WaitPlayer2
	waitbutton
	closetext
	turnobject PLAYER, UP
	applymovement ALPHATOWN_SALIONY, AlphaTown_SalionyRunsToYouMovement1
	opentext
	writetext Text_WhatDoYouThinkYoureDoing2
	waitbutton
	closetext
	follow ALPHATOWN_SALIONY, PLAYER
	applymovement ALPHATOWN_SALIONY, AlphaTown_SalionyBringsYouBackMovement1
	stopfollow
	opentext
	writetext Text_ItsDangerousToGoAlone2
	waitbutton
	closetext
	special RestartMapMusic
	end

AlphaTown_SalionyStopsYouScene2:
	playmusic MUSIC_MOM
	turnobject ALPHATOWN_SALIONY, DOWN
	opentext
	writetext Text_WaitPlayer2
	waitbutton
	closetext
	turnobject PLAYER, UP
	applymovement ALPHATOWN_SALIONY, AlphaTown_SalionyRunsToYouMovement2
	turnobject PLAYER, UP
	opentext
	writetext Text_WhatDoYouThinkYoureDoing2
	waitbutton
	closetext
	follow ALPHATOWN_SALIONY, PLAYER
	applymovement ALPHATOWN_SALIONY, AlphaTown_SalionyBringsYouBackMovement2
	stopfollow
	opentext
	writetext Text_ItsDangerousToGoAlone2
	waitbutton
	closetext
	special RestartMapMusic
	end

AlphaTownSalionyScript:
	faceplayer
	opentext
	checkevent EVENT_TALKED_TO_MOM_AFTER_MYSTERY_EGG_QUEST
	iftrue .CallMom
	checkevent EVENT_GAVE_MYSTERY_EGG_TO_ELM
	iftrue .TellMomYoureLeaving
	checkevent EVENT_GOT_A_POKEMON_FROM_ELM
	iftrue .MonIsAdorable
	writetext Text_GearIsImpressive2
	waitbutton
	closetext
	end

.MonIsAdorable:
	writetext Text_YourMonIsAdorable2
	waitbutton
	closetext
	end

.TellMomYoureLeaving:
	writetext Text_TellMomIfLeaving2
	waitbutton
	closetext
	end

.CallMom:
	writetext Text_CallMomOnGear2
	waitbutton
	closetext
	end

AlphaTownPlayersHouseSign:
	jumptext AlphaTownPlayersHouseSignText

AlphaTownWyburnumsLabSign:
	jumptext AlphaTownWyburnumsLabSignText

AlphaTown_SalionyRunsToYouMovement1:
	step DOWN
	step DOWN
	step_end

AlphaTown_SalionyRunsToYouMovement2:
	step DOWN
	step DOWN
	step DOWN
	turn_head RIGHT
	step_end

AlphaTown_SalionyBringsYouBackMovement1:
	step UP
	step UP
	turn_head DOWN
	step_end

AlphaTown_SalionyBringsYouBackMovement2:
	step UP
	step UP
	step UP
	turn_head DOWN
	step_end

Text_GearIsImpressive2:
	text "Wow, your #GEAR"
	line "is impressive!"

	para "Did your mom get"
	line "it for you?"
	done

Text_WaitPlayer2:
	text "Wait, <PLAY_G>!"
	done

Text_WhatDoYouThinkYoureDoing2:
	text "What do you think"
	line "you're doing?"
	done

Text_ItsDangerousToGoAlone2:
	text "It's dangerous to"
	line "go out without a"
	cont "#MON!"

	para "Wild #MON"
	line "jump out of the"

	para "grass on the way"
	line "to the next town."
	done

Text_YourMonIsAdorable2:
	text "Oh! Your #MON"
	line "is adorable!"
	cont "I wish I had one!"
	done

Text_TellMomIfLeaving2:
	text "Hi, <PLAY_G>!"
	line "Leaving again?"

	para "You should tell"
	line "your mom if you"
	cont "are leaving."
	done

Text_CallMomOnGear2:
	text "Call your mom on"
	line "your #GEAR to"

	para "let her know how"
	line "you're doing."
	done

AlphaTownPlayersHouseSignText:
	text "<PLAYER>'s House"
	done

AlphaTownWyburnumsLabSignText:
	text "WYBURNUM LAB"
	done

AlphaTown_MapEvents:
	db 0, 0 ; filler

	def_warp_events
	warp_event  9, 13, UWS_LAB, 1
	warp_event  9,  7, PLAYERS_HOUSE_1F, 1

	def_coord_events
	coord_event  8, 17, SCENE_ALPHATOWN_SALIONY_STOPS_YOU, AlphaTown_SalionyStopsYouScene1
	coord_event  9, 17, SCENE_ALPHATOWN_SALIONY_STOPS_YOU, AlphaTown_SalionyStopsYouScene2

	def_bg_events
	bg_event  7,  7, BGEVENT_READ, AlphaTownPlayersHouseSign
	bg_event  7, 13, BGEVENT_READ, AlphaTownWyburnumsLabSign

	def_object_events
	object_event  8, 14, SPRITE_SALIONY, SPRITEMOVEDATA_SPINRANDOM_SLOW, 1, 0, -1, -1, 0, OBJECTTYPE_SCRIPT, 0, AlphaTownSalionyScript, -1
