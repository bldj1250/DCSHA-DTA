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

load "data/BMPR1A.pdb", protein
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

load "data/BMPR1A.pdb_points.pdb.gz", points
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
select surf_pocket1, protein and id [2879,2492,2495,2906,2907,2975,2977,2288,2440,2445,2497,2523,2525,2521,2878,1874,1929,1867,1869,1870,1872,1931,2025,2465,2461,2488,2489,2475,1447,2456,2458,1890,1908,1916,1913,2891,2980,2982,2983,2984,2978,2041,2042,1932,2037,2040,1887,1886,2881,1875,1877,1879,1881,2158,2851,2867,2868,1893,1901,1910] 
set surface_color,  pcol1, surf_pocket1 
set_color pcol2 = [0.329,0.278,0.702]
select surf_pocket2, protein and id [641,835,837,639,640,763,769,765,767,244,514,510,516,760,246,654,669,670,671,247,926,941,833,832,834] 
set surface_color,  pcol2, surf_pocket2 
set_color pcol3 = [0.698,0.361,0.902]
select surf_pocket3, protein and id [2468,2444,2469,1624,2245,2446,2448,2277,2924,2922,2447,2453,2442,2449,2010,2289] 
set surface_color,  pcol3, surf_pocket3 
set_color pcol4 = [0.702,0.278,0.639]
select surf_pocket4, protein and id [261,270,777,775,776,770,523,524,526,529,509,511,759,760,599,602,528,592,641,639,244,258,510,259] 
set surface_color,  pcol4, surf_pocket4 
set_color pcol5 = [0.902,0.361,0.545]
select surf_pocket5, protein and id [2681,2252,2255,4103,2702,2704,2708,2732,2734,2700,2701] 
set surface_color,  pcol5, surf_pocket5 
set_color pcol6 = [0.702,0.353,0.278]
select surf_pocket6, protein and id [2535,2536,2569,2943,2642,2643,2945,2609,2607,2633,2641] 
set surface_color,  pcol6, surf_pocket6 
set_color pcol7 = [0.902,0.729,0.361]
select surf_pocket7, protein and id [3162,3193,3195,2863,2865,2866,3653,3180,3586,2881,2882,2883,2874] 
set surface_color,  pcol7, surf_pocket7 
   

deselect

orient
