
%% Load data
% If the data doesn't exist yet, create it
% (Note: This section would not exist in a non-demo environment, because
%  all the stimuli and responses would have been collected experimentally)
stimFile = fullfile(exampleProjectRootpath, 'data', 'stimuli', 'stimuli_20160310.mat');
if ~exist(stimFile, 'file'); genStimuli_20160310; end

respFile = fullfile(exampleProjectRootpath, 'data', 'responses', 'responses_20160310.mat');
if ~exist(respFile, 'file'); genResponses_20160310; end

% Load the data
% (If your data loading is complicated, you can keep dedicated data-loading
%  scripts in e.g. a 'dataload' code directory)
disp('Loading data')
load(stimFile, 'stimuli')
load(respFile, 'responses')

%% Fit a model to the data
% Model form: a * x ^ n
% modelFn = @(params,data)(params(1) * data.^(params(2)));
disp('Running model fit');
modelFn = getExampleExpModel();
initialPt = [1, 1];
xData = stimuli.contrasts; yData = responses;
fitParams = lsqcurvefit(modelFn,initialPt,xData,yData);

%% Verify that the model fit looks good
figure; hold all;
plot(xData, yData, 'o-');
plot(xData, modelFn(fitParams,xData), 'o-');
legend('Data', 'Model', 'Location', 'Best')
xlabel('Contrast level'), ylabel('Response amplitude')

%% Save the figure in a date-specific folder earmarked with *today*'s date
disp('Saving figure');
figDir = fullfile(exampleProjectRootpath, 'figs', datestr(now,'yyyy-mm-dd'));
if ~exist(figDir, 'dir'); mkdir(figDir); end

saveas(gcf,fullfile(figDir,'exampleModelFit.png'));

%% Save the discovered model parameters
disp('Saving model fit parameters');
modelFit = struct();
modelFit.modelFn = 'getExampleExpModel()';
modelFit.stimuli = stimuli;
modelFit.responses = responses;
modelFit.fitParams = fitParams;
modelFit.todaysDate = datestr(now,'yyyy-mm-dd');
modelFit.note = ['Example model fit to check the suitability of', ...
    'an exponential model for relating contrast levels to responses'];

fitsDir = fullfile(exampleProjectRootpath, 'data', 'modelfits', datestr(now,'yyyy-mm-dd'));
if ~exist(fitsDir, 'dir'); mkdir(fitsDir); end
save(fullfile(fitsDir, 'expModelFit.mat'), 'modelFit');

disp('All finished!');

