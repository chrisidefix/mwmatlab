function [result]=det3(in)
  % Calculates the 3x3 determinant over the first 2 dims.
  % input has to be 3x3xNxMx..
  % http://www.mail-archive.com/numpy-discussion@scipy.org/msg12110.html
  % Mirko Windhoff, 2009. License: GPL (see license.txt).
  % $Id$
  s=size(in);
  if s(1) ~= s(2) || s(1) ~= 3
    error('Input must be 3x3xN...');
  end;
  if numel(s)<=2
    result=det(in);
    return;
  end;
  in=reshape(in,[3, 3, prod(s(3:end))]);
  result=reshape(in(1,1,:).*in(2,2,:).*in(3,3,:) ...
        +in(1,2,:).*in(2,3,:).*in(3,1,:) ...
        +in(1,3,:).*in(2,1,:).*in(3,2,:) ...
        -in(1,3,:).*in(2,2,:).*in(3,1,:) ...
        -in(1,2,:).*in(2,1,:).*in(3,3,:) ...
        -in(1,1,:).*in(2,3,:).*in(3,2,:),[1 s(3:end)]);
end
