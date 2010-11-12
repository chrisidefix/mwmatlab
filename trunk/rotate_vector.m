function v=rotate_vector(v, center, axis, angle)
  % Rotates the vector v around the axis at center by angle. v, center,
  % axis must be sized 1x3, angle is given in degrees (-360:360).
  % USAGE: v=ROTATE_VECTOR(v, center, axis, angle)
  % Mirko Windhoff, 2009
  % $Id: rotate_vector.m 432 2010-08-05 11:06:14Z mwindhoff $
  if size(v,1)~=1 || size(center,1)~=1 || size(axis,1)~=1
    error('Size of input vectors must be 1x3');
  end;
  v_translated=v-center; % move the rotation center to [0 0 0]
  axis=axis./norm(axis); % norm the vector to length 1
  angle=angle/180*pi; % convert to radian
  u=axis;
  % using nomenclature of http://en.wikipedia.org/wiki/Rotation_matrix#Axis_of_a_rotation
  P=u.'*u; %
  I=eye(3,3);
  Q=[[0 -u(3) u(2)];[u(3) 0 -u(1)];[-u(2) u(1) 0]];
  R=P+(I-P)*cos(angle)+Q*sin(angle);
  % apply rotation, translate back
  v=(R*v_translated.').'+center;
end