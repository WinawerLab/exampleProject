# Example Project

This is a demo repository, showing an example directory layout, best practices
for managing files, and a few tricks for keeping your project
organization sane and manageable. The following sections demonstrate best
practices for writing and styling a README, as though this were a real project.

The Winawerlab wiki has a companion page to this repository, which explains
in more detail the coding best practices that are demonstrated here:
https://wikis.nyu.edu/display/winawerlab/Coding+Style+and+Organization

# Summary

ExampleProject is a simulated contrast perception study.

Simulated subjects were shown random noise at different contrasts. Subjects
responded with a numerical measure of perceived contrast. Behavioral responses
are fit with an exponential nonlinear model, with a gain and an exponent.
The fit model parameters are saved.

# How to run this code

In the code/analysis directory, run exampleAnalysis.m. This will automatically
generate all necessary input and output data files.

# Code organization

  * Code directory:
     * analysis - top-level analysis scripts, organized by date
     * models - definitions of different models that can to be fit to behavioral data
     * stimulusgen - code for generating images to be used as experimental stimuli.
  * Data directory:
     * NOTE: Data files in this directory are generally MATLAB structs which contain metadata about their origin.
     * modelfits - saved parameters from model fits, organized by date the model fit was run.
     * responses - experimental responses, organized by date of experiment
     * stimuli - generated images, used as experimental stimuli, organized by date of experiment. 
  * Figures directory: output figures from model-fitting etc., organized by date the figure was generated

# TODO list

  * Finish this README
  * Convert all dates to filenames, not folders (except figs)
  * Finish the wiki suggestions documentation
  * Update the pointers to suggestions that are scattered throughout this code
