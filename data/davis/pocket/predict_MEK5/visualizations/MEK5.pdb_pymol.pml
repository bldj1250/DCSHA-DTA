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

load "data/MEK5.pdb", protein
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

load "data/MEK5.pdb_points.pdb.gz", points
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
select surf_pocket1, protein and id [1509,1512,2355,2361,1344,1349,1350,1393,1395,1396,1343,1345,1873,2388,2390,1684,1683,1886,1887,1347,1497,1348,2277,2278,1932,1928,1929,1892,1908,1912,1906,2354,1758,2352,2371,2373,1514,2360,2362,2262,1935,1937,2252,2253,1959,1363,1353,1355,1351,1357,1364] 
set surface_color,  pcol1, surf_pocket1 
set_color pcol2 = [0.329,0.278,0.702]
select surf_pocket2, protein and id [2225,1514,2358,2360,2362,2396,2397,2262,2252,2253,2254,2392,2240,2241,2494,1396,2429,1371,2420,2418,1370,1364,1367] 
set surface_color,  pcol2, surf_pocket2 
set_color pcol3 = [0.698,0.361,0.902]
select surf_pocket3, protein and id [1740,1743,2080,1730,2325,2315,2317,3350,2319,2321,3352,2323,1129,1729,2104,3337,3338,3339,3340,2073,2050,2049,3314,2075] 
set surface_color,  pcol3, surf_pocket3 
set_color pcol4 = [0.702,0.278,0.639]
select surf_pocket4, protein and id [1168,1171,1173,1475,1476,1477,1783,1786,1152,1167,1174,1482,1153,1148,1149,1151,1172,2311,1893,1895,1901,2323,2324] 
set surface_color,  pcol4, surf_pocket4 
set_color pcol5 = [0.902,0.361,0.545]
select surf_pocket5, protein and id [2210,2211,2213,2556,2559,2428,2607,2491,2223,2224,2493,2221,2502,2526,2472,2474,2476,2425,2427] 
set surface_color,  pcol5, surf_pocket5 
set_color pcol6 = [0.702,0.353,0.278]
select surf_pocket6, protein and id [1405,1521,1306,1308,1309,1310,1311,1312,1314,1265,1849,1852,1406,1408,1520] 
set surface_color,  pcol6, surf_pocket6 
set_color pcol7 = [0.902,0.729,0.361]
select surf_pocket7, protein and id [809,660,663,490,800,804,811,815,697,699,700,671,673,733,790,791,732] 
set surface_color,  pcol7, surf_pocket7 
   

deselect

orient
