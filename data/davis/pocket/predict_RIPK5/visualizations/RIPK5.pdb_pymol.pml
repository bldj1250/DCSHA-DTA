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

load "data/RIPK5.pdb", protein
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

load "data/RIPK5.pdb_points.pdb.gz", points
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
select surf_pocket1, protein and id [5228,5389,5284,5286,5287,5225,5233,5224,5230,5246,5232,5245,5273,5231,5405,5406,5261,5270,5265,5831,6235,6236,6317,6318,6319,6322,6221,6208,6209,6320,6324,6325,6326,5871,5884,5888,5226,5852,5856,5846] 
set surface_color,  pcol1, surf_pocket1 
set_color pcol2 = [0.278,0.333,0.702]
select surf_pocket2, protein and id [2574,2736,2592,2593,2699,2584,2589,2456,2587,2594,2598,2735,2676,2677,2603,2608,2609,2697,2501,2507,2512,2648,2650,2503,2508,2499,2478,2479,2579] 
set surface_color,  pcol2, surf_pocket2 
set_color pcol3 = [0.443,0.361,0.902]
select surf_pocket3, protein and id [2648,2650,2494,2499,2478,2486,2380,2479,2491,2492,2493,2495,2497,2338,2342,2584,2589,2376,2378,2456,2587,2594,2597,2598,2353,2374,2616,2603,2608,2609,2461] 
set surface_color,  pcol3, surf_pocket3 
set_color pcol4 = [0.463,0.278,0.702]
select surf_pocket4, protein and id [3826,3796,4146,4175,3201,4672,3799,3798,4668,4670,3224,3293] 
set surface_color,  pcol4, surf_pocket4 
set_color pcol5 = [0.741,0.361,0.902]
select surf_pocket5, protein and id [6336,6337,6338,5537,5502,5503,5505,5507,5508,6347,6349,6431,5253,5256,5264,5266,5474,5477,5261,5262,5419,5514,5259,5511,5472] 
set surface_color,  pcol5, surf_pocket5 
set_color pcol6 = [0.694,0.278,0.702]
select surf_pocket6, protein and id [5712,5717,270,272,275,5731,5733,293,294,291,257,5706,5722,5128,5167,5170,5172,5173,56,60,61,5742,259,258,5097,5099,5101,5104,5129] 
set surface_color,  pcol6, surf_pocket6 
set_color pcol7 = [0.902,0.361,0.757]
select surf_pocket7, protein and id [6442,6191,6458,6731,6194,6195,6193,6197,6205,6210,6211,6212,6200,6203,5904,5906,6677,6712,6467] 
set surface_color,  pcol7, surf_pocket7 
set_color pcol8 = [0.702,0.278,0.475]
select surf_pocket8, protein and id [2903,2939,2902,2904,2930,6370,6141,6142,6143,2963,2964,6127,5593,5595,5565,2931,5555,5558,5567] 
set surface_color,  pcol8, surf_pocket8 
set_color pcol9 = [0.902,0.361,0.459]
select surf_pocket9, protein and id [772,774,776,808,810,797,2778,2771,2773,2774,804,1879,2775,829,831,1876,1880,2133,1887,1843,1844,1866] 
set surface_color,  pcol9, surf_pocket9 
set_color pcol10 = [0.702,0.318,0.278]
select surf_pocket10, protein and id [647,652,653,655,2967,2968,2973,2974,2944,2978,2979,2969,3004,638,642,639,4898,4893,4897,4865,4860,4861,3006,3008,4923,664,669] 
set surface_color,  pcol10, surf_pocket10 
set_color pcol11 = [0.902,0.561,0.361]
select surf_pocket11, protein and id [3004,642,3966,3965,3996,3002,3006,3007,3040,3008,4843,4865,3067,3063,3974,3998,3032] 
set surface_color,  pcol11, surf_pocket11 
set_color pcol12 = [0.702,0.553,0.278]
select surf_pocket12, protein and id [1523,1559,1334,1337,1491,1496,1497,1499,1139,1479,1454,1463,1336,1352,1489,1555,1556] 
set surface_color,  pcol12, surf_pocket12 
set_color pcol13 = [0.902,0.859,0.361]
select surf_pocket13, protein and id [5583,5584,5585,5586,5591,2870,2872,5593,5550,5556,5557,5552,2904,5544,5546,5060,5062,2841,5037,5520] 
set surface_color,  pcol13, surf_pocket13 
   

deselect

orient
