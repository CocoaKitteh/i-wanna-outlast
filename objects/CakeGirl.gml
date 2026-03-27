#define Create_0
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
alarm_number=0
a=0
image_alpha=0
floating=true
alarm[0]=90
alarm[2]=600
#define Alarm_0
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
floating=false
direction=choose(45,135)
speed=3
alarm[1]=90
#define Alarm_1
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
r=irandom(360)
for(i=0;i<360;i+=360/8) action_create_object_motion(Knife,x,y,2,i+r)
audio_play_single(snd("shoot.wav"))
alarm[1]=90
#define Alarm_2
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
with Knife begin
    speed=0
    direction=point_direction(x,y,Player.x,Player.y)
    wrap=false
end

speed=0
floating=true
audio_play_single(snd("shming.wav"))
alarm[1]=0
alarm[3]=60
#define Alarm_3
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
with Knife begin
    gravity_direction=direction
    gravity=0.2
end
#define Step_0
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
if image_alpha<1 then image_alpha+=0.05
if floating begin
    y+=cos(a)/2
    a+=0.05
end
if instance_exists(Player) begin if Player.x>=x then image_xscale=1 else image_xscale=-1 end else begin
    while alarm_number<11 begin
        alarm[alarm_number]=0
        alarm_number+=1
    end
    speed=0
    floating=true
end
#define Other_0
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
screen_wrap()
