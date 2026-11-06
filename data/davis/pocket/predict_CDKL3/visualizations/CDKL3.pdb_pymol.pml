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

load "data/CDKL3.pdb", protein
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

load "data/CDKL3.pdb_points.pdb.gz", points
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
select surf_pocket1, protein and id [4739,4741,4745,708,1086,1088,4740,4742,4744,732,514,649,695,1112,1113,681,730,731,694,689,250,396,654,655,656,651,652,79,76,78,81,80,675,676,133,134,248,653,232,4716,4718,4720] 
set surface_color,  pcol1, surf_pocket1 
set_color pcol2 = [0.329,0.278,0.702]
select surf_pocket2, protein and id [723,724,4674,4675,1337,1338,1343,1342,4672,4684,4703,4730,4731,4706,1089,1080,1378,4708,4670,4680,4664,1661,1364,1365,1367,1368] 
set surface_color,  pcol2, surf_pocket2 
set_color pcol3 = [0.698,0.361,0.902]
select surf_pocket3, protein and id [1335,4724,4727,1332,1328,1325,116,1331,1309,1217,114,1216,4736,4734,99,102,104] 
set surface_color,  pcol3, surf_pocket3 
set_color pcol4 = [0.702,0.278,0.639]
select surf_pocket4, protein and id [1420,1048,1294,1292,1042,1388,1387,1416,1419,1322,1316,1320,1289,1302,1324,1318,1443,1417] 
set surface_color,  pcol4, surf_pocket4 
set_color pcol5 = [0.902,0.361,0.545]
select surf_pocket5, protein and id [1637,1639,1764,1765,2063,2039,2033,2060,2040,2057,2044,2041,2071,2073,2042,1619,1609,1610,1580] 
set surface_color,  pcol5, surf_pocket5 
set_color pcol6 = [0.702,0.353,0.278]
select surf_pocket6, protein and id [1168,1169,521,522,665,2478,2483,2484,2485,2487,2508,2511,2454,484,486,2457] 
set surface_color,  pcol6, surf_pocket6 
set_color pcol7 = [0.902,0.729,0.361]
select surf_pocket7, protein and id [1491,1497,1496,2208,987,1485,1488,2226,983,982,984,990,991,1490,1518,2229,2224,2234,2240] 
set surface_color,  pcol7, surf_pocket7 
   

deselect

orient
