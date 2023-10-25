	object_const_def
	const EMPLOYEESONLY_OFFICER1
	const EMPLOYEESONLY_OFFICER2

EmployeesOnly_MapScripts:
	def_scene_scripts

	def_callbacks

EmployeesOnlyOfficer1Script:
	jumptextfaceplayer EmployeesOnlyOfficer1Text

EmployeesOnlyOfficer2Script:
	jumptextfaceplayer EmployeesOnlyOfficer2Text

EmployeesOnlyOfficer1Text:
	text "Entrance is for"
	line "staff only,"

	para "please leave this"
	line "corridor."
	done

EmployeesOnlyOfficer2Text:
	text "Entrance is for"
	line "staff only,"

	para "please leave this"
	line "corridor."
	done

EmployeesOnly_MapEvents:
	db 0, 0 ; filler

	def_warp_events
	warp_event  7, 12, ROUTE_29, 2
	warp_event  7,  9, SHORT_CUT, 1
	warp_event 19, 19, SHORT_CUT, 2
	warp_event 19, 22, ROUTE_22, 2

	def_coord_events

	def_bg_events

	def_object_events
	object_event  7, 10, SPRITE_OFFICER, SPRITEMOVEDATA_STANDING_DOWN, 0, 0, -1, -1, PAL_NPC_GREEN, OBJECTTYPE_SCRIPT, 0, EmployeesOnlyOfficer1Script, -1
	object_event 19, 20, SPRITE_OFFICER, SPRITEMOVEDATA_STANDING_DOWN, 0, 0, -1, -1, PAL_NPC_BLUE, OBJECTTYPE_SCRIPT, 0, EmployeesOnlyOfficer2Script, -1
