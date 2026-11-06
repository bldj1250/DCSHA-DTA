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

load "data/RSK3(KinDom.2-C-terminal).pdb", protein
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

load "data/RSK3(KinDom.2-C-terminal).pdb_points.pdb.gz", points
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
select surf_pocket1, protein and id [1171,2826,2810,1178,2822,2824,2860,2861,535,532,533,538,545,1639,1558,1559,1638,729,730,1643,1645,1647,1129,713,590,591,1531,1174,1530,1532,1168,1144,2827,2830,2834,5814,2817,5785,5780,5782,731,879,1123,987] 
set surface_color,  pcol1, surf_pocket1 
set_color pcol2 = [0.278,0.298,0.702]
select surf_pocket2, protein and id [5002,4784,4785,4786,4787,4789,4791,5617,4788,4792,5025,5614,5640,5643,5642,4759,4760,4761,4762,4782,4735,4738,5280,4745,4291,4287,4288,4296,4289,4290,4294,4301,4307,4798,5625,5613,5588,5590,5616,4736,5233,5234,5028,5249] 
set surface_color,  pcol2, surf_pocket2 
set_color pcol3 = [0.533,0.361,0.902]
select surf_pocket3, protein and id [4331,4355,3973,3404,4356,3413,3414,3440,3398,3403,3397,4340,4474,4334,3923,3453,3557,3928,3941,3944,3945,3946,3401,4467,3573,4470,4472,4466,4464,3408,3410,3975,3922,3788,3790] 
set surface_color,  pcol3, surf_pocket3 
set_color pcol4 = [0.565,0.278,0.702]
select surf_pocket4, protein and id [2788,521,2786,2801,2803,2759,520,2794,3287,3292,3295,3297,2763,2799,2792,2865,2866,2868,2864,2870,2872,2840,2838,3845,3606,3607,3847,3849,3846,3888,3825,3827,3828,3831,3832,3842,3836,3838,3640,3647,3652,3654,3648,3680,2776] 
set surface_color,  pcol4, surf_pocket4 
set_color pcol5 = [0.902,0.361,0.878]
select surf_pocket5, protein and id [730,1645,1646,1647,563,567,569,554,559,560,572,573,5838,551,1502,1543,1518,1519,731,880,1660,854,746,1668,1670,1669,1661,1662,844,816,841] 
set surface_color,  pcol5, surf_pocket5 
set_color pcol6 = [0.702,0.278,0.533]
select surf_pocket6, protein and id [4233,4235,4241,4242,4234,4238,4750,4209,5296,5292,4530,4716,4718,4749,4751,4752,4753,5285,5283,4724,4726,5274,5294,5248,4723] 
set surface_color,  pcol6, surf_pocket6 
set_color pcol7 = [0.902,0.361,0.490]
select surf_pocket7, protein and id [2287,1267,4570,2278,4563,1261,1275,4644,1277,1279,4562,4556,1286,1288,2063,1281,4561,2273,2276,4643,4645,4647] 
set surface_color,  pcol7, surf_pocket7 
set_color pcol8 = [0.702,0.329,0.278]
select surf_pocket8, protein and id [1196,2046,5770,1526,1831,1833,5806,5805,1194,1533,1534,1535,2087] 
set surface_color,  pcol8, surf_pocket8 
set_color pcol9 = [0.902,0.620,0.361]
select surf_pocket9, protein and id [1215,1233,1236,1238,3689,3688,4523,4578,3663,3662,4519] 
set surface_color,  pcol9, surf_pocket9 
set_color pcol10 = [0.702,0.631,0.278]
select surf_pocket10, protein and id [956,959,958,2667,2668,2669,1623,1624,1132,1131,1151,1575,1593,1583,1582,1584] 
set surface_color,  pcol10, surf_pocket10 
   

deselect

orient
