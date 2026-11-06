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

load "data/LIMK1.pdb", protein
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

load "data/LIMK1.pdb_points.pdb.gz", points
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
select surf_pocket1, protein and id [2805,2807,2808,2809,3181,2689,2790,2792,2793,2810,2953,3704,3706,3707,3709,3713,3607,3613,2640,3059,3197,3202,3241,3626,3244,3249,3600,3627,2637,3223,2634,2635,3219,3182] 
set surface_color,  pcol1, surf_pocket1 
set_color pcol2 = [0.329,0.278,0.702]
select surf_pocket2, protein and id [2675,2676,2652,2653,3987,2659,3711,3712,3713,3612,3613,3573,3588,3735,2809,2810,3599,2921,2888,2916,2918,2919,2954,3726,3734,2925,2665,2667,2669,2671,2664,2673,2674,2889] 
set surface_color,  pcol2, surf_pocket2 
set_color pcol3 = [0.698,0.361,0.902]
select surf_pocket3, protein and id [947,1300,1299,1940,779,1733,1954,1955,976,768,773,775,774,777,778,1750,1935,979,2474,1753,1751,764,780,781,1732,787] 
set surface_color,  pcol3, surf_pocket3 
set_color pcol4 = [0.702,0.278,0.639]
select surf_pocket4, protein and id [4945,4495,4474,4478,4481,4468,4532,4467,4469,4432,4904,4942,4944,4506,4496,4502,4505,4546] 
set surface_color,  pcol4, surf_pocket4 
set_color pcol5 = [0.902,0.361,0.545]
select surf_pocket5, protein and id [5010,5012,5013,5014,4398,4567,4930,4380,4544,4924,4928,4921,4922,4896,4919,4958,4960,4961,4579,4597,4599,4575,4566,4593,4590] 
set surface_color,  pcol5, surf_pocket5 
set_color pcol6 = [0.702,0.353,0.278]
select surf_pocket6, protein and id [1278,1697,1978,1250,1253,1254,1979,1659,1676,1677,1289,1292] 
set surface_color,  pcol6, surf_pocket6 
set_color pcol7 = [0.902,0.729,0.361]
select surf_pocket7, protein and id [3264,3604,3605,4271,3297,3298,3266,4270] 
set surface_color,  pcol7, surf_pocket7 
   

deselect

orient
