function ea = ellipse_area(a, b) 
   ea = pi * a * b;
end

function psa = paraboloid_surface_area(a, b, x0, y0, rx, ry)
% Surface area of a paraboloid over an ellipse
% z = -a (x - x0)^2 - b (y - y0)^2 + C
%
% Inputs:
%   a, b   - curvature coefficients
%   x0,y0  - center of ellipse
%   rx, ry - ellipse semi-axes
%

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

function psa_impl = paraboloid_surface_area_impl(h, x0, y0, rx, ry)
    a = h / rx^2;
    b = h / ry^2;
    psa_impl = paraboloid_surface_area(a, b, x0, y0, rx, ry);
end

% estimation of graph 0, width = 20, length = 40, height = 3.98
ea0 = ellipse_area(10, 20);
psa0 = paraboloid_surface_area_impl(3.98, 10, 20, 10, 20);
eca0 = ellipse_cone_area(3.98, 10, 20);
fprintf('Surface area 0 = %.6f\n', ea0);
fprintf('Paraboloid surface area 0 = %.6f\n', psa0);
fprintf('Elliptic cone surface area 0 = %.6f\n', eca0);

fprintf('\n=========================\n');

% estimation of graph 1
ea1 = ellipse_area(20, 25);
psa1 = paraboloid_surface_area_impl(3.98, 20, 25, 20, 25);
eca1 = ellipse_cone_area(3.98, 20, 25);
fprintf('Surface area 1 = %.6f\n', ea1);
fprintf('Paraboloid surface area 1 = %.6f\n', psa1);
fprintf('Elliptic cone surface area 1 = %.6f\n', eca1);

fprintf('\n=========================\n');

% estimation of graph 2
ea2 = ellipse_area(20, 35);
psa2 = paraboloid_surface_area_impl(3.98, 20, 35, 20, 35);
eca2 = ellipse_cone_area(3.98, 20, 35);
fprintf('Surface area 2 = %.6f\n', ea2);
fprintf('Paraboloid surface area 2 = %.6f\n', psa2);
fprintf('Elliptic cone surface area 2 = %.6f\n', eca2);

fprintf('\n=========================\n');

% estimation of graph 3, width = 30, length = 40, height = 3
ea3 = ellipse_area(15, 20);
psa3 = paraboloid_surface_area_impl(3, 15, 20, 15, 20);
eca3 = ellipse_cone_area(3, 15, 20);
fprintf('Surface area 3 = %.6f\n', ea3);
fprintf('Paraboloid surface area 3 = %.6f\n', psa3);
fprintf('Elliptic cone surface area 3 = %.6f\n', eca3);

