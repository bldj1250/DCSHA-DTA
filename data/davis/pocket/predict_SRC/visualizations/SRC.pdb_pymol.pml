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

load "data/SRC.pdb", protein
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

load "data/SRC.pdb_points.pdb.gz", points
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
select surf_pocket1, protein and id [3145,3147,3075,3076,3060,3052,2686,2692,2718,2689,2278,2124,2125,2128,2129,2182,2183,2666,2131,2132,2126,2517,2532,3163,2518,2639,2640,3152,3154,2294,2295,2296,3153,2291,3176,2134,2439,2625] 
set surface_color,  pcol1, surf_pocket1 
set_color pcol2 = [0.278,0.310,0.702]
select surf_pocket2, protein and id [3154,2156,2295,2296,2311,2293,2152,2160,2162,2147,3173,3178,3179,3181,3209,2346,3023,3253,3042,3301,2166,2167,2136,2143,2144,2164,3059,3060,3051,3052,2183] 
set surface_color,  pcol2, surf_pocket2 
set_color pcol3 = [0.498,0.361,0.902]
select surf_pocket3, protein and id [654,656,1129,1918,1919,1924,1138,1097,1131,1139,1141,1148,1149,643,644,1083,1082,1084,1015,1013,1016,1036,534,535,1018,1938,1940,1941,514] 
set surface_color,  pcol3, surf_pocket3 
set_color pcol4 = [0.525,0.278,0.702]
select surf_pocket4, protein and id [499,500,1174,2492,2493,2494,1175,497,2483,2487,501,2486,2959,4046,4045,4047,4079,4078,4080,2903] 
set surface_color,  pcol4, surf_pocket4 
set_color pcol5 = [0.851,0.361,0.902]
select surf_pocket5, protein and id [3315,3316,3438,3263,3266,3392,3436,3008,3011,3184,3009,3435,3437,3248,3257,3259,3261,3180,3181,3182,3252,3250,3387,3413,3414] 
set surface_color,  pcol5, surf_pocket5 
set_color pcol6 = [0.702,0.278,0.600]
select surf_pocket6, protein and id [2255,699,702,2247,674,681,1957,1943,1951,1956,2261,2548,1947,2546,1932,1934,666,672,677,680,661,1939,1031,1930,1929,1028] 
set surface_color,  pcol6, surf_pocket6 
set_color pcol7 = [0.902,0.361,0.596]
select surf_pocket7, protein and id [656,1129,1142,1143,1145,1918,1919,1138,1144,1146,1147,1106,1161,1139,1141,1148,1149,643,1162,1164,1166,1168] 
set surface_color,  pcol7, surf_pocket7 
set_color pcol8 = [0.702,0.278,0.325]
select surf_pocket8, protein and id [1255,1256,1511,1516,1523,1219,1220,1526,1527,1192,1197,1216,1221,4076,4117,4104,4105,1186] 
set surface_color,  pcol8, surf_pocket8 
set_color pcol9 = [0.902,0.478,0.361]
select surf_pocket9, protein and id [1949,2491,2649,3133,3134,1947,1948,1950,2654,3118,3116,3085,3092,3119,3088,2668] 
set surface_color,  pcol9, surf_pocket9 
set_color pcol10 = [0.702,0.510,0.278]
select surf_pocket10, protein and id [624,605,623,578,559,606,579,622,532,533,1049,847,903] 
set surface_color,  pcol10, surf_pocket10 
set_color pcol11 = [0.902,0.831,0.361]
select surf_pocket11, protein and id [3630,3913,3496,3526,3911,3914,3766] 
set surface_color,  pcol11, surf_pocket11 
   

deselect

orient
