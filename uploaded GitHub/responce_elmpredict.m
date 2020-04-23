function Yt=responce_elmpredict(input_test,IW,B,LW,TF,TYPE,inputps,outputps)

input_test=input_test';
%
inputn_test=mapminmax('apply',input_test,inputps);
prevalue = elmpredict(inputn_test,IW,B,LW,TF,TYPE);
%
Yt=mapminmax('reverse',prevalue,outputps);
Yt=Yt';
end