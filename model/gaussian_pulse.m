function [stfun1]=gaussian_pulse(light,days,genotype)

%%%%PARAMETERS%%%%%%%
load gauss_cf.mat

x=linspace(16,12,41);

if ismember ('lhy2',genotype) %%only LD!!!
   load gauss_lhy2_cf.mat
   data(:,4:9)=datalhy2(:,1:6); 
end


%%Interpolate
if (light<=16) && (light>=12)
    p=interp1(x',data,light); 
else
    p=interp1(x',data,light,'linear','extrap');
end
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
         

%%%%%%%%%Genotype%%%%%%%%
r=zeros(1,4);
b=zeros(1,4);

if ismember ('lhy2',genotype)
        b=[0 0 0 0];
        r=[0 1 1 1];
elseif ismember ('LHY2ox',genotype)
        b=[400 0 0 0];
        r=[1 1 1 1];
elseif ismember ('gi', genotype)
        b=[0 0 0 0];
        r=[1 0 1 1]; 
elseif ismember ('GIox', genotype)
        b=[0 400 0 0];
        r=[1 1 1 1]; 
elseif ismember ('toc1', genotype)
        b=[0 0 0 0];
        r=[1 1 0 1];
elseif ismember ('TOC1ox', genotype)
        b=[0 0 75 0];
        r=[1 1 1 1];
elseif ismember ('cdf2', genotype)
        b=[0 0 0 0];
        r=[1 1 1 0];
elseif ismember ('CDF2ox', genotype)
        b=[0 0 0 400];
        r=[1 1 1 1];
else
        b=[0 0 0 0 0];
        r=[1 1 1 1 1];
    end


%%%%%%%PULSE_INPUT%%%%%%%

x1=linspace(0,24-(1/60),1439);

stfun=zeros(length(x1),4);


for i=1:length(x1)
%LHY2
	if (x1(i)<=p(2)+12) && (x1(i)>=p(2)-12)
	    mean=p(2);
		stfun(i,1)=b(1)+(p(1)*exp(-((x1(i)-mean)/p(3))^2))*r(1);
	elseif x1(i)<p(2)-12
	    mean=p(2)-24;
		stfun(i,1)=b(1)+(p(1)*exp(-((x1(i)-mean)/p(3))^2))*r(1);
	elseif x1(i)>p(2)+12
	    mean=p(2)+24;
		stfun(i,1)=b(1)+(p(1)*exp(-((x1(i)-mean)/p(3))^2))*r(1);
	end

%GI 
    if (x1(i)<=p(5)+12) && (x1(i)>=p(5)-12)
	 	mean=p(5);
	 	stfun(i,2)=b(2)+(p(4)*exp(-((x1(i)-mean)/p(6))^2))*r(2);
	elseif x1(i)<p(5)-12
	 	mean=p(5)-24;
	 	stfun(i,2)=b(2)+(p(4)*exp(-((x1(i)-mean)/p(6))^2))*r(2);
	elseif x1(i)>p(5)+12
	 	mean=p(5)+24;
	 	stfun(i,2)=b(2)+(p(4)*exp(-((x1(i)-mean)/p(6))^2))*r(2);
    end

%TOC1
    if (x1(i)<=p(8)+12) && (x1(i)>=p(8)-12)
	 	mean=p(8);
	 	stfun(i,3)=b(3)+(p(7)*exp(-((x1(i)-mean)/p(9))^2))*r(3);
	elseif x1(i)<p(8)-12
	 	mean=p(8)-24;
	 	stfun(i,3)=b(3)+(p(7)*exp(-((x1(i)-mean)/p(9))^2))*r(3);
	elseif x1(i)>p(8)+12
	 	mean=p(8)+24;
	 	stfun(i,3)=b(3)+(p(7)*exp(-((x1(i)-mean)/p(9))^2))*r(3);
    end

%CDF2
	if (x1(i)<=p(20)+12) && (x1(i)>=p(20)-12)
		mean=p(20);
		stfun(i,4)=b(4)+(p(19)*exp(-((x1(i)-mean)/p(21))^2))*r(4);
	elseif x1(i)<p(20)-12
		mean=p(20)-24;
		stfun(i,4)=b(4)+(p(19)*exp(-((x1(i)-mean)/p(21))^2))*r(4);
	elseif x1(i)>p(20)+12
		mean=p(20)+24;
		stfun(i,4)=b(4)+(p(19)*exp(-((x1(i)-mean)/p(21))^2))*r(4);
    end

end


stfun1=repmat(stfun,days,1); %%Para que usar 2 dias?¿

%save gaussianpulseLDDlhy2 stfun

end
