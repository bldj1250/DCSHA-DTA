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

load "data/P25116.pdb", protein
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

load "data/P25116.pdb_points.pdb.gz", points
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
select surf_pocket1, protein and id [2790,2753,2755,2780,2783,2747,2749,2750,2752,2643,2012,2015,2017,2005,2024,2025,760,762,2732,2721,322,2702,2723,2724,710,729,731,703,320,321,2010,2656,2641,2644,2007,2032,2026,2030,2073,2047,2048,2682,2683,2686,2639,2676,2049,1246,1247,1285,866,868,1440,1456,1442,1444,2811,2812,1453,1477,1443,746,749,732,1283,2081] 
set surface_color,  pcol1, surf_pocket1 
set_color pcol2 = [0.302,0.278,0.702]
select surf_pocket2, protein and id [1878,1879,1832,1849,1460,1462,1831,1833,1807,1803,1178,1181,1180,1470,1211,1430,1432,1406,1407,1408,1409,1469,1205] 
set surface_color,  pcol2, surf_pocket2 
set_color pcol3 = [0.631,0.361,0.902]
select surf_pocket3, protein and id [1190,2830,2851,2857,1187,1188,1189,1191,1192,1474,1476,2570,1472,1499,1501,1477,2829] 
set surface_color,  pcol3, surf_pocket3 
set_color pcol4 = [0.678,0.278,0.702]
select surf_pocket4, protein and id [1691,1693,1688,1689,1685,1687,1698,1766,1729,1738,1765,1695,1547,1105,1107,1546,1570,1573,1571,1606,1739,1576,1702,1569] 
set surface_color,  pcol4, surf_pocket4 
set_color pcol5 = [0.902,0.361,0.682]
select surf_pocket5, protein and id [2894,2884,939,940,964,2883,3008,3009,3042,968,2970] 
set surface_color,  pcol5, surf_pocket5 
set_color pcol6 = [0.702,0.278,0.341]
select surf_pocket6, protein and id [2812,1453,1477,1478,2589,1456,2621,2783,2781] 
set surface_color,  pcol6, surf_pocket6 
set_color pcol7 = [0.902,0.522,0.361]
select surf_pocket7, protein and id [1517,2236,1539,1569,2261,2199,1819,1791,1547,2188,2237,2229] 
set surface_color,  pcol7, surf_pocket7 
set_color pcol8 = [0.702,0.596,0.278]
select surf_pocket8, protein and id [2135,2122,2124,2129,2131,2160,2094,2096] 
set surface_color,  pcol8, surf_pocket8 
   

deselect

orient
