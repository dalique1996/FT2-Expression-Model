# FT2-Expression-Model
Code for the simulation of poplar FT2 daily transcription in MATLAB under varying daylengths and after manipulation of core clock genes.

##########RUNNING SIMULATIONS#############################

TOC1-GI-LHY2 model can be simulated from “run.m” file. “run.m” takes as input:

-light: a number between 0 and 24 that defines the daylength. It modulates the Gaussian pulses of the input genes (TOC1, GI, LHY2) by linear interpolation, between 12 and 16, or extrapolation. 

-genotype: next genotypes can be simulated:

‘WT’: Wild type
‘gi’: GI knockout mutant
‘GIox’: GI constitutive overexpressor
‘toc1’: TOC1 knockout mutant
‘TOC1ox’: TOC1 constitutive overexpressor
‘lhy2’: LHY2 knockout mutant
‘LHY2ox’: LHY2 constitutive overexpressor

(Any not valid genotype is taken as ‘WT’)

-gene: gene you want to plot as output. Only FT2 pattern is predicted. For GI, TOC1 and LHY2 the Gaussian pulse used as input is plotted.

(Any not valid gene is taken as ‘FT2’)  


*circaplot.m function was modified from Seaton et al., 2015

Seaton, Daniel D., et al. "Linked circadian outputs control elongation growth and flowering in response to photoperiod and temperature." Molecular systems biology 11.1 (2015): 776.
