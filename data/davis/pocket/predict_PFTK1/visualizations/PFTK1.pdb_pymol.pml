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

load "data/PFTK1.pdb", protein
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

load "data/PFTK1.pdb_points.pdb.gz", points
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
select surf_pocket1, protein and id [1646,1648,1649,1650,1651,2178,1517,1644,1647,2173,2101,2102,1169,1266,1112,1115,1116,1670,1515,1677,1656,1672,1282,1283,1284,2182,1170,1111,1167,1299,1618,1279,1632,2074,1113,1704,1682,1684,1726,2187,2181,2183,2195,2086,2175,2176,2190,2171,2197,1449,2216,2217,2218,2221] 
set surface_color,  pcol1, surf_pocket1 
set_color pcol2 = [0.278,0.278,0.702]
select surf_pocket2, protein and id [1155,1283,1284,2182,1143,1147,1131,1152,1298,1299,1632,2197,2277,2187,2181,2195,2217,2221,2247] 
set surface_color,  pcol2, surf_pocket2 
set_color pcol3 = [0.576,0.361,0.902]
select surf_pocket3, protein and id [1064,1233,1018,1020,1210,1223,1242,1208,1234,1542,1538,1540,1541,1543,1544,1245,1261,1061] 
set surface_color,  pcol3, surf_pocket3 
set_color pcol4 = [0.616,0.278,0.702]
select surf_pocket4, protein and id [1401,1403,1617,1402,1575,1578,1572,1556,1559,1560,1557,181,216,154,184,185,217,1381] 
set surface_color,  pcol4, surf_pocket4 
set_color pcol5 = [0.902,0.361,0.792]
select surf_pocket5, protein and id [3397,3400,3398,1976,3274,1977,3273,3291,3292,3402,1936,3440,3423,1916,1917,1914,1915,1884,3392] 
set surface_color,  pcol5, surf_pocket5 
set_color pcol6 = [0.702,0.278,0.447]
select surf_pocket6, protein and id [2776,2784,2785,2787,2822,2769,2819,2992,2821,2775,2990,2820,3234,3199,2818,3203,3200,3187,3192,3197,3198] 
set surface_color,  pcol6, surf_pocket6 
set_color pcol7 = [0.902,0.361,0.361]
select surf_pocket7, protein and id [1298,1299,1618,1304,1318,1143,1371,2247,2248,2255,2221,1394] 
set surface_color,  pcol7, surf_pocket7 
set_color pcol8 = [0.702,0.447,0.278]
select surf_pocket8, protein and id [1291,1610,1625,1624,1077,1081,1082,1609,1274,1037,1038,1567,1584] 
set surface_color,  pcol8, surf_pocket8 
set_color pcol9 = [0.902,0.792,0.361]
select surf_pocket9, protein and id [2847,2878,2833,2845,2846,2870,2434,3217,3218,2448,2450,3226,3227] 
set surface_color,  pcol9, surf_pocket9 
   

deselect

orient
