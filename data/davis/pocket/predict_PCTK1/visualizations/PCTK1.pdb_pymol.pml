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

load "data/PCTK1.pdb", protein
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

load "data/PCTK1.pdb_points.pdb.gz", points
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
select surf_pocket1, protein and id [1968,2047,1135,980,1539,1546,1033,1035,1941,1969,977,981,1574,976,978,983,1287,1519,1520,1151,1152,1153,2049,2050,2052,2054,2055,2057,1036,2056,982,2064,1552,1558,1559,1554,1567,1600,1599,1389,1515,1518,1513,1517,1316] 
set surface_color,  pcol1, surf_pocket1 
set_color pcol2 = [0.329,0.278,0.702]
select surf_pocket2, protein and id [581,585,3303,2017,3316,1529,1984,1524,1534,1366,1365,2034,2035,2018,1396,1363] 
set surface_color,  pcol2, surf_pocket2 
set_color pcol3 = [0.698,0.361,0.902]
select surf_pocket3, protein and id [2161,2163,2334,2337,2079,2162,2165,2157,2159,2160,2179,2366,2283,1898,2249,2250,2251,2254,2201,1899,1900,1897,2154,2149,2135] 
set surface_color,  pcol3, surf_pocket3 
set_color pcol4 = [0.702,0.278,0.639]
select surf_pocket4, protein and id [1115,1076,1089,1099,1100,1112,880,882,1092,593,1408,1411,931,928] 
set surface_color,  pcol4, surf_pocket4 
set_color pcol5 = [0.902,0.361,0.545]
select surf_pocket5, protein and id [3153,3154,3129,1789,1791,1850,3130,3131,1756,1758,3264,3297,3258,3259,3261,3280,3253,3260] 
set surface_color,  pcol5, surf_pocket5 
set_color pcol6 = [0.702,0.353,0.278]
select surf_pocket6, protein and id [2713,2715,3070,2727,2735,2726,2721,2305,2306,2308,2310,2272,2273,2297,2756] 
set surface_color,  pcol6, surf_pocket6 
set_color pcol7 = [0.902,0.729,0.361]
select surf_pocket7, protein and id [1324,1325,1326,819,805,818,548,555,556,1409,874,875,878,840,843,876,1416,1421,1423,1427,883,884,1430] 
set surface_color,  pcol7, surf_pocket7 
   

deselect

orient
