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

load "data/AMPK-alpha2.pdb", protein
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

load "data/AMPK-alpha2.pdb_points.pdb.gz", points
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
select surf_pocket1, protein and id [340,747,748,1189,1190,341,342,1272,1163,325,776,753,770,169,170,226,171,175,176,224,227,186,187,183,798,172,173,174,774,1263,1175,1265,1266,1268,614] 
set surface_color,  pcol1, surf_pocket1 
set_color pcol2 = [0.329,0.278,0.702]
select surf_pocket2, protein and id [1235,1236,1237,1251,1206,2660,2670,2671,2673,2674,2675,2210,2209,2212,584,586,587,2701,2662,624,756,2635,2661,1233,598,599,991,1202,1218,762,2676,2208,2207] 
set surface_color,  pcol2, surf_pocket2 
set_color pcol3 = [0.698,0.361,0.902]
select surf_pocket3, protein and id [843,845,1664,815,817,818,852,848,846,1157,1438,1637,1436,1672,1677,1678,1679,1665,1666,1667] 
set surface_color,  pcol3, surf_pocket3 
set_color pcol4 = [0.702,0.278,0.639]
select surf_pocket4, protein and id [538,569,572,629,637,2571,2573,2579,2603,2605,2606,2492,2493,2496,2518,2527,2528,2530,2521,2523,2516,2487,535,537,539] 
set surface_color,  pcol4, surf_pocket4 
set_color pcol5 = [0.902,0.361,0.545]
select surf_pocket5, protein and id [565,567,568,2668,2604,2664,2629,619,622,623,2638,639,2600,2637,569,627,629,637,2602,2603,2605,2292,2293] 
set surface_color,  pcol5, surf_pocket5 
set_color pcol6 = [0.702,0.353,0.278]
select surf_pocket6, protein and id [1044,2260,1042,2237,2238,2288,579,582,2286,2287,2271,2281,2273,2696,2700,2258,2252,2257,1073,2259,2236,1069,2205,2705,2703,1082,588,589,2699,2701] 
set surface_color,  pcol6, surf_pocket6 
set_color pcol7 = [0.902,0.729,0.361]
select surf_pocket7, protein and id [4283,4285,4308,4310,4287,3763,4274,4276,3762,3217,3766,3219,3222,3205,4337,3229] 
set surface_color,  pcol7, surf_pocket7 
   

deselect

orient
