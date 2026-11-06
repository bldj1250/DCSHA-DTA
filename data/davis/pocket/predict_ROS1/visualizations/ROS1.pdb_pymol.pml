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

load "data/ROS1.pdb", protein
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

load "data/ROS1.pdb_points.pdb.gz", points
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
select surf_pocket1, protein and id [9704,10108,9709,10126,10125,9694,10118,10120,11325,11326,9734,9363,9366,9370,9711,9705,11378,10627,10629,10631,10634,10635,11004,11005,11331,11366,11009,11370,9374,9377,11011,11367,10653,9680,9684,9686,9688,11306,11307,11308,11309,11310,10104,10094,10981,10099,10101,10622,10614,10618,9349,9351,9353,9690,10989,10994,10990] 
set surface_color,  pcol1, surf_pocket1 
set_color pcol2 = [0.278,0.384,0.702]
select surf_pocket2, protein and id [3628,3632,3278,3621,3625,3263,3264,3279,2968,3284,3647,3648,4350,4352,4353,3629,3623,3989,3979,2939,2943,2938,3269,2924,4330,4332,4312,4314,4318,4313,3963,4303,4362,2584,2591,2929,2593,4317,3973,3286] 
set surface_color,  pcol2, surf_pocket2 
set_color pcol3 = [0.361,0.416,0.902]
select surf_pocket3, protein and id [6587,6591,6586,6988,6590,6592,6593,6609,7361,7362,5576,5933,6971,6975,6979,7307,7289,7294,6989,6990,6995,7349,7353,7350,6991,5588,6224,6576,6230,6237,6239,5577,5891,6241,5575,6244,5904,7288,5560,5566,5573,6245] 
set surface_color,  pcol3, surf_pocket3 
set_color pcol4 = [0.302,0.278,0.702]
select surf_pocket4, protein and id [16652,15931,16653,16535,16536,16537,15490,15484,15486,15485,15488,15489,15536,15539,15538,15493,16657,16661,15685,15669,16075,16064,16058,16105,16509,15500,15501,16109,15491,15492,15494,16523,16080,16099,16100,16102,16081,16089,16077,15523] 
set surface_color,  pcol4, surf_pocket4 
set_color pcol5 = [0.467,0.361,0.902]
select surf_pocket5, protein and id [3307,3310,4389,3318,3670,3671,4385,4743,4748,3303,3312,3315,1613,1618,1617,1620,1622,4592,4593,4595,4591,4583,1666,4596,4612,4771,4744,1608,1609,1610,4405,4393,4404,4575,4793,4392,4576] 
set surface_color,  pcol5, surf_pocket5 
set_color pcol6 = [0.427,0.278,0.702]
select surf_pocket6, protein and id [1040,1021,1103,15224,1042,1232,1235,1220,1226,1020,1102,1215,1219,1234,15735,15736,15748,15753,15745,15733,15737,15740,1217,1724,1732,1734,1735,15223,15222,15213,15214,15215,15201,15217] 
set surface_color,  pcol6, surf_pocket6 
set_color pcol7 = [0.631,0.361,0.902]
select surf_pocket7, protein and id [663,659,655,656,657,658,606,1364,679,681,682,683,492,493,571,488,490,453,431,638,450,451,452,472,476,423,427,582,578] 
set surface_color,  pcol7, surf_pocket7 
set_color pcol8 = [0.553,0.278,0.702]
select surf_pocket8, protein and id [3843,3845,3783,3784,3708,3710,3728,13164,13851,3748,13176,13180,3797,3794,3556,13153,13154,3554,3560,3550,3545,3555,13161,3765,13162,13165] 
set surface_color,  pcol8, surf_pocket8 
set_color pcol9 = [0.792,0.361,0.902]
select surf_pocket9, protein and id [9190,11338,11340,11343,9189,9191,11336,9085,9103,9104,9078,9082,9270,9274,9262,9532,9531,8289,9414,9413,9537,9543] 
set surface_color,  pcol9, surf_pocket9 
set_color pcol10 = [0.678,0.278,0.702]
select surf_pocket10, protein and id [15273,15271,6528,1087,1111,1113,6531,1082,6708,1080,6703,6533,15241,15248,15221,1102,1108,1098,1104,1103,15224,15753,15216] 
set surface_color,  pcol10, surf_pocket10 
set_color pcol11 = [0.902,0.361,0.847]
select surf_pocket11, protein and id [16801,16804,6740,6895,15228,6723,6712,6717,15229,15221,15226,15258,6741,15248,6701,6702] 
set surface_color,  pcol11, surf_pocket11 
set_color pcol12 = [0.702,0.278,0.596]
select surf_pocket12, protein and id [5359,5394,5396,5398,5402,5392,7229,7249,7270,7272,5463,5465,5469,7238] 
set surface_color,  pcol12, surf_pocket12 
set_color pcol13 = [0.902,0.361,0.682]
select surf_pocket13, protein and id [6920,6922,6924,6929,7201,7080,7133,7132,7096,7098,7083,7214,7200] 
set surface_color,  pcol13, surf_pocket13 
set_color pcol14 = [0.702,0.278,0.471]
select surf_pocket14, protein and id [990,1137,1138,6520,1369,6522,6523,6521,1346,1347,1363,1366,1367,6516,6518,1109,1110,6519,968] 
set surface_color,  pcol14, surf_pocket14 
set_color pcol15 = [0.902,0.361,0.522]
select surf_pocket15, protein and id [9767,9768,9769,9901,9789,9994,9897,10014,10342,10343,9998,10366,9720,9748,11717,11718] 
set surface_color,  pcol15, surf_pocket15 
set_color pcol16 = [0.702,0.278,0.341]
select surf_pocket16, protein and id [9755,9759,9404,9401,9403,9405,9725,9438,9508,9384,9420,9923,9381,9383,9509] 
set surface_color,  pcol16, surf_pocket16 
set_color pcol17 = [0.902,0.361,0.361]
select surf_pocket17, protein and id [2614,2599,2642,2309,2310,2264,2281,2284,2288] 
set surface_color,  pcol17, surf_pocket17 
set_color pcol18 = [0.702,0.341,0.278]
select surf_pocket18, protein and id [6491,15255,15257,15247,6540,6541,6761,15260,6542,6527,6498,6875] 
set surface_color,  pcol18, surf_pocket18 
set_color pcol19 = [0.902,0.522,0.361]
select surf_pocket19, protein and id [16125,15146,15145,15118,15119,15120,16512,16515,16843,16880,16879,16511,16863,17135,17139,17140,17141,17195,17197,17196] 
set surface_color,  pcol19, surf_pocket19 
set_color pcol20 = [0.702,0.471,0.278]
select surf_pocket20, protein and id [485,486,487,488,490,518,520,522,521,544,574,575,576,547,685,712,714,713,9641] 
set surface_color,  pcol20, surf_pocket20 
set_color pcol21 = [0.902,0.682,0.361]
select surf_pocket21, protein and id [9863,10027,10030,10053,9882,10089,10210,10212,10074,10056,10229,9868] 
set surface_color,  pcol21, surf_pocket21 
set_color pcol22 = [0.702,0.596,0.278]
select surf_pocket22, protein and id [13376,13523,13556,13381,13380,13382,13596,13598,13544,13546,13553,13558,13557,13386] 
set surface_color,  pcol22, surf_pocket22 
set_color pcol23 = [0.902,0.847,0.361]
select surf_pocket23, protein and id [9179,9256,9237,9198,11249,9127,9180,11271,11261,11265,9144,11268,11269,11289,11263] 
set surface_color,  pcol23, surf_pocket23 
set_color pcol24 = [0.678,0.702,0.278]
select surf_pocket24, protein and id [10152,10153,9733,10652,11385,10137] 
set surface_color,  pcol24, surf_pocket24 
   

deselect

orient
