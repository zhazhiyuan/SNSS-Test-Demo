clc
clear
m_10_1=0; 
m_10_2=0; 
m_10_3=0; 
m_20_1=0; 
m_20_2=0; 
m_20_3=0; 
m_30_1=0; 
m_30_2=0; 
m_30_3=0; 
m_40_1=0;
m_40_2=0; 
m_40_3=0; 
m_50_1=0;
m_50_2=0; 
m_50_3=0; 
m_75_1=0;
m_75_2=0; 
m_75_3=0; 
m_100_1=0;
m_100_2=0; 
m_100_3=0; 

All_data_Results_10_1 = cell(1,200);
All_data_Results_10_2 = cell(1,200);
All_data_Results_10_3 = cell(1,200);

All_data_Results_20_1 = cell(1,200);
All_data_Results_20_2 = cell(1,200);
All_data_Results_20_3 = cell(1,200);

All_data_Results_30_1 = cell(1,200);
All_data_Results_30_2 = cell(1,200);
All_data_Results_30_3 = cell(1,200);

All_data_Results_40_1 = cell(1,200);
All_data_Results_40_2 = cell(1,200);
All_data_Results_40_3 = cell(1,200);

All_data_Results_50_1 = cell(1,200);
All_data_Results_50_2 = cell(1,200);
All_data_Results_50_3 = cell(1,200);

All_data_Results_75_1 = cell(1,200);
All_data_Results_75_2 = cell(1,200);
All_data_Results_75_3 = cell(1,200);

All_data_Results_100_1 = cell(1,200);
All_data_Results_100_2 = cell(1,200);
All_data_Results_100_3 = cell(1,200);



for i = 1:12
ImageNum =i;

switch ImageNum
          case 1
                filename = 'airplane';
            case 2
                filename = 'boats';
            case 3
                filename = 'cameraman';
            case 4
                filename = 'foreman';    
            case 5
                filename = 'House'; 
                
            case 6
                filename = 'Leaves';
            case 7
                filename = 'lena';
            case 8
                filename = 'man';
            case 9
                filename = 'Monarch';    
            case 10
                filename = 'pentagon'; 
                
            case 11
                filename = 'plants';
            case 12
                filename = 'starfish';
      
end
for j  =  4:7
    

  filename  
randn ('seed',0);

Sigma_Num        =       [10, 20, 30, 40, 50, 75, 100]; 



Sigma             =       Sigma_Num(j)



if  Sigma==10


    delta   =  0.1;  gamma  = 0.6;      lamada  =  1.8;    Err_or  = 0.0026;
     
[filename, Sigma,  PSNR_Final,FSIM_Final,SSIM_Final]     =  SNSS_Main (filename, Sigma, delta, gamma, lamada, Err_or); 

 
 m_10_1= m_10_1+1;
 
 s=strcat('A',num2str(m_10_1));
 
 All_data_Results_10_1{m_10_1}= {filename, Sigma,  PSNR_Final,FSIM_Final,SSIM_Final};
 

 xlswrite('SNSS_Sigma_10.xls', All_data_Results_10_1{m_10_1},'sheet1',s);
 

 
  
 
 
 elseif  Sigma==20
     

         
    delta   =  0.1;  gamma  = 0.5;      lamada  =   1.7;   Err_or  = 0.0013;
     
[filename, Sigma,  PSNR_Final,FSIM_Final,SSIM_Final]     =  SNSS_Main (filename, Sigma, delta, gamma, lamada, Err_or); 
 
 m_20_1= m_20_1+1;
 
 s=strcat('A',num2str(m_20_1));
 
 All_data_Results_20_1{m_20_1}= {filename, Sigma,  PSNR_Final,FSIM_Final,SSIM_Final};
 
 xlswrite('SNSS_Sigma_20.xls', All_data_Results_20_1{m_20_1},'sheet1',s);


 
 
  elseif  Sigma==30
     

    delta   =  0.1;  gamma  = 0.5;      lamada  =   1.6;   Err_or  = 0.0015;
     
[filename, Sigma,  PSNR_Final,FSIM_Final,SSIM_Final]     =  SNSS_Main (filename, Sigma, delta, gamma, lamada, Err_or); 
 
 m_30_1= m_30_1+1;
 
 s=strcat('A',num2str(m_30_1));
 
 All_data_Results_30_1{m_30_1}= {filename, Sigma,  PSNR_Final,FSIM_Final,SSIM_Final};
 
 xlswrite('SNSS_Sigma_30.xls', All_data_Results_30_1{m_30_1},'sheet1',s);


   elseif  Sigma==40
     

         
    delta   =  0.1;  gamma  = 0.5;      lamada  =   1.3;   Err_or  = 0.0011;
     
