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

load "data/FYN.pdb", protein
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

load "data/FYN.pdb_points.pdb.gz", points
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
select surf_pocket1, protein and id [2197,2253,2348,2200,2254,2195,2726,2728,2731,2735,2212,2361,2364,2365,2211,2194,2198,2193,2708,2709,2694,2585,2586,2587,3140,3141,3207,2511,3214,3215,3216,3238,3225,3227,3209,3117,2760,2763,2789,2757,3125] 
set surface_color,  pcol1, surf_pocket1 
set_color pcol2 = [0.302,0.278,0.702]
select surf_pocket2, protein and id [3083,3087,3124,3125,3106,3116,3212,3213,3214,3216,3238,3235,3243,3241,3271,3315,3317,3385,3363,3236,2212,2365,2366,2211,2381,2224,2227,2231,2218,2220,2254,2238,2235,2236,2233,2407,2416] 
set surface_color,  pcol2, surf_pocket2 
set_color pcol3 = [0.631,0.361,0.902]
select surf_pocket3, protein and id [1227,2560,2562,2564,2573,2553,2555,2556,4111,2964,2937,2939,2572,2940,2941,1252,1214,4144,4145,4146] 
set surface_color,  pcol3, surf_pocket3 
set_color pcol4 = [0.678,0.278,0.702]
select surf_pocket4, protein and id [4134,4139,4142,1217,1239,1241,1219,1240,1562,1544,1551,1558,4183,4167,4170,4174,4176,2912,2920,1215,1236,1242,1247,1273,1276,2938,2917,2914,2915,2887,2888,2898] 
set surface_color,  pcol4, surf_pocket4 
set_color pcol5 = [0.902,0.361,0.682]
select surf_pocket5, protein and id [1970,1971,2617,2615,2713,2711,2719,2323,2327,2328,2329,2333,2318,1057,695,1993,1995,1996,724,721,1980,1990] 
set surface_color,  pcol5, surf_pocket5 
set_color pcol6 = [0.702,0.278,0.341]
select surf_pocket6, protein and id [3476,3478,3475,3325,3328,3454,3449,3321,3323,3244,3377,3312,3310,3249,3500,3498,3497,3499,3075,3079] 
set surface_color,  pcol6, surf_pocket6 
set_color pcol7 = [0.902,0.522,0.361]
select surf_pocket7, protein and id [926,846,849,870,872,486,488,489,1075,646,647,625,627,628,484,485,487,482] 
set surface_color,  pcol7, surf_pocket7 
set_color pcol8 = [0.702,0.596,0.278]
select surf_pocket8, protein and id [1439,1441,1632,1631,1674,1676,1763,504,1098,1101,1104,1105,503,518,1438] 
set surface_color,  pcol8, surf_pocket8 
   

deselect

orient
