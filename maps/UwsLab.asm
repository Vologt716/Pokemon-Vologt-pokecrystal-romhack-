	object_const_def
	const UWSLAB_ULYSSES
	const UWSLAB_POKE_BALL2

UwsLab_MapScripts:
	def_scene_scripts
	scene_script UwsLabMeetUwScene,  SCENE_UWSLAB_MEET_UW
	scene_script UwsLabNoop1Scene,   SCENE_UWSLAB_CANT_LEAVE
	scene_script UwsLabNoop2Scene,   SCENE_UWSLAB_NOOP

	def_callbacks
	callback MAPCALLBACK_OBJECTS, UwsLabMoveUwCallback

UwsLabMeetUwScene:
	sdefer UwsLabWalkUpToUwScript
	end

UwsLabNoop1Scene:
	end

UwsLabNoop2Scene:
	end

UwsLabMoveUwCallback:
	checkscene
	iftrue .Skip ; not SCENE_UWSLAB_MEET_UW
	moveobject UWSLAB_ULYSSES, 3, 4
.Skip:
	endcallback

UwsLabWalkUpToUwScript:
	applymovement PLAYER, UwsLab_WalkUpToUwMovement
	showemote EMOTE_SHOCK, UWSLAB_ULYSSES, 15
	turnobject UWSLAB_ULYSSES, RIGHT
	opentext
	writetext UwText_Intro
.MustSayYes:
	yesorno
	iftrue .UwGetsEmail
	writetext UwText_Refused
	sjump .MustSayYes

.UwGetsEmail:
	writetext UwText_Accepted
	promptbutton
	writetext UwText_ResearchAmbitions
	waitbutton
	closetext
	playsound SFX_GLASS_TING
	pause 30
	showemote EMOTE_SHOCK, UWSLAB_ULYSSES, 10
	turnobject UWSLAB_ULYSSES, DOWN
	opentext
	writetext UwText_GotAnEmail
	waitbutton
	closetext
	opentext
	turnobject UWSLAB_ULYSSES, RIGHT
	writetext UwText_MissionFromMrPokemon
	waitbutton
	closetext
	applymovement UWSLAB_ULYSSES, UwsLab_UwToDefaultPositionMovement1
	turnobject PLAYER, UP
	applymovement UWSLAB_ULYSSES, UwsLab_UwToDefaultPositionMovement2
	turnobject PLAYER, RIGHT
	opentext
	writetext UwText_ChooseAPokemon
	waitbutton
	setscene SCENE_UWSLAB_CANT_LEAVE
	closetext
	end

ProfUwScript:
	faceplayer
	opentext
	checkevent EVENT_GOT_A_POKEMON_FROM_UW
	iftrue UwDescribesMrPokemonScript
	writetext UwText_LetYourMonBattleIt
	waitbutton
	closetext
	end

LabTryToLeave2Script:
	turnobject UWSLAB_ULYSSES, DOWN
	opentext
	writetext LabWhereGoing2Text
	waitbutton
	closetext
	applymovement PLAYER, UwsLab_CantLeaveMovement
	end

DittoPokeBallScript:
	checkevent EVENT_GOT_A_POKEMON_FROM_UW
	iftrue LookAtUwPokeBallScript
	turnobject UWSLAB_ULYSSES, DOWN
	refreshscreen
	pokepic DITTO
	cry DITTO
	waitbutton
	closepokepic
	opentext
	writetext TakeDittoText
	yesorno
	iffalse DidntChooseStarter2Script
	disappear UWSLAB_POKE_BALL2
	setevent EVENT_GOT_DITTO_FROM_UW
	writetext ChoseStarter2Text
	promptbutton
	waitsfx
	getmonname STRING_BUFFER_3, DITTO
	writetext ReceivedStarter2Text
	playsound SFX_CAUGHT_MON
	waitsfx
	promptbutton
	givepoke DITTO, 5, BERRY
	closetext
	readvar VAR_FACING
	ifequal RIGHT, UwDirectionsScript
	applymovement PLAYER, AfterDittoMovement
	sjump UwDirectionsScript

DidntChooseStarter2Script:
	writetext DidntChooseStarter2Text
	waitbutton
	closetext
	end

