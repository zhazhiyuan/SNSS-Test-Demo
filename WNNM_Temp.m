function  X   =   WNNM_Temp( Y, lam, nsig)



[GR_S, Sigma0, GR_D] = svd(full(Y),'econ');  %svd(CurArray);


Sigma0            =   diag(Sigma0);%49*1

S                 =   max( Sigma0.^2/size(Y, 2) - nsig^2, 0 );
thr               =   lam*2*sqrt(2)*nsig^2./ ( sqrt(S) + eps );
S                 =   soft(Sigma0, thr);


    X = GR_S*diag(S)*GR_D';


return;