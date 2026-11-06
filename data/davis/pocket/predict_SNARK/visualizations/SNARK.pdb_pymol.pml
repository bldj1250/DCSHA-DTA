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

load "data/SNARK.pdb", protein
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

load "data/SNARK.pdb_points.pdb.gz", points
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
select surf_pocket1, protein and id [503,641,493,494,495,497,520,522,639,3969,511,654,504,517,518,513,515,3638,3640,1576,3949,3950,535,1439,3972,3958,3966,1597,1599,1589,1590,1591,642,809,1574,1575,1598,763,764,771,776,656] 
set surface_color,  pcol1, surf_pocket1 
set_color pcol2 = [0.278,0.298,0.702]
select surf_pocket2, protein and id [3931,475,476,534,535,478,479,3933,3935,3941,3944,3948,1567,1569,1570,912,1039,624,1044,640,1038,1497,1094,1496,1084,1061,1065,1070,1083,1060,3913,3929,3930] 
set surface_color,  pcol2, surf_pocket2 
set_color pcol3 = [0.533,0.361,0.902]
select surf_pocket3, protein and id [1284,1285,1288,2548,2518,2519,2520,2526,2532,2512,2516,1250,1290,1294,1296,1538,1253,1254,2499,2546,2547,2482,2484,884,886,887,258,2538,877,880,1344,1316,1318,2536,2521,894,896,897] 
set surface_color,  pcol3, surf_pocket3 
set_color pcol4 = [0.565,0.278,0.702]
select surf_pocket4, protein and id [1454,1473,1752,1754,1472,1463,2002,3502,1110,1112,3501,3522,3503,3537,1741,1455,1456,1725,1727,3973,3953,3962,1734,1723,3525,3524,3523] 
set surface_color,  pcol4, surf_pocket4 
set_color pcol5 = [0.902,0.361,0.878]
select surf_pocket5, protein and id [2683,2687,2724,2722,2713,2716,2231,2233,2689,2266,2267,2268,2269,2271,2273,2270,2274,2264,2297] 
set surface_color,  pcol5, surf_pocket5 
set_color pcol6 = [0.702,0.278,0.533]
select surf_pocket6, protein and id [764,766,767,768,769,770,1599,1591,1697,1699,1700,1705,1715,1717,1431,3635,3636,3638,3640,3634] 
set surface_color,  pcol6, surf_pocket6 
set_color pcol7 = [0.902,0.361,0.490]
select surf_pocket7, protein and id [646,648,527,528,389,391,444,446,447,384,999,1001,442,443,445,379,383,1015,1016] 
set surface_color,  pcol7, surf_pocket7 
set_color pcol8 = [0.702,0.329,0.278]
select surf_pocket8, protein and id [2227,2249,1984,2171,2172,2173,2201,2181,2225,2228,2255,2256,2152,2154,1947,1949] 
set surface_color,  pcol8, surf_pocket8 
set_color pcol9 = [0.902,0.620,0.361]
select surf_pocket9, protein and id [1439,1455,1456,3973,3953,3971,3972,3960,3966,1481,3951,1576,3947,3949,3969,1480,1574,1575,1598,1597,1468] 
set surface_color,  pcol9, surf_pocket9 
set_color pcol10 = [0.702,0.631,0.278]
select surf_pocket10, protein and id [1850,1851,1853,2356,2358,2360,2362,1362,1366,1337,1340,1852,1855,1884,1631,1363,1396,1633,1843] 
set surface_color,  pcol10, surf_pocket10 
   

deselect

orient
