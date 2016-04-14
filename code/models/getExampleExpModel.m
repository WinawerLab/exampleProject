% GET EXAMPLE EXPONENTIAL MODEL
%
% Returns a function that computes an exponential function of
%   its input, y = a*x.^n
%
% Input: none
% Output: modelFn, a function from (params,data) to output.
%   params is a two-element vector (a,n)
%   data is a vector or matrix of any size
%   the returned value will be a vector of the same size as the data

% NOTE: this function *returns a function*
function modelFn = getExampleExpModel()
    modelFn = @(params,data)(params(1) * data.^(params(2)));
end