UwDirectionsScript:
	turnobject PLAYER, UP
	opentext
	writetext UwDirectionsText1
	waitbutton
	closetext
	addcellnum PHONE_ELM
	opentext
	writetext GotUwsNumberText
	playsound SFX_REGISTER_PHONE_NUMBER
	waitsfx
	waitbutton
	closetext
	turnobject UWSLAB_ULYSSES, LEFT
	opentext
	writetext UwDirectionsText2
	waitbutton
	closetext
	turnobject UWSLAB_ULYSSES, DOWN
	opentext
	writetext UwDirectionsText3
	waitbutton
	closetext
	setevent EVENT_GOT_A_POKEMON_FROM_UW
	setevent EVENT_RIVAL_CHERRYGROVE_CITY
	setmapscene NEW_BARK_TOWN, SCENE_NEWBARKTOWN_NOOP
	end

UwDescribesMrPokemonScript:
	writetext UwDescribesMrPokemonText
	waitbutton
	closetext
	end

LookAtUwPokeBallScript:
	opentext
	writetext UwPokeBallText
	waitbutton
	closetext
	end

UwsLabHealingMachine:
	opentext
	checkevent EVENT_GOT_A_POKEMON_FROM_UW
	iftrue .CanHeal
	writetext UwsLabHealingMachineText1
	waitbutton
	closetext
	end

.CanHeal:
	writetext UwsLabHealingMachineText2
	yesorno
	iftrue UwsLabHealingMachine_HealParty
	closetext
	end

UwsLabHealingMachine_HealParty:
	special StubbedTrainerRankings_Healings
	special HealParty
	playmusic MUSIC_NONE
	setval HEALMACHINE_UWS_LAB
	special HealMachineAnim
	pause 30
	special RestartMapMusic
	closetext
	end

UwScript_CallYou:
	writetext UwText_CallYou
	waitbutton
UwScript_NoRoomForEverstone:
	closetext
	end

UwJumpBackScript1:
	closetext
	readvar VAR_FACING
	ifequal DOWN, UwJumpDownScript
	ifequal UP, UwJumpUpScript
	ifequal LEFT, UwJumpLeftScript
	ifequal RIGHT, UwJumpRightScript
	end

UwJumpBackScript2:
	closetext
	readvar VAR_FACING
	ifequal DOWN, UwJumpUpScript
	ifequal UP, UwJumpDownScript
	ifequal LEFT, UwJumpRightScript
	ifequal RIGHT, UwJumpLeftScript
	end

UwJumpUpScript:
	applymovement UWSLAB_ULYSSES, UwJumpUpMovement
	opentext
	end

UwJumpDownScript:
	applymovement UWSLAB_ULYSSES, UwJumpDownMovement
	opentext
	end

UwJumpLeftScript:
	applymovement UWSLAB_ULYSSES, UwJumpLeftMovement
	opentext
	end

UwJumpRightScript:
	applymovement UWSLAB_ULYSSES, UwJumpRightMovement
	opentext
	end

UwsLabTravelTip1:
	jumptext UwsLabTravelTip1Text

UwsLabTravelTip2:
	jumptext UwsLabTravelTip2Text

UwsLabTravelTip3:
	jumptext UwsLabTravelTip3Text

UwsLabTravelTip4:
	jumptext UwsLabTravelTip4Text

UwsLabTrashcan:
	jumptext UwsLabTrashcanText

UwsLabPC:
	jumptext UwsLabPCText

UwsLabTrashcan2: ; unreferenced
	jumpstd TrashCanScript

UwsLabBookshelf:
	jumpstd DifficultBookshelfScript

UwsLabPoster1:
	jumptext UwsLabPoster1Text

UwsLabPoster2:
	jumptext UwsLabPoster2Text

UwsLab_WalkUpToUwMovement:
	step UP
	step UP
	step UP
	step UP
	step UP
	step UP
	step UP
	turn_head LEFT
	step_end

UwsLab_CantLeaveMovement:
	step UP
	step_end

UwJumpUpMovement:
	fix_facing
	big_step UP
	remove_fixed_facing
	step_end

UwJumpDownMovement:
	fix_facing
	big_step DOWN
	remove_fixed_facing
	step_end

UwJumpLeftMovement:
	fix_facing
	big_step LEFT
	remove_fixed_facing
	step_end

UwJumpRightMovement:
	fix_facing
	big_step RIGHT
	remove_fixed_facing
	step_end

UwsLab_UwToDefaultPositionMovement1:
	step UP
	step_end

UwsLab_UwToDefaultPositionMovement2:
	step RIGHT
	step RIGHT
	step UP
	turn_head DOWN
	step_end

AfterDittoMovement:
	step LEFT
	step LEFT
	step UP
	turn_head UP
	step_end

