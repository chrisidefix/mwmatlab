function out=ensure_vertical(in)
  % Returns the vertical Nx1 version of a vector, if it was 1xN.
  % For a matrix with N>M the input MxN is transposed to NxM.
  % USAGE: out=ENSURE_VERTICAL(in)
  % Mirko Windhoff, 2010
  % $Id$
  s=size(in);
  if numel(s)~=2, error('Input can only be of dims NxM'); end;
  if s(1)<s(2), out=in'; return; end;
  out=in;
end