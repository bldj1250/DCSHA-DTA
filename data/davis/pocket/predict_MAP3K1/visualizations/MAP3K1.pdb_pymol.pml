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

load "data/MAP3K1.pdb", protein
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

load "data/MAP3K1.pdb_points.pdb.gz", points
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
select surf_pocket1, protein and id [10114,10461,10463,10112,10485,10569,10484,10064,9630,10069,10088,10091,10092,10106,10109,9486,9490,9485,9487,9488,10083,10086,10087,10469,10574,10576,10577,10578,10571,10572,9645,9538,9526,9493,9501,9502,9491,9536] 
set surface_color,  pcol1, surf_pocket1 
set_color pcol2 = [0.278,0.341,0.702]
select surf_pocket2, protein and id [5288,1354,5311,5722,5721,5723,5693,6142,6173,5747,6159,6161,6166,6167,6172,6160,1369,5755,5753,1333,1330,1334,5234,5278,5280,5226,5227,6144,6145,5694,5229,1325,1353,1355,1323,1324,5286,5254,6194,6197,6201] 
set surface_color,  pcol2, surf_pocket2 
set_color pcol3 = [0.424,0.361,0.902]
select surf_pocket3, protein and id [10026,9231,9246,9248,9807,9810,9232,9776,9322,9325,9680,9682,9985,10029,9983,9984,9250,9252,9270,9273,9254,9272,9777,9744,9285,9293,9295,9301] 
set surface_color,  pcol3, surf_pocket3 
set_color pcol4 = [0.435,0.278,0.702]
select surf_pocket4, protein and id [9614,10078,10080,9087,9114,9115,9086,10094,10099,10497,10499,10501,10507,9040,9065,9067,9037,9057,9061,9066,9082,10502,10554,10535,9108,10531,10534,9083,10538,10074,9615,10557,10068,10070,10071,9617,9039] 
set surface_color,  pcol4, surf_pocket4 
set_color pcol5 = [0.698,0.361,0.902]
select surf_pocket5, protein and id [3804,3805,4447,4408,4412,4439,3806,4471,4437,4438,4468,3774,3779,3780,3782,3550,3549,3587,3613,4891,4892] 
set surface_color,  pcol5, surf_pocket5 
set_color pcol6 = [0.651,0.278,0.702]
select surf_pocket6, protein and id [10143,10144,10262,10265,10492,10516,10517,10518,10498,10515,10102,10526,10195,10197,10199,10190,10192,10230,10229,10200,10173,10175,10177,10171] 
set surface_color,  pcol6, surf_pocket6 
set_color pcol7 = [0.902,0.361,0.824]
select surf_pocket7, protein and id [3357,2311,3537,2285,2289,3402,3403,3404,3505,3509,3527,3525,3410,3405,3528,2294] 
set surface_color,  pcol7, surf_pocket7 
set_color pcol8 = [0.702,0.278,0.533]
select surf_pocket8, protein and id [9511,2503,9514,9668,2501,9667,9669,9670,9686,9688,9509,2500,2502,2496,2498,2499,2535,2538,2521,2522,9504,9507,9512,9521,9652,9532] 
set surface_color,  pcol8, surf_pocket8 
set_color pcol9 = [0.902,0.361,0.545]
select surf_pocket9, protein and id [3527,3529,3525,3410,4401,3405,3528,3530,2294,2423,3404,3505,4871,4397,4870,4866,4862] 
set surface_color,  pcol9, surf_pocket9 
set_color pcol10 = [0.702,0.278,0.318]
select surf_pocket10, protein and id [2923,3326,3349,3350,2925,2953,2954,2956,2685,2921,2945,2706,3686,3696,2963,2958,2960,2982,2983,2944,2320,2322,2674] 
set surface_color,  pcol10, surf_pocket10 
set_color pcol11 = [0.902,0.451,0.361]
select surf_pocket11, protein and id [6159,6161,6167,6172,6160,6163,1370,8600,1396,1397,1398,8567,8568,8566,1388,1389,6194,6197,6198,6201] 
set surface_color,  pcol11, surf_pocket11 
set_color pcol12 = [0.702,0.459,0.278]
select surf_pocket12, protein and id [10858,10862,10655,10657,10861,10864,10363,11393,11413,10868,10359,10860,10869,10870,10872,10895,10658,11395,11396,11376,11391] 
set surface_color,  pcol12, surf_pocket12 
set_color pcol13 = [0.902,0.729,0.361]
select surf_pocket13, protein and id [2569,2618,2619,2608,2609,2251,2252,1348,2474,2472,2452,2284,2414,2417,2288,2280,2302,2300,2282] 
set surface_color,  pcol13, surf_pocket13 
set_color pcol14 = [0.702,0.675,0.278]
select surf_pocket14, protein and id [9215,9955,9952,9867,9865,9868,9167,9170,9209,9151,9960] 
set surface_color,  pcol14, surf_pocket14 
   

deselect

orient
