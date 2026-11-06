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

load "data/TIE2.pdb", protein
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

load "data/TIE2.pdb_points.pdb.gz", points
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
select surf_pocket1, protein and id [2092,2095,2103,2105,2106,2108,2113,373,3182,3188,3189,3191,3210,2176,2177,3546,3549,2169,3284,3266,3209,2071,2065,2067,2068,391,3267,387,392,393,395,2282,2273,2277,2278,2279,2128,2126,385,386,2120,2433,2116,2123,2121,2122,2431,390,3535,3580,3581,3264] 
set surface_color,  pcol1, surf_pocket1 
set_color pcol2 = [0.278,0.333,0.702]
select surf_pocket2, protein and id [6782,6913,6914,6744,6740,6763,6741,7316,7320,7299,6897,7294,6781,7339,7348,7319,7837,7838,7911,7913,7914,7916,7057,7816,7345,7808,7822,6915,6759,7918,7919,7920,6722,6726,6723,6728,6779,6765,6766,6733,6735] 
set surface_color,  pcol2, surf_pocket2 
set_color pcol3 = [0.443,0.361,0.902]
select surf_pocket3, protein and id [821,892,545,548,890,447,448,2392,2393,2395,2336,820,835,843,531,533,460,462,906,905,519] 
set surface_color,  pcol3, surf_pocket3 
set_color pcol4 = [0.463,0.278,0.702]
select surf_pocket4, protein and id [7917,7936,6761,7920,7785,7811,7814,7941,7943,6762,8049,9078,7822,6750,8065,8068,8059,7942] 
set surface_color,  pcol4, surf_pocket4 
set_color pcol5 = [0.741,0.361,0.902]
select surf_pocket5, protein and id [7364,7365,7403,8356,8360,8361,7810,9048,9050,9051,9073,9039,9045,7811,7814,8368,8102,8103,8354] 
set surface_color,  pcol5, surf_pocket5 
set_color pcol6 = [0.694,0.278,0.702]
select surf_pocket6, protein and id [2040,2041,2655,2475,2640,2653,2459,1270,2454,2461,2470,1264,1255,1257,1253,1267,2631,1268,2055] 
set surface_color,  pcol6, surf_pocket6 
set_color pcol7 = [0.902,0.361,0.757]
select surf_pocket7, protein and id [1785,1788,1742,1745,726,729,719,1481,1483,1456,1457,1459,1462,1458,1775,1782,1454] 
set surface_color,  pcol7, surf_pocket7 
set_color pcol8 = [0.702,0.278,0.475]
select surf_pocket8, protein and id [1235,1237,1240,1241,1233,2654,2655,2473,2638,2639,2640,2636,2470,1244,2528,2531,2401,2402,2483,2526,2523,2524,2525] 
set surface_color,  pcol8, surf_pocket8 
set_color pcol9 = [0.902,0.361,0.459]
select surf_pocket9, protein and id [2839,2842,2798,2793,2783,2833,2820,2831,2796,2797,2215,2770,2786,2792] 
set surface_color,  pcol9, surf_pocket9 
set_color pcol10 = [0.702,0.318,0.278]
select surf_pocket10, protein and id [3596,3522,3592,3595,3597,3224,3520,3523,575,577,581,2304,409,572,395,397,398,400,401] 
set surface_color,  pcol10, surf_pocket10 
set_color pcol11 = [0.902,0.561,0.361]
select surf_pocket11, protein and id [2059,1877,2050,2054,2055,2056,2048,1284,1285,1913,1920] 
set surface_color,  pcol11, surf_pocket11 
set_color pcol12 = [0.702,0.553,0.278]
select surf_pocket12, protein and id [8307,9011,9013,8384,8381,8385,8369,8359,8522,9015] 
set surface_color,  pcol12, surf_pocket12 
set_color pcol13 = [0.902,0.859,0.361]
select surf_pocket13, protein and id [696,703,1699,705,1478,1700,1702,1127,1130,1126,1844,1847,680,681,702] 
set surface_color,  pcol13, surf_pocket13 
   

deselect

orient
