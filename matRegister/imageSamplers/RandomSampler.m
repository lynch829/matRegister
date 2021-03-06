classdef RandomSampler < ImageSampler
%RANDOMPOSITIONSSAMPLER Sample random positions within image
%
%   Sample random positions within image. Positions correspond to exact
%   positions of elements in physical space.
%
%   Example
%   RandomSampler
%
%   See also
%
%
% ------
% Author: David Legland
% e-mail: david.legland@grignon.inra.fr
% Created: 2011-07-20,    using Matlab 7.9.0.529 (R2009b)
% Copyright 2011 INRA - Cepia Software Platform.

%% Properties
properties
    % the base image
    image;
    
    % number of points to generate
    nPoints;
    
    % generated points
    points;
end


%% Static factory
methods (Static = true)
    function sampler = create(image, n)
        sampler = RandomSampler(image, n);
    end
end


%% Constructor
methods
    function this = RandomSampler(varargin)
        
        if nargin < 1
            return;
        end
        
        var = varargin{1};
        if isa(var, 'Image')
            % initialisation constructor
            this.image = var;
            this.nPoints = varargin{2};
            updatePoints(this);
            
        elseif isa(var, 'RandomSampler')
            % copy constructor
            this.image   = var.image;
            this.nPoints = var.nPoints;
            this.points  = var.points;
            
        end
        
    end
end


%% General methods
methods
    function n = positionNumber(this)
        % Number of positions generated by this sampler
        n = this.nPoints;
    end
    
    function points = positions(this)
        % Return the array of sampled positions
        
        points = this.points;
    end
    
    function updatePoints(this)
        
        N = this.nPoints;
        
        dim = size(this.image);
        sp = this.image.spacing;
        or = this.image.origin;
        
        % compute point coordinates
        nd = this.image.dimension;
        if nd == 2
            % 2D images
            this.points = [...
                floor(rand(N, 1)*dim(1)) * sp(1) + or(1) , ...
                floor(rand(N, 1)*dim(2)) * sp(2) + or(2) ];
            
        elseif nd == 3
            % 3D images
            this.points = [...
                floor(rand(N, 1)*dim(1)) * sp(1) + or(1) , ...
                floor(rand(N, 1)*dim(2)) * sp(2) + or(2) , ...
                floor(rand(N, 1)*dim(3)) * sp(3) + or(3) , ...
                ];
            
        else
            error(['Not implemented for dimension ' num2str(nd)]);
        end
        
    end
end

end