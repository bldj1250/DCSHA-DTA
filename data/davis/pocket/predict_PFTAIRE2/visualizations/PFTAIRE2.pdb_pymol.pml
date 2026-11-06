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

load "data/PFTAIRE2.pdb", protein
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

load "data/PFTAIRE2.pdb_points.pdb.gz", points
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
select surf_pocket1, protein and id [1375,1376,1377,1378,1379,1380,1241,1243,1902,1385,1402,1827,1828,1424,1421,1422,1427,1434,1405,1909,1911,1800,1015,1018,1904,1905,1910,904,903,852,546,849,1406,1414,1420,1412,1002,845,851,846,850,847] 
set surface_color,  pcol1, surf_pocket1 
set_color pcol2 = [0.302,0.278,0.702]
select surf_pocket2, protein and id [1018,1019,1020,1035,1904,1905,1906,1910,1916,1924,1935,1938,1939,1912,1174,1175,1362,1360,1121,1143,1144,1150,1145,1909,1771,1907,1908,1911,1378,1379,1380,1241,1242,1921,1895,1172,1977,1983,1987,1989,1978,1927,1149,877,889,865] 
set surface_color,  pcol2, surf_pocket2 
set_color pcol3 = [0.631,0.361,0.902]
select surf_pocket3, protein and id [1387,1388,1389,1890,1889,1394,1221,1220,3185,1218,1252,3171,1873,1871,1872,3188,1840] 
set surface_color,  pcol3, surf_pocket3 
set_color pcol4 = [0.678,0.278,0.702]
select surf_pocket4, protein and id [792,793,775,776,815,816,1310,1027,1350,1351,1294,1026,1336] 
set surface_color,  pcol4, surf_pocket4 
set_color pcol5 = [0.902,0.361,0.682]
select surf_pocket5, protein and id [2929,2554,2518,2520,2551,2552,2553,2512,2514,2501,2926,2502,2509,2925,2965,2912,2922,2505] 
set surface_color,  pcol5, surf_pocket5 
set_color pcol6 = [0.702,0.278,0.341]
select surf_pocket6, protein and id [2954,2957,2565,2938,2939,2573,2943,2128,2157,2124,2567,2945,2609,2579,2596,2169,2172,2174,2170,2192,2952] 
set surface_color,  pcol6, surf_pocket6 
set_color pcol7 = [0.902,0.522,0.361]
select surf_pocket7, protein and id [760,762,1264,1269,1266,1268,943,800,797,941,969] 
set surface_color,  pcol7, surf_pocket7 
set_color pcol8 = [0.702,0.596,0.278]
select surf_pocket8, protein and id [1446,1803,2083,2299,2347,2340,2341,2348,1444,1447,1471,1476,1477,1478,1480,2332] 
set surface_color,  pcol8, surf_pocket8 
   

deselect

orient
