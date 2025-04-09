clc; clear; close all;

%% Initialize file path and open Simulink Model simulation

addpath(fullfile(matlabroot,'examples','mpc','main'));
mdl = 'mpcACCsystem';
open_system(mdl);

%% Set the value of variables as per the example

Ts = 0.1;
T = 80;

G_ego = tf(1,[0.5,1,0]);

x0_lead = 50;   % initial position for lead car (m)
v0_lead = 25;   % initial velocity for lead car (m/s)

x0_ego = 10;   % initial position for ego car (m)
v0_ego = 20;   % initial velocity for ego car (m/s)

t_gap = 1.4;
D_default = 10;

v_set = 30;

amin_ego = -3;
amax_ego = 2;

%% Reload the simulation and plot the graph

sim(mdl)
mpcACCplot(logsout,D_default,t_gap,v_set)

%% Clear file path and close graph

rmpath(fullfile(matlabroot,'examples','mpc','main'));
bdclose(mdl)

%% New Parameters

Ts = 0.1;
T = 100;

G_ego = tf(1,[0.5,1,0]);

x0_lead = 50;   % initial position for lead car (m)
v0_lead = 25;   % initial velocity for lead car (m/s)

x0_ego = 10;   % initial position for ego car (m)
v0_ego = (80/3.6);   % initial velocity for ego car (m/s)

t_gap = 1.2;
safe_D = 120;
D_default = (safe_D - t_gap*v0_ego);

v_set = 30;

amin_ego = -3;
amax_ego = 2;

