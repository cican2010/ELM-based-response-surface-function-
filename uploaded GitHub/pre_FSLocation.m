function [pre_FS,pre_Xlocation,pre_Ylocation]=pre_FSLocation(h,input_test,datafile)

load (datafile)
 %% train the ELM model

     output_train=[FS_train,Xlocation_train,Ylocation_train];
     [IW,B,LW,TF,TYPE,inputps,outputps]=responce_elmtrain(input_train,output_train,h);
%%  predict
    pre_test=responce_elmpredict(input_test,IW,B,LW,TF,TYPE,inputps,outputps);
    %  [~,pre_test]=RBF(X_train,output_train,X_test);
    [~,N]=size(pre_test);
    N=(N-1)/2;
    pre_FS=pre_test(:,1);
    pre_Xlocation=pre_test(:,2:(N+1));
    pre_Ylocation=pre_test(:,(N+2):(2*N+1));
end
% FS_SLIP=[pre_FS,pre_Xlocation,pre_Ylocation];