[filename, Sigma,  PSNR_Final,FSIM_Final,SSIM_Final]     =  SNSS_Main (filename, Sigma, delta, gamma, lamada, Err_or); 
 
 m_40_1= m_40_1+1;
 
 s=strcat('A',num2str(m_40_1));
 
 All_data_Results_40_1{m_40_1}= {filename, Sigma,  PSNR_Final,FSIM_Final,SSIM_Final};
 
 xlswrite('SNSS_Sigma_40.xls', All_data_Results_40_1{m_40_1},'sheet1',s);




 elseif  Sigma==50
     

         
    delta   =  0.1;  gamma  = 0.4;      lamada  =   2;   Err_or  = 0.0011;
     
[filename, Sigma,  PSNR_Final,FSIM_Final,SSIM_Final]     =  SNSS_Main (filename, Sigma, delta, gamma, lamada, Err_or); 
 
 m_50_1= m_50_1+1;
 
 s=strcat('A',num2str(m_50_1));
 
 All_data_Results_50_1{m_50_1}= {filename, Sigma,  PSNR_Final,FSIM_Final,SSIM_Final};
 
 xlswrite('SNSS_Sigma_50.xls', All_data_Results_50_1{m_50_1},'sheet1',s);
 

 
 
 elseif  Sigma==75
     

    delta   =  0.1;  gamma  = 0.5;      lamada  =   1.3;   Err_or  = 0.0011;
     
[filename, Sigma,  PSNR_Final,FSIM_Final,SSIM_Final]     =  SNSS_Main (filename, Sigma, delta, gamma, lamada, Err_or); 
 
 m_75_1= m_75_1+1;
 
 s=strcat('A',num2str(m_75_1));
 
 All_data_Results_75_1{m_75_1}= {filename, Sigma,  PSNR_Final,FSIM_Final,SSIM_Final};
 
 xlswrite('SNSS_Sigma_75.xls', All_data_Results_75_1{m_75_1},'sheet1',s);


 else
     

    delta   =  0.1;  gamma  = 0.4;      lamada  =   2;   Err_or  = 0.0014;
     
[filename, Sigma,  PSNR_Final,FSIM_Final,SSIM_Final]     =  SNSS_Main (filename, Sigma, delta, gamma, lamada, Err_or); 
 
 m_100_1= m_100_1+1;
 
 s=strcat('A',num2str(m_100_1));
 
 All_data_Results_100_1{m_100_1}= {filename, Sigma,  PSNR_Final,FSIM_Final,SSIM_Final};
 
 xlswrite('SNSS_Sigma_100.xls', All_data_Results_100_1{m_100_1},'sheet1',s);



 end
 

clearvars -except filename i m_10_1 m_10_2 m_10_3 m_20_1 m_20_2 m_20_3 m_30_1 m_30_2 m_30_3 m_40_1 m_40_2 m_40_3...
m_50_1 m_50_2 m_50_3 m_75_1 m_75_2 m_75_3 m_100_1 m_100_2 m_100_3 All_data_Results_10_1...
All_data_Results_10_2 All_data_Results_10_3 All_data_Results_20_1 All_data_Results_20_2...
All_data_Results_20_3 All_data_Results_30_1 All_data_Results_30_2 All_data_Results_30_3...
All_data_Results_40_1 All_data_Results_40_2 All_data_Results_40_3 All_data_Results_50_1...
All_data_Results_50_2 All_data_Results_50_3 All_data_Results_75_1 All_data_Results_75_2...
All_data_Results_75_3 All_data_Results_100_1 All_data_Results_100_2 All_data_Results_100_3
end
clearvars -except filename m_10_1 m_10_2 m_10_3 m_20_1 m_20_2 m_20_3 m_30_1 m_30_2 m_30_3 m_40_1 m_40_2 m_40_3...
m_50_1 m_50_2 m_50_3 m_75_1 m_75_2 m_75_3 m_100_1 m_100_2 m_100_3 All_data_Results_10_1...
All_data_Results_10_2 All_data_Results_10_3 All_data_Results_20_1 All_data_Results_20_2...
All_data_Results_20_3 All_data_Results_30_1 All_data_Results_30_2 All_data_Results_30_3...
All_data_Results_40_1 All_data_Results_40_2 All_data_Results_40_3 All_data_Results_50_1...
All_data_Results_50_2 All_data_Results_50_3 All_data_Results_75_1 All_data_Results_75_2...
All_data_Results_75_3 All_data_Results_100_1 All_data_Results_100_2 All_data_Results_100_3
end






         