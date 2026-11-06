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

load "data/NEK11.pdb", protein
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

load "data/NEK11.pdb_points.pdb.gz", points
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
select surf_pocket1, protein and id [890,893,921,897,1299,1300,1302,1328,1408,271,274,275,321,323,324,880,884,303,299,300,310,277,278,280,282,286,270,272,1327,704,1401,1329,1330,1404,1406,1407,838,837,843,453,454,855,1325,1326,865,860,863,864,636,469,470,466,822,1312,8,637] 
set surface_color,  pcol1, surf_pocket1 
set_color pcol2 = [0.278,0.278,0.702]
select surf_pocket2, protein and id [1889,1910,1878,1880,1883,1871,1886,5029,5031,1919,1890,1503,4546,4544,5041,5043,5045,4514,4482,4484,4489,4490,4485,4518,4510,4515,4516,1940,1942,1943,1626,1617,1636,1639,4476,4478,4486,1951,5004,5006,5003,1872,1875] 
set surface_color,  pcol2, surf_pocket2 
set_color pcol3 = [0.576,0.361,0.902]
select surf_pocket3, protein and id [1346,847,1347,2492,2512,418,419,420,2459,2460,2482,2484,412,414,673,680,846,1388,2509,2511,842,712,713,447,734,735,421,695,709,667,714,2458,2479,2490,2513,852,848,435] 
set surface_color,  pcol3, surf_pocket3 
set_color pcol4 = [0.616,0.278,0.702]
select surf_pocket4, protein and id [1662,1579,1570,1583,1730,1656,1658,1660,1585,1441,1475,1491,1468,1490,1496,1521,1488,1584,1264,1442,1443,1495,1257,1258,1260,1440,1609,1610,1611,1612,1477,1637,1638,1502,1651,1652,1653] 
set surface_color,  pcol4, surf_pocket4 
set_color pcol5 = [0.902,0.361,0.792]
select surf_pocket5, protein and id [1546,1562,1548,7,1577,1575,1295,1831,1832,911,912,946,913,1303,1301,1302] 
set surface_color,  pcol5, surf_pocket5 
set_color pcol6 = [0.702,0.278,0.447]
select surf_pocket6, protein and id [8,1539,6,1537,1515,1444,1447,305,306,1271,1289,1272,295,1517,1521] 
set surface_color,  pcol6, surf_pocket6 
set_color pcol7 = [0.902,0.361,0.361]
select surf_pocket7, protein and id [305,1434,1436,1289,1272,572,1405,1413,1421,301,302,303,299,471,488,607,1404,1406,1407] 
set surface_color,  pcol7, surf_pocket7 
set_color pcol8 = [0.702,0.447,0.278]
select surf_pocket8, protein and id [2563,2566,1205,2542,2539,2541,2569,2570,2572,1144,1147,1170,1174,675,678,1176] 
set surface_color,  pcol8, surf_pocket8 
set_color pcol9 = [0.902,0.792,0.361]
select surf_pocket9, protein and id [4830,4831,4970,4972,4997,4854,4855,4993,4749,4888,4959,4961,4995,4964,4960,4942,4856,4832,4781,4996] 
set surface_color,  pcol9, surf_pocket9 
   

deselect

orient
