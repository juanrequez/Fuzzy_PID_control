function [sys,x0,str,ts,simStateCompliance] = takagisugeno_p(t,x,u,flag)
switch flag,
    % Initialization %
    case 0,
        [sys,x0,str,ts,simStateCompliance]=mdlInitializeSizes;
        % Derivatives %
    case 1,
        sys=mdlDerivatives(t,x,u);
        % Update %
    case 2,
        sys=mdlUpdate(t,x,u);
        % Outputs %
    case 3,
        sys=mdlOutputs(t,x,u);
        % GetTimeOfNextVarHit %
    case 4,
        sys=mdlGetTimeOfNextVarHit(t,x,u);
        % Terminate %
    case 9,
        sys=mdlTerminate(t,x,u);
        % Unexpected flags %
    otherwise
        DAStudio.error('Simulink:blocks:unhandledFlag', num2str(flag));
end
% mdlInitializeSizes
% Return the sizes, initial conditions, and sample times for the S-function.
function [sys,x0,str,ts,simStateCompliance]=mdlInitializeSizes
sizes = simsizes;
sizes.NumContStates  = 0;
sizes.NumDiscStates  = 0;
sizes.NumOutputs     = 1;
sizes.NumInputs      = 1;
sizes.DirFeedthrough = 2;
sizes.NumSampleTimes = 1;   % at least one sample time is needed
sys = simsizes(sizes);
x0  = [];
str = [];
ts  = [0 0];
simStateCompliance = 'UnknownSimState';
% mdlDerivatives
% Return the derivatives for the continuous states.
function sys=mdlDerivatives(t,x,u)
sys = [];
% mdlUpdate
% Handle discrete state updates, sample time hits, and major time step
% requirements.
function sys=mdlUpdate(t,x,u)
sys = [];
% mdlOutputs
% Return the block outputs.
function sys=mdlOutputs(t,x,u)
sys = P_takagisugeno(u);
% mdlGetTimeOfNextVarHit
% Return the time of the next hit for this block.  Note that the result is
% absolute time.  Note that this function is only used when you specify a
% variable discrete-time sample time [-2 0] in the sample time array in
% mdlInitializeSizes.
function sys=mdlGetTimeOfNextVarHit(t,x,u)
sampleTime = 1;    %  Example, set the next hit to be one second later.
sys = t + sampleTime;
% mdlTerminate
% Perform any end of simulation tasks.
function sys=mdlTerminate(t,x,u)
sys = [];

