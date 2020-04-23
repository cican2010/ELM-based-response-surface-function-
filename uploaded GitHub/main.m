
clc;clear;close all
datafile='SLIDEdata';
load (datafile)
h=42;%number of hidden layer nodes of ELM  
%% train and test the ELM
[preFS_test,preX_test,preY_test]=pre_FSLocation(h,input_test,datafile);
%% calculate the R2 and RMSE
 [r2_FS, rmse_FS] = rsquare(FS_test,preFS_test);
%
len=length(Xlocation_test);
for i=1:len
     [r2_Xlo(i,1), rmse_Xlo(i,1)] = rsquare(Xlocation_test(i,:),preX_test(i,:));
     [r2_Ylo(i,1), rmse_Ylo(i,1)] = rsquare(Ylocation_test(i,:),preY_test(i,:));
end
%% plot the results
figure
plot(FS_test,preFS_test,'ro')
axis equal;
%
figure
plot(Xlocation_test',preX_test','p')
axis equal;
%
figure
plot(Ylocation_test',preY_test','*')
axis equal;
%
fprintf('FS correlation and Rmse    ---> %5.4f %5.4f \n',r2_FS,rmse_FS);
fprintf('X correlation and Rmse    ---> %5.4f %5.4f \n',mean(r2_Xlo),mean(rmse_Xlo));
fprintf('Y correlation and Rmse    ---> %5.4f %5.4f \n',mean(r2_Ylo),mean(rmse_Ylo));


