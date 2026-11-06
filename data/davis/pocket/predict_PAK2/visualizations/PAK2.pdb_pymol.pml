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

load "data/PAK2.pdb", protein
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

load "data/PAK2.pdb_points.pdb.gz", points
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
select surf_pocket1, protein and id [3009,2980,2982,2984,2891,1999,2002,1991,1998,2000,2007,2010,2012,2013,2998,2999,1986,1989,1981,2879,2880,2551,2554,2579,1085,1088,1086,2005,3010,3127,3128,3135,2852,2868,2869,2881,2882,1984,2029,2121,2507,2508,2525,2527,2513,2530,2534,2030,2906,2975,2905,2976,2548,2138,2139,2137,2997,1114,1116,1118] 
set surface_color,  pcol1, surf_pocket1 
set_color pcol2 = [0.365,0.278,0.702]
select surf_pocket2, protein and id [1116,1498,1499,1500,1501,1502,1504,3168,3438,3439,3412,3398,1496,1484,3396,1118,3152,3367,2875,2881,2882,2883,2599,2570,3134,3167] 
set surface_color,  pcol2, surf_pocket2 
set_color pcol3 = [0.792,0.361,0.902]
select surf_pocket3, protein and id [2237,2240,3008,2998,2999,1093,2210,2211,2207,2199,2012,3009,2005,3010,1091,2205,2236,2242,2243,2247,2274,2997] 
set surface_color,  pcol3, surf_pocket3 
set_color pcol4 = [0.702,0.278,0.533]
select surf_pocket4, protein and id [3257,3263,3265,3266,2784,3808,3811,3272,3273,3274,3075,2780,2781,3816,2807] 
set surface_color,  pcol4, surf_pocket4 
set_color pcol5 = [0.902,0.361,0.361]
select surf_pocket5, protein and id [874,793,794,817,820,721,725,715,749,746,724,728,901,713,827,900] 
set surface_color,  pcol5, surf_pocket5 
set_color pcol6 = [0.702,0.533,0.278]
select surf_pocket6, protein and id [2139,2273,2137,2977,2978,2304,2508,2976] 
set surface_color,  pcol6, surf_pocket6 
   

deselect

orient
