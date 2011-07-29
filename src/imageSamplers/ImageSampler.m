classdef ImageSampler < handle
%IMAGESAMPLER  Abstract base class for other image samplers
%
%   Base class for other image samplers. 
%   An image sampler generate positions in the physical space of image.
%
%
% ------
% Author: David Legland
% e-mail: david.legland@grignon.inra.fr
% Created: 2011-07-20,    using Matlab 7.9.0.529 (R2009b)
% Copyright 2011 INRA - Cepia Software Platform.

methods (Abstract)
    n = positionNumber(this)
    % Number of positions generated by this sampler
    
    points = positions(this)
    % Return the array of sampled positions
end

end
