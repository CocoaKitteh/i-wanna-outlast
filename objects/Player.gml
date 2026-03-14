#define Create_0
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
djump=true
max_hspeed=2.5
max_vspeed=7.5
grav=0.36*50/60
j=-8.6*50/60
dj=-6.67*50/60
image_speed=0.2*50/60
#define Step_0
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
l=keyboard_check(vk_left)
r=keyboard_check(vk_right)

vspeed+=grav

if l or r begin
    if r then hspeed=max_hspeed
    else hspeed=-max_hspeed
    image_xscale=sign(hspeed)
end else hspeed=0

if keyboard_check_pressed(vk_shift) begin
    if place_meeting(x,y+1,Block) begin
        vspeed=j
        djump=true
        audio_play_single(snd("jump.wav"))
    end else begin
        if djump begin
            vspeed=dj
            djump=false
            audio_play_single(snd("djump.wav"))
        end
    end
end

if keyboard_check_released(vk_shift) and vspeed<0 then vspeed*=0.45
if vspeed>=max_vspeed vspeed=max_vspeed

if keyboard_check_pressed(ord("Z")) and instance_number(Bullet)<6 begin
    b=instance_create(x-2*image_xscale,y-2,Bullet)
    b.hspeed=16*sign(image_xscale)
    audio_play_single(snd("shoot.wav"))
end

if place_meeting(x,y,PlayerKiller) or keyboard_check_pressed(ord("Q")) then kill_player()
#define Step_2
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
if l or r and place_meeting(x,y+1,Block) and vspeed>=0 begin
    sprite_index=sprPlayerRun
    image_speed=0.5*50/60
end else begin
    sprite_index=sprPlayerIdle
    image_speed=0.2*50/60
end

if !place_meeting(x,y+1,Block) and vspeed!=0 begin
    if vspeed>=0 then sprite_index=sprPlayerFall else sprite_index=sprPlayerJump
    image_speed=0.5*50/60
end
#define Collision_Block
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
if !place_free(x+hspeed,y) begin
    if hspeed<=0 then move_contact_solid(180,abs(hspeed))
    if hspeed>0 then move_contact_solid(0,abs(hspeed))
    hspeed=0
end
while !place_free(x+hspeed,y) x+=0.5
if !place_free(x,y+vspeed) begin
    if vspeed<=0 then move_contact_solid(90,abs(vspeed))
    if vspeed>0 begin
        move_contact_solid(270,abs(vspeed))
        djump=true
    end
    vspeed=0
end
if !place_free(x+hspeed,y+vspeed) then hspeed=0
