Music_HomeTown:
	channel_count 3
	channel 1, Music_HomeTown_Ch1
	channel 2, Music_HomeTown_Ch2
	channel 3, Music_HomeTown_Ch3

	db $3 ; unused, leftover from a channel 4
	
Music_HomeTown_Ch1:
	tempo 186
	volume 7, 7
	pitch_offset 1
	stereo_panning FALSE, TRUE
	vibrato 18, 2, 2
	note_type 12, 9, 6
	rest 4
.mainloop:
	duty_cycle 1
	sound_call .sub1
	octave 3
	note B_, 12
	note C#, 1
	rest 1
	octave 2
	note A_, 1
	rest 1
	octave 3
	note G_, 2
	note F#, 2
	duty_cycle 2
	volume_envelope 8, 2
	note E_, 1
	note F#, 1
	note E_, 1
	note D_, 1
	note F#, 1
	note C#, 1
	octave 2
	note B_, 1
	note A_, 1
	note B_, 12
	note D#, 1
	note G_, 1
	duty_cycle 0
	volume_envelope 8, 7
	sound_call .sub1
	octave 3
	note C#, 1
	rest 1
	octave 2
	note B_, 1
	note A_, 1
	rest 1
	octave 3
	note E_, 2
	duty_cycle 2
	volume_envelope 8, 2
	note C#, 1
	rest 1
	octave 2
	note A_, 1
	octave 3
	note C#, 1
	note E_, 1
	note G_, 1
	note A_, 1
	octave 4
	note D#, 1
	note C#, 1
	note E_, 4
	note E_, 1
	note D_, 4
	note A_, 1
	duty_cycle 1
	volume_envelope 5, -6
	sound_call .sub2
	sound_call .sub2
	sound_call .sub2
	octave 2
	note C_, 4
	note G_, 2
	note B_, 2
	octave 3
	note A_, 4
	note D_, 2
	volume_envelope 7, 7
	note G_, 8
	volume_envelope 7, 8
	note F#, 4
	note G_, 4
	note D_, 2
	octave 2
	note A_, 2
	octave 3
	note C#, 2
	note E_, 2
	note G_, 4
	note A_, 4
	note B_, 12
	note B_, 2
	volume_envelope 8, 7
	sound_loop 0, .mainloop

.sub1:
	octave 3
	note A_, 1
	note F#, 1
	rest 1
	note D_, 1
	rest 1
	note A_, 2
	note D_, 1
	rest 1
	note F#, 1
	rest 1
	note A_, 1
	note D_, 1
	rest 1
	note G_, 2
	note A#, 2
	note D_, 1
	rest 1
	note F#, 1
	rest 1
	note D_, 1
	rest 1
	note B_, 2
	note F#, 1
	rest 1
	note F#, 1
	rest 1
	note D_, 1
	rest 1
	octave 4
	note E_, 2
	note G_, 4
	note F#, 2
	note G_, 2
	note A_, 2
	note E_, 2
	note D_, 2
	note C_, 2
	note E_, 2
	note F#, 2
	note E_, 2
	note D_, 2
	note C_, 2
	octave 3
	note D_, 1
	rest 1
	octave 2
	note B_, 8
	note B_, 1
	volume_envelope 7, 7
	rest 1
	note B_, 8
	note G_, 1
.loop1:
	rest 1
	duty_cycle 3
	octave 3
	volume_envelope 9, 2
	note G_, 2
	octave 2
	note B_, 1
	rest 1
	note B_, 1
	rest 1
	note G#, 1
	rest 1
	octave 3
	note E_, 2
	octave 2
	note B_, 1
	rest 1
	sound_ret

