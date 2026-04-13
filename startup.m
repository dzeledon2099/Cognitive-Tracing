addpath(genpath('harness'));
addpath(genpath('tests'));
if ~exist('logs', 'dir'), mkdir('logs'); end
rehash;
fprintf('Research Lab Initialized.\n');
