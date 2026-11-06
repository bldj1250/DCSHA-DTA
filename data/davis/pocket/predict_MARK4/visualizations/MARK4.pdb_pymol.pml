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

load "data/MARK4.pdb", protein
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

load "data/MARK4.pdb_points.pdb.gz", points
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
select surf_pocket1, protein and id [489,1100,492,541,543,544,1485,1486,1056,1558,1556,914,527,661,662,663,811,1050,1051,845,1457,1458,1470,1565,1566,1567,1561,1563,1560,483,484,485,487,1070,1077,1073,645,5624,5634,5632,5641,5635,5640,5625,1098,1090,1091,5656,496,494,501,502,5645,528,5643] 
set surface_color,  pcol1, surf_pocket1 
set_color pcol2 = [0.278,0.278,0.702]
select surf_pocket2, protein and id [1735,1118,1119,1949,1985,1987,1988,5667,1724,1461,1725,1974,1975,1982,1976,1977,1148,1142,1143,1144,5703,5699,1146,4382,4383,4379,4370,2013,2014,2015,4384,5664,5660,5669,5672,4398,4401,4385,5675] 
set surface_color,  pcol2, surf_pocket2 
set_color pcol3 = [0.576,0.361,0.902]
select surf_pocket3, protein and id [1565,1566,1567,1580,1581,1591,1592,1593,812,1582,1563,771,775,777,746,768,774,1448,1470,527,662,663,678,679,780,544,773,501,502,520,522,516,720,747,745,4403,4422,4425,4426,4413] 
set surface_color,  pcol3, surf_pocket3 
set_color pcol4 = [0.616,0.278,0.702]
select surf_pocket4, protein and id [2043,2045,2078,2079,3789,3766,3793,3788,3799,3801,1717,4415,3769,4430,1695,1693,1773,1778,1780,1694,1768] 
set surface_color,  pcol4, surf_pocket4 
set_color pcol5 = [0.902,0.361,0.792]
select surf_pocket5, protein and id [772,773,1423,1683,1587,1699,1589,1591,771,770,803,4425,4428,3762] 
set surface_color,  pcol5, surf_pocket5 
set_color pcol6 = [0.702,0.278,0.447]
select surf_pocket6, protein and id [2968,2937,2939,2940,2944,1065,1498,1502,1546,1059,1057,1516] 
set surface_color,  pcol6, surf_pocket6 
set_color pcol7 = [0.902,0.361,0.361]
select surf_pocket7, protein and id [1844,1852,1642,2373,2375,1359,2391,1354,1355,1356,1841,1843,1362,1367,1627,1626,2377,2390] 
set surface_color,  pcol7, surf_pocket7 
set_color pcol8 = [0.702,0.447,0.278]
select surf_pocket8, protein and id [5473,5474,479,5314,5381,5311,499,500,5471,5395,465,473,5493,5331,476,477,5333] 
set surface_color,  pcol8, surf_pocket8 
set_color pcol9 = [0.902,0.792,0.361]
select surf_pocket9, protein and id [2606,2623,2625,2826,2828,851,2850,2848,2605,2604,2912,2913,2880] 
set surface_color,  pcol9, surf_pocket9 
   

deselect

orient
