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

load "data/p38-alpha.pdb", protein
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

load "data/p38-alpha.pdb_points.pdb.gz", points
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
select surf_pocket1, protein and id [689,403,866,1358,1359,885,888,890,688,308,310,265,266,268,415,610,576,611,851,420,418,419,311,612,865,1278,889,896,905,909,404,263,264,883,259,261,1360,1367,1366,1355,1257,574] 
set surface_color,  pcol1, surf_pocket1 
set_color pcol2 = [0.278,0.278,0.702]
select surf_pocket2, protein and id [723,729,737,741,742,49,68,38,50,67,23,716,717,206,718,362,2825,185,202,2786,2785,2806,2792] 
set surface_color,  pcol2, surf_pocket2 
set_color pcol3 = [0.576,0.361,0.902]
select surf_pocket3, protein and id [1609,2025,2027,2098,1554,1556,1555,1590,1889,1557,1559,1560,1620,1621,2341,2343,1603] 
set surface_color,  pcol3, surf_pocket3 
set_color pcol4 = [0.616,0.278,0.702]
select surf_pocket4, protein and id [874,875,1343,691,664,2882,710,2830,2832,692,693,697,699,636,649,641,643,645,680,653,660] 
set surface_color,  pcol4, surf_pocket4 
set_color pcol5 = [0.902,0.361,0.792]
select surf_pocket5, protein and id [1048,1049,1074,2543,2497,2495,2494,1083,1084,1086,674,675,667,1109,1113] 
set surface_color,  pcol5, surf_pocket5 
set_color pcol6 = [0.702,0.278,0.447]
select surf_pocket6, protein and id [892,1321,1322,1324,1290,1293,1326,1325,663,870,873,1342,1343,2880,2882,881,2906,662] 
set surface_color,  pcol6, surf_pocket6 
set_color pcol7 = [0.902,0.361,0.361]
select surf_pocket7, protein and id [970,972,939,941,940,1291,1019,1021,1022,1317,1299,989,1020,1018] 
set surface_color,  pcol7, surf_pocket7 
set_color pcol8 = [0.702,0.447,0.278]
select surf_pocket8, protein and id [1364,1363,1367,1224,1226,1391,1392,1394,1227,1228,1546,1455,1490,1244,1245,1265,1266,538,292,1448,1423,1386,1456] 
set surface_color,  pcol8, surf_pocket8 
set_color pcol9 = [0.902,0.792,0.361]
select surf_pocket9, protein and id [1542,1572,1577,1456,1452,1453,1857,1502,1506,1509,1580,1454,1455,1490,1464,1546,1491] 
set surface_color,  pcol9, surf_pocket9 
   

deselect

orient
