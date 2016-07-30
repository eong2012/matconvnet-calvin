% Trains and tests a Region-based semantic segmentation with end-to-end training on SIFT Flow.
%
% Copyright by Holger Caesar, 2016

% Settings
expNameAppend = 'testRelease';
global glBaseFolder glDatasetFolder glFeaturesFolder; % Define global variables to be used in all scripts
rootFolder = calvin_root();
glBaseFolder = fullfile(rootFolder, 'data');
glDatasetFolder = fullfile(glBaseFolder, 'Datasets');
glFeaturesFolder = fullfile(glBaseFolder, 'Features');
labelingsFolder = fullfile(glFeaturesFolder, 'CNN-Models', 'E2S2', 'SiftFlow', 'Run1', sprintf('%s_e2s2_run1_exp1', 'SiftFlow'), 'labelings-test-epoch-30');

% Download dataset
downloadSiftFlow();

% Download base network
downloadNetwork();

% Download Selective Search
downloadSelectiveSearch();

% Extract region proposals and labels
setupE2S2Regions();

% Train and test network
e2s2_wrapper_SiftFlow();

% Show example segmentation
fileList = dirSubfolders(labelingsFolder);
image = imread(fullfile(labelingsFolder, fileList{1}));
figure();
imshow(image);
