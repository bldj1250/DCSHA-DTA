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

load "data/ABL1(F317L).pdb", protein
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

load "data/ABL1(F317L).pdb_points.pdb.gz", points
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
select surf_pocket1, protein and id [2447,2448,2449,2575,3333,3334,3336,3338,3339,3340,3331,2321,2324,2444,2308,2600,2601,3230,3238,3244,2860,2276,2278,2280,2281,2273,2829,2323,2675,3257,2805,2432,2433,2441,2826,2804,2787,3258,2853,2854,2267,2268,2270,2271,2266,2830,2824] 
set surface_color,  pcol1, surf_pocket1 
set_color pcol2 = [0.278,0.298,0.702]
select surf_pocket2, protein and id [3012,3769,3771,2987,2980,2982,2947,3008,3014,3009,2990,4327,4329,4331,4357,4356,4391,3713,3749,3751,3752,3991,4036,4001,4012,3999,4000,3998,3746,3716,3045,3010,3020,4252,3015,3017] 
set surface_color,  pcol2, surf_pocket2 
set_color pcol3 = [0.533,0.361,0.902]
select surf_pocket3, protein and id [3055,3026,3050,3029,3031,3033,3059,3052,3054,1405,1403,1332,1318,1341,1342,1345,1515,4262,1321,1368,1367,1347,1370,1404,3283,2042,2039,2041,2660,3062,3303,2661,2650,2652,3049,3080,3082,4228,4229] 
set surface_color,  pcol3, surf_pocket3 
set_color pcol4 = [0.565,0.278,0.702]
select surf_pocket4, protein and id [856,2050,2052,869,871,861,867,2089,2070,2071,2072,2073,1077,2047,1202,2057,2410,2414,2393,2392,874,875,2701,2095,886,888,2413,2809] 
set surface_color,  pcol4, surf_pocket4 
set_color pcol5 = [0.902,0.361,0.878]
select surf_pocket5, protein and id [2078,2606,2635,1042,1043,2125,2127,2129,1050,2634,2636,2101,1032,1047,2114,2119,2130,2131,2136,2138,2087,2154,2155,2156,2157,2159,2160,2142,2612,2618,2619] 
set surface_color,  pcol5, surf_pocket5 
set_color pcol6 = [0.702,0.278,0.533]
select surf_pocket6, protein and id [2814,3320,2065,2067,2066,2048,2057,2061,3267,2840,3270,3275,3276,3277,3304,2042,2039,2041,2832,2807,2809,2815,2819,2419,2413,2839] 
set surface_color,  pcol6, surf_pocket6 
set_color pcol7 = [0.902,0.361,0.490]
select surf_pocket7, protein and id [4294,4295,1351,1353,1354,1358,1656,1657,1492,1507,1520,1522,1508,1565,1676,1658,1516,4296,4297] 
set surface_color,  pcol7, surf_pocket7 
set_color pcol8 = [0.702,0.329,0.278]
select surf_pocket8, protein and id [753,743,754,1833,1844,724,730,719,1836,1253,1829,1831,1832,1281,1236,1244,1270,1271] 
set surface_color,  pcol8, surf_pocket8 
set_color pcol9 = [0.902,0.620,0.361]
select surf_pocket9, protein and id [3434,3445,3447,3453,3363,2538,3377,3380,2291,3475,3486,3488,3469,3362,3192,3199,3193] 
set surface_color,  pcol9, surf_pocket9 
set_color pcol10 = [0.702,0.631,0.278]
select surf_pocket10, protein and id [2369,2400,2094,2096,2100,2212,890,2386,2388,2151,2165,2171,2173,2698,2142,2102,2144,2141,2177] 
set surface_color,  pcol10, surf_pocket10 
   

deselect

orient
