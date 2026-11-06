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

load "data/MAP3K15.pdb", protein
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

load "data/MAP3K15.pdb_points.pdb.gz", points
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
select surf_pocket1, protein and id [2190,2194,3690,3069,3416,3701,3703,3691,3699,3068,3070,3459,3457,3072,3730,3735,3450,3451,3488,2442,2444,2452,2453,2720,2721,3064,3066,3067,2718,2722,3089,3090,2482,2477,2479,2481,2776,3726,3728,2749,2751,2754,2772,3759,2719,2744,2746,2748,2745,3426,3422,3424,3428,3432,3418] 
set surface_color,  pcol1, surf_pocket1 
set_color pcol2 = [0.278,0.298,0.702]
select surf_pocket2, protein and id [5164,5162,5168,5175,5176,5213,5215,5216,6233,6234,6236,6239,6230,6232,5333,5716,5715,5587,6150,5160,5731,5733,5727,5735,5739,5161,5157,5712,5317,5156,5163,5166,5170,6136,5158,6151,5760,5762,6125,5753,5754,5757] 
set surface_color,  pcol2, surf_pocket2 
set_color pcol3 = [0.533,0.361,0.902]
select surf_pocket3, protein and id [3794,3798,3791,3789,3849,3855,3529,3532,3832,3834,3829,3803,3986,3800,3508,3946,3509,3916,3918,3917,3524,3525,3528,3530,3547,3531,3506] 
set surface_color,  pcol3, surf_pocket3 
set_color pcol4 = [0.565,0.278,0.702]
select surf_pocket4, protein and id [4159,4160,4162,4427,4430,4432,4161,4402,4689,4699,4706,4708,4713,4700,4150,4169,4703,4433,4436,4437,4472,4367,4370,4387,4448,4449,4144,4211,4213,4718,4720] 
set surface_color,  pcol4, surf_pocket4 
set_color pcol5 = [0.902,0.361,0.878]
select surf_pocket5, protein and id [3519,3521,3264,3266,3296,3265,3185,3291,3494,3513,3186,3187,3182,3183,3184,3298,3299,3300] 
set surface_color,  pcol5, surf_pocket5 
set_color pcol6 = [0.702,0.278,0.533]
select surf_pocket6, protein and id [7826,7827,7855,7819,6456,6466,6763,6785,6786,6787,6765,6792,6794,7817,7820,7821,6458,6757,6784,6755,6754,6367,6366] 
set surface_color,  pcol6, surf_pocket6 
set_color pcol7 = [0.902,0.361,0.490]
select surf_pocket7, protein and id [5832,5834,5836,5830,5887,5888,5928,7222,7237,7238,6192,6193,6171,5914,6170,5925,5912] 
set surface_color,  pcol7, surf_pocket7 
set_color pcol8 = [0.702,0.329,0.278]
select surf_pocket8, protein and id [1387,1389,1391,1537,1531,1530,1532,1543,1342,1388,1369,1390,1392,1548,1574,1575,1568,1569] 
set surface_color,  pcol8, surf_pocket8 
set_color pcol9 = [0.902,0.620,0.361]
select surf_pocket9, protein and id [3661,3710,3617,4000,4009,4767,3620,3621,3623,3627,3663] 
set surface_color,  pcol9, surf_pocket9 
set_color pcol10 = [0.702,0.631,0.278]
select surf_pocket10, protein and id [2283,2041,2087,2315,2013,2037,2048,2038,2011,2306,2339] 
set surface_color,  pcol10, surf_pocket10 
   

deselect

orient
