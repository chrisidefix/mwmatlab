function R=rotation_matrix(axis, angle)
  % Gives the rotation matrix around the axis by angle. axis must be sized 
  % 1x3, angle is given in degrees (-360:360).
  % USAGE: R=ROTATION_MATRIX(axis, angle)
  % Mirko Windhoff, 2010
  % $Id$
  if size(axis,1)~=1
    error('Size of axis must be 1x3');
  end;
  axis=axis./norm(axis); % norm the vector to length 1
  angle=angle/180*pi; % convert to radian
  u=axis;
  % using nomenclature of http://en.wikipedia.org/wiki/Rotation_matrix#Axis_of_a_rotation
  P=u.'*u; %
  I=eye(3,3);
  Q=[[0 -u(3) u(2)];[u(3) 0 -u(1)];[-u(2) u(1) 0]];
  R=P+(I-P)*cos(angle)+Q*sin(angle);
end