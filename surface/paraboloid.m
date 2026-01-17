function psa = paraboloid_surface_area(a, b, x0, y0, rx, ry)
% Surface area of a paraboloid over an ellipse
% z = -a (x - x0)^2 - b (y - y0)^2 + C
%
% Inputs:
%   a, b   - curvature coefficients
%   x0,y0  - center of ellipse
%   rx, ry - ellipse semi-axes

    % Surface area integrand
    integrand = @(x,y) sqrt( ...
        1 + (2*a*(x - x0)).^2 + (2*b*(y - y0)).^2 );
    % Bounds
    xmin = x0 - rx;
    xmax = x0 + rx;
    ymin = @(x) y0 - ry * sqrt(1 - ((x - x0).^2) / rx^2);
    ymax = @(x) y0 + ry * sqrt(1 - ((x - x0).^2) / rx^2);
    % Result
    psa = integral2(integrand, xmin, xmax, ymin, ymax, ...
                  'AbsTol', 1e-10, 'RelTol', 1e-8);
end

function ca = ellipse_cone_area(h, rx, ry) 
% Surface area of a cone over an ellipse, opening down
%
% Inputs:
%   h      - height of the cone
%   rx, ry - semi-axis of x and y

    ca = pi * rx * ry * sqrt(1 + (h/rx)^2 + (h/ry)^2);
end

