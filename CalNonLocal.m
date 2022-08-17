
function       [nDCnlX,blk_arr,DC,par] = CalNonLocal( im, par)


im = single(im);
X   = zeros(par.ps2, par.maxrc, 'single');
k   = 0;
for i = 1:par.ps
    for j = 1:par.ps
        k = k+1;
        blk = im(i:end-par.ps+i,j:end-par.ps+j);
        X(k,:) = blk(:)';
    end
end

Index    =   (1:par.maxrc);
Index    =   reshape(Index,par.maxr,par.maxc);

blk_arr  =  zeros(par.nlsp, par.lenrc ,'single');


DC = zeros(par.ps2,par.lenrc,'single');


nDCnlX = zeros(par.ps2,par.lenrc*par.nlsp,'single');
for  i  =  1 :par.lenr
    for  j  =  1 : par.lenc
        row = par.r(i);
        col = par.c(j);
        off = (col-1)*par.maxr + row;
        off1 = (j-1)*par.lenr + i;
       
        
        rmin = max( row - par.Win, 1 );
        rmax = min( row + par.Win, par.maxr );
        cmin = max( col - par.Win, 1 );
        cmax = min( col + par.Win, par.maxc );
        idx     =   Index(rmin:rmax, cmin:cmax);
        idx     =   idx(:);
        neighbor = X(:,idx); 
        
        seed  = X(:,off);
        dis = sum(bsxfun(@minus,neighbor, seed).^2,1);
        [~,ind] = sort(dis);
        indc = idx( ind( 1:par.nlsp ) );
        blk_arr(:,off1) = indc;
        temp = X( : , indc );
        DC(:,off1) = mean(temp,2);
        nDCnlX(:,(off1-1)*par.nlsp+1:off1*par.nlsp) = bsxfun(@minus,temp,DC(:,off1));
    end
end