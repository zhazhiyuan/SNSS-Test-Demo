function [filename, Sigma, PSNR_Final,FSIM_Final,SSIM_Final]     =  SNSS_Main (filename, Sigma, delta, gamma, lamada, Err_or)

randn ('seed',0);

[par, model]  =  Parameters_Setting( Sigma,delta, gamma, lamada );

fn               =     [filename, '.tif'];

I                =     imread(fn);

[~, ~, kk]       =     size (I);

if kk==3
    
    I     = rgb2gray (I);
       
end


par.I = single( I )/255;


par.nim =   par.I + par.nSig*randn(size(par.I));

fprintf('The initial value of PSNR = %2.4f, SSIM = %2.4f \n', csnr( par.nim*255, par.I*255, 0, 0 ),cal_ssim( par.nim*255, par.I*255, 0, 0 ));



[Denoising1, dif, iter, par]  =  SNSS_Denoising(par,model, Err_or);

im  = Denoising1{iter};

im(im > 1) = 1;
im(im < 0) = 0;



PSNR_Final       =   csnr (im*255, par.I*255,0,0);
FSIM_Final       =   FeatureSIM(im*255, par.I*255);
SSIM_Final       =   cal_ssim (im*255, par.I*255,0,0);






if Sigma==10

Final_denoisng= strcat(filename,'_SNSS_','_sigma_',num2str(Sigma),'_PSNR_',num2str(PSNR_Final),'_SSIM_',num2str(SSIM_Final),'_FSIM_',num2str(FSIM_Final),'.png');

imwrite(uint8(im*255),strcat('./10_Result/',Final_denoisng));


elseif Sigma==20

Final_denoisng= strcat(filename,'_SNSS_','_sigma_',num2str(Sigma),'_PSNR_',num2str(PSNR_Final),'_SSIM_',num2str(SSIM_Final),'_FSIM_',num2str(FSIM_Final),'.png');

imwrite(uint8(im*255),strcat('./20_Result/',Final_denoisng));

elseif Sigma==30
    
Final_denoisng= strcat(filename,'_SNSS_','_sigma_',num2str(Sigma),'_PSNR_',num2str(PSNR_Final),'_SSIM_',num2str(SSIM_Final),'_FSIM_',num2str(FSIM_Final),'.png');
imwrite(uint8(im*255),strcat('./30_Result/',Final_denoisng));

elseif Sigma==40
    
Final_denoisng= strcat(filename,'_SNSS_','_sigma_',num2str(Sigma),'_PSNR_',num2str(PSNR_Final),'_SSIM_',num2str(SSIM_Final),'_FSIM_',num2str(FSIM_Final),'.png');

imwrite(uint8(im*255),strcat('./40_Result/',Final_denoisng));

elseif Sigma==50
    
Final_denoisng= strcat(filename,'_SNSS_','_sigma_',num2str(Sigma),'_PSNR_',num2str(PSNR_Final),'_SSIM_',num2str(SSIM_Final),'_FSIM_',num2str(FSIM_Final),'.png');
imwrite(uint8(im*255),strcat('./50_Result/',Final_denoisng));

elseif Sigma==75
    
Final_denoisng= strcat(filename,'_SNSS_','_sigma_',num2str(Sigma),'_PSNR_',num2str(PSNR_Final),'_SSIM_',num2str(SSIM_Final),'_FSIM_',num2str(FSIM_Final),'.png');

imwrite(uint8(im*255),strcat('./75_Result/',Final_denoisng));

else
    
Final_denoisng= strcat(filename,'_SNSS_','_sigma_',num2str(Sigma),'_PSNR_',num2str(PSNR_Final),'_SSIM_',num2str(SSIM_Final),'_FSIM_',num2str(FSIM_Final),'.png');

imwrite(uint8(im*255),strcat('./100_Result/',Final_denoisng));
end


end

