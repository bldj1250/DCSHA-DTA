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

load "data/MYO3A.pdb", protein
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

load "data/MYO3A.pdb_points.pdb.gz", points
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
select surf_pocket1, protein and id [3316,3315,3320,3321,3313,3314,3325,3358,3360,3189,8396,8389,8391,8392,8423,8354,8394,8397,8399,3290,3293,3294,2978,2980,2981,2982,2983,3192,3195,3196,3287,7566,3288,7555,7559,7565,7568,3348,8420,7547,7548,7549,7550,7556,7577,5941,5945,7930,7931,7932,2984,7882,7920,7921,7575,5954,7943,5942,5993,5949,7949,7951,3286,3178] 
set surface_color,  pcol1, surf_pocket1 
set_color pcol2 = [0.278,0.373,0.702]
select surf_pocket2, protein and id [3475,3480,3821,3457,3459,3468,3471,3474,3455,3456,3818,3819,3448,3449,3028,3029,3834,3829,3832,3805,3806,3807,3447,3828,3043,3045,7656,3466,3467,5680,5695,5685,3445,3446,3462,3482] 
set surface_color,  pcol2, surf_pocket2 
set_color pcol3 = [0.361,0.380,0.902]
select surf_pocket3, protein and id [1326,1327,1230,850,1257,1256,217,834,830,847,840,218,223,1241,219,276,277,221,377,1328,1329,1331,1333,1335,394,1334,1324,393,811,627,808,817,828,515,389,392,228,235,236,226] 
set surface_color,  pcol3, surf_pocket3 
set_color pcol4 = [0.337,0.278,0.702]
select surf_pocket4, protein and id [4131,4132,5767,5798,4108,4110,5751,5769,5753,5754,5755,4094,4097,6767,6768,6730,4044,4045,5797,4061,5786,5787,5788,5789,5734,5736,5732,3790,5730,4107,4092,4099,4130] 
set surface_color,  pcol4, surf_pocket4 
set_color pcol5 = [0.533,0.361,0.902]
select surf_pocket5, protein and id [1486,1502,1518,1519,1795,1232,12323,12308,12311,12315,868,1231,1233,1815,1788,1796,12326,901,1504,1848,12285,12283,1816] 
set surface_color,  pcol5, surf_pocket5 
set_color pcol6 = [0.490,0.278,0.702]
select surf_pocket6, protein and id [4168,4553,4555,4564,4167,4169,4139,4141,4567,3810,3706,3709,4628,3738,3740,4211,4213,3482,3712,3731,3736,3822,3820,3821,3818,3811,3773,3775,4551,4537,4620,4591] 
set surface_color,  pcol6, surf_pocket6 
set_color pcol7 = [0.725,0.361,0.902]
select surf_pocket7, protein and id [3991,3996,3998,4000,7484,7515,7483,4009,4018,7021,7033,4008,7039,7003,7005,7022,7053,7055,3985,7514,5517,5496,5495] 
set surface_color,  pcol7, surf_pocket7 
set_color pcol8 = [0.643,0.278,0.702]
select surf_pocket8, protein and id [12202,12204,12207,12239,12240,12241,12243,12244,7476,5893,6225,6167,6188,6190,6163,5867,6189,6227,6224,7442,12276,6169,6200,12274,12275] 
set surface_color,  pcol8, surf_pocket8 
set_color pcol9 = [0.902,0.361,0.878]
select surf_pocket9, protein and id [6846,6847,7418,7420,4055,5394,5398,5434,5399,6803,6806,6807,6810,6792,6797,6799,6791,6979,6986,6988,6992,6995,6964,6997,6998,7334,6882,7354,7332,7366,7355,7361,7379,7357,7358,6781,6801] 
set surface_color,  pcol9, surf_pocket9 
set_color pcol10 = [0.702,0.278,0.608]
select surf_pocket10, protein and id [3438,7801,5703,5705,5711,5719,5722,3434,5723,3444,3437,3439,7619,7741,7640,3440,3797,3798,5707,5725,6672,7764] 
set surface_color,  pcol10, surf_pocket10 
set_color pcol11 = [0.902,0.361,0.682]
select surf_pocket11, protein and id [4039,4040,4041,4043,4047,4056,4059,4061,5786,6764,6795,7396,7397,6763,5782,5784,4029,4023,4026,4034,4053,5778,5812,5776,5810,7428] 
set surface_color,  pcol11, surf_pocket11 
set_color pcol12 = [0.702,0.278,0.455]
select surf_pocket12, protein and id [6949,6950,6951,5466,6947,6948,6982,6983,5498,5491,5502,5461,5492,5495,7041,5524,5493,5522,7063,7081,7047,7042,7038,7060,4734] 
set surface_color,  pcol12, surf_pocket12 
set_color pcol13 = [0.902,0.361,0.490]
select surf_pocket13, protein and id [3035,3036,3018,3023,3027,3029,3478,3458,3456,3513,3490,2934,3052,3063,3066,3068,3092,3094] 
set surface_color,  pcol13, surf_pocket13 
set_color pcol14 = [0.702,0.278,0.306]
select surf_pocket14, protein and id [5891,5893,12268,12235,5983,5904] 
set surface_color,  pcol14, surf_pocket14 
set_color pcol15 = [0.902,0.424,0.361]
select surf_pocket15, protein and id [12301,12303,12304,12292,12293,12294,5969,6128,6131,6001,6107,12267,5936,5937,6144,6146,6148,12295] 
set surface_color,  pcol15, surf_pocket15 
set_color pcol16 = [0.702,0.408,0.278]
select surf_pocket16, protein and id [3123,3126,3078,3081,3082,3149,3229,3221,3238,3161,3223,3224] 
set surface_color,  pcol16, surf_pocket16 
set_color pcol17 = [0.902,0.620,0.361]
select surf_pocket17, protein and id [1953,1955,1940,1956,1728,1907,1701,1499,1934,1810,1903] 
set surface_color,  pcol17, surf_pocket17 
set_color pcol18 = [0.702,0.557,0.278]
select surf_pocket18, protein and id [190,288,402,786,788,703,704,765,766,722] 
set surface_color,  pcol18, surf_pocket18 
set_color pcol19 = [0.902,0.812,0.361]
select surf_pocket19, protein and id [12276,6165,6169,6170,6164,6166,12302,12303,12304,12270,12274,5894,12267,5936,5937,6167,6160,6162,6163,6148] 
set surface_color,  pcol19, surf_pocket19 
set_color pcol20 = [0.690,0.702,0.278]
select surf_pocket20, protein and id [245,253,255,239,1357,1356,1335,1334,1351,1348,1205] 
set surface_color,  pcol20, surf_pocket20 
   

deselect

orient
