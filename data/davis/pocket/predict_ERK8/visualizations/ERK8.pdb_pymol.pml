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

load "data/ERK8.pdb", protein
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

load "data/ERK8.pdb_points.pdb.gz", points
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
select surf_pocket1, protein and id [217,218,337,338,3630,1262,1264,1266,161,162,3631,3623,321,756,758,760,766,754,164,1437,1443,3602,201,202,204,188,190,191,192,200,168,170,171,172,179,180,203,167,193,195,197,199,3622,3599,3601,334,336,1260,339,461,497,453,1265,1279,451,452,460,355,466,496,761,1132,1287,1288,1289,455,456,459,1438,194,196,432,433,802,1186,1185,1256,1258,1259,1162,800,805,812,610,608,785,787,782,786,794,1163,1149,1150,1171] 
set surface_color,  pcol1, surf_pocket1 
set_color pcol2 = [0.416,0.278,0.702]
select surf_pocket2, protein and id [4095,892,839,1221,803,1193,840,883,4081,1199] 
set surface_color,  pcol2, surf_pocket2 
set_color pcol3 = [0.902,0.361,0.878]
select surf_pocket3, protein and id [1222,1223,989,1218,1220,988,990,950,1227,1212,4152,593,987,583,1017,976,978,2452,2450,4158,4159,2491,2468] 
set surface_color,  pcol3, surf_pocket3 
set_color pcol4 = [0.702,0.278,0.380]
select surf_pocket4, protein and id [1490,1494,1492,1526,1527,1499,1496,1585,1391,1525,1117,1118,1130,1128,1121,1124,1131,1411,1380,1409,1412,1413,1288,1408,1410,1387,1389,1390,1378,1383,1443] 
set surface_color,  pcol4, surf_pocket4 
set_color pcol5 = [0.902,0.620,0.361]
select surf_pocket5, protein and id [1488,1450,1472,1476,1486,827,1696,828,1163,1451] 
set surface_color,  pcol5, surf_pocket5 
   

deselect

orient
