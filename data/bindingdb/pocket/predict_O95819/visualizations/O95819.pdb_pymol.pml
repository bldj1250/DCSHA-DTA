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

load "data/O95819.pdb", protein
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

load "data/O95819.pdb_points.pdb.gz", points
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
select surf_pocket1, protein and id [244,1340,1343,1349,1350,1239,1266,1265,1351,867,237,239,243,228,232,864,863,384,848,230,846,847,852,844,227,229,285,284,401,827,1342,832,870,895,1251] 
set surface_color,  pcol1, surf_pocket1 
set_color pcol2 = [0.278,0.278,0.702]
select surf_pocket2, protein and id [7826,7827,8277,8280,7821,7823,7825,8294,8299,8302,8279,8285,8690,7844,9722,9724,9726,9736,9738,8300,8301,9746,9397,8700,9057,9049,9051,9042,8684,8674,9408,9403,9405,9409,7527,7815,7534,9720,9731,9393,9390,7833] 
set surface_color,  pcol2, surf_pocket2 
set_color pcol3 = [0.576,0.361,0.902]
select surf_pocket3, protein and id [1365,1367,1370,265,1364,1373,263,1347,1348,1345,1346,253,261,244,247,1351,1371,525,526,402,1475,1497,1213,1230,1250,1251,1243,1238,1199,1496,1197,1209,1198,1492,1493,1480,1488,1495,252,1482] 
set surface_color,  pcol3, surf_pocket3 
set_color pcol4 = [0.616,0.278,0.702]
select surf_pocket4, protein and id [9526,7412,9627,9628,9629,9638,9640,9645,9650,7411,9814,9892,9894,9653] 
set surface_color,  pcol4, surf_pocket4 
set_color pcol5 = [0.902,0.361,0.792]
select surf_pocket5, protein and id [8034,8012,8014,8015,8016,8017,8018,8020,1468,1466,1467,8540,8542,8545,1438] 
set surface_color,  pcol5, surf_pocket5 
set_color pcol6 = [0.702,0.278,0.447]
select surf_pocket6, protein and id [8506,8512,1545,1546,8532,8535,8533,1511,1483,1485,1491,1900,8573,1866,1901,1509] 
set surface_color,  pcol6, surf_pocket6 
set_color pcol7 = [0.902,0.361,0.361]
select surf_pocket7, protein and id [7579,7552,7572,7556,7558,7560,7561,8092,7657,7733,7735,8098,8100,8091,8064,8067,8062,8063] 
set surface_color,  pcol7, surf_pocket7 
set_color pcol8 = [0.702,0.447,0.278]
select surf_pocket8, protein and id [526,416,265,1373,263,257,261,262,260,465,500,498] 
set surface_color,  pcol8, surf_pocket8 
set_color pcol9 = [0.902,0.792,0.361]
select surf_pocket9, protein and id [8005,8048,7758,8196,8200,8202,7785,7788,7756,7757,8084,8047] 
set surface_color,  pcol9, surf_pocket9 
   

deselect

orient