UwText_Intro:
	text "ELM: <PLAY_G>!"
	line "There you are!"

	para "I needed to ask"
	line "you a favor."

	para "I'm conducting new"
	line "#MON research"

	para "right now. I was"
	line "wondering if you"

	para "could help me with"
	line "it, <PLAY_G>."

	para "You see…"

	para "I'm writing a"
	line "paper that I want"

	para "to present at a"
	line "conference."

	para "But there are some"
	line "things I don't"

	para "quite understand"
	line "yet."

	para "So!"

	para "I'd like you to"
	line "raise a #MON"

	para "that I recently"
	line "caught."
	done

UwText_Accepted:
	text "Thanks, <PLAY_G>!"

	para "You're a great"
	line "help!"
	done

UwText_Refused:
	text "But… Please, I"
	line "need your help!"
	done

UwText_ResearchAmbitions:
	text "When I announce my"
	line "findings, I'm sure"

	para "we'll delve a bit"
	line "deeper into the"

	para "many mysteries of"
	line "#MON."

	para "You can count on"
	line "it!"
	done

UwText_GotAnEmail:
	text "Oh, hey! I got an"
	line "e-mail!"

	para "<……><……><……>"
	line "Hm… Uh-huh…"

	para "Okay…"
	done

UwText_MissionFromMrPokemon:
	text "Hey, listen."

	para "I have an acquain-"
	line "tance called MR."
	cont "#MON."

	para "He keeps finding"
	line "weird things and"

	para "raving about his"
	line "discoveries."

	para "Anyway, I just got"
	line "an e-mail from him"

	para "saying that this"
	line "time it's real."

	para "It is intriguing,"
	line "but we're busy"

	para "with our #MON"
	line "research…"

	para "Wait!"

	para "I know!"

	para "<PLAY_G>, can you"
	line "go in our place?"
	done

UwText_ChooseAPokemon:
	text "I want you to"
	line "raise one of the"

	para "#MON contained"
	line "in these BALLS."

	para "You'll be that"
	line "#MON's first"
	cont "partner, <PLAY_G>!"

	para "Go on. Pick one!"
	done

UwText_LetYourMonBattleIt:
	text "If a wild #MON"
	line "appears, let your"
	cont "#MON battle it!"
	done

LabWhereGoing2Text:
	text "ELM: Wait! Where"
	line "are you going?"
	done

TakeDittoText:
	text "ELM: So, you like"
	line "DITTO, the"
	cont "normal #MON?"
	done

DidntChooseStarter2Text:
	text "ELM: Think it over"
	line "carefully."

	para "Your partner is"
	line "important."
	done

ChoseStarter2Text:
	text "ELM: I think"
	line "that's a great"
	cont "#MON too!"
	done

ReceivedStarter2Text:
	text "<PLAYER> received"
	line "@"
	text_ram wStringBuffer3
	text "!"
	done

UwDirectionsText1:
	text "MR.#MON lives a"
	line "little bit beyond"

	para "CHERRYGROVE, the"
	line "next city over."

	para "It's almost a"
	line "direct route"

	para "there, so you"
	line "can't miss it."

	para "But just in case,"
	line "here's my phone"

	para "number. Call me if"
	line "anything comes up!"
	done

UwDirectionsText2:
	text "If your #MON is"
	line "hurt, you should"

	para "heal it with this"
	line "machine."

	para "Feel free to use"
	line "it anytime."
	done

UwDirectionsText3:
	text "<PLAY_G>, I'm"
	line "counting on you!"
	done

GotUwsNumberText:
	text "<PLAYER> got ELM's"
	line "phone number."
	done

UwDescribesMrPokemonText:
	text "MR.#MON goes"
	line "everywhere and"
	cont "finds rarities."

	para "Too bad they're"
	line "just rare and"
	cont "not very useful…"
	done

UwPokeBallText:
	text "It contains a"
	line "#MON caught by"
	cont "PROF.ELM."
	done

UwsLabHealingMachineText1:
	text "I wonder what this"
	line "does?"
	done

UwsLabHealingMachineText2:
	text "Would you like to"
	line "heal your #MON?"
	done

UwGiveEverstoneText1:
	text "Thanks, <PLAY_G>!"
	line "You're helping"

	para "unravel #MON"
	line "mysteries for us!"

	para "I want you to have"
	line "this as a token of"
	cont "our appreciation."
	done

UwGiveEverstoneText2:
	text "That's an"
	line "EVERSTONE."

	para "Some species of"
	line "#MON evolve"

	para "when they grow to"
	line "certain levels."

	para "A #MON holding"
	line "the EVERSTONE"
	cont "won't evolve."

	para "Give it to a #-"
	line "MON you don't want"
	cont "to evolve."
	done