.sub2:
	octave 2
	note G_, 2
	note E_, 2
	note B_, 2
	note G_, 2
	note D#, 2
	note G_, 2
	note D#, 2
	volume_envelope 5, -7
	note G_, 1
	note A_, 1
	note B_, 1
	octave 4
	octave 3
	note C_, 1
	note D_, 2
	note F#, 4
	note G_, 4
	note D_, 2
	octave 2
	note C_, 2
	note A_, 2
	octave 3
	note C#, 2
	note B_, 2
	note E_, 2
	sound_loop 2, .loop1
	volume_envelope 3, -7
	octave 4
	note C_, 4
	note G_, 4
	octave 3
	note B_, 4
	note A_, 4
	note G_, 4
	note F#, 4
	note D_, 4
	note E_, 4
	note E_, 2
	volume_envelope 7, 2
	note C_, 1
	sound_ret
	note E_, 1
	note G_, 1
	octave 4
	note C_, 1
	note D_, 1
	note A_, 1
	octave 5
	note D_, 2
	volume_envelope 6, 2
	note D_, 2
	volume_envelope 2, 2
	note D_, 2
	volume_envelope 2, -7
	octave 3
	note D_, 4
	note E_, 4
	note G_, 6
	note A_, 1
	note G_, 1
	volume_envelope 1, -7
	note F#, 8
	sound_loop 0, .mainloop
	

Music_HomeTown_Ch2:
	volume 7, 7
	vibrato 18, 2, 2
	pitch_offset 1
	stereo_panning FALSE, TRUE
	note_type 12, 9, 6
	rest 4
.mainloop:
	duty_cycle 1
	sound_call .sub1
	octave 3
	note B_, 12
	note C#, 1
	rest 1
	octave 2
	note A_, 1
	rest 1
	octave 3
	note G_, 2
	note F#, 2
	duty_cycle 2
	volume_envelope 8, 2
	note E_, 1
	note F#, 1
	note E_, 1
	note D_, 1
	note F#, 1
	note C#, 1
	octave 2
	note B_, 1
	note A_, 1
	note B_, 12
	note D#, 1
	note G_, 1
	duty_cycle 0
	volume_envelope 8, 7
	sound_call .sub1
	octave 3
	note C#, 1
	rest 1
	octave 2
	note B_, 1
	note A_, 1
	rest 1
	octave 3
	note E_, 2
	duty_cycle 2
	volume_envelope 8, 2
	note C#, 1
	rest 1
	octave 2
	note A_, 1
	octave 3
	note C#, 1
	note E_, 1
	note G_, 1
	note A_, 1
	octave 4
	note D#, 1
	note C#, 1
	note E_, 4
	note E_, 1
	note D_, 4
	note A_, 1
	duty_cycle 1
	volume_envelope 5, -6
	sound_call .sub2
	sound_call .sub2
	sound_call .sub2
	octave 2
	note C_, 4
	note G_, 2
	note B_, 2
	octave 3
	note A_, 4
	note D_, 2
	volume_envelope 7, 7
	note G_, 8
	volume_envelope 7, 8
	note F#, 4
	note G_, 4
	note D_, 2
	octave 2
	note A_, 2
	octave 3
	note C#, 2
	note E_, 2
	note G_, 4
	note A_, 4
	note B_, 12
	note B_, 2
	volume_envelope 8, 7
	sound_loop 0, .mainloop

.sub1:
	octave 3
	note A_, 1
	note F#, 1
	rest 1
	note D_, 1
	rest 1
	note A_, 2
	note D_, 1
	rest 1
	note F#, 1
	rest 1
	note A_, 1
	note D_, 1
	rest 1
	note G_, 2
	note A#, 2
	note D_, 1
	rest 1
	note F#, 1
	rest 1
	note D_, 1
	rest 1
	note B_, 2
	note F#, 1
	rest 1
	note F#, 1
	rest 1
	note D_, 1
	rest 1
	octave 4
	note E_, 2
	note G_, 4
	note F#, 2
	note G_, 2
	note A_, 2
	note E_, 2
	note D_, 2
	note C_, 2
	note E_, 2
	note F#, 2
	note E_, 2
	note D_, 2
	note C_, 2
	octave 3
	note D_, 1
	rest 1
	octave 2
	note B_, 8
	note B_, 1
	volume_envelope 7, 7
	rest 1
	note B_, 8
	note G_, 1
.loop1:
	rest 1
	duty_cycle 3
	octave 3
	volume_envelope 9, 2
	note G_, 2
	octave 2
	note B_, 1
	rest 1
	note B_, 1
	rest 1
	note G#, 1
	rest 1
	octave 3
	note E_, 2
	octave 2
	note B_, 1
	rest 1
	sound_ret

