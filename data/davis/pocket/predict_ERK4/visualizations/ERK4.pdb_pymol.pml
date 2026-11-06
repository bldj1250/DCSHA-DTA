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

load "data/ERK4.pdb", protein
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

load "data/ERK4.pdb_points.pdb.gz", points
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
select surf_pocket1, protein and id [1217,1208,1209,1234,1236,813,814,867,891,854,855,860,819,1232,836,839,840,848,1322,1324,1326,1196,1319,1320,249,194,195,251,198,345,199,196,200,201,202,206,215,216,252,360,361,362] 
set surface_color,  pcol1, surf_pocket1 
set_color pcol2 = [0.329,0.278,0.702]
select surf_pocket2, protein and id [444,445,3493,3478,3494,3492,3472,3475,1456,1457,1458,1460,1388,1411,1433,2641,1434,3481,2667,2639,2640,1422,1424,1426,1427,1436,1440,479,443,1362,454,455,3483,1413,1414,1415,3603] 
set surface_color,  pcol2, surf_pocket2 
set_color pcol3 = [0.698,0.361,0.902]
select surf_pocket3, protein and id [1036,1025,1027,995,998,1278,1281,999,2556,4283,4285,4323,4289,4293,4294,4316,2513,2515,2517,4325,4348,963,1062,1063,2530,2532,1037,1039,1271,585,584,1066] 
set surface_color,  pcol3, surf_pocket3 
set_color pcol4 = [0.702,0.278,0.639]
select surf_pocket4, protein and id [1532,1798,1799,3050,3068,880,1508,1542,1544,1509,1204,879,1201,1208,1752,1203] 
set surface_color,  pcol4, surf_pocket4 
set_color pcol5 = [0.902,0.361,0.545]
select surf_pocket5, protein and id [599,814,597,520,1319,1320,1334,1322,360,362,487,521] 
set surface_color,  pcol5, surf_pocket5 
set_color pcol6 = [0.702,0.353,0.278]
select surf_pocket6, protein and id [898,897,899,944,925,1252,1256,1009,1010,1243,975,976,1282,934,945] 
set surface_color,  pcol6, surf_pocket6 
set_color pcol7 = [0.902,0.729,0.361]
select surf_pocket7, protein and id [408,410,435,2720,2771,736,2746,2719,2716] 
set surface_color,  pcol7, surf_pocket7 
   

deselect

orient
