#define Create_0
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
a=0
#define Step_0
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
a+=1
if a mod 3==0 begin
    s=instance_create(480,270,Shming)
    s.direction=irandom(360)
    s.speed=10
    s.image_alpha=0
end
if !audio_isplaying(snd("game.ogg")) then audio_music_play(snd("game.ogg"))
#define Other_2
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
global.sounds=audio_load_directory(working_directory)
#define Other_3
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
ds_map_destroy(global.sounds)
#define Other_4
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
room_caption="I Wanna Outlast"
audio_stop(snd("game_over.ogg"))
audio_music_resume()
#define Draw_0
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
if room==rmTitle begin
    draw_sprite(sprTitleKid,a/10,440,200+lengthdir_y(12,a*2))
    draw_sprite(sprTitleA,0,480,200+lengthdir_y(12,a*2))
    draw_sprite(sprTitleB,0,480,270+lengthdir_y(12,a*2))
    draw_set_color(make_color_rgb(128,0,255))
    draw_set2(fa_center,fa_middle)
    draw_set_font(ftTitle)
    draw_text(479,450,"PRESS SHIFT TO START")
    draw_text(479,449,"PRESS SHIFT TO START")
    draw_text(479,451,"PRESS SHIFT TO START")
    draw_text(480,449,"PRESS SHIFT TO START")
    draw_text(481,449,"PRESS SHIFT TO START")
    draw_text(481,450,"PRESS SHIFT TO START")
    draw_text(481,451,"PRESS SHIFT TO START")
    draw_text(480,451,"PRESS SHIFT TO START")
    draw_text(478,450,"PRESS SHIFT TO START")
    draw_text(478,449,"PRESS SHIFT TO START")
    draw_text(478,451,"PRESS SHIFT TO START")
    draw_text(480,448,"PRESS SHIFT TO START")
    draw_text(482,449,"PRESS SHIFT TO START")
    draw_text(482,450,"PRESS SHIFT TO START")
    draw_text(482,451,"PRESS SHIFT TO START")
    draw_text(480,452,"PRESS SHIFT TO START")
    draw_set_color(c_black)
    draw_text(480,450,"PRESS SHIFT TO START")
end
draw_set_color(c_white)
#define KeyPress_16
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
if room==rmTitle then room_goto(rmGame)
#define KeyPress_82
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
room_restart()
#define KeyPress_113
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
if room!=rmTitle begin
    audio_all_stop()
    room_goto(rmTitle)
end
