%% EXAMPLE ANALYSIS
% Load stimuli and responses; fit an exponential model to the data;
% save out figures and model parameters
% Written 2016-03-15

%% NOTE:
% Consult the wiki at https://github.com/WinawerLab/exampleProject
% to follow along with the recommendations implemented here!

%% Load data
% If the data doesn't exist yet, create it
% (Note: This section would not exist in a non-demo environment, because
%  all the stimuli and responses would have been collected experimentally)
stimFile = fullfile(exampleProjectRootpath, 'data', 'stimuli', '20160310_stimuli.mat');
if ~exist(stimFile, 'file'); genStimuli_20160310; end

respFile = fullfile(exampleProjectRootpath, 'data', 'responses', '20160310_responses.mat');
if ~exist(respFile, 'file'); genResponses_20160310; end

% Load the data
% (If your data loading is complicated, you can keep dedicated data-loading
%  scripts in e.g. a 'dataload' code directory)
disp('Loading data')
load(stimFile, 'stimuli')
load(respFile, 'responses')

%% Fit an exponential model to the data
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

%% Save the figure in a date-specific folder earmarked with *today*'s date.
% NOTE: Putting dates on your figures enables you to easily see how your
% work and progress was changing over time, and to revisit the results
% you had at a certain point in the past
disp('Saving figure');
figDir = fullfile(exampleProjectRootpath, 'figs', datestr(now,'yyyy-mm-dd'));
if ~exist(figDir, 'dir'); mkdir(figDir); end

saveas(gcf,fullfile(figDir,'exampleModelFit.png'));

%% Save the discovered model parameters
% NOTE: Saving model fits is especially useful if the model-fitting is
% time-consuming
disp('Saving model fit parameters');
modelFit = struct();
modelFit.modelFn = 'getExampleExpModel()';
modelFit.stimuli = stimuli;
modelFit.responses = responses;
modelFit.fitParams = fitParams;
modelFit.todaysDate = datestr(now,'yyyy-mm-dd');
modelFit.note = ['Example model fit to check the suitability of', ...
    'an exponential model for relating contrast levels to responses'];

fitsDir = fullfile(exampleProjectRootpath, 'data', 'modelfits');
if ~exist(fitsDir, 'dir'); mkdir(fitsDir); end
save(fullfile(fitsDir, [datestr(now,'yyyymmdd'), '_expModelFit.mat']), 'modelFit');

disp('All finished!');

