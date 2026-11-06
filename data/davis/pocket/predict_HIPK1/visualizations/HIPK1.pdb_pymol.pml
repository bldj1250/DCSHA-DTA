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

load "data/HIPK1.pdb", protein
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

load "data/HIPK1.pdb_points.pdb.gz", points
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
select surf_pocket1, protein and id [2454,2455,1478,2467,2479,2619,2621,2609,2613,2617,1512,1526,1643,1645,1646,2053,1800,2054,1503,1647,1770,2629,2622,1510,1476,1485,1472,1473,1474,1475,1486,7195,1466,2494,2495,2612,2051,1630,1914,2059,2047,2049,1464,1470,1523,1525,1465,1468,1471,2076,2084,2104,2101] 
set surface_color,  pcol1, surf_pocket1 
set_color pcol2 = [0.416,0.278,0.702]
select surf_pocket2, protein and id [2982,3034,3035,2772,3023,3024,3027,3028,2196,2195,2197,2198,7215,7206,7219,7220,2123,2125,2160,2161,2774,3059] 
set surface_color,  pcol2, surf_pocket2 
set_color pcol3 = [0.902,0.361,0.878]
select surf_pocket3, protein and id [2121,2123,2469,2470,2471,2461,2462,2786,7219,7220,2982,3034,3035,2770,2772,3024,3028,2983,2196,2198,2774] 
set surface_color,  pcol3, surf_pocket3 
set_color pcol4 = [0.702,0.278,0.380]
select surf_pocket4, protein and id [2455,2479,2438,2621,1505,1489,2751,2437,2436,1495,1506,2642] 
set surface_color,  pcol4, surf_pocket4 
set_color pcol5 = [0.902,0.620,0.361]
select surf_pocket5, protein and id [2176,2178,2142,2143,2144,2569,2571,2251,2252,2253,2255,2217,2218,2556,2226,2213] 
set surface_color,  pcol5, surf_pocket5 
   

deselect

orient
