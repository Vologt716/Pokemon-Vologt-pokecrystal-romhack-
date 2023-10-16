	object_const_def
	const MRPOKEMONSHOUSE_GENTLEMAN

MrPokemonsHouse_MapScripts:
	def_scene_scripts
	scene_script MrPokemonsHouseMeetMrPokemonScene, SCENE_MRPOKEMONSHOUSE_MEET_MR_POKEMON
	scene_script MrPokemonsHouseNoopScene,          SCENE_MRPOKEMONSHOUSE_NOOP

	def_callbacks

MrPokemonsHouseMeetMrPokemonScene:
	sdefer MrPokemonsHouseMrPokemonEventScript
	end

MrPokemonsHouseNoopScene:
	end

MrPokemonsHouseMrPokemonEventScript:
	showemote EMOTE_SHOCK, MRPOKEMONSHOUSE_GENTLEMAN, 15
	turnobject MRPOKEMONSHOUSE_GENTLEMAN, DOWN
	opentext
	writetext MrPokemonIntroText1
	waitbutton
	closetext
	applymovement PLAYER, MrPokemonsHouse_PlayerWalksToMrPokemon
	opentext
	writetext MrPokemonIntroText2
	promptbutton
	waitsfx
	giveitem MYSTERY_EGG
	writetext MrPokemonsHouse_GotEggText
	playsound SFX_KEY_ITEM
	waitsfx
	itemnotify
	setevent EVENT_GOT_MYSTERY_EGG_FROM_MR_POKEMON
	blackoutmod CHERRYGROVE_CITY
	writetext MrPokemonIntroText3
	promptbutton
	turnobject MRPOKEMONSHOUSE_GENTLEMAN, RIGHT
	writetext MrPokemonIntroText4
	promptbutton
	turnobject MRPOKEMONSHOUSE_GENTLEMAN, DOWN
	writetext MrPokemonIntroText5
	waitbutton
	closetext
	sjump MrPokemonsHouse_OakScript

MrPokemonsHouse_MrPokemonScript:
	faceplayer
	opentext
	checkitem RED_SCALE
	iftrue .RedScale
	checkevent EVENT_GAVE_MYSTERY_EGG_TO_ELM
	iftrue .AlwaysNewDiscoveries
	writetext MrPokemonText_ImDependingOnYou
	waitbutton
	closetext
	end

.AlwaysNewDiscoveries:
	writetext MrPokemonText_AlwaysNewDiscoveries
	waitbutton
	closetext
	end

.RedScale:
	writetext MrPokemonText_GimmeTheScale
	yesorno
	iffalse .refused
	verbosegiveitem EXP_SHARE
	iffalse .full
	takeitem RED_SCALE
	sjump .AlwaysNewDiscoveries

.refused
	writetext MrPokemonText_Disappointed
	waitbutton
.full
	closetext
	end

MrPokemonsHouse_OakScript:
	opentext
	writetext MrPokemonsHouse_MrPokemonHealText
	waitbutton
	closetext
	special FadeBlackQuickly
	special ReloadSpritesNoPalettes
	playmusic MUSIC_HEAL
	special StubbedTrainerRankings_Healings
	special HealParty
	pause 60
	special FadeInQuickly
	special RestartMapMusic
	opentext
	writetext MrPokemonText_ImDependingOnYou
	waitbutton
	closetext
	setevent EVENT_PLAYERS_HOUSE_1F_NEIGHBOR
	clearevent EVENT_PLAYERS_NEIGHBORS_HOUSE_NEIGHBOR
	setscene SCENE_MRPOKEMONSHOUSE_NOOP
	checkevent EVENT_GOT_TOTODILE_FROM_ELM
	iftrue .RivalTakesChikorita
	checkevent EVENT_GOT_CHIKORITA_FROM_ELM
	iftrue .RivalTakesCyndaquil
	setevent EVENT_TOTODILE_POKEBALL_IN_ELMS_LAB
	end

.RivalTakesChikorita:
	setevent EVENT_CHIKORITA_POKEBALL_IN_ELMS_LAB
	end

