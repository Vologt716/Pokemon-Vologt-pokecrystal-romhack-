	db MISSINGNO ; 252

	db  100,  100,  100,  100,  100,  100
	;   hp  atk  def  spd  sat  sdf

	db BIRD, BIRD ; type
	db 45 ; catch rate
	db 64 ; base exp
	db NO_ITEM, NO_ITEM ; items
	db GENDER_UNKNOWN ; gender ratio
	db 100 ; unknown 1
	db 120 ; step cycles to hatch
	db 5 ; unknown 2
	INCBIN "gfx/pokemon/missingno/front.dimensions"
	dw NULL, NULL ; unused (beta front/back pics)
	db GROWTH_MEDIUM_SLOW ; growth rate
	dn EGG_NONE, EGG_NONE ; egg groups

	; tm/hm learnset
	tmhm DYNAMICPUNCH, HEADBUTT, ROLLOUT, ROAR, ZAP_CANNON, ROCK_SMASH, BLIZZARD, ICY_WIND, IRON_TAIL, DRAGONBREATH, THUNDER, EARTHQUAKE, DIG, ICE_PUNCH, SLUDGE_BOMB, FIRE_BLAST, THUNDERPUNCH, ATTRACT, THIEF, STEEL_WING, FIRE_PUNCH, FURY_CUTTER, CUT, FLY, SURF, STRENGTH, WHIRLPOOL, WATERFALL, FLAMETHROWER, THUNDERBOLT, ICE_BEAM
	; end
