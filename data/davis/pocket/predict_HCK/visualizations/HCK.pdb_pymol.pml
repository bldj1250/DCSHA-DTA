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

load "data/HCK.pdb", protein
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

load "data/HCK.pdb_points.pdb.gz", points
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
select surf_pocket1, protein and id [3059,3060,2172,2669,2672,2698,2622,2604,2621,2288,2130,2606,2284,2287,3128,3134,3135,3044,3124,3126,3036,2171,2169,2121,2129,2281,2272,2118,2119,2639,2115,2116,2643,2647,2666] 
set surface_color,  pcol1, surf_pocket1 
set_color pcol2 = [0.329,0.278,0.702]
select surf_pocket2, protein and id [2993,3003,3005,3007,3026,3043,3044,3302,3303,3132,3131,3135,3154,3159,3162,3189,2149,2151,3235,2141,3281,3295,3232,2153,2288,2289,2130,2133,2304,2172,2156,2129,2155] 
set surface_color,  pcol2, surf_pocket2 
set_color pcol3 = [0.698,0.361,0.902]
select surf_pocket3, protein and id [1241,1244,1508,1514,1503,1510,1512,2826,2828,2830,2831,2832,2853,1185,1209,2797,2823,2796,4094,4096,1215,1210,1211,1203,1204,1206,1207,1517,1518,4090,4104,1494,4126,4056,4064,1187,1208,1529,4124,2806] 
set surface_color,  pcol3, surf_pocket3 
set_color pcol4 = [0.702,0.278,0.639]
select surf_pocket4, protein and id [2992,2995,3414,3415,3395,3396,3243,3246,358,360,361,3163,3295,3232,3227,3228,3230,3237,2993,3162] 
set surface_color,  pcol4, surf_pocket4 
set_color pcol5 = [0.902,0.361,0.545]
select surf_pocket5, protein and id [1908,640,643,1922,1924,1901,1903,1136,1138,1139,1140,1123,1100,1145,1141,1131,641,1003,630,1023,1075,1074,1076,1079,1144] 
set surface_color,  pcol5, surf_pocket5 
set_color pcol6 = [0.702,0.353,0.278]
select surf_pocket6, protein and id [3128,3134,3157,2514,2517,2426,3124,3126,2499,2621,2606] 
set surface_color,  pcol6, surf_pocket6 
set_color pcol7 = [0.902,0.729,0.361]
select surf_pocket7, protein and id [2466,2468,2469,2878,2880,2882,2883,2885,4037,4038,2881,2473,2486,2470,1162,1165,1167,1195] 
set surface_color,  pcol7, surf_pocket7 
   

deselect

orient