.RivalTakesCyndaquil:
	setevent EVENT_CYNDAQUIL_POKEBALL_IN_ELMS_LAB
	end

MrPokemonsHouse_ForeignMagazines:
	jumptext MrPokemonsHouse_ForeignMagazinesText

MrPokemonsHouse_BrokenComputer:
	jumptext MrPokemonsHouse_BrokenComputerText

MrPokemonsHouse_StrangeCoins:
	jumptext MrPokemonsHouse_StrangeCoinsText

MrPokemonsHouse_PlayerWalksToMrPokemon:
	step RIGHT
	step UP
	step_end

MrPokemonIntroText1:
	text "Hello, hello! You"
	line "must be <PLAY_G>."

	para "ULYSSES said that"
	line "you would visit."
	done

MrPokemonIntroText2:
	text "This is what I"
	line "want ULYSSES to"
	cont "examine."
	done

MrPokemonsHouse_GotEggText:
	text "<PLAYER> received"
	line "WYBURNUM's PARCEL."
	done

MrPokemonIntroText3:
	text "It seems that the"
	line "whochief executive"
	cont "is in a very bad"
	cont "mood right now."

	para "He instructed me"
	line "to deliver the"
	cont "PACKAGE urgently."

	para "I was confused, so"
	line "I sent a letter to"
	cont "ULYSSES."

	para "I don't know"
	line "what's there, but"
	cont "I think it's very"
	cont "important."
	done

MrPokemonIntroText4:
	text "Even ULYSSES here"
	line "recognizes that."
	done

MrPokemonIntroText5:
	text "Hmm... I guess I"
	line "need to do"
	cont "something else..."
	done

MrPokemonsHouse_MrPokemonHealText:
	text "You are returning"
	line "to ULYSSES?"

	para "Here. Your #MON"
	line "should have some"
	cont "rest."
	done

MrPokemonText_ImDependingOnYou:
	text "I'm depending on"
	line "you!"
	done

MrPokemonText_AlwaysNewDiscoveries:
	text "Life is delight-"
	line "ful! Always, new"

	para "discoveries to be"
	line "made!"
	done

MrPokemonText_GimmeTheScale:
	text "Hm? That SCALE!"
	line "What's that?"
	cont "A red GYARADOS?"

	para "That's rare! "
	line "I, I want it…"

	para "<PLAY_G>, would you"
	line "care to trade it?"

	para "I can offer this"
	line "EXP.SHARE I got"
	cont "from PROF.OAK."
	done

MrPokemonText_Disappointed:
	text "That's disappoint-"
	line "ing. That happens"
	cont "to be very rare."
	done

MrPokemonsHouse_ForeignMagazinesText:
	text "It's packed with"
	line "foreign magazines."

	para "Can't even read"
	line "their titles…"
	done

MrPokemonsHouse_BrokenComputerText:
	text "It's a big com-"
	line "puter. Hmm. It's"
	cont "broken."
	done

MrPokemonsHouse_StrangeCoinsText:
	text "A whole pile of"
	line "strange coins!"

	para "Maybe they're from"
	line "another country…"
	done

MrPokemonsHouse_MapEvents:
	db 0, 0 ; filler

	def_warp_events
	warp_event  2,  7, ROUTE_22, 1
	warp_event  3,  7, ROUTE_22, 1

	def_coord_events

	def_bg_events
	bg_event  0,  1, BGEVENT_READ, MrPokemonsHouse_ForeignMagazines
	bg_event  1,  1, BGEVENT_READ, MrPokemonsHouse_ForeignMagazines
	bg_event  6,  1, BGEVENT_READ, MrPokemonsHouse_BrokenComputer
	bg_event  7,  1, BGEVENT_READ, MrPokemonsHouse_BrokenComputer
	bg_event  6,  4, BGEVENT_READ, MrPokemonsHouse_StrangeCoins

	def_object_events
	object_event  3,  5, SPRITE_GENTLEMAN, SPRITEMOVEDATA_STANDING_RIGHT, 0, 0, -1, -1, 0, OBJECTTYPE_SCRIPT, 0, MrPokemonsHouse_MrPokemonScript, -1
