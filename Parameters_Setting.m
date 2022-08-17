function  [par, model]  =  Parameters_Setting( nSig, delta, gamma, lamada )

par.step = 4;       % the step of two neighbor patches
par.IteNum = 30;  % the iteration number
par.nSig      =   nSig/255;

if nSig <= 10
    load './model/PG_Class_GMM_7x7_win25_nlsp30_step10_cls256.mat';
    par.lam = lamada;
    par.delta = delta;
    par.gamma=  gamma;
elseif nSig<=20
    load './model/PG_Class_GMM_7x7_win25_nlsp30_step10_cls256.mat';
    par.lam = lamada;
    par.delta = delta;
    par.gamma=  gamma;
elseif nSig <=30
    load './model/PG_Class_GMM_7x7_win25_nlsp30_step10_cls256.mat';
    par.lam = lamada;
    par.delta = delta;
    par.gamma=  gamma;
elseif nSig<=40
    load './model/PG_Class_GMM_7x7_win25_nlsp30_step10_cls256.mat';
    par.lam = lamada;
    par.delta = delta;
    par.gamma=  gamma;
elseif nSig<=50
    load './model/PG_Class_GMM_7x7_win25_nlsp30_step10_cls256.mat';
    par.lam = lamada;
    par.delta = delta;
    par.gamma=  gamma;
elseif nSig<=75
    load './model/PG_Class_GMM_8x8_win25_nlsp30_step10_cls256.mat';
    par.lam = lamada;
    par.delta = delta;  
    par.gamma=  gamma;
else
    load './model/PG_Class_GMM_9x9_win25_nlsp40_step10_cls256.mat';
    par.lam = lamada;
    par.delta = delta;
    par.gamma=  gamma;
end
par.ps = ps;        % patch size
par.nlsp = nlsp;  % number of non-local patches
par.Win = win;   % size of window around the patch
par.Z   = Z;
par.INDEX_N   = INDEX_N;
