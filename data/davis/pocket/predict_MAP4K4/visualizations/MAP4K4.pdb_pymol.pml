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

load "data/MAP4K4.pdb", protein
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

load "data/MAP4K4.pdb_points.pdb.gz", points
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
select surf_pocket1, protein and id [227,228,230,284,827,384,1265,1342,844,846,847,848,852,855,856,857,863,864,232,282,285,244,233,1238,1251,1349,1351,239,1239,1343,1266,867,870,895,1340] 
set surface_color,  pcol1, surf_pocket1 
set_color pcol2 = [0.278,0.310,0.702]
select surf_pocket2, protein and id [8503,8504,8483,8489,8498,8481,8484,8048,8029,8030,8031,8032,8047,8037,8505,8904,8889,9255,9261,9257,9246,9613,9609,9928,9935,9601,9607,9926,9605] 
set surface_color,  pcol2, surf_pocket2 
set_color pcol3 = [0.498,0.361,0.902]
select surf_pocket3, protein and id [8484,8047,8037,8048,8029,8031,8505,9246,9613,9609,9940,9942,7731,9928,9935,9924,9594,9601,9930,9607,9923,9926,9605] 
set surface_color,  pcol3, surf_pocket3 
set_color pcol4 = [0.525,0.278,0.702]
select surf_pocket4, protein and id [486,488,493,494,460,464,498,500,413,422,258,462,463,1456,416,417,521,524,526,262,1400,260,492] 
set surface_color,  pcol4, surf_pocket4 
set_color pcol5 = [0.851,0.361,0.902]
select surf_pocket5, protein and id [7960,7962,7992,7961,7989,8288,8390,8404,8406,8358,8251,8252,8189,8193,8209,8212,8400,8402] 
set surface_color,  pcol5, surf_pocket5 
set_color pcol6 = [0.702,0.278,0.600]
select surf_pocket6, protein and id [1597,1601,8554,8708,8710,8705,8711,1877,8690,8557,8553,8556,8566,1546,1486,1581,1900,1897,1579,8560,1898,1484] 
set surface_color,  pcol6, surf_pocket6 
set_color pcol7 = [0.902,0.361,0.596]
select surf_pocket7, protein and id [9730,10017,10018,7616,7612,7615,9849,9851,9854,9848,9842,9844] 
set surface_color,  pcol7, surf_pocket7 
set_color pcol8 = [0.702,0.278,0.325]
select surf_pocket8, protein and id [8266,8267,8268,7759,7760,7761,7762,7764,7765,7757,7758,7754,7756,7766,7767,8262,7783,7861,8295,8296] 
set surface_color,  pcol8, surf_pocket8 
set_color pcol9 = [0.902,0.478,0.361]
select surf_pocket9, protein and id [1250,1251,1349,1350,1351,1348,1347,263,247,253,261,1377,1209,1213,402,401,244] 
set surface_color,  pcol9, surf_pocket9 
set_color pcol10 = [0.702,0.510,0.278]
select surf_pocket10, protein and id [682,685,129,686,92,679,567,662,91,93,533] 
set surface_color,  pcol10, surf_pocket10 
set_color pcol11 = [0.902,0.831,0.361]
select surf_pocket11, protein and id [8385,8238,8218,8219,8220,8221,8222,8224,1467,8743,8744,8746,8749] 
set surface_color,  pcol11, surf_pocket11 
   

deselect

orient
