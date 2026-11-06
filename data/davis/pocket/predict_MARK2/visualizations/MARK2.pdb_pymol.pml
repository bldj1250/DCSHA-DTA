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

load "data/MARK2.pdb", protein
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

load "data/MARK2.pdb_points.pdb.gz", points
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
select surf_pocket1, protein and id [1534,1535,1536,470,512,1452,1066,1453,6012,1044,1056,6006,511,453,455,462,457,458,450,452,6007,495,496,469,626,627,1017,1018,1040,611,1023,1532,1561,1676,1562,1560,1425,1437,1424,1426,1414,1415,1685,4641,4628,4639,4640,1530,1527,1529] 
set surface_color,  pcol1, surf_pocket1 
set_color pcol2 = [0.278,0.298,0.702]
select surf_pocket2, protein and id [473,478,711,685,476,488,490,479,1534,1535,1536,470,495,484,644,744,776,731,738,739,741,707,709,710,684,627,628,643,1561,1562,737,1558,1560,1415,732,735,1551,1549,1550] 
set surface_color,  pcol2, surf_pocket2 
set_color pcol3 = [0.533,0.361,0.902]
select surf_pocket3, protein and id [6040,6042,1698,1699,6043,6050,6053,6055,1961,1085,1987,1427,1428,1429,1419,1709,1711,1683,1685] 
set surface_color,  pcol3, surf_pocket3 
set_color pcol4 = [0.565,0.278,0.702]
select surf_pocket4, protein and id [1612,1614,1826,2342,2348,2356,2359,2346,2344,1595,1596,1319,1318,1320,1326,1327,1817,1818,1323,1815,1294] 
set surface_color,  pcol4, surf_pocket4 
set_color pcol5 = [0.902,0.361,0.878]
select surf_pocket5, protein and id [840,841,842,890,891,2571,2573,2577,2581,815,838,2553,2806,2596,2575,2893,2593,2829,896,2861] 
set surface_color,  pcol5, surf_pocket5 
set_color pcol6 = [0.702,0.278,0.533]
select surf_pocket6, protein and id [439,440,5870,6005,6007,5392,5405,5887,529,1039,454,1049,5987,5983,5984,6002,5865] 
set surface_color,  pcol6, surf_pocket6 
set_color pcol7 = [0.902,0.361,0.490]
select surf_pocket7, protein and id [1470,1473,2941,2936,2922,2930,2944,1024,1026,1032,2925,1465,1482,1469,1514,1515] 
set surface_color,  pcol7, surf_pocket7 
set_color pcol8 = [0.702,0.329,0.278]
select surf_pocket8, protein and id [841,842,889,891,2571,2573,2577,2580,2581,2566,908,2921,2923,2889,2890,2887,2893,2593,2882,2913,2642] 
set surface_color,  pcol8, surf_pocket8 
set_color pcol9 = [0.902,0.620,0.361]
select surf_pocket9, protein and id [1417,1419,1708,1082,1073,1444,1084,1112,1890,1893,1895,1931,1922] 
set surface_color,  pcol9, surf_pocket9 
set_color pcol10 = [0.702,0.631,0.278]
select surf_pocket10, protein and id [775,809,810,881,1017,1018,1530,879,1529] 
set surface_color,  pcol10, surf_pocket10 
   

deselect

orient
