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

load "data/MYO3B.pdb", protein
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

load "data/MYO3B.pdb_points.pdb.gz", points
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
select surf_pocket1, protein and id [3361,3363,3364,3396,7609,7610,8433,8435,7965,7962,3360,7970,3392,3386,3424,3426,3425,8059,7599,7591,7592,7593,7594,3385,3387,3388,3415,3418,3359,8466,8468,8469,8438,8437,8071,8069,3244,3245,3043,3045,3273,3044,8403,8397,8400,8399,3341,3342,3263,3264,3266,3268,8440,8442,8445,3269,3340,3338,3339,8409,7603,7605,3046,3048,7954,7955,3251] 
set surface_color,  pcol1, surf_pocket1 
set_color pcol2 = [0.278,0.369,0.702]
select surf_pocket2, protein and id [275,287,329,328,269,271,273,1295,282,270,875,889,890,921,288,1374,443,1372,1373,439,442,1368,1370,852,858,871,427,1269,1363,1365,1366,1296,1280,1367,896,891,893] 
set surface_color,  pcol2, surf_pocket2 
set_color pcol3 = [0.361,0.373,0.902]
select surf_pocket3, protein and id [3514,3512,3513,3869,3871,3872,3873,3895,3516,3523,3535,7701,3107,3109,3524,3091,3092,3093,3536,3539,3541,3543,3550,3525,3527,3888,3899,3900,3886,3896,5753,3542,3530,3534,5768,5758,3548] 
set surface_color,  pcol3, surf_pocket3 
set_color pcol4 = [0.349,0.278,0.702]
select surf_pocket4, protein and id [6859,6863,6897,6845,6848,6856,6844,7462,7464,7419,7423,7460,7047,7049,7050,7051,7078,5472,5502,5471,5504,5507,4128,5461,5468,5469,6896,7016,7044] 
set surface_color,  pcol4, surf_pocket4 
set_color pcol5 = [0.553,0.361,0.902]
select surf_pocket5, protein and id [7599,7585,7587,7600,7601,7593,7594,7976,7973,7584,7586,10134,6018,6021,6051,10128,10130,10136,10141,10129,7569,7573,7572,7619,7621,6016,6028,6054,6056,6059,6061,6047,6048,6049,6053,7603,3054,3048,7913,7954,6060] 
set surface_color,  pcol5, surf_pocket5 
set_color pcol6 = [0.510,0.278,0.702]
select surf_pocket6, protein and id [4666,4667,4668,4669,4287,4286,4289,3885,3887,3888,4633,3799,3800,3806,3807,3809,3889,4243,4244,4245,4246,4635,3843,3845,4217,4609,4638,4215,4216,4611,3877,3878,3881,4626,3780] 
set surface_color,  pcol6, surf_pocket6 
set_color pcol7 = [0.757,0.361,0.902]
select surf_pocket7, protein and id [7472,4097,4098,4099,5885,5893,5857,4107,4112,4120,4129,4134,5861,5851,5853,5887,6817,7440,7441,6816,7465,4127,4128,7456,4126,7072,7460,7439,6848,6846,4096,4102,4103] 
set surface_color,  pcol7, surf_pocket7 
set_color pcol8 = [0.671,0.278,0.702]
select surf_pocket8, protein and id [664,2423,654,665,1350,655,1333,1334,1336,1100,1070,2421,2422,1093,1095,1122,2386,1068] 
set surface_color,  pcol8, surf_pocket8 
set_color pcol9 = [0.902,0.361,0.839]
select surf_pocket9, protein and id [5871,5842,5872,5873,6821,4179,4172,4180,4182,5803,5824,4208,4207,5809,5805,5806,5807,4136,4118,4165,4138,4117,4145,5862,5863,5864] 
set surface_color,  pcol9, surf_pocket9 
set_color pcol10 = [0.702,0.278,0.573]
select surf_pocket10, protein and id [7465,4127,4128,7456,7458,4126,7072,7076,7050,7460,7439,7462,6848,6844,4095,4096,4102,4103,4106,7086,7440,4107] 
set surface_color,  pcol10, surf_pocket10 
set_color pcol11 = [0.902,0.361,0.631]
select surf_pocket11, protein and id [3076,3524,3082,3099,3100,3087,3091,3093,2998,3116,3122,3129,3521,3579,3007,3010,3546,3548,3162,3160,3526,3557] 
set surface_color,  pcol11, surf_pocket11 
set_color pcol12 = [0.702,0.278,0.412]
select surf_pocket12, protein and id [7495,7496,7498,7482,7483,6303,6304,6368,7448,7452,10233,6302,7407,6403,7405,10259,6343,6344,6364] 
set surface_color,  pcol12, surf_pocket12 
set_color pcol13 = [0.902,0.361,0.427]
select surf_pocket13, protein and id [2985,2990,3006,3146,3149,3150,2979,2991,2999,3296,3298,3299,3304,2984,3232,3191,3193,3313] 
set surface_color,  pcol13, surf_pocket13 
set_color pcol14 = [0.702,0.306,0.278]
select surf_pocket14, protein and id [4071,4073,7558,7559,4074,4079,4064,4069,4091,4078,7526,7527,7528,7074,7082,7085,7057,4056,4059] 
set surface_color,  pcol14, surf_pocket14 
set_color pcol15 = [0.902,0.498,0.361]
select surf_pocket15, protein and id [4035,4037,4038,3977,3980,5634,5635,5693,5694,5695,5713,3994,4006,3998,4039,5665,5674,5670,5672,5685,5692] 
set surface_color,  pcol15, surf_pocket15 
set_color pcol16 = [0.702,0.467,0.278]
select surf_pocket16, protein and id [5776,6725,5778,5780,5795,7784,3865,5792,5796,7663,7685,3505,3506,7780,3507,3501,3504,3511] 
set surface_color,  pcol16, surf_pocket16 
set_color pcol17 = [0.902,0.702,0.361]
select surf_pocket17, protein and id [4819,4821,4822,4851,4853,4371,4373,4405,4828,4326,4710,4355,4792,4824] 
set surface_color,  pcol17, surf_pocket17 
set_color pcol18 = [0.702,0.624,0.278]
select surf_pocket18, protein and id [4132,4160,5410,5467,5435,5439,6817,6813,6814,6818,6820,6808,5409,5411,5412,6806,6807,6812,4167] 
set surface_color,  pcol18, surf_pocket18 
set_color pcol19 = [0.894,0.902,0.361]
select surf_pocket19, protein and id [371,400,410,223,224,408,706,707,708,709,711,415] 
set surface_color,  pcol19, surf_pocket19 
   

deselect

orient
