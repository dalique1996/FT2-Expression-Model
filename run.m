clear all
clc

%%%%SELECT%%%%%%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
light=16; %hours of light per day (daylength)
genotype={'TOC1ox'}; % README for list of possible genotypes (Any not valid genotype is taken as WT) 
gene={'FT2'}; %README for list of possible genes (Any not valid gene is taken as FT2)
              %Only FT2 expression is predicted 
              %For other genes Gaussian function used as input for the simulation is plotted
%days are fixed to 1, it can be increased in FT2.parms file

%Minimal expression values are set to 0 instead of 1 for visualization

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

addpath('model'); %model folder
model='FT2';
parms='FT2';

[y, t, sttime, stfun]= Xsolver_FT2(model, parms,light,genotype);


%%%Define gene to plot%%%
if ismember('LHY2',gene)
    z=stfun(:,1);
elseif ismember('GI',gene)
    z=stfun(:,2);
elseif ismember('TOC1',gene)
    z=stfun(:,3);
elseif ismember('CDF2',gene)
    z=stfun(:,4);
 else %plot FT2
    z=y;
end


%%%%PLOT%%%%%%%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
 figure(1)
 circaplot(t,z,[0,light],['w','k'],24)
 hold on
 xlabel('ZT','fontsize',18)
 ylabel('Relative Expression','fontsize',18)
 v=axis;
 text(v(1)+1,v(4)*0.9,strcat(gene,'-',genotype),'FontAngle','italic','fontsize',20)
 hold off
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%


clear genotype model modelfolder parms genes v

