function [y ,t, sttime, stfun1]= Xsolver_FT2(model, par,light,genotype)

%Read system
model = str2func(model);

%%%%%Read parameters%%%%%%%%%%%%%%
if exist(strcat(par,'.parms'),'file')
    filename = strcat(par,'.parms');

    fid = fopen(filename);

    parameters = textscan(fid,'%s %s','Delimiter',':','CommentStyle','%');

fclose(fid);

end

parameter_names = parameters{1,1};
parameter_values = parameters{1,2};

nogenerals = str2double(parameter_values(1,1));

generals_values = str2double(parameter_values(2:nogenerals+1,:)');

parms_values = str2double(parameter_values(nogenerals+2:end,:))';

%Convert initial conditions to a vector (numbers separated by comma)
yinitial=str2double(split(parameter_values(3),","));

%If there are not enough initial values for the variables this will add 0 at the end
if length(yinitial)<generals_values(1)
	while length(yinitial)<generals_values(1)
		yinitial=reshape(yinitial,1,length(yinitial));
		yinitial=[yinitial 0];
	end
else
	yinitial=reshape(yinitial,1,generals_values(1)*generals_values(2)*generals_values(3)); % vectorize
end


days=generals_values(5)+1;
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%


%%%%%%%%%%%%%MODEL%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

%%%%Gauss Input%%%%%%%%%%
sttime=linspace(0,24*days-(1/60),1439*days);

[stfun1]=gaussian_pulse(light,days,genotype);


%%%%%%%%ODE%%%%%%%%%%%%%%
opts = [];

[t,y] = ode15s(model,sttime,yinitial',opts, parms_values,sttime,stfun1);

%%%%%%%OUTPUT%%%%%%%%%%%%
%%%%%Remove first day%%%%%%
t=t(1440:end);
t=t-24;
y=y(1440:end,:);

%stfun
%1.LHY2 2.GI 3.TOC1 4.CDF2
sttime=sttime(1440:end);
sttime=sttime-24;
stfun1=stfun1(1440:end,:);
end
