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

load "data/P30553.pdb", protein
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

load "data/P30553.pdb_points.pdb.gz", points
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
select surf_pocket1, protein and id [813,1,814,2883,2884,2742,1649,1580,1578,1623,2735,2738,1624,1625,1626,1556,2,4,6,7,8,1540,1542,1547,1553,3,9,14,1550,1551,1574,2676,2709,2684,2686,2708,2710,2706,2707,1661,1662,1013,988,1415,2655,2651,1681,1684,1412,951,953,958,962,989,990,1011,1716,992,994,1388,1389,2689] 
set surface_color,  pcol1, surf_pocket1 
set_color pcol2 = [0.365,0.278,0.702]
select surf_pocket2, protein and id [1735,1782,1784,1756,1757,1758,1776,1759,2588,2597,2624,1779,2635,1805,2620,2622,2623,1728,2663,1726] 
set surface_color,  pcol2, surf_pocket2 
set_color pcol3 = [0.792,0.361,0.902]
select surf_pocket3, protein and id [3044,3045,3048,3026,640,1117,651,654,661,662,639,2551,2524,2559,653,3025,2525,685] 
set surface_color,  pcol3, surf_pocket3 
set_color pcol4 = [0.702,0.278,0.533]
select surf_pocket4, protein and id [1296,1225,678,1267,1268,1269,1297,646,677,1099,1101,1103,1135,1219,1223,1232,1234,1076,1093,1096,1098,1073,1075] 
set surface_color,  pcol4, surf_pocket4 
set_color pcol5 = [0.902,0.361,0.361]
select surf_pocket5, protein and id [443,445,813,844,1,2880,2882,2883,2884,23,24,2847,2742,2816,406,845,2,6,9,12,14,2854,2851,2878] 
set surface_color,  pcol5, surf_pocket5 
set_color pcol6 = [0.702,0.533,0.278]
select surf_pocket6, protein and id [3098,536,3088,2997,3090,3065,3119] 
set surface_color,  pcol6, surf_pocket6 
   

deselect

orient
