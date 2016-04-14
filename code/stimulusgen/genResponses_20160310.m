% GENERATE RESPONSES - Generate fake responses for a hypothetical experiment

% Load the generated stimuli, so that we can use the correct contrast
% values to generate our fake data
stimDir = fullfile(exampleProjectRootpath, 'data', 'stimuli');
load(fullfile(stimDir, '20160310_stimuli.mat'), 'stimuli');

% Construct demo responses
% (In real life, we would have gathered these from an experiment)
errstd = 0.1;
responses = 3 * stimuli.contrasts.^2 + errstd*randn(1,4);
    % User's response is assumed to be some transformation of the contrast

% Save responses
respDir = fullfile(exampleProjectRootpath, 'data', 'responses');
if ~exist(respDir,'dir'), mkdir(respDir), end;
save(fullfile(respDir, '20160310_responses.mat'), 'responses');

% NOTE: Ideally, you could save metadata with your responses as well