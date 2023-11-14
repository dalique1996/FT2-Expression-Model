function dy = FT2(t,y,p,sttime,stfun1)

%%%%Input_genes%%%%
LHY2=interp1(sttime,stfun1(:,1),t);
GI=interp1(sttime,stfun1(:,2),t);
TOC1=interp1(sttime,stfun1(:,3),t); 
CDF2=interp1(sttime,stfun1(:,4),t);

%%%%%%%%%%%%%%%%%%%%%%%%%%%

%%%%Define variables%%%%%%
FT2 = y;

%parameter
% 1.FT2_bassal
% 2.FT2_GIactv
% 3.FT2_GIaffinity
% 4.FT2_GIn
% 5.FT2_TOC1repress
% 6.FT2_TOC1affinity
% 7.FT2_TOC1n
% 8.FT2_LHY2rep-aff
% 9.FT2_LHY2n
% 10.FT2_degradation


%%GI-TOC1-LHY2 model
dFT2 = ((p(1)+(p(2)*(p(3)*GI)^p(4)))/...
       (1+((p(3)*GI)^p(4))+(p(5)*(p(6)*TOC1)^p(7))+((p(3)*p(6))^(p(4)*p(7)))...
      +((p(8)*LHY2)^p(9))))-p(10)*FT2;


dy = dFT2;

end
