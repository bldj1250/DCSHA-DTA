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

load "data/ABL2.pdb", protein
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

load "data/ABL2.pdb_points.pdb.gz", points
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
select surf_pocket1, protein and id [2180,3232,2172,2220,2223,2173,2179,3123,3137,3151,3223,2344,3225,2472,3240,2341,2497,2498,2683,2345,2346,3230,3226,3228,3233,3150,2720,2329,2572,2697,2698,2222,2338,2166,2169,2748,2724] 
set surface_color,  pcol1, surf_pocket1 
set_color pcol2 = [0.278,0.278,0.702]
select surf_pocket2, protein and id [2922,2924,2926,1257,1278,4139,1252,1255,3195,3196,2558,2952,2955,2547,2549,1246,1242,1313,1311,1312,1231,1251,1940,1942,1941,1943,1923,1924,1931,1937,1919,2948,2973,2975,4105,4106,2945,4137] 
set surface_color,  pcol2, surf_pocket2 
set_color pcol3 = [0.576,0.361,0.902]
select surf_pocket3, protein and id [777,2289,2292,783,794,796,2290,1951,1109,1112,775,1953,778,984,1995,779,782,769,2598,1996,1994,1968,1971,1972,1974,2597,2310,2311,1990,1992,1973,2702] 
set surface_color,  pcol3, surf_pocket3 
set_color pcol4 = [0.616,0.278,0.702]
select surf_pocket4, protein and id [3884,2883,3895,4235,3882,4234,3881,3883,4265,3874,3880,3639,3641,3642,2905,3659,3661,2901,2938,3606,3636,2902,3917,2884,2907,2908,2910,4204,2874,2876,2880,2878,2841,3886] 
set surface_color,  pcol4, surf_pocket4 
set_color pcol5 = [0.902,0.361,0.792]
select surf_pocket5, protein and id [2532,957,2533,2503,2054,2058,2055,2059,2035,2039,2037,954,2026,2027,2029,940,2020,2015,1979,1988,1998,2002,2041,971,2515,2516] 
set surface_color,  pcol5, surf_pocket5 
set_color pcol6 = [0.702,0.278,0.447]
select surf_pocket6, protein and id [2712,2316,2597,2310,2311,1967,1949,1958,1962,2598,2726,2707,2700,2702,2708,3193,3195,3196,3211,3212,1966,3163,2734,3160] 
set surface_color,  pcol6, surf_pocket6 
set_color pcol7 = [0.902,0.361,0.361]
select surf_pocket7, protein and id [1261,1263,1264,1404,1570,1428,4171,1268,1566,1419,1432,1434,1591,1420,1474,1585,1590,1565,1567,1573,1575,4174,4175,4172,4173] 
set surface_color,  pcol7, surf_pocket7 
set_color pcol8 = [0.702,0.447,0.278]
select surf_pocket8, protein and id [746,757,759,1925,1927,1928,1929,1930,1959,1097,1167,1169,1228,1941] 
set surface_color,  pcol8, surf_pocket8 
set_color pcol9 = [0.902,0.792,0.361]
select surf_pocket9, protein and id [1191,1146,1154,1143,1180,1181,1751,1736,1738,1739,656,657,658,635,655,1149,1163,1743,1740] 
set surface_color,  pcol9, surf_pocket9 
   

deselect

orient
