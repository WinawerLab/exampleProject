% GENERATE STIMULI - Generate fake stimuli for a hypothetical experiment
% Experiment run on 2016-03-10

% Suggestion: "Organize scripts by date when you want old versions to be frozen"
% Here: This stimulus-generation script has been titled with its date
%   (2016-03-10) rather than just "genStimuli.m". The rationale in this
%   case is that the experiment was run once in the past, and we might forget
%   exactly what we did by the time we get around to analyzing it, so it helps
%   to have a canonical snapshot of exactly what was run on March 10th.

% Construct demo stimuli: random noise at different contrasts
res = 300;                      
contrasts = [0.125, 0.25, 0.5, 0.75];
ims = zeros(res, res, length(contrasts));
rngseed = sum(100*clock); rng(rngseed); % set random seed for reproducibility
for c = 1:length(contrasts)
    im = rand(res) - 0.5;
    im = im * contrasts(c);
    ims(:,:,c) = im;
end

% Suggestion: "Keep metadata attached to data whenever possible"
% Here: The easiest way to save the stimuli would be to just save the
%   "ims" matrix, but then we might forget what the different contrast
%   values were, or what the experiment was, or where they came from,
%   or what the dimensions are. By creating a struct to hold the stimuli,
%   we can store all that information easily, so that we're never confused
%   in the future.

% Prepare to save stimuli
stimuli = struct();
stimuli.ims = ims;
stimuli.contrasts = contrasts;
stimuli.genStimuliFile = 'genStimuli_20160310.m';
stimuli.rngseed = rngseed; % with the rng seed, we can rerun this script exactly
stimuli.date = '2016-03-10';
stimuli.dimensions = sprintf('xpixels * ypixels * contrast levels');
stimuli.notes = 'Fake stimuli for a github demo authored in March 2016; random noise at different contrasts';
% stimuli.anythingYouMightForgetInTheFuture = 'remember me'

% Suggestion : "Use relative paths with a 'rootpath' script"

% Save stimuli
stimdir = fullfile(rootpath, 'data', 'stimuli'); if ~exist(stimdir,'dir'), mkdir(stimdir), end;
save(fullfile(stimdir, 'stimuli_20160310.mat'), 'stimuli');
