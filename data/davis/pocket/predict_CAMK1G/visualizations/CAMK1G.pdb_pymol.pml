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

load "data/CAMK1G.pdb", protein
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

load "data/CAMK1G.pdb_points.pdb.gz", points
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
select surf_pocket1, protein and id [1211,1317,650,789,1315,1318,1324,1325,1326,1319,1322,1323,239,240,243,244,295,402,420,1380,1345,1344,1350,1351,1353,1379,1381,245,296,247,248,280,1184,1196,241,835,1171,1153,1154,1155,1172,1441,246,249,251,253,255,256,259,811,824,825,1212,2523,810,794,807,813] 
set surface_color,  pcol1, surf_pocket1 
set_color pcol2 = [0.329,0.278,0.702]
select surf_pocket2, protein and id [811,818,822,824,825,1212,828,833,2523,2507,2531,2506,2473,834,835,2503,2504,244,2524,1211,861,863,2479,2480,897,898,899,870,869,823,1243] 
set surface_color,  pcol2, surf_pocket2 
set_color pcol3 = [0.698,0.361,0.902]
select surf_pocket3, protein and id [1747,1749,2400,2411,2413,2415,1718,1720,1733,1741,1808,2401,1187,1474,1476,1452,1462,1461] 
set surface_color,  pcol3, surf_pocket3 
set_color pcol4 = [0.702,0.278,0.639]
select surf_pocket4, protein and id [154,212,740,741,763,766,732,148,163,147,141,424,425,742,289,306,426,210,307,166] 
set surface_color,  pcol4, surf_pocket4 
set_color pcol5 = [0.902,0.361,0.545]
select surf_pocket5, protein and id [1482,1510,1511,1509,1154,1443,1444,1141,1483,1433,1435,1140,1142,1561,1557,1559,1389,1390,1588,1519] 
set surface_color,  pcol5, surf_pocket5 
set_color pcol6 = [0.702,0.353,0.278]
select surf_pocket6, protein and id [1187,2478,2433,2435,2408,2409,2411,2441,861,862,863,2443,848,852,1176,1180,1185,1186,836] 
set surface_color,  pcol6, surf_pocket6 
set_color pcol7 = [0.902,0.729,0.361]
select surf_pocket7, protein and id [788,1319,1333,1335,1348,662,787,665,666,1337,570,774] 
set surface_color,  pcol7, surf_pocket7 
   

deselect

orient
