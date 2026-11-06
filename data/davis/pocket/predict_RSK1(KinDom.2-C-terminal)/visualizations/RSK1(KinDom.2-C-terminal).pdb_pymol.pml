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

load "data/RSK1(KinDom.2-C-terminal).pdb", protein
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

load "data/RSK1(KinDom.2-C-terminal).pdb_points.pdb.gz", points
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
select surf_pocket1, protein and id [8,1,2,4,6,15,5,545,531,573,576,540,549,557,559,536,537,560,1169,1549,1550,2818,1168,1170,1522,1521,706,521,575,518,1638,22,837,1652,1653,1661,724,873,1637,1651,722,723,874,553,739,834,848,555,777,1629,1630,1631,1632,1115,719,1121,1136,978,1523,1525,2824,2828,2852,2854,2855,519,524,525,517,523,2802,2811,2816,2821,5754,1196,1185,1187,5756,5759] 
set surface_color,  pcol1, surf_pocket1 
set_color pcol2 = [0.278,0.322,0.702]
select surf_pocket2, protein and id [4441,3550,3415,3547,3552,3648,4437,4440,3767,3898,3535,3880,3534,3536,3539,3544,3897,4314,4443,4445,4447,3383,3373,3378,3379,3381,3428,3430,3374,3376,3914,3385,3388,3389,3766,4329,3921,3919,3920,4305,3950] 
set surface_color,  pcol2, surf_pocket2 
set_color pcol3 = [0.467,0.361,0.902]
select surf_pocket3, protein and id [3625,2796,3864,3656,3657,3803,3804,3805,3238,3242,3237,2834,3583,3584,3826,3822,3617,3631,2788,2790,2794,2797,2778,3239,2791,2784,2782,2787,507,2786,2780,3247,3689,3690] 
set surface_color,  pcol3, surf_pocket3 
set_color pcol4 = [0.490,0.278,0.702]
select surf_pocket4, protein and id [4275,4262,5603,5621,5592,5623,5624,4741,4743,5595,4779,4739,4763,4765,4766,4767,4768,4770,4709,4736,4738,5571,5594,5602,5591,4716,5615,4982,4714,4772,5007,5267,5220,5221,4769,4773,5217,4979,5236,5010] 
set surface_color,  pcol4, surf_pocket4 
set_color pcol5 = [0.792,0.361,0.902]
select surf_pocket5, protein and id [1614,1143,1005,1118,1120,1122,1123,1124,1615,942,986,988,3106,681,682,702,1004,3073,3078,1562,1125,1129,1573,1575,687,1566,949,951,952,3102,3104,3099,2659,2663,1574,1584] 
set surface_color,  pcol5, surf_pocket5 
set_color pcol6 = [0.702,0.278,0.659]
select surf_pocket6, protein and id [2863,2864,2866,3257,3259,3261,3266,3267,3273,2834,2830,2832,3822,2833,3804,3238,3237,3246,506,507,2786,2862,2780,3247,2784,2782,2787,2858,2860,2778,3239,2788,2790,2794] 
set surface_color,  pcol6, surf_pocket6 
set_color pcol7 = [0.902,0.361,0.682]
select surf_pocket7, protein and id [4293,3385,3388,3389,3392,3395,3397,4292,3383,3610,4276,4314,4447,4472,3415,4473,5602,3405,3407,3409] 
set surface_color,  pcol7, surf_pocket7 
set_color pcol8 = [0.702,0.278,0.408]
select surf_pocket8, protein and id [3230,3280,3252,3315,3473,3486,3281,3310,3229,3231,3233,3232,3799] 
set surface_color,  pcol8, surf_pocket8 
set_color pcol9 = [0.902,0.361,0.361]
select surf_pocket9, protein and id [4586,4587,4580,1278,1276,4568,4573,4574,4570,1267,1269,1271,1272,1273,1282,1287,4588,4598,4548,4536,1259] 
set surface_color,  pcol9, surf_pocket9 
set_color pcol10 = [0.702,0.408,0.278]
select surf_pocket10, protein and id [1399,2468,2471,1422,1426,2456,2467,2451,1922,1920,1921,1923,1423,1429,1430,1397] 
set surface_color,  pcol10, surf_pocket10 
set_color pcol11 = [0.902,0.682,0.361]
select surf_pocket11, protein and id [1195,1197,1198,1203,1207,1225,1228,2714,3664,3665,2804,2806,1236,1238,3629,3632,3666,4515,3640] 
set surface_color,  pcol11, surf_pocket11 
set_color pcol12 = [0.702,0.659,0.278]
select surf_pocket12, protein and id [1820,5785,5786,1188,1807,1808,2034,1809,5741,5744] 
set surface_color,  pcol12, surf_pocket12 
   

deselect

orient
