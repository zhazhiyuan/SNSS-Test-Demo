
function  [Denoising,  difff, ite, par] = SNSS_Denoising(par,model,Err_or)
im_out = par.nim;
par.nSig0 = par.nSig;
[h,  w] = size(im_out);
par.maxr = h-par.ps+1;
par.maxc = w-par.ps+1;
par.maxrc = par.maxr * par.maxc;
par.h = h;
par.w = w;
r = 1:par.step:par.maxr;
par.r = [r r(end)+1:par.maxr];
c = 1:par.step:par.maxc;
par.c = [c c(end)+1:par.maxc];
par.lenr = length(par.r);
par.lenc = length(par.c);
par.lenrc = par.lenr*par.lenc;
par.ps2 = par.ps^2;

Z     =    par.Z;

INDEX_N   =    par.INDEX_N;


cnt         =   1;

AllPSNR     =  zeros(1,par.IteNum );

Denoising  =   cell (1,par.IteNum);


for ite = 1 : par.IteNum
    
    
    im_out = im_out + par.delta*(par.nim - im_out);

    if ite == 1
        par.nSig = par.nSig0;
    else
        dif = mean( mean( (par.nim - im_out).^2 ) ) ;
        par.nSig = sqrt( abs( par.nSig0^2 - dif ) )*par.gamma;
    end
    % search non-local patch groups
    [nDCnlX,blk_arr,DC,par] = CalNonLocal( im_out, par);

    if mod(ite-1,2) == 0
        PYZ = zeros(model.nmodels,size(DC,2));
        sigma2I = par.nSig^2*eye(par.ps2);
        for i = 1:model.nmodels
            sigma = model.covs(:,:,i) + sigma2I;
            [R,~] = chol(sigma);
            Q = R'\nDCnlX;
            TempPYZ = - sum(log(diag(R))) - dot(Q,Q,1)/2;
            TempPYZ = reshape(TempPYZ,[par.nlsp size(DC,2)]);
            PYZ(i,:) = sum(TempPYZ);
        end
        
        
        % find the most likely component for each patch group
        [~,dicidx] = max(PYZ);
        dicidx = dicidx';
        [idx,  s_idx] = sort(dicidx);
        idx2 = idx(1:end-1) - idx(2:end);
        seq = find(idx2);
        seg = [0; seq; length(dicidx)];
        
    end
    
    X_hat = zeros(par.ps2,par.maxrc,'single');
    
    W = zeros(par.ps2,par.maxrc,'single');
    
    
 
    for   j = 1:length(seg)-1
        
        idx =   s_idx(seg(j)+1:seg(j+1));
        
        cls =   dicidx(idx(1));
        
      %  j
        
        for i = 1:size(idx,1)
            
            
            Y = nDCnlX(:,(idx(i)-1)*par.nlsp+1:idx(i)*par.nlsp);
           
                
                [mm,~]          =       size(INDEX_N{cls});
                
                M_1             =       zeros (1, mm);
                
                idx1            =       INDEX_N{cls};
                
                for   nn        =      1:mm
                   
                    
%                    Dis         =      (Y- Z(:,(idx1(nn)-1)*par.nlsp+1:idx1(nn)*par.nlsp)).^2; 
                    
                    Dis         =      abs(Y- Z(:,(idx1(nn)-1)*par.nlsp+1:idx1(nn)*par.nlsp));  
                    % We use L1-norm to enhace the accuration of group selection.
                        
           %         M_1(1,nn)     =       mean (Dis(:));
           
                     M_1(1,nn)     =      sum(sum (Dis));
 
                end   
                
              [~,ind1]    =     sort(M_1);
            
               indc1      =     idx1( ind1( 1 ) );  
            
               E_PG       =     Z (:,(indc1-1)*par.nlsp+1:indc1*par.nlsp);   
         
            
          Y_New          =       [Y, E_PG];           
                
            
            
         TMP                 =          WNNM_Temp( Y_New, par.lam, par.nSig); %Core  
         
 
            
            X_hat(:,blk_arr(:,idx(i))) = X_hat(:,blk_arr(:,idx(i)))+bsxfun(@plus,TMP(:,1:par.nlsp), DC(:,idx(i)));
            W(:,blk_arr(:,idx(i))) = W(:,blk_arr(:,idx(i)))+ones(par.ps2,par.nlsp);

        end
    end
    % Reconstruction
    im_out = zeros(h,w,'single');
    im_wei = zeros(h,w,'single');
    

    r = 1:par.maxr;
    c = 1:par.maxc;
    k = 0;
    for i = 1:par.ps
        for j = 1:par.ps
            k = k+1;
            im_out(r-1+i,c-1+j)  =  im_out(r-1+i,c-1+j) + reshape( X_hat(k,:)', [par.maxr par.maxc]);
            im_wei(r-1+i,c-1+j)  =  im_wei(r-1+i,c-1+j) + reshape( W(k,:)', [par.maxr par.maxc]);
            
        end
    end
    im_out  =  im_out./im_wei;
    

    
        Denoising{ite}  =   im_out;

        AllPSNR(ite)  = csnr( im_out*255, par.I*255, 0, 0);
              
        fprintf( 'SNSS----Iteration %d : PSNR = %f\n', cnt, csnr( im_out*255, par.I*255, 0, 0) );
        
        cnt   =  cnt + 1;

   if ite>1
       
     difff      =  norm(abs(Denoising{ite}) - abs(Denoising{ite-1}),'fro')/norm(abs(Denoising{ite-1}), 'fro');
     
       if difff< Err_or%AllPSNR(ite) -AllPSNR(ite-1)<0.0012 
           break;
       end    
   end        
    

end
im_out(im_out > 1) = 1;
im_out(im_out < 0) = 0;
end
