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

load "data/TRPM6.pdb", protein
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

load "data/TRPM6.pdb_points.pdb.gz", points
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
select surf_pocket1, protein and id [8912,8878,8882,8883,8914,7205,7208,7210,7333,7397,7339,7238,7727,7730,7754,7725,7421,7419,8843,8844,7361,7362,8848,7325,7358,7363,7396,7328,7382,6841,8921,8923,6874,6876,7207,7209,7173,7154,7420,7183,8966,7120,8857,8855,8893,8895,7764,7765,6839] 
set surface_color,  pcol1, surf_pocket1 
set_color pcol2 = [0.278,0.380,0.702]
select surf_pocket2, protein and id [6207,6213,6217,6219,6221,6225,6226,6228,6230,5883,8902,8904,8905,6764,6759,6761,6763,6774,6798,8900,6726,6733,6721,6724,6760,6762,6729,6255,6257,9206,9207,8919,5910,6183,6184,5920,5923,5918] 
set surface_color,  pcol2, surf_pocket2 
set_color pcol3 = [0.361,0.400,0.902]
select surf_pocket3, protein and id [5869,7796,7786,7790,7792,7794,5986,5988,5989,5897,6780,6782,6818,6820,6822,5908,5947,5893,5977,5980,7805,8822,8825,8784,7797,7784,5899,7787,8820,8868,5894,5895,8866,6809,6807] 
set surface_color,  pcol3, surf_pocket3 
set_color pcol4 = [0.318,0.278,0.702]
select surf_pocket4, protein and id [2353,1175,2355,2356,1157,2080,2386,2077,2079,2072,2054,2056,2053,1416,1418,1173,2047,1640,2070,2105,2109,1165,1163,2339,2340,1168,1171,1181,2349,2364,2533,1182,1184] 
set surface_color,  pcol4, surf_pocket4 
set_color pcol5 = [0.498,0.361,0.902]
select surf_pocket5, protein and id [7886,7855,8814,7852,7854,7856,8813,7848,7849,7877,7780,7388,8860,7367,7382,7384,7386,7369,7370,7372,8848] 
set surface_color,  pcol5, surf_pocket5 
set_color pcol6 = [0.455,0.278,0.702]
select surf_pocket6, protein and id [15595,15597,14498,14514,15129,14499,15159,15588,15155,15157,14336,14284,14288,15187,15188,15189,15190,15540,15542,14298,15183,15185,15186,15149,15151,15152,15156,15553,14287,14323] 
set surface_color,  pcol6, surf_pocket6 
set_color pcol7 = [0.675,0.361,0.902]
select surf_pocket7, protein and id [14014,14017,14015,15034,14011,14012,13889,15035,15037,15040,15055,14165,14685,14686,15097,15020,15098,13856,13888,15036,15038,15075,14144,14146,14147,14148,14151,14718,13879,13859] 
set surface_color,  pcol7, surf_pocket7 
set_color pcol8 = [0.592,0.278,0.702]
select surf_pocket8, protein and id [1045,1049,85,118,1771,1772,757,758,759,760,1056,146,1044,1060,753,755,880,891,103,104,105,115,117,767,872,873,874,875] 
set surface_color,  pcol8, surf_pocket8 
set_color pcol9 = [0.851,0.361,0.902]
select surf_pocket9, protein and id [4907,5652,4846,4848,4849,4908,4857,4862,4865,4854,4850,4844,4841,4842,4843,5650,4206,4207,4208,4852,4261,4265,4267,4836,4835,3750,3752,4291,4204,4861,4255,4256] 
set surface_color,  pcol9, surf_pocket9 
set_color pcol10 = [0.702,0.278,0.671]
select surf_pocket10, protein and id [13865,14695,14696,13863,13864,13871,13839,13837,13829,14693,14726,14724,14755,14626,14628,14638,14636,14631,11750,11751,14729,15701,15686,11718,11717,11720,13873] 
set surface_color,  pcol10, surf_pocket10 
set_color pcol11 = [0.902,0.361,0.773]
select surf_pocket11, protein and id [4895,4897,4896,5660,5661,5662,5665,5666,4207,4901,4907,4180,4183,4218,4113,4200,4217,4220,4931] 
set surface_color,  pcol11, surf_pocket11 
set_color pcol12 = [0.702,0.278,0.533]
select surf_pocket12, protein and id [14323,14763,15610,15593,15594,15245,15242,15244,15246,14311,14320,14735,15596,14738,15525,15541,15210,15595,15732,15727,15733,15729,15731,15735,14731,14733] 
set surface_color,  pcol12, surf_pocket12 
set_color pcol13 = [0.902,0.361,0.596]
select surf_pocket13, protein and id [14610,14668,14671,14567,14569,14570,14659,14660,14661,14672,14675,14678,14611,13901,14679,14682,13891,13897,15091,13920,15083,15081] 
set surface_color,  pcol13, surf_pocket13 
set_color pcol14 = [0.702,0.278,0.396]
select surf_pocket14, protein and id [5707,8835,8837,5886,9203,8875,5599,5603,5690,5692,5693,9204,9200,8876,5711,5714,5713] 
set surface_color,  pcol14, surf_pocket14 
set_color pcol15 = [0.902,0.361,0.420]
select surf_pocket15, protein and id [213,448,451,906,1668,1751,2027,1716] 
set surface_color,  pcol15, surf_pocket15 
set_color pcol16 = [0.702,0.302,0.278]
select surf_pocket16, protein and id [13754,13757,15451,15445,15447,14881,15408,15412,15414,15444,15937,15925,14882,15920,15914,15917] 
set surface_color,  pcol16, surf_pocket16 
set_color pcol17 = [0.902,0.478,0.361]
select surf_pocket17, protein and id [3787,4034,4037,4055,3758,4366,4367,4368,4369,4370,4372,4337,4338,4340,4336,4364,4411,3756,4333,4324,4300,4302,3751] 
set surface_color,  pcol17, surf_pocket17 
set_color pcol18 = [0.702,0.439,0.278]
select surf_pocket18, protein and id [7129,7099,7469,7493,7495,7497,7132,7136,7138,7158,7127,7477,7475,7467,7473,7476] 
set surface_color,  pcol18, surf_pocket18 
set_color pcol19 = [0.902,0.655,0.361]
select surf_pocket19, protein and id [13830,13832,14752,14754,14149,14151,14153,14035,14036,14132,14133,13821,13858,13826,13829] 
set surface_color,  pcol19, surf_pocket19 
set_color pcol20 = [0.702,0.576,0.278]
select surf_pocket20, protein and id [5106,5107,5108,9320,5100,4873,5621,9284,5637,5640,4871] 
set surface_color,  pcol20, surf_pocket20 
set_color pcol21 = [0.902,0.831,0.361]
select surf_pocket21, protein and id [15710,15711,13803,13805,13808,15486,13764,15632,15493,15494,15721,15722,13799,13802,13766] 
set surface_color,  pcol21, surf_pocket21 
set_color pcol22 = [0.686,0.702,0.278]
select surf_pocket22, protein and id [10344,10345,10340,10351,10362,10352,10357,10359,10363,10346,10347,10348] 
set surface_color,  pcol22, surf_pocket22 
   

deselect

orient
