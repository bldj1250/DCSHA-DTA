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

load "data/PIK3C2B.pdb", protein
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

load "data/PIK3C2B.pdb_points.pdb.gz", points
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
select surf_pocket1, protein and id [3424,3419,3457,3459,3460,3461,3462,3463,3465,3425,3426,8858,8233,7226,7499,8860,8863,2790,8262,8242,8255,3307,3308,3309,3325,3326,3327,8263,3434,3432,3436,3516,3518,3517,3523,8466,3299,3300,3301,3296,8499,3542,8667,8669,8671,8672,8701,8696,8697,8698,7202,7222,7223,7234,8732,3422,3423,7503,7199,7201,8948,8950,8973,8974,8838,8856,8864,8868,8844,8846,8531,8956,8525,8506,8520,8524,8502,8527,8666,8636,8639,8661,8837,8840,7261,7227,7531,7533,7534,7535,7536,7537,7224,7539,8638,8640,8642,8877,8879] 
set surface_color,  pcol1, surf_pocket1 
set_color pcol2 = [0.278,0.384,0.702]
select surf_pocket2, protein and id [6025,6024,6026,4674,4676,4677,6038,6042,6044,6045,2543,4693,3839,3842,3844,3845,4695,4696,3869,3870,4690,4694,3792,3793,3794,5883,5894,5761,5847,2542,5802,5804,2552,2537,2539,2541,2544,5843,5848,5789,5791,5794,5838,4673,4668,4666,5875,5876,5877,5878,5854,6018,6020,7677,6008,7675,7676,7709,6054,6055,7674,7718,7719,7721,3783,3825,3782,3786,5768,6007,7362,7364,7363,3757,5767,7351,7353,2559,2560,2561,2556,3833,7681,7678] 
set surface_color,  pcol2, surf_pocket2 
set_color pcol3 = [0.361,0.416,0.902]
select surf_pocket3, protein and id [8571,9608,9609,8407,8551,8362,8363,8364,8365,8367,9602,9002,9493,9520,8996,8997,8987,8425,9604,9606,8360,8379,8381,9492,9494,9495,9003,8941,8942,8851,8852,9601,8947,9519,9583,8552,8958,8959,8953,8957,8960,8964,8847,8848,8965,9603,9598,10625] 
set surface_color,  pcol3, surf_pocket3 
set_color pcol4 = [0.302,0.278,0.702]
select surf_pocket4, protein and id [9659,10289,10291,10293,9768,9770,9416,10321,10322,10324,10315,9418,10428,10286,10316,9729,9731,9747,9451,9657,9673,9442,9447,9766,9775,9463,9465,9746,9748,9749,9750,9404,9435,9436,9438,9771] 
set surface_color,  pcol4, surf_pocket4 
set_color pcol5 = [0.467,0.361,0.902]
select surf_pocket5, protein and id [7599,7763,3799,7600,3777,3808,7762,3804,7854,7853,7916,3817,3818,3820,3798,3801,7878,7880,7561,7560] 
set surface_color,  pcol5, surf_pocket5 
set_color pcol6 = [0.427,0.278,0.702]
select surf_pocket6, protein and id [10500,10501,10502,9884,9835,9897,9902,9903,9814,9813,10472,9932,9933,9935,9937,9870,9898,9900,10474,10475,10479,10481,12445,12447,12448,12459,12464,12474,12473,12470,12426] 
set surface_color,  pcol6, surf_pocket6 
set_color pcol7 = [0.631,0.361,0.902]
select surf_pocket7, protein and id [10176,7028,7029,7033,10247,6506,6504,7041,10246,5982,5143,10173,10183,7329,10230,5990,5991,5989,7326,5994] 
set surface_color,  pcol7, surf_pocket7 
set_color pcol8 = [0.553,0.278,0.702]
select surf_pocket8, protein and id [8723,8841,8722,8798,3489,3491,8797,8696,8697,8729,8731,3422,3453,8760,8761,3424,3419,3457,3461,3463,3420,3501,3455,3448,3454,8838,8834,3502,8837,8840,8823,8839] 
set surface_color,  pcol8, surf_pocket8 
set_color pcol9 = [0.792,0.361,0.902]
select surf_pocket9, protein and id [2453,2455,2456,2427,2428,2431,2433,2426,3984,3987,4578,4010,4018,4551,4556,4579,4576,4549,4042] 
set surface_color,  pcol9, surf_pocket9 
set_color pcol10 = [0.678,0.278,0.702]
select surf_pocket10, protein and id [261,263,9742,10596,10616,10625,8388,9480,10595,10594,9459,9458] 
set surface_color,  pcol10, surf_pocket10 
set_color pcol11 = [0.902,0.361,0.847]
select surf_pocket11, protein and id [8379,9479,9480,10595,10594,9492,9496,9459,9458,9610,9504,10596,10625,8388] 
set surface_color,  pcol11, surf_pocket11 
set_color pcol12 = [0.702,0.278,0.596]
select surf_pocket12, protein and id [8689,8690,8826,8831,9621,9589,9591,9585,9588,9381,9398] 
set surface_color,  pcol12, surf_pocket12 
set_color pcol13 = [0.902,0.361,0.682]
select surf_pocket13, protein and id [5530,5532,5533,5971,5102,5521,5551,5553,5101,5103,5115,5164,5189,5972,5965] 
set surface_color,  pcol13, surf_pocket13 
set_color pcol14 = [0.702,0.278,0.471]
select surf_pocket14, protein and id [10033,10034,10378,10379,10380,9999,10408,10409,12106,9980,11997,12121,10385,10386,10388,12910,12911,10384,12890,12892,12893,12894,12895,9978,10007,10008,10009,10002] 
set surface_color,  pcol14, surf_pocket14 
set_color pcol15 = [0.902,0.361,0.522]
select surf_pocket15, protein and id [5846,6148,6150,6151,6149,6196,6162,6164,6140,4890,4900,4903,4904,4867,4869,5841,5438,4898,5852,5838] 
set surface_color,  pcol15, surf_pocket15 
set_color pcol16 = [0.702,0.278,0.341]
select surf_pocket16, protein and id [11165,11179,11180,11181,11434,10986,11447,11470,11433,11438,11428,11430,11379,11500,11504,11467,11465,10976,10979,10983,10982] 
set surface_color,  pcol16, surf_pocket16 
set_color pcol17 = [0.902,0.361,0.361]
select surf_pocket17, protein and id [5291,5342,5343,4939,5289,5327,4242,4941,4257,4283,4284] 
set surface_color,  pcol17, surf_pocket17 
set_color pcol18 = [0.702,0.341,0.278]
select surf_pocket18, protein and id [7628,7916,7596,3820,7599,7600,7908,7575,7878,8891,7597,8923,7917] 
set surface_color,  pcol18, surf_pocket18 
set_color pcol19 = [0.902,0.522,0.361]
select surf_pocket19, protein and id [8993,9180,9218,9219,9208,8994,8995,10746,10748,10743,10745,9028,9029,9030,9031,9063,9062,10713,9209] 
set surface_color,  pcol19, surf_pocket19 
set_color pcol20 = [0.702,0.471,0.278]
select surf_pocket20, protein and id [7067,6836,5491,5492,6871,6835,6785,6214,6229,5476,5473] 
set surface_color,  pcol20, surf_pocket20 
set_color pcol21 = [0.902,0.682,0.361]
select surf_pocket21, protein and id [2817,2816,2818,2851,2823,2848,2849,2827,3403,3399,3043,3041,3045,3047,3386,3482,3478] 
set surface_color,  pcol21, surf_pocket21 
set_color pcol22 = [0.702,0.596,0.278]
select surf_pocket22, protein and id [4988,5018,6076,5719,5902,5903,5905,6086,6089,6092,5911,5921,5922] 
set surface_color,  pcol22, surf_pocket22 
set_color pcol23 = [0.902,0.847,0.361]
select surf_pocket23, protein and id [5730,5532,5713,5533,5971,5553,5937,5972,5929,5733,5931] 
set surface_color,  pcol23, surf_pocket23 
set_color pcol24 = [0.678,0.702,0.278]
select surf_pocket24, protein and id [10092,10094,10096,6483,10097,6476,6480,6481,6482,10067,6453,6705,6986,6707,6693,6706] 
set surface_color,  pcol24, surf_pocket24 
   

deselect

orient
