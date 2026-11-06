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

load "data/CAMKK1.pdb", protein
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

load "data/CAMKK1.pdb_points.pdb.gz", points
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
select surf_pocket1, protein and id [1186,1187,1188,1521,2197,1057,2198,1818,2277,2268,2270,2271,2182,2273,2275,1035,2276,2173,1019,134,1007,1010,1012,1014,146,147,1020,1040,1042,1043,128,127,129,1056,1170,1003,1005,1793,1789,1002,152,2278,1769,1771,1765,1767,1768,1770,1772,1623,1777] 
set surface_color,  pcol1, surf_pocket1 
set_color pcol2 = [0.329,0.278,0.702]
select surf_pocket2, protein and id [102,2426,2418,101,111,112,113,100,1858,2700,1852,1855,1856,1857,1859,1865,2427,2430,2782,2712,2698,2731,2720,2724,2725,2726,1851,2441,2442,2168,2159,2174,2169] 
set surface_color,  pcol2, surf_pocket2 
set_color pcol3 = [0.698,0.361,0.902]
select surf_pocket3, protein and id [3240,3249,3232,3236,2024,3291,697,3248,1959,2001,1960,1987,1957,1990,1963,705,706,1602,713,717,702,704,712,2236,2238,2239,2240] 
set surface_color,  pcol3, surf_pocket3 
set_color pcol4 = [0.702,0.278,0.639]
select surf_pocket4, protein and id [1035,1037,2276,2289,2290,2293,2277,2274,2182,2275,2299,2409,2410,2411,2412,2161,2144,2419,2298,128,1023,1026,127,129,102,104] 
set surface_color,  pcol4, surf_pocket4 
set_color pcol5 = [0.902,0.361,0.545]
select surf_pocket5, protein and id [2292,1035,1037,2276,2289,2290,2293,2277,2274,2275,1187,1188,1492,1522,2298,1023,1026] 
set surface_color,  pcol5, surf_pocket5 
set_color pcol6 = [0.702,0.353,0.278]
select surf_pocket6, protein and id [1694,1213,1216,1218,1706,3452,3454,3456,3458,1252,1251,1465,3430,3431,3432] 
set surface_color,  pcol6, surf_pocket6 
set_color pcol7 = [0.902,0.729,0.361]
select surf_pocket7, protein and id [1050,1064,1068,909,910,861,1725,1743,1746,972,1194,1195] 
set surface_color,  pcol7, surf_pocket7 
   

deselect

orient
