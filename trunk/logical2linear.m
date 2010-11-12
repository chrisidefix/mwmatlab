function linear_index=logical2linear(logical_index)
  % converts the logical_index to a linear_index.
  % USAGE: linear_index=LOGICAL2LINEAR(logical_index)
  % Mirko Windhoff, 2010
  % $Id: logical2linear.m 432 2010-08-05 11:06:14Z mwindhoff $
  linear_index=find(logical_index);
end