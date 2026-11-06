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

load "data/SIK2.pdb", protein
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

load "data/SIK2.pdb_points.pdb.gz", points
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
select surf_pocket1, protein and id [1325,1327,1328,1301,1302,496,236,238,498,380,530,379,1324,1326,488,1319,1315,1316,1317,464,490,485,460,462,461,5877,5878,5813,5851,1177,1200,1178,5814,5816,218,243,229,232,221,226,227,228,1187,5784,5782,5811] 
set surface_color,  pcol1, surf_pocket1 
set_color pcol2 = [0.329,0.278,0.702]
select surf_pocket2, protein and id [847,5704,5705,5706,5711,5678,871,870,872,876,877,841,879,5712,5714,5744,5742,1712,900,1686,1687,1714,1718,1721,1710,1711,1713,874,1474,844,846,1723,1724,5746,5748,5749] 
set surface_color,  pcol2, surf_pocket2 
set_color pcol3 = [0.698,0.361,0.902]
select surf_pocket3, protein and id [825,827,1188,1216,1215,798,777,789,255,257,258,375,362,772,372,205,198,200,204,199,202,203,817,791,529,378,379,562,771,1300,1298,1295,1296,1293,636,637] 
set surface_color,  pcol3, surf_pocket3 
set_color pcol4 = [0.702,0.278,0.639]
select surf_pocket4, protein and id [2623,2624,2626,2692,2694,2695,2696,2682,2685,559,652,646,582,584,588,591,595,647,2756,2718,2719,2579,2401,2403,2405,567,2606,2601,2605,2607,2367,2364,2366] 
set surface_color,  pcol4, surf_pocket4 
set_color pcol5 = [0.902,0.361,0.545]
select surf_pocket5, protein and id [778,780,786,782,2725,2726,2727,2728,341,2724,2762,2730,347,1228,1232,1233,1236,1246,1247,2760,804,806,642,645,2751,2754,610,781,1280,1281,598,600,606,594,2756,607,609] 
set surface_color,  pcol5, surf_pocket5 
set_color pcol6 = [0.702,0.353,0.278]
select surf_pocket6, protein and id [2644,2641,2501,2655,7191,7192,2508,2500,2503,2507,2653,2673,7190,145,147,319] 
set surface_color,  pcol6, surf_pocket6 
set_color pcol7 = [0.902,0.729,0.361]
select surf_pocket7, protein and id [1580,1088,2108,2110,1091,2115,2119,2120,1086,1087,1064,1578,1614,2112] 
set surface_color,  pcol7, surf_pocket7 
   

deselect

orient
