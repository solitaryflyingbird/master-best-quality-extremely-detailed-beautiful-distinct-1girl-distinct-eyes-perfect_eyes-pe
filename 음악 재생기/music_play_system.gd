extends Node2D

export(Resource) var do
export(Resource) var re
export(Resource) var mi
export(Resource) var fa
export(Resource) var sol
export(Resource) var la
export(Resource) var si
export(Resource) var do2

export(Resource) var do_shop
export(Resource) var re_shop
export(Resource) var fa_shop
export(Resource) var sol_shop
export(Resource) var la_shop

var arr= [["레", 6], 3, ["라", 2], 1, ["솔", 6], 2, ["파", 3], 1, ["미", 5], 1, ["레", 1], 1, ["도", 3], 1, ["레", 7], 2]

var notes_dic
var player


func _ready():
	notes_dic = {
	"도": do,
	"레": re,
	"미": mi,
	"파": fa,
	"솔": sol,
	"라": la,
	"시": si,
	"도2": do2,
	"도#": do_shop,
	"레#": re_shop,
	"파#": fa_shop,
	"솔#": sol_shop,
	"라#": la_shop,
}
	player = $player
	play_music()
	
func play_note(note, time):
	player.stream = note
	player.play()
	yield(get_tree().create_timer(time / 4.0), "timeout")
	player.stop()
func play_music():
	for note in arr:
		print(note)
		if note is Array:
			var note_name = note[0]
			var duration = note[1]
			var note_sound = notes_dic[note_name]
			var time = duration
			play_note(note_sound, time)
		elif note is int:
			yield(get_tree().create_timer(note / 4.0), "timeout")  # assume 1 beat = 0.25 seconds
		else:
			print("Invalid note:", note)

