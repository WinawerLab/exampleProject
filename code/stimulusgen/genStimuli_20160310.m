% GENERATE STIMULI - Generate fake stimuli for a hypothetical experiment
% Experiment run on 2016-03-10

% NOTE: This stimulus-generation script has been titled with its date
%   (2016-03-10) rather than just "genStimuli.m". The rationale in this
%   case is that the experiment was run once in the past, and we might forget
%   exactly what we did by the time we get around to analyzing it, so it helps
%   to have a canonical snapshot of exactly what was run for the experiment
%   conducted on March 10th, without having to dig around in version control
%   to recover it. Copies of this file can be made for future experiments.
%   Making archival versions of scripts that were run once is the primary case
%   when copying-and-pasting old code is a good idea.

% Construct demo stimuli: random noise at different contrasts
res = 300;                      
contrasts = [0.125, 0.25, 0.5, 0.75];
ims = zeros(res, res, length(contrasts));
rngSeed = sum(100*clock); rng(rngSeed); % set random seed for reproducibility
for c = 1:length(contrasts)
    im = rand(res) - 0.5;
    im = im * contrasts(c);
    ims(:,:,c) = im;
end

% NOTE: Here we add metadata to the saved data explaining where the data
%   came from, how it was generated, what it is for, etc. The easiest way
%   to save the stimuli would be to just save the "ims" matrix, with no
%   other annotations, but then we might forget what the different contrast
%   values were, or what the experiment was, or what script created it,
%   or what the dimensions are. By creating a struct to hold the stimuli,
%   we can store all that information easily, so that we're never confused
%   in the future.

% Prepare to save stimuli
stimuli = struct();
stimuli.ims = ims;
stimuli.contrasts = contrasts;
stimuli.genStimuliFile = 'genStimuli_20160310.m';
stimuli.rngSeed = rngSeed; % with the rng seed, we can rerun this script exactly
stimuli.date = '2016-03-10';
stimuli.dimensions = sprintf('xpixels * ypixels * contrast levels');
stimuli.notes = 'Fake stimuli for a github demo authored in March 2016; random noise at different contrasts';
% stimuli.anythingYouMightForgetInTheFuture = 'remember me'


% NOTE: The call to the "exampleProjectRootpath" script below enables us to
%   easily use absolute file paths on any platform.

% Save stimuli
stimDir = fullfile(exampleProjectRootpath, 'data', 'stimuli');
if ~exist(stimDir,'dir'), mkdir(stimDir), end;
save(fullfile(stimDir, '20160310_stimuli.mat'), 'stimuli');
