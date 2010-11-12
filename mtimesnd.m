function [c]=mtimesnd(a,b)
  % This is an convenient interface to mtimes3d for more dimensions.
  % Computes the mtimes on the first 2 dimensions of a and be for each pair
  % of submatrices a(:,:,k,...)*b(:,:,k,...). This is limited to square matrices in
  % dim 1 and 2 only, meaning: size(a)==size(b); But using mtimes3d one could adapt it for 
  % nonsquare dimensions.
  % See mtimes3d for more information.
  % Mirko Windhoff, 2009
  % $Id: mtimesnd.m 433 2010-08-05 22:11:37Z mwindhoff $
  if size(a)~=size(b)
    error('Dimension missmatch.');
  end;
  d=size(a);
  c=reshape(mtimes3d(reshape(a,[d(1),d(2),prod(d(3:end))]),reshape(b,[d(1),d(2),prod(d(3:end))])),size(a));
end

