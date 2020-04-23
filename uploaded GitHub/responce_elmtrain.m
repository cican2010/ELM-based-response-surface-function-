function [IW,B,LW,TF,TYPE,inputps,outputps]=responce_elmtrain(input_train,output_train,h)

input_train=input_train';
output_train=output_train';
%output_test=output_test';
%
[inputn,inputps]=mapminmax(input_train);
[outputn,outputps]=mapminmax(output_train);

%
[IW,B,LW,TF,TYPE] = elmtrain(inputn,outputn,h,'sig',0);
end