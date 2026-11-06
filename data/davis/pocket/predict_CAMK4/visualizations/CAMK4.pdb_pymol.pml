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

load "data/CAMK4.pdb", protein
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

load "data/CAMK4.pdb_points.pdb.gz", points
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
select surf_pocket1, protein and id [428,552,1415,1417,1422,1423,1424,427,899,536,1307,1295,769,770,905,918,924,1322,1323,947,372,375,936,937,922,373,378,371] 
set surface_color,  pcol1, surf_pocket1 
set_color pcol2 = [0.365,0.278,0.702]
select surf_pocket2, protein and id [2553,2557,2583,2586,2588,2527,1832,1834,2526,2555,2558,2614,1575,1577,1563,1567,1568,1589,1591,1830,1904,1932,1861,1933] 
set surface_color,  pcol2, surf_pocket2 
set_color pcol3 = [0.792,0.361,0.902]
select surf_pocket3, protein and id [396,1485,1556,1266,1282,1283,1294,1296,1297,1299,1307,413,553,554,1420,1424,569,393,401,407,392,1252,1262,1264,1265,1453,1421,1461,1451,1459,1486,1448,1449,1568,1597,1554,1558,1559] 
set surface_color,  pcol3, surf_pocket3 
set_color pcol4 = [0.702,0.278,0.533]
select surf_pocket4, protein and id [1831,1858,1819,1860,1862,1821,1822,1823,1824,1825,1826,2489,2490,2047,2048,2074,2075,3112,1840,2551] 
set surface_color,  pcol4, surf_pocket4 
set_color pcol5 = [0.902,0.361,0.361]
select surf_pocket5, protein and id [1551,1546,1559,1550,1634,1597,1623,1625,1628,1631,1517,1461,1520,1459,1486,1518,1519,1252,1262,1264,1265,1556] 
set surface_color,  pcol5, surf_pocket5 
set_color pcol6 = [0.702,0.533,0.278]
select surf_pocket6, protein and id [1101,1103,1333,1078,1095,1075,1128,1332,1335,1368,1369,1379,1080,992,983,986,1018,1019,1364] 
set surface_color,  pcol6, surf_pocket6 
   

deselect

orient
