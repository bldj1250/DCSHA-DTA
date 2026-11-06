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

load "data/ADCK3.pdb", protein
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

load "data/ADCK3.pdb_points.pdb.gz", points
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
select surf_pocket1, protein and id [4756,4408,4409,4568,4603,4376,4601,4624,4786,4788,4755,4757,4763,4791,4792,4793,2103,2101,2110,2112,4602,4770,4758,4759,4724,4760,4761,4762,4249,4251,4625,4661,4662,4665,4691,4693,4621,4694,4732,4733,2938,2944,4633,4735,4738,2936,3050,4773,3011,4728,4730,4731,2979,4684,2941,2952,2954,4405,4081,4382,4384,4379,4383,4385,4351,4088,4089,4790,4057,4084,4055,4355,4354,2076,2078,2077,2079,2090,2082,2988,2983,3049,4823,4543,4821,4822,4569,4537,4538,4578,4579,4809,4816,4794,4808,4533,4535,4406,4437] 
set surface_color,  pcol1, surf_pocket1 
set_color pcol2 = [0.416,0.278,0.702]
select surf_pocket2, protein and id [2713,2714,3135,3925,3926,3927,3407,3408,3805,3920,3923,1454,3796,3918,3915,3426,3432,3919,2072,2073,2074,3080,3762,3760,2069,2053,3078,3079,3081,3076,3761,2104,3946,4773,3776,3795,3797,2252,2712,2578,2044,2567,2569,2571,2605,2606,2709,2573,2584,2697,3391,2586,2561,2251,1455,2556,3424,2696,2557,2563,2565] 
set surface_color,  pcol2, surf_pocket2 
set_color pcol3 = [0.902,0.361,0.878]
select surf_pocket3, protein and id [3771,3790,3791,3767,4798,4819,4796,2121,2257,4822,2102,2104,2103,2098,3761,3765,3768,3769,3770,4767,2070,2096,2095] 
set surface_color,  pcol3, surf_pocket3 
set_color pcol4 = [0.702,0.278,0.380]
select surf_pocket4, protein and id [3591,886,894,895,3592,3593,3594,3595,3597,883,905,906,904,3564,4879,4887,4889,4903,3558,3561] 
set surface_color,  pcol4, surf_pocket4 
set_color pcol5 = [0.902,0.620,0.361]
select surf_pocket5, protein and id [2151,2152,2089,2905,2916,2923,2218,2185,2870] 
set surface_color,  pcol5, surf_pocket5 
   

deselect

orient
