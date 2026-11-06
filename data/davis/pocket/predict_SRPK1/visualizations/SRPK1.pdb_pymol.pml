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

load "data/SRPK1.pdb", protein
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

load "data/SRPK1.pdb_points.pdb.gz", points
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
select surf_pocket1, protein and id [758,761,694,697,700,760,693,695,707,1354,1783,3933,3935,888,889,890,3929,3931,1378,1784,1361,747,1333,1330,1177,1178,1328,3926,1326,1356,872,1338,1350,1353,1355,1332,3936,1007,3928] 
set surface_color,  pcol1, surf_pocket1 
set_color pcol2 = [0.302,0.278,0.702]
select surf_pocket2, protein and id [678,681,1840,1880,1881,1900,686,694,695,698,1354,422,423,424,3587,2011,1995,1997,1935,1934,1990,1992,1841,1843,3584,3765,3766,1359,1360,1361,1369,1370,1371,3583,3585,1348] 
set surface_color,  pcol2, surf_pocket2 
set_color pcol3 = [0.631,0.361,0.902]
select surf_pocket3, protein and id [3456,3459,3463,3465,3508,3445,3451,4094,4093,1436,1759,4105,1758,1760,4095,1397,1396,78,4330,4337,4344,4346,4348,4375,4335,4376,1466,4328,1465,1467,1468,1469,1471,1463,115,116,119,4345] 
set surface_color,  pcol3, surf_pocket3 
set_color pcol4 = [0.678,0.278,0.702]
select surf_pocket4, protein and id [738,740,3945,3946,977,3947,3955,3935,3934,889,890,734,903,747,904,945,948,975,947,1008] 
set surface_color,  pcol4, surf_pocket4 
set_color pcol5 = [0.902,0.361,0.682]
select surf_pocket5, protein and id [700,695,707,412,414,422,423,424,1363,1369,1370,1404,1756,1378,1381,1784,416] 
set surface_color,  pcol5, surf_pocket5 
set_color pcol6 = [0.702,0.278,0.341]
select surf_pocket6, protein and id [1255,546,547,608,1252,610,589,590,591,2857,2860,552,2858,1248,596,606,1243,1246] 
set surface_color,  pcol6, surf_pocket6 
set_color pcol7 = [0.902,0.522,0.361]
select surf_pocket7, protein and id [63,64,43,4527,4810,56,4503,4507,65,4539,4811,4536,4504,4353] 
set surface_color,  pcol7, surf_pocket7 
set_color pcol8 = [0.702,0.596,0.278]
select surf_pocket8, protein and id [1403,1415,1419,3794,3594,3596,3562,3588,1445,3583,1414,1416,1420,1443] 
set surface_color,  pcol8, surf_pocket8 
   

deselect

orient
