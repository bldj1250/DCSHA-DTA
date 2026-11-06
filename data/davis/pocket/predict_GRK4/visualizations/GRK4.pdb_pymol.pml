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

load "data/GRK4.pdb", protein
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

load "data/GRK4.pdb_points.pdb.gz", points
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
select surf_pocket1, protein and id [2164,2181,2589,2670,2672,2590,2561,2562,2191,2169,1643,1750,1751,1752,2674,2673,2676,1606,1736,2149,2143,1590,1591,1586,1587,1640,1642,1588,1592,1593,1594,1596,1598,1600,3830,3849,3847,3834,3845,3836,3850,2175,2172] 
set surface_color,  pcol1, surf_pocket1 
set_color pcol2 = [0.278,0.278,0.702]
select surf_pocket2, protein and id [1521,1481,1471,269,258,260,1516,1519,1520,1675,1680,1691,1444,1447,1472,1490,4104,4143] 
set surface_color,  pcol2, surf_pocket2 
set_color pcol3 = [0.576,0.361,0.902]
select surf_pocket3, protein and id [1729,1717,2158,2150,2151,1709,1711,1712,2026,2156,2614,149,151,154,4195,4196,4197,2025,2027,2658,4162,4127,4159,2039,4129,1713,1705,140,141,152,142,1716,1718,2174] 
set surface_color,  pcol3, surf_pocket3 
set_color pcol4 = [0.616,0.278,0.702]
select surf_pocket4, protein and id [1751,1752,2678,2679,2680,1606,1609,1610,2690,2691,2693,2698,2700,1909,1620,1622,1878] 
set surface_color,  pcol4, surf_pocket4 
set_color pcol5 = [0.902,0.361,0.792]
select surf_pocket5, protein and id [2247,2249,3147,3149,3129,3130,3135,3141,3152,3128,2205,2206,2207,2208,2564,2565,2566,2841,2843,3101,3103,2825,2829,3126,2556,3057,2819] 
set surface_color,  pcol5, surf_pocket5 
set_color pcol6 = [0.702,0.278,0.447]
select surf_pocket6, protein and id [3529,2933,2936,2938,2939,2954,2956,3531,2922,3486,2765,2916,3488,3559,2947,2949,2455,2456,2982,3527,3487,3532,2766,2769,3491,2943] 
set surface_color,  pcol6, surf_pocket6 
set_color pcol7 = [0.902,0.361,0.361]
select surf_pocket7, protein and id [447,501,504,542,545,530,532,655,455,422,1204,1205,1206,682,1233,678,679,690,680] 
set surface_color,  pcol7, surf_pocket7 
set_color pcol8 = [0.702,0.447,0.278]
select surf_pocket8, protein and id [1759,1760,1761,2121,2106,1549,1551,1552,1553,2082,2084,2085,1501,1504] 
set surface_color,  pcol8, surf_pocket8 
set_color pcol9 = [0.902,0.792,0.361]
select surf_pocket9, protein and id [2156,2602,2606,2158,2150,1711,2658,2655,1990,3730] 
set surface_color,  pcol9, surf_pocket9 
   

deselect

orient
