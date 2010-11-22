function logical_index=linear2logical(linear_index, target_size)
  % converts the linear_index to a logical_index of size target_size.
  % USAGE: logical_index=LINEAR2LOGICAL(linear_index, target_size)
  % Mirko Windhoff, 2010. License: GPL (see license.txt).
  % $Id$
  logical_index=logical(zeros(target_size));
  logical_index(linear_index(:))=true;
end
