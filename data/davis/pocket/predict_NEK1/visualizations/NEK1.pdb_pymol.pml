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

load "data/NEK1.pdb", protein
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

load "data/NEK1.pdb_points.pdb.gz", points
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
select surf_pocket1, protein and id [9925,9926,9927,9928,9929,9435,9461,9424,9426,9427,1267,1431,9460,9900,1418,1411,1414,1378,1291,1319,1321,1287,1290,1292,1266,1293,1294,1296,9894,9923,9952,9919,9891,9893,1678,1707,1741,9956,1682,1684,1674,1676,1708,1320,1327,1297,9421,9393,9397,9398] 
set surface_color,  pcol1, surf_pocket1 
set_color pcol2 = [0.329,0.278,0.702]
select surf_pocket2, protein and id [514,515,1111,1112,1113,1114,1110,651,1192,1193,264,104,105,128,259,261,262,263,85,87,141,86,88,89,90,92,247,657,673,678,668,670,672,246,1083,703,731,677,692,693,1053,1055,1072,1095,1082,1340,1041,1051,1054,1314,1338,1302,1310,1313,1331,1334,108,113,121,123,124,1198,1206,1229,1232] 
set surface_color,  pcol2, surf_pocket2 
set_color pcol3 = [0.698,0.361,0.902]
select surf_pocket3, protein and id [652,526,528,444,441,532,1183,1186,512,514,651,513,442,648,1187,445,1201,1203,462] 
set surface_color,  pcol3, surf_pocket3 
set_color pcol4 = [0.702,0.278,0.639]
select surf_pocket4, protein and id [1244,1249,1255,1292,1286,1288,1285,1260,1408,1379,1291,1315,1489,1458,1409,1455,1457,1460,1406,1427,1429,1437,1426,1432,1403,1364,1228,1232,1225,1284,1279,1041,1314] 
set surface_color,  pcol4, surf_pocket4 
set_color pcol5 = [0.902,0.361,0.545]
select surf_pocket5, protein and id [321,322,385,387,120,1218,1220,1213,1239,280,281,617] 
set surface_color,  pcol5, surf_pocket5 
set_color pcol6 = [0.702,0.353,0.278]
select surf_pocket6, protein and id [1197,1199,443,445,1214,418,414,1200,436,413,415,1023,1017,416] 
set surface_color,  pcol6, surf_pocket6 
set_color pcol7 = [0.902,0.729,0.361]
select surf_pocket7, protein and id [9663,9664,9732,9889,9887,9886,9758,9918,9640,9641,9919] 
set surface_color,  pcol7, surf_pocket7 
   

deselect

orient
