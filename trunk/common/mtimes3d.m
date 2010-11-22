function c=mtimes3d(a,b)
  % Computes the mtimes on the first 2 dimensions of a and b for each 
  % pair of submatrices a(:,:,k)*b(:,:,k). This is limited to matrices 
  % with size(a,2)==size(b,1) and size(a,3)==size(b,3); The output will
  % have the size(c)==[size(a,1) size(b,2) size(a,3)].
  % Usage:
  %   c=mtimes3d(a,b)
  % Examples: 
  %   a is 3x3x10; b is 3x3x10; c=mtimes3d(a,b);
  %
  %   Use reshape, on nD-matrices to form 3D-matrices like:
  %   a is 4x4x10x3; b is 4x4x10x3;
  %   c=reshape(mtimes3d(reshape(a,[4,4,10*3]),reshape(b,[4,4,10*3])),size(a));
  % Mirko Windhoff, 2009. License: GPL (see license.txt).
  % $Id$
  [n,m,l]=size(a);
  [r,s,l2]=size(b);
  if m~=r || l~=l2
    error('Dimensions mismatch: a(1,:,:) and b(:,1,:) must have same size.');
%   elseif n==m && r==n && s==n % a and b are square matrices
%     i = 1:n; i = i(ones(1,m),:); % faster version of repmat(1:n,[m,1]);
%     b2 = permute(b, [2 1 3]);
%     c = reshape(sum(a(i',:,:) .* b2(i,:,:), 2), [n,n,l]);
  else % other cases
    i = 1:n; i = i(ones(1,s),:)'; % faster version of repmat(1:n,[s,1])';
    j = 1:s; j = j(ones(1,n),:);
    b2 = permute(b, [2 1 3]);
    c = reshape(sum(a(i,:,:) .* b2(j,:,:), 2), [n,s,l]);
  end;
end

%% Testing the function:
% n=100000;
% a=repmat(rand(5,3),[1,1,n]);
% b=repmat(rand(3,2),[1,1,n]);
% c1=zeros(size(a,1),size(b,2),size(a,3));
% tic;
% for i=1:n,
%   c1(:,:,i)=a(:,:,i)*b(:,:,i); 
% end; 
% toc;
% 
% tic; 
% c2=mtimes3d(a,b); 
% toc;
% sum(abs(c1(:)-c2(:)))

%% Testing output:
% Elapsed time is 1.594806 seconds.
% Elapsed time is 0.115814 seconds.
% ans =
%      0
