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

load "data/PCTK2.pdb", protein
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

load "data/PCTK2.pdb_points.pdb.gz", points
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
select surf_pocket1, protein and id [2629,2630,2632,2633,2637,1969,2627,2634,2635,1899,1900,2096,2097,2098,2099,2100,2101,1971,2094,1613,1615,1718,2644,2648,1866,1871,2649,2650,2657,1734,2082,1735,1736,1753,1731,1616,1601,1602,2112,2118,2123,1878,2494,2658,2511,2636,1576,4181,4184,4185,4186,4187,4188,2535,2550,2141,2155,2523,2551,2140,1563,1566,1568,1570,1575,1557,1558,1560,2120,2127,2139,1561,2133,2135,1842,4189,4180,2772,2781] 
set surface_color,  pcol1, surf_pocket1 
set_color pcol2 = [0.278,0.278,0.702]
select surf_pocket2, protein and id [1174,1461,1682,1698,1681,1656,1658,1674,1995,1996,1991,1993,1168,2005,1507,1510,1498,1452,1450,1713,1997,1994,1695] 
set surface_color,  pcol2, surf_pocket2 
set_color pcol3 = [0.576,0.361,0.902]
select surf_pocket3, protein and id [2189,2191,3975,2193,4001,2146,2147,2569,2572,2573,3980,3986,3994,3990,4018,4019,4021,4020,4022,4023] 
set surface_color,  pcol3, surf_pocket3 
set_color pcol4 = [0.616,0.278,0.702]
select surf_pocket4, protein and id [2566,1946,1948,3885,2598,1979,2108,2110,2128,2615,2105,2115,1166,1996,1168,2563,2138] 
set surface_color,  pcol4, surf_pocket4 
set_color pcol5 = [0.902,0.361,0.792]
select surf_pocket5, protein and id [2826,2815,2945,2944,2824,2828,2840,2480,2738,2739,2740,2741,2742,2744,2736,2830,2833,2912,2915,2861] 
set surface_color,  pcol5, surf_pocket5 
set_color pcol6 = [0.702,0.278,0.447]
select surf_pocket6, protein and id [3861,3736,3737,3714,3745,3873,2369,2371,1944,2368,2390,2430,3712,3713,3838,3843,3846,3849,3877] 
set surface_color,  pcol6, surf_pocket6 
set_color pcol7 = [0.902,0.361,0.361]
select surf_pocket7, protein and id [1845,1850,2067,2068,2024,1875,1877,2012,1817,1849,1851,2026,2027,2028,2030,180] 
set surface_color,  pcol7, surf_pocket7 
set_color pcol8 = [0.702,0.447,0.278]
select surf_pocket8, protein and id [2903,3659,3646,2851,3648,3650,3284,3292,3282,3286,2852,2875,2883,2884,2886,2888,3297,3298,3306,3322,3325] 
set surface_color,  pcol8, surf_pocket8 
set_color pcol9 = [0.902,0.792,0.361]
select surf_pocket9, protein and id [1256,1298,1289,1291,1097,1122,1126,1348,1059,1058] 
set surface_color,  pcol9, surf_pocket9 
   

deselect

orient
