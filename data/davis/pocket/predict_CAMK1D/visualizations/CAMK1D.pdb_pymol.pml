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

load "data/CAMK1D.pdb", protein
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

load "data/CAMK1D.pdb_points.pdb.gz", points
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
select surf_pocket1, protein and id [269,1423,1374,1403,1378,258,1377,1379,1165,1166,1177,2467,2468,1190,1320,1322,1149,1348,1349,1351,1145,1147,1148,1432,1422,1424,1426,1427,1445,1454,1425,248,251,252,276,255,404,292,1324] 
set surface_color,  pcol1, surf_pocket1 
set_color pcol2 = [0.329,0.278,0.702]
select surf_pocket2, protein and id [1782,2456,2460,2389,2390,2392,2395,2415,2418,2492,2453,2421,2422,1442,1746,1748,1755,1806,1447,1453,2424,2426,2404,2405,2406,1477,1475,1717,1719,1732,1720,2391,1460,1461,1462,1463] 
set surface_color,  pcol2, surf_pocket2 
set_color pcol3 = [0.698,0.361,0.902]
select surf_pocket3, protein and id [289,291,292,402,1323,1324,387,772,773,639,235,238,789,1205,795,797,242,244,246,251,236,241,1190,1322,1178,1314,1316] 
set surface_color,  pcol3, surf_pocket3 
set_color pcol4 = [0.702,0.278,0.639]
select surf_pocket4, protein and id [1258,1276,1259,1269,1270,1271,855,858,852,886,888,1215,1218,947,948,966,969,890,891,950,968,864,916,889,975,976,970,973,1004] 
set surface_color,  pcol4, surf_pocket4 
set_color pcol5 = [0.902,0.361,0.545]
select surf_pocket5, protein and id [157,158,285,298,727,728,729,730,408,747,750,148,410,203,205] 
set surface_color,  pcol5, surf_pocket5 
set_color pcol6 = [0.702,0.353,0.278]
select surf_pocket6, protein and id [649,772,773,560,1346,1347,1345,1329,1331,1333,1335] 
set surface_color,  pcol6, surf_pocket6 
set_color pcol7 = [0.902,0.729,0.361]
select surf_pocket7, protein and id [1175,1179,1180,2469,820,2434,2432,1169,1174,1171,2402,2404,1181,1170,832,836] 
set surface_color,  pcol7, surf_pocket7 
   

deselect

orient
