function B = subarray(A, i1, i2, j1, j2, pad)
% Extract a subarray from an array.
%   B = subarray(A, i1, i2, j1, j2, pad)
%
% Return value
%   B     Output subarray of A
%
% Arguments
%   A     Input array
%   i1    Start row (inclusive)
%   i2    End row (incl.)
%   j1    Start column (incl.)
%   j2    End column (incl.)
%   pad   true => pad with boundary values 
%         false => pad with zeros

% AUTORIGHTS
% -------------------------------------------------------
% Copyright (C) 2011-2012 Ross Girshick
% Copyright (C) 2008, 2009, 2010 Pedro Felzenszwalb, Ross Girshick
% Copyright (C) 2007 Pedro Felzenszwalb, Deva Ramanan
% 
% This file is part of the voc-releaseX code
% (http://people.cs.uchicago.edu/~rbg/latent/)
% and is available under the terms of an MIT-like license
% provided in COPYING. Please retain this notice and
% COPYING if you use this file (or a portion of it) in
% your project.
% -------------------------------------------------------

dim = size(A);

i1c = max(i1, 1);
i2c = min(i2, dim(1));
j1c = max(j1, 1);
j2c = min(j2, dim(2));

B = A(i1c:i2c, j1c:j2c, :);

ipad1 = i1c - i1;
jpad1 = j1c - j1;
ipad2 = i2 - i2c;
jpad2 = j2 - j2c;

if pad
  B = padarray(B, [ipad1 jpad1], 'replicate', 'pre');
  B = padarray(B, [ipad2 jpad2], 'replicate', 'post');
else
  B = padarray(B, [ipad1 jpad1], 0, 'pre');
  B = padarray(B, [ipad2 jpad2], 0, 'post');
end
