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

load "data/MTOR.pdb", protein
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

load "data/MTOR.pdb_points.pdb.gz", points
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
select surf_pocket1, protein and id [17781,17794,18658,17365,17787,17788,17789,17798,17793,18659,17361,17364,17792,17187,17779,17774,18743,18746,17693,17775,18748,18755,17381,17382,18747,18634,18643,17837,18633,17235,17186,17198,17200] 
set surface_color,  pcol1, surf_pocket1 
set_color pcol2 = [0.278,0.404,0.702]
select surf_pocket2, protein and id [12528,12529,12530,12549,12934,12936,12937,12938,12939,11723,12168,11953,11954,11722,11980,12927,12928,11763,12929,12906,11720,11721,12552,12554,12556,12586,12587,12193,12555,12167,12175,12189,12191,12192,12166,12588,12001,12005,12194,12205,12208,12962,12579,12580,12932] 
set surface_color,  pcol2, surf_pocket2 
set_color pcol3 = [0.361,0.459,0.902]
select surf_pocket3, protein and id [2525,2526,2529,4534,2527,4557,4559,4560,4592,4537,4834,4836,4838,2502,2504,2505,2506,2336,2340,2341,4045,4567,2304,2368,2363,2365,2366,2401,2367,2331,2334,2377,2524,4615,4585,4588,4589,4617,2523,4068] 
set surface_color,  pcol3, surf_pocket3 
set_color pcol4 = [0.278,0.310,0.702]
select surf_pocket4, protein and id [13088,13089,12987,13021,12008,12009,13248,13252,12961,11996,12007,12951,12926,12985,12984,12986,12927,13218,13224,11757,11761,13115,13118,13229,13197,11741,13217,13220] 
set surface_color,  pcol4, surf_pocket4 
set_color pcol5 = [0.380,0.361,0.902]
select surf_pocket5, protein and id [19224,19201,19204,19202,19228,19230,19222,19250,19253,19254,19255,15076,19256,19257,19259,15098,19231,19249,15109,15380,15381,15139,15141,15417,15135,15382,15378,15108,14279,14308,14339,15148,15150,15160,14307,14348,15149,15073,15087,19251,19286,19288,19290,19924,19927] 
set surface_color,  pcol5, surf_pocket5 
set_color pcol6 = [0.341,0.278,0.702]
select surf_pocket6, protein and id [18293,18322,18325,11051,11052,11053,18301,11077,18295,18299,18290,18292,18987,11045,19018,11081,11079,11080,19000,18401,18403,11014,11015,10763,18329] 
set surface_color,  pcol6, surf_pocket6 
set_color pcol7 = [0.498,0.361,0.902]
select surf_pocket7, protein and id [7056,12496,12498,7057,18421,18422,18423,7055,11232,12478,12480,11214,12504,11212,18378,17638,17616,17619,17622,11219,11222,11224,7014,18451,18460,18411,18490,17627,11233] 
set surface_color,  pcol7, surf_pocket7 
set_color pcol8 = [0.431,0.278,0.702]
select surf_pocket8, protein and id [6254,6235,2672,2660,5908,5904,6262,6282,6283,2650,2652,2655,5936,6583,6553,6555,6556,6560,6224,6561,6565,6566,6557,6558,6223,6226,6559,6585,6586,6587,6588,6592,6590,6925,6593] 
set surface_color,  pcol8, surf_pocket8 
set_color pcol9 = [0.616,0.361,0.902]
select surf_pocket9, protein and id [17015,17335,17344,17355,17357,17697,17694,7158,7160,17784,17807,17806,17324,17340,7157,17021,17777,17778,7164,7165] 
set surface_color,  pcol9, surf_pocket9 
set_color pcol10 = [0.525,0.278,0.702]
select surf_pocket10, protein and id [17021,17695,17018,17019,15651,17713,15624,17678,17681,7157,15342,15365,15368,15627,17697,17703,15647,15662,17686,17699,17455,15375,15376,17457,17454,15661,17032,17033,17035] 
set surface_color,  pcol10, surf_pocket10 
set_color pcol11 = [0.733,0.361,0.902]
select surf_pocket11, protein and id [16059,16060,16314,16315,16316,16317,16342,16346,16030,16007,16010,16058,17395,15982,16008,15984,15991,16364,16365,16366,16011,15979,15986,16013,16020,16026,16032,16398,17732,17734,17745,17747,17748,15951] 
set surface_color,  pcol11, surf_pocket11 
set_color pcol12 = [0.616,0.278,0.702]
select surf_pocket12, protein and id [8984,8985,8986,9510,9513,9283,9282,9508,9509,9726,9727,9761,9764,9725,9728,9732,9723,9731,9736,9698,9724,9284,9286,9287,9697,9699,9738,9285,8948,8950,9259,9768] 
set surface_color,  pcol12, surf_pocket12 
set_color pcol13 = [0.851,0.361,0.902]
select surf_pocket13, protein and id [4065,4068,4070,4072,4598,4599,4094,4096,4098,4616,4092,2548,2549,4097,4100,4095,2524,4615,4585,4617,2543,2545,2305,2528,2306,2307,2308,2303,4046,4045,4567,2526,2557,2559] 
set surface_color,  pcol13, surf_pocket13 
set_color pcol14 = [0.702,0.278,0.694]
select surf_pocket14, protein and id [2115,2092,3082,2200,3140,1657,1633,1634,1636,1631,2124,1629,1609,1661,2231,3106,3104,3105,3073] 
set surface_color,  pcol14, surf_pocket14 
set_color pcol15 = [0.902,0.361,0.831]
select surf_pocket15, protein and id [5967,2635,2636,2648,2638,5575,5557,5584,5603,5606,5289,5577,2647,5286,5288] 
set surface_color,  pcol15, surf_pocket15 
set_color pcol16 = [0.702,0.278,0.600]
select surf_pocket16, protein and id [17635,7153,7128,17566,7105,7122,7125,7099,7098,7094,7101,7089,18713,17636,17644,17651,17653,17535,17537,17538,17658,7151,17536,17669,17670] 
set surface_color,  pcol16, surf_pocket16 
set_color pcol17 = [0.902,0.361,0.714]
select surf_pocket17, protein and id [13182,13187,13475,13478,13181,13529,13472,13477,13328,13484,13511,13513,13525,13444,13210,13212,13213,13447,13449,13451,13207,13209,13211,13298,13292,13296] 
set surface_color,  pcol17, surf_pocket17 
set_color pcol18 = [0.702,0.278,0.510]
select surf_pocket18, protein and id [14221,14251,14249,14252,15052,14223,14225,14218,14226,14188] 
set surface_color,  pcol18, surf_pocket18 
set_color pcol19 = [0.902,0.361,0.596]
select surf_pocket19, protein and id [19320,17425,17428,17432,19298,19312,15708,15710,15711,15717,19297,15747,17740,15373,17469,15371,17458,15374,15402,15403,17466,15660,15685,15682,15400,15686,15688,15396,15398,15683] 
set surface_color,  pcol19, surf_pocket19 
set_color pcol20 = [0.702,0.278,0.416]
select surf_pocket20, protein and id [719,718,716,711,715,782,807,1008,742,733,743,706,772,769,809,1027,1026,1024] 
set surface_color,  pcol20, surf_pocket20 
set_color pcol21 = [0.902,0.361,0.478]
select surf_pocket21, protein and id [6169,6219,6176,6177,6178,6153,6170,6509,6539,6470,6471,6472,6128,6145,6497,6495,6496,6464,6507] 
set surface_color,  pcol21, surf_pocket21 
set_color pcol22 = [0.702,0.278,0.325]
select surf_pocket22, protein and id [4800,4764,4296,4776,4778,4780,4317,4763,4765,4767,4740,4847,4553,4520,4818,4821] 
set surface_color,  pcol22, surf_pocket22 
set_color pcol23 = [0.902,0.361,0.361]
select surf_pocket23, protein and id [7289,7276,7283,10712,10713,10714,10992,18366,7313,10736,18382,12471,18383,12473] 
set surface_color,  pcol23, surf_pocket23 
set_color pcol24 = [0.702,0.325,0.278]
select surf_pocket24, protein and id [2410,4528,2377,2349,2375,4539,2339,2342,4032,4048,4037,4039,4538,4540,4541,4543,4537] 
set surface_color,  pcol24, surf_pocket24 
set_color pcol25 = [0.902,0.478,0.361]
select surf_pocket25, protein and id [20272,17985,17986,18012,20227,20228,20229,20232,20254,17854,17855,17987,20285,20271] 
set surface_color,  pcol25, surf_pocket25 
set_color pcol26 = [0.702,0.416,0.278]
select surf_pocket26, protein and id [18954,20259,20188,18955,18231,18232,20163,20164,18949,18938,18952,20146,18199,18201] 
set surface_color,  pcol26, surf_pocket26 
set_color pcol27 = [0.902,0.596,0.361]
select surf_pocket27, protein and id [14251,14287,13950,14260,14288,14249,14223,14225,14088,14090,14226,13913,13915,13917,13920] 
set surface_color,  pcol27, surf_pocket27 
set_color pcol28 = [0.702,0.510,0.278]
select surf_pocket28, protein and id [17678,17681,7157,17021,17695,15044,17514,17489,15347,15349,15350,15351,17516,17546,17515,17686,17480,17490,17454,17485,17486,7139,7136,7141,15353] 
set surface_color,  pcol28, surf_pocket28 
set_color pcol29 = [0.902,0.714,0.361]
select surf_pocket29, protein and id [694,1001,971,949,950,953,951,674,693,695,696,697,699,263,266,284,265,677,293,998,968] 
set surface_color,  pcol29, surf_pocket29 
set_color pcol30 = [0.702,0.600,0.278]
select surf_pocket30, protein and id [13127,13129,13468,13124,13125,13438,13439,13123,13122,13236,13093,13094,13407,13463,13469] 
set surface_color,  pcol30, surf_pocket30 
set_color pcol31 = [0.902,0.831,0.361]
select surf_pocket31, protein and id [14094,14113,14211,14930,14928,14239,14240,14929,14934,14119,14121,14210,14971] 
set surface_color,  pcol31, surf_pocket31 
set_color pcol32 = [0.702,0.694,0.278]
select surf_pocket32, protein and id [7280,7282,7283,10710,10712,10713,10714,10370,7281,7312,10744,10398,10399,7313,10736] 
set surface_color,  pcol32, surf_pocket32 
set_color pcol33 = [0.851,0.902,0.361]
select surf_pocket33, protein and id [170,172,536,577,513,190,139] 
set surface_color,  pcol33, surf_pocket33 
   

deselect

orient
