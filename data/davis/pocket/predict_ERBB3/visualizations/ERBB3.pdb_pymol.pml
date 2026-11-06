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

load "data/ERBB3.pdb", protein
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

load "data/ERBB3.pdb_points.pdb.gz", points
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
select surf_pocket1, protein and id [6457,6465,6459,6471,5533,5525,5529,5530,5554,5521,6102,6105,5515,5520,6434,5547,6565,6567,5539,6433,6460,6719,5943,6556,6560,6576,6578,6561,5715,5717,6038,6566,6589,6558,5568,6485,6486,5567,6079,6099,5514,5517,5518,5565,5519,5716,5712,6572,6577,5944,6052,6036,5945,5698,6053,5700,5709,5879,5964] 
set surface_color,  pcol1, surf_pocket1 
set_color pcol2 = [0.278,0.298,0.702]
select surf_pocket2, protein and id [7036,7034,7035,7037,8147,8148,8167,8160,8165,8171,6984,6122,6123,6159,7028,7030,7032,6728,6732,7092,6460,6463,6768,6719,7091,6767,6459] 
set surface_color,  pcol2, surf_pocket2 
set_color pcol3 = [0.533,0.361,0.902]
select surf_pocket3, protein and id [1889,1925,1928,1945,1947,1882,1884,1958,1872,1880,1866,625,189,190,191,614,617,621,1851,2197,2204,628,629,630] 
set surface_color,  pcol3, surf_pocket3 
set_color pcol4 = [0.565,0.278,0.702]
select surf_pocket4, protein and id [2283,2454,2456,2457,2458,2007,2009,2010,2112,2294,2297,2463,2437,2441,2147,2165,2168,2166] 
set surface_color,  pcol4, surf_pocket4 
set_color pcol5 = [0.902,0.361,0.878]
select surf_pocket5, protein and id [2729,2734,2575,2564,2570,2743,3230,3232,3242,3244,2567,2569,2568,2732,2727,2728,2733,3018,3021,3234,3231] 
set surface_color,  pcol5, surf_pocket5 
set_color pcol6 = [0.702,0.278,0.533]
select surf_pocket6, protein and id [4230,4232,4062,4231,4227,4221,4223,4224,4214,3445,3446,4046,4063,4065,4009,4044,3999,4004,4007,4001,3417,3988,3994] 
set surface_color,  pcol6, surf_pocket6 
set_color pcol7 = [0.902,0.361,0.490]
select surf_pocket7, protein and id [3877,3879,3874,3606,3807,3926,3804,3839,3862,3868,3870,3872,3878,3884,3913,3599,3602] 
set surface_color,  pcol7, surf_pocket7 
set_color pcol8 = [0.702,0.329,0.278]
select surf_pocket8, protein and id [2190,2191,2192,2194,2193,2195,814,815,818,828,1919,1905,452,643,641,644,829] 
set surface_color,  pcol8, surf_pocket8 
set_color pcol9 = [0.902,0.620,0.361]
select surf_pocket9, protein and id [6736,6737,6679,6689,6691,6420,5550,6682,6432,5549,5539,6433,5536,5538] 
set surface_color,  pcol9, surf_pocket9 
set_color pcol10 = [0.702,0.631,0.278]
select surf_pocket10, protein and id [3319,3335,3503,3504,3506,3509,3336,3297,3505,3507,3760,3271,3279,3280,3283] 
set surface_color,  pcol10, surf_pocket10 
   

deselect

orient
