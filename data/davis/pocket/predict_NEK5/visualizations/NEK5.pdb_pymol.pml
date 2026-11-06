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

load "data/NEK5.pdb", protein
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

load "data/NEK5.pdb_points.pdb.gz", points
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
select surf_pocket1, protein and id [1099,1095,717,1096,1098,1100,690,692,505,84,1183,640,247,248,1184,683,682,685,715,78,81,82,77,79,80,132,83,231,232,666,663,658,660,667,1069] 
set surface_color,  pcol1, surf_pocket1 
set_color pcol2 = [0.278,0.298,0.702]
select surf_pocket2, protein and id [1212,110,111,113,311,373,310,399,395,400,339,342,344,1301,343,1211,112,114,1210,1189,1203,249,248,266,430,626,265] 
set surface_color,  pcol2, surf_pocket2 
set_color pcol3 = [0.533,0.361,0.902]
select surf_pocket3, protein and id [1220,114,1223,1294,1297,1293,1295,1302,1324,1057,1356,1327,1331,1043,1047,1028,1041,1042,1059,1521,1449,1451,1355,1357,1366,1401,1277,1270,1272,1365,1372,1273,1308,1303] 
set surface_color,  pcol3, surf_pocket3 
set_color pcol4 = [0.565,0.278,0.702]
select surf_pocket4, protein and id [3304,3302,3303,3342,2862,2863,2864,2865,2868,2909,2912,3274,2933,3277,3279,2892,2894,2895,2932,2934,2897,3305,3271,2926] 
set surface_color,  pcol4, surf_pocket4 
set_color pcol5 = [0.902,0.361,0.878]
select surf_pocket5, protein and id [3893,3898,2906,2907,2908,2909,2910,3895,3931,2875,3928,3930,3862,3863,3865,3906,2905,2904,2933] 
set surface_color,  pcol5, surf_pocket5 
set_color pcol6 = [0.702,0.278,0.533]
select surf_pocket6, protein and id [205,223,225,194,204,34,37,540,532,528,530,526] 
set surface_color,  pcol6, surf_pocket6 
set_color pcol7 = [0.902,0.361,0.490]
select surf_pocket7, protein and id [641,428,431,512,515,504,1192,1194,1177,1178] 
set surface_color,  pcol7, surf_pocket7 
set_color pcol8 = [0.702,0.329,0.278]
select surf_pocket8, protein and id [2790,2791,2792,2795,2883,2885,2888,2882,2884,2886,2802,2823,2880,2800] 
set surface_color,  pcol8, surf_pocket8 
set_color pcol9 = [0.902,0.620,0.361]
select surf_pocket9, protein and id [1188,1190,958,1207,1004] 
set surface_color,  pcol9, surf_pocket9 
set_color pcol10 = [0.702,0.631,0.278]
select surf_pocket10, protein and id [1468,1998,1995,1997,967,976,2004,2012,963,964] 
set surface_color,  pcol10, surf_pocket10 
   

deselect

orient
