function [ yeul ] = eul( f,x,y,h )
%EULER 

yeul=y+h.*feval(f,x,y);
end
