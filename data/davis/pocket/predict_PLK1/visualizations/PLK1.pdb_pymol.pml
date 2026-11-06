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

load "data/PLK1.pdb", protein
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

load "data/PLK1.pdb_points.pdb.gz", points
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
select surf_pocket1, protein and id [1070,1424,1416,1440,1441,1442,1443,1045,1438,1439,1522,848,471,982,573,773,967,988,847,1005,1004,1006,1001,426,421,469,414,415,416,418,428,1068,1069,3179,1036,1039,1035,1525,1527,1529,585,586,587,740,742,1523,1528,433,434,455] 
set surface_color,  pcol1, surf_pocket1 
set_color pcol2 = [0.278,0.298,0.702]
select surf_pocket2, protein and id [3391,2495,2492,2496,3935,3936,3980,3981,2473,3982,3519,3522,3527,3932,3530,3532,3220,4023,2489,2502,3513,3515,2483,2485,4003,3978,3979,3534,3552,3387] 
set surface_color,  pcol2, surf_pocket2 
set_color pcol3 = [0.533,0.361,0.902]
select surf_pocket3, protein and id [4392,4393,3227,3231,3243,3245,3246,4294,4295,4296,4424,4423,4425,3896,4426,4427,4430,4446,3239,3233,4274,4275,4276,4278] 
set surface_color,  pcol3, surf_pocket3 
set_color pcol4 = [0.565,0.278,0.702]
select surf_pocket4, protein and id [1060,1061,1710,1401,1411,1405,1408,1413,1085,1088,1955,1956,1912,1982,1697,1708,1402,1682] 
set surface_color,  pcol4, surf_pocket4 
set_color pcol5 = [0.902,0.361,0.878]
select surf_pocket5, protein and id [444,446,448,450,451,640,716,1543,1544,447,449,682,678,680,707,710,679,1529,586,587,1528,743,1542,455,602,719] 
set surface_color,  pcol5, surf_pocket5 
set_color pcol6 = [0.702,0.278,0.533]
select surf_pocket6, protein and id [4188,3196,3198,3202,3214,2523,1101,4326,1103,1105,4340,4186,1102,4185,4187,4199] 
set surface_color,  pcol6, surf_pocket6 
set_color pcol7 = [0.902,0.361,0.490]
select surf_pocket7, protein and id [3294,3297,3803,3806,3800,3801,3802,3804,3844,3846,3848,3320,3330,3332,3777,3318,3292] 
set surface_color,  pcol7, surf_pocket7 
set_color pcol8 = [0.702,0.329,0.278]
select surf_pocket8, protein and id [2940,2941,4340,4341,1102,2522,1110,1113,1125,2526,2530,2539,2931,4180,4183,2910,2904,2894,2902,2896,2898,2900,2901] 
set surface_color,  pcol8, surf_pocket8 
set_color pcol9 = [0.902,0.620,0.361]
select surf_pocket9, protein and id [4227,3269,4278,4236,4279,4249,4295,3889,4230,3265,3267,3270,3261] 
set surface_color,  pcol9, surf_pocket9 
set_color pcol10 = [0.702,0.631,0.278]
select surf_pocket10, protein and id [867,882,875,340,341,868,895,298,364,365,367,975,974,344,513] 
set surface_color,  pcol10, surf_pocket10 
   

deselect

orient
