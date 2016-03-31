% GENERATE RESPONSES - Generate fake responses for a hypothetical experiment

% Construct demo responses
% (In real life, we would have gathered these from an experiment)
errstd = 0.1;
seed = 10; rng(seed);
responses = 3 * [0.125, 0.25, 0.5, 0.75].^2 + errstd*randn(1,4);
    % User's response is assumed to be some transformation of the contrast

% Save responses
respdir = fullfile(exampleProjectRootpath, 'data', 'responses');
if ~exist(respdir,'dir'), mkdir(respdir), end;
save(fullfile(respdir, 'responses_20160310.mat'), 'responses');

% Ideally, you could save metadata with your responses as well