UwText_CallYou:
	text "ELM: <PLAY_G>, I'll"
	line "call you if any-"
	cont "thing comes up."
	done

UwGiveTicketText1:
	text "ELM: <PLAY_G>!"
	line "There you are!"

	para "I called because I"
	line "have something for"
	cont "you."

	para "See? It's an"
	line "S.S.TICKET."

	para "Now you can catch"
	line "#MON in KANTO."
	done

UwGiveTicketText2:
	text "The ship departs"
	line "from OLIVINE CITY."

	para "But you knew that"
	line "already, <PLAY_G>."

	para "After all, you've"
	line "traveled all over"
	cont "with your #MON."

	para "Give my regards to"
	line "PROF.OAK in KANTO!"
	done

UwsLabWindowText1:
	text "The window's open."

	para "A pleasant breeze"
	line "is blowing in."
	done

UwsLabWindowText2:
	text "He broke in"
	line "through here!"
	done

UwsLabTravelTip1Text:
	text "<PLAYER> opened a"
	line "book."

	para "Travel Tip 1:"

	para "Press START to"
	line "open the MENU."
	done

UwsLabTravelTip2Text:
	text "<PLAYER> opened a"
	line "book."

	para "Travel Tip 2:"

	para "Record your trip"
	line "with SAVE!"
	done

UwsLabTravelTip3Text:
	text "<PLAYER> opened a"
	line "book."

	para "Travel Tip 3:"

	para "Open your PACK and"
	line "press SELECT to"
	cont "move items."
	done

UwsLabTravelTip4Text:
	text "<PLAYER> opened a"
	line "book."

	para "Travel Tip 4:"

	para "Check your #MON"
	line "moves. Press the"

	para "A Button to switch"
	line "moves."
	done

UwsLabTrashcanText:
	text "The wrapper from"
	line "the snack PROF.ELM"
	cont "ate is in there…"
	done

UwsLabPCText:
	text "OBSERVATIONS ON"
	line "#MON EVOLUTION"

	para "…It says on the"
	line "screen…"
	done

UwsLabPoster1Text:
	text "Press START to"
	line "open the MENU."
	done

UwsLabPoster2Text:
	text "The SAVE option is"
	line "on the MENU."

	para "Use it in a timely"
	line "manner."
	done

UwsLab_MapEvents:
	db 0, 0 ; filler

	def_warp_events
	warp_event  4, 11, ALPHA_TOWN, 1
	warp_event  5, 11, ALPHA_TOWN, 1

	def_coord_events
	coord_event  4,  6, SCENE_UWSLAB_CANT_LEAVE, LabTryToLeave2Script
	coord_event  5,  6, SCENE_UWSLAB_CANT_LEAVE, LabTryToLeave2Script

	def_bg_events
	bg_event  2,  1, BGEVENT_READ, UwsLabHealingMachine
	bg_event  8,  1, BGEVENT_READ, UwsLabBookshelf
	bg_event  9,  1, BGEVENT_READ, UwsLabBookshelf
	bg_event  0,  7, BGEVENT_READ, UwsLabTravelTip1
	bg_event  1,  7, BGEVENT_READ, UwsLabTravelTip2
	bg_event  2,  7, BGEVENT_READ, UwsLabTravelTip3
	bg_event  3,  7, BGEVENT_READ, UwsLabTravelTip4
	bg_event  6,  7, BGEVENT_READ, UwsLabBookshelf
	bg_event  7,  7, BGEVENT_READ, UwsLabBookshelf
	bg_event  8,  7, BGEVENT_READ, UwsLabBookshelf
	bg_event  9,  7, BGEVENT_READ, UwsLabBookshelf
	bg_event  9,  3, BGEVENT_READ, UwsLabTrashcan
	bg_event  3,  5, BGEVENT_DOWN, UwsLabPC
	bg_event  6,  0, BGEVENT_READ, UwsLabPoster1
	bg_event  7,  0, BGEVENT_READ, UwsLabPoster2

	def_object_events
	object_event  5,  2, SPRITE_ULYSSES, SPRITEMOVEDATA_STANDING_DOWN, 0, 0, -1, -1, 0, OBJECTTYPE_SCRIPT, 0, ProfUwScript, -1
	object_event  7,  3, SPRITE_POKE_BALL, SPRITEMOVEDATA_STILL, 0, 0, -1, -1, 0, OBJECTTYPE_SCRIPT, 0, DittoPokeBallScript, EVENT_DITTO_POKEBALL_IN_UWS_LAB
