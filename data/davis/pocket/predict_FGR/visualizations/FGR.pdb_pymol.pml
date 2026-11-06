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

load "data/FGR.pdb", protein
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

load "data/FGR.pdb_points.pdb.gz", points
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
select surf_pocket1, protein and id [2669,2693,2115,2108,2109,2114,2112,2113,2110,2271,2164,2268,2255,2161,2163,3055,2664,2667,3031,2661,2662,3054,2632,2634,2636,2640,3039,3126,3133,3134,3135,2493,2614,2615,2256,2654] 
set surface_color,  pcol1, surf_pocket1 
set_color pcol2 = [0.302,0.278,0.702]
select surf_pocket2, protein and id [2126,2129,2135,2138,2142,2125,2273,2146,2272,2164,3030,3234,2134,2144,3281,3021,2998,3002,3135,3132,3039,3031,3160,3188,3190,2323,3154,3159,3162] 
set surface_color,  pcol2, surf_pocket2 
set_color pcol3 = [0.631,0.361,0.902]
select surf_pocket3, protein and id [1908,1912,1917,1911,1923,1925,1929,1932,1934,1935,1937,2478,2859,2466,2467,2468,2469,2470,3113,3096,3098,3114,1214,1147,1149,1179,1180,1181,1175,1177,1145,1936,2624,2629,3064,3067,2637,2644,2642,1213,3071,3079,1199,1202,1178,3072,3070] 
set surface_color,  pcol3, surf_pocket3 
set_color pcol4 = [0.678,0.278,0.702]
select surf_pocket4, protein and id [1161,1168,1171,1173,4048,4051,4090,4092,1195,1227,1230,1506,1510,1193,1194,1169,1190,4043,4076,4079,1479,1492,1497,1499,1502,1164,4118,4122,4113,4112,4108,4091,4109,2826,2828,2830,2831,2798,2825,1201,2849,2823,2806,2796,2797,4083] 
set surface_color,  pcol4, surf_pocket4 
set_color pcol5 = [0.902,0.361,0.682]
select surf_pocket5, protein and id [1214,1905,1124,1126,1927,1928,1903,637,639,996,626,1902,1904,1925,1908,1909,1112,1114,1125,1122,1120,1110,1119,1063,1064,1078,1084,995,1016] 
set surface_color,  pcol5, surf_pocket5 
set_color pcol6 = [0.702,0.278,0.341]
select surf_pocket6, protein and id [3414,3416,3417,3393,3395,3392,3162,3165,2990,2994,251,275,3231,3229,3206,3244,3251,253,256,3163,3168,3233,3250] 
set surface_color,  pcol6, surf_pocket6 
set_color pcol7 = [0.902,0.522,0.361]
select surf_pocket7, protein and id [3128,3144,3146,3134,2492,2493,2614,2615,2271,2268,2416,2510,2600,3157] 
set surface_color,  pcol7, surf_pocket7 
set_color pcol8 = [0.702,0.596,0.278]
select surf_pocket8, protein and id [684,2235,681,1011,1919,1920,1921,1926,1930,657,1938] 
set surface_color,  pcol8, surf_pocket8 
   

deselect

orient
