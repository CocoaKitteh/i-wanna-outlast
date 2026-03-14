move=argument0
i=0
maximiliano=abs(move)
dir=sign(move)

while place_meeting(x,y-1,Block) begin
    y-=sign(move)
    vspeed=0
    if abs(move)==0 break
end

if place_meeting(x,y+move,Block) begin
    while !place_meeting(x,y+dir,Block) and i<maximiliano begin
        y+=dir
        i+=1
    end
    move=0
end

// y+=move
vspeed=move
