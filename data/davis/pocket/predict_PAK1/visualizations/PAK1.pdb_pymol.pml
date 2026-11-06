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

load "data/PAK1.pdb", protein
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

load "data/PAK1.pdb_points.pdb.gz", points
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
select surf_pocket1, protein and id [2161,2204,2205,1125,2173,1126,1127,2297,1120,3062,3089,3157,3158,3088,2689,2695,2313,2314,2315,2174,2175,2177,2182,2188,2191,1103,1109,3159,3162,3164,3165,3166,3050,3051,3034,3073,1106,1107,2185,2187,1144,2156,2157,2159,2709,2707,2736,2738,2733,2759,2760,2761,2730,2716,2712,4196,4215,4218,4194] 
set surface_color,  pcol1, surf_pocket1 
set_color pcol2 = [0.365,0.278,0.702]
select surf_pocket2, protein and id [3621,3622,1563,1565,3349,3063,3064,3065,1124,1562,1120,1123,1111,1113,1114,1103,1109,3334,3350,1116,3051,3316,3336,3595,3549,1546,1557,1559,1561,1571,2752,2782,2760,1544,3579,2781,2779,1137,1139,1140,1141,1142,1143,1144,1558,1560,4253,2790,2789,4217,4242] 
set surface_color,  pcol2, surf_pocket2 
set_color pcol3 = [0.792,0.361,0.902]
select surf_pocket3, protein and id [3192,1104,3190,1105,1106,2187,3181,1053,1052,1051,1088,1099,1102,3310,2391,3305,2416,1050,3296,2386,2381,2383,2387,1049,1080,1073,1074,1075] 
set surface_color,  pcol3, surf_pocket3 
set_color pcol4 = [0.702,0.278,0.533]
select surf_pocket4, protein and id [3454,3455,3456,3989,3992,2961,2965,3445,3447,3448,3997] 
set surface_color,  pcol4, surf_pocket4 
set_color pcol5 = [0.902,0.361,0.361]
select surf_pocket5, protein and id [3811,2809,3809,3806,1530,2802,2804,1521,1523,1524,3561,3563,3560,3564,3565,3819,3782] 
set surface_color,  pcol5, surf_pocket5 
set_color pcol6 = [0.702,0.533,0.278]
select surf_pocket6, protein and id [1105,1106,2185,2187,3181,2375,2450,2386,2381,2383,2387,2416,2413] 
set surface_color,  pcol6, surf_pocket6 
   

deselect

orient