.sub2:
	octave 2
	note G_, 2
	note E_, 2
	note B_, 2
	note G_, 2
	note D#, 2
	note G_, 2
	note D#, 2
	volume_envelope 5, -7
	note G_, 1
	note A_, 1
	note B_, 1
	octave 4
	octave 3
	note C_, 1
	note D_, 2
	note F#, 4
	note G_, 4
	note D_, 2
	octave 2
	note C_, 2
	note A_, 2
	octave 3
	note C#, 2
	note B_, 2
	note E_, 2
	sound_loop 2, .loop1
	volume_envelope 3, -7
	octave 4
	note C_, 4
	note G_, 4
	octave 3
	note B_, 4
	note A_, 4
	note G_, 4
	note F#, 4
	note D_, 4
	note E_, 4
	note E_, 2
	volume_envelope 7, 2
	note C_, 1
	sound_ret
	note E_, 1
	note G_, 1
	octave 4
	note C_, 1
	note D_, 1
	note A_, 1
	octave 5
	note D_, 2
	volume_envelope 6, 2
	note D_, 2
	volume_envelope 2, 2
	note D_, 2
	volume_envelope 2, -7
	octave 3
	note D_, 4
	note E_, 4
	note G_, 6
	note A_, 1
	note G_, 1
	volume_envelope 1, -7
	note F#, 8
	sound_loop 0, .mainloop
	
Music_HomeTown_Ch3:
	vibrato 21, 2, 2
	stereo_panning TRUE, FALSE
.mainloop:
	note_type 12, 1, 0
	octave 4
	note D_, 2
	note C_, 2
	note E_, 2
	octave 5
.mainloop:
	note B_, 2
	note F#, 4
	note A_, 2
	note A_, 4
	octave 6
	note G_, 2
	note E_, 2
	note F#, 2
	note E_, 2
	note G_, 2
	note F#, 6
	note D_, 6
	note D_, 2
	octave 5
	octave 4
	note B_, 2
	note A_, 6
	note G_, 1
	rest 1
	note G_, 1
	rest 1
	note A_, 1
	rest 1
	note B_, 1
	note B_, 4
	rest 1
	octave 6
	note C_, 8
	rest 2
	octave 5
	note F#, 2
	note D_, 4
	note G_, 2
	note E_, 2
	note A_, 2
	note B_, 6
	octave 6
	note C_, 1
	octave 5
	note B_, 1
	note A_, 8
	octave 6
	note D_, 2
	note C_, 2
	note C#, 2
	octave 5
	note B_, 2
	octave 6
	note D_, 2
	note G_, 1
	rest 1
	note F#, 1
	rest 1
	note F#, 1
	rest 1
	note G_, 1
	rest 1
	note E_, 6
	note F#, 2
	note E_, 4
	rest 2
	note D_, 1
	rest 1
	note D_, 8
	note E_, 1
	note F#, 4
	note C_, 2
	note A_, 4
	octave 5
	note B_, 2
	note A#, 2
	note A_, 2
	note G_, 2
	note A#, 2
	note A_, 6
	octave 6
	note D_, 2
	note C_, 2
	note C#, 2
	octave 5
	note B_, 2
	note A_, 2
	note G_, 8
	rest 2
	note G_, 2
	note A_, 2
	note B_, 2
	octave 6
	note C_, 8
	note D_, 6
	note C_, 2
	octave 5
	note B_, 8
	note E_, 1
	rest 2
	note F#, 1
	note G_, 2
	note G_, 6
	note A_, 2
	note B_, 2
	octave 6
	note C_, 2
	rest 2
	note C_, 4
	note D_, 6
	note C_, 1
	note D_, 1
	octave 5
	note B_, 8
	rest 2
	note B_, 2
	note A_, 2
	note A_, 6
	note G_, 2
	note G_, 1
	note A_, 8
	note F#, 1
	note E_, 4
	rest 4
	volume_envelope 2, 5
	vibrato 18, 5, 3
	octave 2
	note G_, 16
	note A_, 16
	note G_, 16
	note A_, 16
	note G_, 16
	note A_, 16
	note G_, 16
	note B_, 4
	note A_, 14
	volume_envelope 1, 0
	vibrato 22, 2, 3
	octave 5
	note A_, 8
	note D_, 1
	note G_, 4
	note E_, 4
	note E_, 1
	note F#, 7
	rest 1
	note G_, 3
	rest 1
	note B_, 3
	rest 1
	note B_, 8
	note A_, 8
	sound_loop 0, .mainloop