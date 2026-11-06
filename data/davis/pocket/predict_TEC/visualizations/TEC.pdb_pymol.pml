from pymol import cmd,stored

set depth_cue, 1
set fog_start, 0.4

set_color b_col, [36,36,85]
set_color t_col, [10,10,10]
set bg_rgb_bottom, b_col
set bg_rgb_top, t_col      
set bg_gradient

set  spec_power  =  200
set  spec_refl   =  0

load "data/TEC.pdb", protein
create ligands, protein and organic
select xlig, protein and organic
delete xlig

hide everything, all

color white, elem c
color bluewhite, protein
#show_as cartoon, protein
show surface, protein
#set transparency, 0.15

show sticks, ligands
set stick_color, magenta




# SAS points

load "data/TEC.pdb_points.pdb.gz", points
hide nonbonded, points
show nb_spheres, points
set sphere_scale, 0.2, points
cmd.spectrum("b", "green_red", selection="points", minimum=0, maximum=0.7)


stored.list=[]
cmd.iterate("(resn STP)","stored.list.append(resi)")    # read info about residues STP
lastSTP=stored.list[-1] # get the index of the last residue
hide lines, resn STP

cmd.select("rest", "resn STP and resi 0")

for my_index in range(1,int(lastSTP)+1): cmd.select("pocket"+str(my_index), "resn STP and resi "+str(my_index))
for my_index in range(1,int(lastSTP)+1): cmd.show("spheres","pocket"+str(my_index))
for my_index in range(1,int(lastSTP)+1): cmd.set("sphere_scale","0.4","pocket"+str(my_index))
for my_index in range(1,int(lastSTP)+1): cmd.set("sphere_transparency","0.1","pocket"+str(my_index))



set_color pcol1 = [0.361,0.576,0.902]
select surf_pocket1, protein and id [4140,3267,3268,3145,3147,3148,3251,3619,3264,3099,3109,3104,3108,3134,3618,4134,3489,4131,4052,4141,4065,4066,4133,3675,4038,3640,3644,3636,3638,3669,3672,3700,3094,3093,3096,3269,3127,3677] 
set surface_color,  pcol1, surf_pocket1 
set_color pcol2 = [0.278,0.341,0.702]
select surf_pocket2, protein and id [3236,3228,3229,3231,2934,2936,3223,3226,3232,1570,1568,1576,3194,1587,2906,2910,3623,3628,2897,2902,2917,1936,1939,3633,1562,1572,2896,1557,3238,3235,3655,2912,2918,3516,2932,3517,3519,3621] 
set surface_color,  pcol2, surf_pocket2 
set_color pcol3 = [0.424,0.361,0.902]
select surf_pocket3, protein and id [2858,2859,2861,4103,4104,4092,4079,4099,3463,3464,3465,4119,3474,2091,2101,2131,2133,2134,2135,2136,3475,2862,2102,3870,4097,2080,2073,2167,2166,2075,4120,2899,2888,2889,2891] 
set surface_color,  pcol3, surf_pocket3 
set_color pcol4 = [0.435,0.278,0.702]
select surf_pocket4, protein and id [2910,3623,3628,4120,2897,2899,3236,3633,2888,2890,2891,2892,3655,3656,3621,2861,4103,4104,4092,4077,4079,3461,3463,3464,4119] 
set surface_color,  pcol4, surf_pocket4 
set_color pcol5 = [0.698,0.361,0.902]
select surf_pocket5, protein and id [3845,3847,3712,3710,3747,3781,3783,3816,3839,3870,4097,2158,2159,3837,3812,3817,4096,4099,4084,4091,4093,4094,4095,3664,3751] 
set surface_color,  pcol5, surf_pocket5 
set_color pcol6 = [0.651,0.278,0.702]
select surf_pocket6, protein and id [4140,3267,3619,3503,3506,3618,3604,3488,4134,3489,4131,4135,4163,4152,3417,4150,3507] 
set surface_color,  pcol6, surf_pocket6 
set_color pcol7 = [0.902,0.361,0.824]
select surf_pocket7, protein and id [3398,2978,3395,1760,2958,2962,2961,2975,2959,3431,1774,3433,1759,3397,2922,2923,1784,1788,2943,2957,3425] 
set surface_color,  pcol7, surf_pocket7 
set_color pcol8 = [0.702,0.278,0.533]
select surf_pocket8, protein and id [2860,2858,2859,2861,2863,2864,2868,2870,2871,1540,2010,2009,2080,2079,2011,2012,1550,1552,1924,1538,2901,1549,2889] 
set surface_color,  pcol8, surf_pocket8 
set_color pcol9 = [0.902,0.361,0.545]
select surf_pocket9, protein and id [1087,728,689,690,973,972,1152,1164,676,1003,992,1169,1009,1177,1178] 
set surface_color,  pcol9, surf_pocket9 
set_color pcol10 = [0.702,0.278,0.318]
select surf_pocket10, protein and id [437,223,225,226,245,248,203,122,124,227,108,109,337,435,127,107] 
set surface_color,  pcol10, surf_pocket10 
set_color pcol11 = [0.902,0.451,0.361]
select surf_pocket11, protein and id [4485,4757,4774,4730,4627,4628,4936,4934,4779,4310,4317,4340,4700,4483,4514] 
set surface_color,  pcol11, surf_pocket11 
set_color pcol12 = [0.702,0.459,0.278]
select surf_pocket12, protein and id [4781,4775,4782,4618,4619,4788,4790,4624,4761,4762,4767,4656,4658] 
set surface_color,  pcol12, surf_pocket12 
set_color pcol13 = [0.902,0.729,0.361]
select surf_pocket13, protein and id [219,605,588,199,767,1036,1038,117,120,765,596,581,563,1059,1060] 
set surface_color,  pcol13, surf_pocket13 
set_color pcol14 = [0.702,0.675,0.278]
select surf_pocket14, protein and id [42,288,289,12,274,349,351,273,15,312,327] 
set surface_color,  pcol14, surf_pocket14 
   

deselect

orient
