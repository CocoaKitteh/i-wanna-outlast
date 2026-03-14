#define Create_0
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
alarm[0]=10
#define Alarm_0
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
instance_destroy()
#define Step_0
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
for(i=0;i<=360;i+=10) begin
    if random(1)<0.2 begin
        repeat 10 begin
            b=instance_create(x,y,Blood)
            b.direction=i
            b.speed=random(15)
        end
    end
end
