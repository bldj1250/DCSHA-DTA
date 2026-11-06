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

load "data/MAP4K5.pdb", protein
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

load "data/MAP4K5.pdb_points.pdb.gz", points
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
select surf_pocket1, protein and id [236,222,226,227,230,224,220,383,1165,217,267,212,215,266,213,754,1164,366,760,777,781,214,774,776,244,382,1140,1141,798,800,795,792,823,824,825,235,5156,5157,1273,1149,1245,1246,1247,1238,1131,248,1302,246,1303,1386,1115,1385,1276,1384,1113,1132,1392,1393,1368] 
set surface_color,  pcol1, surf_pocket1 
set_color pcol2 = [0.278,0.310,0.702]
select surf_pocket2, protein and id [4937,4933,6442,6447,6432,6439,6429,6427,4947,2757,2778,2779,2780,6446,6132,2792,2794,2797,2796,4365,4369,6434,6426,4356,4925,4928,4930,5760,5759,5761,5748,5352,5346,5347,4919,5332,5780,5775,6128,6133,6118,6122,5776,6455,4390,6453,6454,4388,4006,4009,6444,6448,6449,6451,2804,2805,2798,2802,2803,4373,4377,4002,3995] 
set surface_color,  pcol2, surf_pocket2 
set_color pcol3 = [0.498,0.361,0.902]
select surf_pocket3, protein and id [816,817,4816,855,4800,4803,4805,815,854,1140,4814,4801,5140,5143,1410,1709,1710,5156,5165,5167,5161,5163,5164,5157,1708,1132,1388,1392,1425,1426,1386,1400,1130,1131] 
set surface_color,  pcol3, surf_pocket3 
set_color pcol4 = [0.525,0.278,0.702]
select surf_pocket4, protein and id [740,741,1266,1268,1269,545,751,615,616,1240,1241,1246,1248,546,1252,1256,1254,381,755,754] 
set surface_color,  pcol4, surf_pocket4 
set_color pcol5 = [0.851,0.361,0.902]
select surf_pocket5, protein and id [4289,4261,4629,4290,4233,4232,4234,4259,4260,4086,4631,4632,4191,4104,4107,4595,4202,4205,4287,4288,4271,4273,4208] 
set surface_color,  pcol5, surf_pocket5 
set_color pcol6 = [0.702,0.278,0.600]
select surf_pocket6, protein and id [4315,4317,4324,4325,2492,2494,4333,2460,4304,4588,4830,4833,4836,2455,2453,2451,2490,4749,4750,4751,2466,2468,4825,4828,4618,4822,4617,2513] 
set surface_color,  pcol6, surf_pocket6 
set_color pcol7 = [0.902,0.361,0.596]
select surf_pocket7, protein and id [5580,5579,5435,5437,5439,5362,5946,5934,5935,5378,5938] 
set surface_color,  pcol7, surf_pocket7 
set_color pcol8 = [0.702,0.278,0.325]
select surf_pocket8, protein and id [638,647,648,640,88,639,668,111,148,152,151,162,164,311] 
set surface_color,  pcol8, surf_pocket8 
set_color pcol9 = [0.902,0.478,0.361]
select surf_pocket9, protein and id [3939,3940,3941,6594,2562,3942,6595,3943,3915,2655,2656,2657,2609,2610,2615,2570] 
set surface_color,  pcol9, surf_pocket9 
set_color pcol10 = [0.702,0.510,0.278]
select surf_pocket10, protein and id [5800,2759,6146,2760,6015,6014,5798,5799,5791] 
set surface_color,  pcol10, surf_pocket10 
set_color pcol11 = [0.902,0.831,0.361]
select surf_pocket11, protein and id [6231,6232,6405,6193,6494,6406,2684] 
set surface_color,  pcol11, surf_pocket11 
   

deselect

orient
