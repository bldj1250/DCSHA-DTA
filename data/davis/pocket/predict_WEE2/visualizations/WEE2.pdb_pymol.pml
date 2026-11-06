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

load "data/WEE2.pdb", protein
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

load "data/WEE2.pdb_points.pdb.gz", points
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
select surf_pocket1, protein and id [1757,1874,1704,1754,1756,2294,2691,2324,2316,2319,2301,2315,2980,2981,2983,2985,2987,2718,2719,2700,2132,2715,2717,2280,2297,2300,2023,1877,1878,2271,2274,1860,1861,1862,1706,1702,1700,1701,1703,1743,1711,1713,2345,1716,1717] 
set surface_color,  pcol1, surf_pocket1 
set_color pcol2 = [0.329,0.278,0.702]
select surf_pocket2, protein and id [2144,752,755,756,760,2945,758,2898,2749,2750,2751,2752,2946,2104,2106,2967,2140,2091,2092,2108,2903,2901,2912,2089,783,764,744,745,735,737,738,740,739,2747,2309,2736,2738,2745,2308,747,2284,2289,2731,2733,2310,746] 
set surface_color,  pcol2, surf_pocket2 
set_color pcol3 = [0.698,0.361,0.902]
select surf_pocket3, protein and id [2551,2550,2902,2897,2900,2894,2895,2862,2871,2886,2883,2887,2888,2893,3805,3808,2520,3803,3821,3794,3799,2108,2109,2102,2526,2527,2495,2528,2489,2490,2492,2890,2922,2892,2116,2118,2119] 
set surface_color,  pcol3, surf_pocket3 
set_color pcol4 = [0.702,0.278,0.639]
select surf_pocket4, protein and id [2348,2350,2314,2743,2437,2435,2937,2958,2470,2938,2727,2742,2374,2382] 
set surface_color,  pcol4, surf_pocket4 
set_color pcol5 = [0.902,0.361,0.545]
select surf_pocket5, protein and id [2199,2184,1597,1600,1604,1305,1599,1601,1642,1266,1267,1269,1264,1306,1582,2207,1234,1235,1191,1196,1200] 
set surface_color,  pcol5, surf_pocket5 
set_color pcol6 = [0.702,0.353,0.278]
select surf_pocket6, protein and id [2163,2161,2160,1209,1221,1222,1242,2172,2174,2266,2267,1800,1801,1641,1642,1643,1819,1604] 
set surface_color,  pcol6, surf_pocket6 
set_color pcol7 = [0.902,0.729,0.361]
select surf_pocket7, protein and id [2038,3014,3021,3063,3065,3066,2012,3016,3022,3067,3068,2041,2040,2043,3025,3048,2037,2035,2039] 
set surface_color,  pcol7, surf_pocket7 
   

deselect

orient
