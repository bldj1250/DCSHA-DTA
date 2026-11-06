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

load "data/TXK.pdb", protein
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

load "data/TXK.pdb_points.pdb.gz", points
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
select surf_pocket1, protein and id [2666,3240,3241,2280,2432,2799,2329,2331,2332,2818,2819,2824,2566,2445,3317,3318,3319,2291,2448,2449,2450,2307,2311,2849,92,2852,2846,93,2832,2292,3213,108,110,122,2276,2278,2318,2275,2277,2282,2595,2596,2784,2798,3309,3311,3312,3313,3315,3227,3212,3215] 
set surface_color,  pcol1, surf_pocket1 
set_color pcol2 = [0.278,0.278,0.702]
select surf_pocket2, protein and id [2694,2696,2803,2411,2417,776,2410,2082,2085,2413,2808,2836,2813,2076,2078,2834,2835,2809,2416,2421,3296,3297,2077,2083,3252,1117,2091,2095,2097] 
set surface_color,  pcol2, surf_pocket2 
set_color pcol3 = [0.576,0.361,0.902]
select surf_pocket3, protein and id [2652,1257,1285,1287,1260,2054,1289,1355,2641,3068,2643,2651,1322,1323,1324,1319,1321,1354,3264,3267,3279,3281,2065,2066,1356,2642,2068,2070,2067,3265,1276,1278,1282,3067] 
set surface_color,  pcol3, surf_pocket3 
set_color pcol4 = [0.616,0.278,0.702]
select surf_pocket4, protein and id [2652,1255,1257,1285,1245,1254,1260,2053,2054,1289,2641,2070,2072,2077,3281,1266,1269,1276,1282,718,729,731,1102,719,2090,2092,2093,2087,1194,1193] 
set surface_color,  pcol4, surf_pocket4 
set_color pcol5 = [0.902,0.361,0.792]
select surf_pocket5, protein and id [1344,1345,1346,1347,1348,3272,3263,3265,3270,3271,3273,2989,2991,2992,2987,1317,1321,3015,1342] 
set surface_color,  pcol5, surf_pocket5 
set_color pcol6 = [0.702,0.278,0.447]
select surf_pocket6, protein and id [3520,3215,3216,3219,3521,3794,3485,3487,118,120,122,123,129,132,133,2870,115] 
set surface_color,  pcol6, surf_pocket6 
set_color pcol7 = [0.902,0.361,0.361]
select surf_pocket7, protein and id [3336,3338,3340,3333,3334,3360,3341,3342,3468,2529,2498,2312,2314,3317,3318,3319,2313,2526,2528] 
set surface_color,  pcol7, surf_pocket7 
set_color pcol8 = [0.702,0.447,0.278]
select surf_pocket8, protein and id [2578,2603,2181,2721,2580,2548,2165,2720,2539,2543,2547,2707,2684,2706] 
set surface_color,  pcol8, surf_pocket8 
set_color pcol9 = [0.902,0.792,0.361]
select surf_pocket9, protein and id [4105,4107,4102,4104,3671,3812,3700,3953] 
set surface_color,  pcol9, surf_pocket9 
   

deselect

orient
