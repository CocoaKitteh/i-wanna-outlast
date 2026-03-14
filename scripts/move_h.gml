move=argument0
i=0
maximiliano=abs(move)
dir=sign(move)

while place_meeting(x,y,Block) begin
    x-=sign(move)
    if abs(move)==0 break
end

if place_meeting(x+move,y,Block) begin
    while !place_meeting(x+dir,y,Block) and i<maximiliano begin
        x+=dir
        i+=1
    end
    move=0
end

// x+=move
hspeed=move
