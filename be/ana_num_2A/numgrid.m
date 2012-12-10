function G = numgrid(R,n)
%NUMGRID Number the grid points in a two dimensional region.
%   G = NUMGRID(REGION,N) numbers the points on an N-by-N grid in
%   the subregion of -1<=x<=1 and -1<=y<=1 determined by REGION.
%   SPY(NUMGRID(REGION,N)) plots the points.
%   DELSQ(NUMGRID(REGION,N)) generates the 5-point discrete Laplacian.
%   The regions currently available are:
%      'S' - the entire square.
%      'L' - the L-shaped domain made from 3/4 of the entire square.
%      'C' - like the 'L', but with a quarter circle in the 4-th square.
%      'D' - the unit disc.
%      'A' - an annulus.
%      'H' - a heart-shaped cardioid.
%      'B' - the exterior of a "Butterfly".
%      'N' - a nested dissection ordering of the square.
%   To add other regions, edit toolbox/matlab/demos/numgrid.m.
%
%   See also DELSQ, DELSQSHOW, DELSQDEMO.

%   Copyright 1984-2005 The MathWorks, Inc. 
%   $Revision: 5.8.4.1 $  $Date: 2005/03/23 20:24:00 $

if R == 'N'
   G = nested(n);
else
   x = ones(n,1)*[-1, (-(n-3):2:(n-3))/(n-1), 1];
   y = flipud(x');
   if R == 'S'
      G = (x > -1) & (x < 1) & (y > -1) & (y < 1);
   elseif R == 'Rec'  % modif rectangle
       G = (x > -0.5) & (x < 0.5) & (y > -1) & (y < 1);  
   elseif R == 'Ne1'  % modif Nervure
      G1 = (x > -1) & (x < -1/3) & (y > -1) & (y < 1);
      G2 = (x > -1/3) & (x < 1/3) & (y > -1) & (y < 1/3);
      G3 = (x > 1/3) & (x < 1) & (y > -1) & (y < 1);
      G=G1+G2+G3;
     elseif R == 'Ne2'  % modif Nervure
      G1 = (x > -1) & (x < -0.33) & (y > -1) & (y < 1);
      G2 = (x > -0.33) & (x < 0.33) & (y > -0.333) & (y < 0.333);
      G3 = (x > 0.3333) & (x < 1) & (y > -1) & (y < 1);
      G=G1+G2+G3;
   elseif R == 'L'
      G = (x > -1) & (x < 1) & (y > -1) & (y < 1) & ( (x > 0) | (y > 0));
   elseif R == 'C'
      G = (x > -1) & (x < 1) & (y > -1) & (y < 1) & ((x+1).^2+(y+1).^2 > 1);
   elseif R == 'D'
      G = x.^2 + y.^2 < 1;
   elseif R == 'A'
      G = ( x.^2 + y.^2 < 1) & ( x.^2 + y.^2 > 1/3);
   elseif R == 'H'
      RHO = .75; SIGMA = .75;
      G = (x.^2+y.^2).*(x.^2+y.^2-SIGMA*y) < RHO*x.^2;
   elseif R == 'B'
      t = atan2(y,x);
      r = sqrt(x.^2 + y.^2);
      G = (r >= sin(2*t) + .2*sin(8*t)) & ...
          (x > -1) & (x < 1) & (y > -1) & (y < 1);
   else
      error('Invalid region type.');
   end
   k = find(G);
   G = zeros(size(G));      % Convert from logical to double matrix
   G(k) = (1:length(k))';
end