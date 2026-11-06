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

load "data/PRKCI.pdb", protein
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

load "data/PRKCI.pdb_points.pdb.gz", points
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
select surf_pocket1, protein and id [3083,3084,2714,2713,3086,2731,2252,2253,3195,2126,2662,2254,3188,3095,3186,3189,3191,3193,3187,3110,2073,2075,2077,2084,2085,2070,4468,4469,4443,2068,2125,4433,2063,2066,2065,4426,4431,4436,4439,2738,2236,3109,3071,3070] 
set surface_color,  pcol1, surf_pocket1 
set_color pcol2 = [0.278,0.322,0.702]
select surf_pocket2, protein and id [4062,4060,4104,4107,4101,4071,3273,3267,3270,3272,2978,2985,3461,2981,3464,2977,3468,3470,3499,3503,3505,3282,3268,3274,3275,3277,3457,3458,3291,3446,4065,4078,3475,3477,4016,4064,3441,2953,2989,2991] 
set surface_color,  pcol2, surf_pocket2 
set_color pcol3 = [0.467,0.361,0.902]
select surf_pocket3, protein and id [2300,2310,1042,2097,2100,2101,3219,2093,2348,2371,2382,2383,2388,3209,3210,3211,3217,3054,2350,2267,2268,2253,2109,3195,2254,2413,3194] 
set surface_color,  pcol3, surf_pocket3 
set_color pcol4 = [0.490,0.278,0.702]
select surf_pocket4, protein and id [1075,1076,1047,271,3307,1012,1013,3306,3304,1002,211,228,794,810,1004,1006,1007,1008,1011,1043,1049,994,1046,829,3312,3303,3305] 
set surface_color,  pcol4, surf_pocket4 
set_color pcol5 = [0.792,0.361,0.902]
select surf_pocket5, protein and id [631,389,625,360,362,629,387,515,512,514,516,518,531,510,524,421,424,493,499,506,505,476] 
set surface_color,  pcol5, surf_pocket5 
set_color pcol6 = [0.702,0.278,0.659]
select surf_pocket6, protein and id [241,242,243,246,976,1031,1056,1027,1055,252,834,843,845,847,937,977,854,221,230,827,973,975] 
set surface_color,  pcol6, surf_pocket6 
set_color pcol7 = [0.902,0.361,0.682]
select surf_pocket7, protein and id [1337,2338,2340,2343,2378,2376,2380,3311,3312,2375,2377,2381,1076,2341,2342,2363,2367,2404,3234,3240,3232,2403,3227,3235,3224] 
set surface_color,  pcol7, surf_pocket7 
set_color pcol8 = [0.702,0.278,0.408]
select surf_pocket8, protein and id [2184,2192,2551,4768,4742,4744,4746,4745,4763,2186,4748,4709,4708,1977,2181,2168] 
set surface_color,  pcol8, surf_pocket8 
set_color pcol9 = [0.902,0.361,0.361]
select surf_pocket9, protein and id [2101,3219,2093,3071,3209,3210,3211,3217,3053,3054,3195,2254,3194,2085] 
set surface_color,  pcol9, surf_pocket9 
set_color pcol10 = [0.702,0.408,0.278]
select surf_pocket10, protein and id [2745,2786,2787,2788,4329,4330,2816,2888] 
set surface_color,  pcol10, surf_pocket10 
set_color pcol11 = [0.902,0.682,0.361]
select surf_pocket11, protein and id [301,304,1483,1484,188,192,191,785,1091,1093,1474,195] 
set surface_color,  pcol11, surf_pocket11 
set_color pcol12 = [0.702,0.659,0.278]
select surf_pocket12, protein and id [2837,2838,2840,2875,4259,4302,2869,2871,4301,4203,2862,2863,2868,4213,4208] 
set surface_color,  pcol12, surf_pocket12 
   

deselect

orient
