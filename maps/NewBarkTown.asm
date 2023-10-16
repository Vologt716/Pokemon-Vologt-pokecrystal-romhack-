	object_const_def
	const NEWBARKTOWN_TEACHER
	const PALLETTOWN_TEACHER
	const PALLETTOWN_FISHER

NewBarkTown_MapScripts:
	def_scene_scripts
	scene_script NewBarkTownNoop1Scene, SCENE_NEWBARKTOWN_TEACHER_STOPS_YOU
	scene_script NewBarkTownNoop2Scene, SCENE_NEWBARKTOWN_NOOP

	def_callbacks
	callback MAPCALLBACK_NEWMAP, NewBarkTownFlypointCallback

NewBarkTownNoop1Scene:
	end

NewBarkTownNoop2Scene:
	end

NewBarkTownFlypointCallback:
	setflag ENGINE_FLYPOINT_NEW_BARK
	clearevent EVENT_FIRST_TIME_BANKING_WITH_MOM
	endcallback

NewBarkTown_TeacherStopsYouScene1:
	playmusic MUSIC_MOM
	turnobject NEWBARKTOWN_TEACHER, LEFT
	opentext
	writetext Text_WaitPlayer
	waitbutton
	closetext
	turnobject PLAYER, UP
	applymovement NEWBARKTOWN_TEACHER, NewBarkTown_TeacherRunsToYouMovement1
	opentext
	writetext Text_WhatDoYouThinkYoureDoing
	waitbutton
	closetext
	follow NEWBARKTOWN_TEACHER, PLAYER
	applymovement NEWBARKTOWN_TEACHER, NewBarkTown_TeacherBringsYouBackMovement1
	stopfollow
	opentext
	writetext Text_ItsDangerousToGoAlone
	waitbutton
	closetext
	special RestartMapMusic
	end

NewBarkTown_TeacherStopsYouScene2:
	playmusic MUSIC_MOM
	turnobject NEWBARKTOWN_TEACHER, LEFT
	opentext
	writetext Text_WaitPlayer
	waitbutton
	closetext
	turnobject PLAYER, UP
	applymovement NEWBARKTOWN_TEACHER, NewBarkTown_TeacherRunsToYouMovement2
	turnobject PLAYER, LEFT
	opentext
	writetext Text_WhatDoYouThinkYoureDoing
	waitbutton
	closetext
	follow NEWBARKTOWN_TEACHER, PLAYER
	applymovement NEWBARKTOWN_TEACHER, NewBarkTown_TeacherBringsYouBackMovement2
	stopfollow
	opentext
	writetext Text_ItsDangerousToGoAlone
	waitbutton
	closetext
	special RestartMapMusic
	end

NewBarkTownTeacherScript:
	faceplayer
	opentext
	checkevent EVENT_TALKED_TO_MOM_AFTER_MYSTERY_EGG_QUEST
	iftrue .CallMom
	checkevent EVENT_GAVE_MYSTERY_EGG_TO_ELM
	iftrue .TellMomYoureLeaving
	checkevent EVENT_GOT_A_POKEMON_FROM_ELM
	iftrue .MonIsAdorable
	writetext Text_GearIsImpressive
	waitbutton
	closetext
	end

.MonIsAdorable:
	writetext Text_YourMonIsAdorable
	waitbutton
	closetext
	end

.TellMomYoureLeaving:
	writetext Text_TellMomIfLeaving
	waitbutton
	closetext
	end

.CallMom:
	writetext Text_CallMomOnGear
	waitbutton
	closetext
	end

NewBarkTownSign:
	jumptext NewBarkTownSignText

NewBarkTownPlayersHouseSign:
	jumptext NewBarkTownPlayersHouseSignText

NewBarkTownElmsLabSign:
	jumptext NewBarkTownElmsLabSignText

PalletTownTeacherScript:
	jumptextfaceplayer PalletTownTeacherText

PalletTownFisherScript:
	jumptextfaceplayer PalletTownFisherText

NewBarkTown_TeacherRunsToYouMovement1:
	step DOWN
	step_end

NewBarkTown_TeacherRunsToYouMovement2:
	step DOWN
	step DOWN
	turn_head RIGHT
	step_end

NewBarkTown_TeacherBringsYouBackMovement1:
	step UP
	turn_head DOWN
	step_end

NewBarkTown_TeacherBringsYouBackMovement2:
	step UP
	step UP
	turn_head DOWN
	step_end

Text_GearIsImpressive:
	text "SALIONY: Looks "
	line "like you're late"

	para "getting your"
	line "#MON starter."
	done

Text_WaitPlayer:
	text "SALIONY: Wait!"
	done

Text_WhatDoYouThinkYoureDoing:
	text "What are you"
	line "doing?"
	done

Text_ItsDangerousToGoAlone:
	text "I can't let you go"
	line "out without"
	cont "#MON!"

	para "Some disaster may"
	line "happen to you"

	para "as long as I am "
	line "responsible for"
	cont "you."
	done

Text_YourMonIsAdorable:
	text "SALIONY: I hope"
	line "you know what you"
	cont "are going to do?"
	done

Text_TellMomIfLeaving:
	text "Hi, <PLAY_G>!"
	line "Leaving again?"

	para "You should tell"
	line "your mom if you"
	cont "are leaving."
	done

Text_CallMomOnGear:
	text "Call your mom on"
	line "your #GEAR to"

	para "let her know how"
	line "you're doing."
	done

NewBarkTownSignText:
	text "CITY A"

	para "Hostel of show"
	line "participants"
	done

NewBarkTownPlayersHouseSignText:
	text "<PLAYER>'s House"
	done

NewBarkTownElmsLabSignText:
	text "WYBURNUM #MON"
	line "LABORATORY"
	done

PalletTownTeacherText:
	text "I'm raising #-"
	line "MON too."

	para "When they get"
	line "strong, they can"
	cont "protect me!"
	done

PalletTownFisherText:
	text "Technology is"
	line "incredible!"

	para "You can now store"
	line "and recail items"
	cont "and #MON as"
	cont "data via PC!"
	done

NewBarkTown_MapEvents:
	db 0, 0 ; filler

	def_warp_events
	warp_event  9, 13, ELMS_LAB, 1
	warp_event  9,  7, PLAYERS_HOUSE_1F, 1

	def_coord_events
	coord_event  8, 16, SCENE_NEWBARKTOWN_TEACHER_STOPS_YOU, NewBarkTown_TeacherStopsYouScene1
	coord_event  9, 16, SCENE_NEWBARKTOWN_TEACHER_STOPS_YOU, NewBarkTown_TeacherStopsYouScene2

	def_bg_events
	bg_event 13,  9, BGEVENT_READ, NewBarkTownSign
	bg_event  7,  7, BGEVENT_READ, NewBarkTownPlayersHouseSign
	bg_event  7, 13, BGEVENT_READ, NewBarkTownElmsLabSign

	def_object_events
	object_event  8, 14, SPRITE_SALIONY, SPRITEMOVEDATA_SPINRANDOM_SLOW, 1, 0, -1, -1, 0, OBJECTTYPE_SCRIPT, 0, NewBarkTownTeacherScript, -1
	object_event  3,  8, SPRITE_TEACHER, SPRITEMOVEDATA_WANDER, 2, 2, -1, -1, 0, OBJECTTYPE_SCRIPT, 0, PalletTownTeacherScript, -1
	object_event 12, 14, SPRITE_FISHER, SPRITEMOVEDATA_WALK_LEFT_RIGHT, 2, 0, -1, -1, PAL_NPC_GREEN, OBJECTTYPE_SCRIPT, 0, PalletTownFisherScript, -1
