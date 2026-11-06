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

load "data/SRPK2.pdb", protein
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

load "data/SRPK2.pdb_points.pdb.gz", points
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
select surf_pocket1, protein and id [1738,4157,4161,866,4159,4160,4171,4154,4155,4180,4152,1147,1148,865,983,984,1304,1302,1727,1725,1726,1697,1713,1714,4301,1695,1696,4295,674,1754,679,681,1332,1753,732,735,864,671,734,861,1301,1303,721,848,1297,1299,1321,1325,1309,1327,1349,668,3377,712,4181,710,711,713,714,715,3381,3376,3379,3382,3384,926,951,953,954,924,921,3391,3392,3394,3396,4288,4290,4296,691,692,695,698,708,879] 
set surface_color,  pcol1, surf_pocket1 
set_color pcol2 = [0.278,0.278,0.702]
select surf_pocket2, protein and id [669,1958,1968,1956,1805,1806,1808,3989,1843,1845,1951,1898,1899,1864,1953,672,1844,655,1972,652,660,1842,375,401,1377,1341,1342,4018,3991,3994,358,3981,400,1340,1333,1332,1330,1331,1325] 
set surface_color,  pcol2, surf_pocket2 
set_color pcol3 = [0.576,0.361,0.902]
select surf_pocket3, protein and id [674,1754,677,681,1332,1368,391,392,393,1375,1351,1340,1349,1352,1334,1727,1725,1726,669,400,390,1377,3402,692,3410,414,419,683,685,687,689] 
set surface_color,  pcol3, surf_pocket3 
set_color pcol4 = [0.616,0.278,0.702]
select surf_pocket4, protein and id [5093,5054,4516,4518,4564,4576,5125,5127,5094,5045,5044,5050,5029,4578,4725,4759,4762,4750,4756,4591,4724,4726,4755] 
set surface_color,  pcol4, surf_pocket4 
set_color pcol5 = [0.902,0.361,0.792]
select surf_pocket5, protein and id [3451,3405,3407,3409,3411,3406,3450,4598,4319,4320,4321,4526,4560,4568,4569,4571,4551,1729,1439,1442,1437,1367,1368] 
set surface_color,  pcol5, surf_pocket5 
set_color pcol6 = [0.702,0.278,0.447]
select surf_pocket6, protein and id [1728,1730,4331,1729,4526,4568,4571,1367,1368,1439,4319,4320,4321,4300,3409,3411,3406] 
set surface_color,  pcol6, surf_pocket6 
set_color pcol7 = [0.902,0.361,0.361]
select surf_pocket7, protein and id [375,1376,1342,3995,4018,3994,4015,358,364,1414,1416,1339,1391,1386,1387,1390,1373,1374] 
set surface_color,  pcol7, surf_pocket7 
set_color pcol8 = [0.702,0.447,0.278]
select surf_pocket8, protein and id [4591,4594,4595,4729,4724,4726,4727,4728,4730,4755,4725,4759,4762,5045,5044,5050,5029,4750,4564,4576] 
set surface_color,  pcol8, surf_pocket8 
set_color pcol9 = [0.902,0.792,0.361]
select surf_pocket9, protein and id [4434,1624,4428,5355,5358,1595,5357,1620,1619,1621,1627,1628,1630,5340,5353] 
set surface_color,  pcol9, surf_pocket9 
   

deselect

orient
