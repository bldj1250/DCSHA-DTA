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

load "data/LTK.pdb", protein
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

load "data/LTK.pdb_points.pdb.gz", points
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
select surf_pocket1, protein and id [5126,3401,3413,3415,4952,5068,4684,5096,5145,5146,5147,4954,4955,4957,4979,5023,4891,4863,5030,4866,5022,3402,3375,5101,4897,4899] 
set surface_color,  pcol1, surf_pocket1 
set_color pcol2 = [0.278,0.322,0.702]
select surf_pocket2, protein and id [6400,3904,4842,4843,4844,6402,3739,3728,4883,4860,4857,4858,4859,4890,4841,4856,6418,6420,6401,5004,4699,4735,4865,5012,4867,5006,4891] 
set surface_color,  pcol2, surf_pocket2 
set_color pcol3 = [0.467,0.361,0.902]
select surf_pocket3, protein and id [3451,3452,3463,3473,3464,4031,3480,3465,4030,4052,3474,3477,3503,3505,3506,4095,4093,4060,4084,4055,4059,4049,4082,4083,4638,3467,4053,3559,3569,3568,4906,4908,4655,4659,4661,4911] 
set surface_color,  pcol3, surf_pocket3 
set_color pcol4 = [0.490,0.278,0.702]
select surf_pocket4, protein and id [2580,5454,5457,5458,5459,5460,5463,2557,886,887,889,890,892,884,2565,2577,2563,2559,5435,5436,5467,5488,2599,2604,2586,2555,5466,5468] 
set surface_color,  pcol4, surf_pocket4 
set_color pcol5 = [0.792,0.361,0.902]
select surf_pocket5, protein and id [5487,5488,5489,2511,2520,5485,873,2639,861,875,1034,2509,2513,890,892,1021,2620,5494,5495,5496] 
set surface_color,  pcol5, surf_pocket5 
set_color pcol6 = [0.702,0.278,0.659]
select surf_pocket6, protein and id [3904,4039,4842,4843,4844,6402,3728,3903,3760,4836,4840,3899,3901,3902,6388,6384,3759] 
set surface_color,  pcol6, surf_pocket6 
set_color pcol7 = [0.902,0.361,0.682]
select surf_pocket7, protein and id [2557,889,1016,1017,1018,1019,1020,1021,5488,5467,2554,2555,5558,5466,5561,5496] 
set surface_color,  pcol7, surf_pocket7 
set_color pcol8 = [0.702,0.278,0.408]
select surf_pocket8, protein and id [5487,5488,5489,873,875,5435,5436,5467,890,892,498,2615,2618,2620,2604] 
set surface_color,  pcol8, surf_pocket8 
set_color pcol9 = [0.902,0.361,0.361]
select surf_pocket9, protein and id [4663,4666,4667,4653,4655,4659,4688,4691,4911,4909,4898,4906,4908,4872,3430,3432,3438,4668,4670,4646,3449,4638] 
set surface_color,  pcol9, surf_pocket9 
set_color pcol10 = [0.702,0.408,0.278]
select surf_pocket10, protein and id [5060,4335,4333,4721,4724,5043,5044,5327,5328,6439,6425,6427,6414,6416,6417,6419,4725,6412,6413,6423,6408,4728,5383,6438,6434,5020,5384] 
set surface_color,  pcol10, surf_pocket10 
set_color pcol11 = [0.902,0.682,0.361]
select surf_pocket11, protein and id [4422,5926,5927,5913,2877,2719,2937,2940,2941,2717,2942] 
set surface_color,  pcol11, surf_pocket11 
set_color pcol12 = [0.702,0.659,0.278]
select surf_pocket12, protein and id [1932,1891,1925,2021,2016,1910,1994,1996,1987,1989,1903,1904,1905,1906,1920,1907] 
set surface_color,  pcol12, surf_pocket12 
   

deselect

orient
