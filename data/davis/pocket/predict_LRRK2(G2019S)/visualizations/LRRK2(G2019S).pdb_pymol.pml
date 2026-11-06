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

load "data/LRRK2(G2019S).pdb", protein
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

load "data/LRRK2(G2019S).pdb_points.pdb.gz", points
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
select surf_pocket1, protein and id [12447,12449,12450,12451,12452,10332,12453,12448,10423,12483,11168,12031,12036,12041,12046,12029,10445,10421,10424,10456,10448,10450,12472,12475,12078,12054,12053,12080,12426,12427,10449,12030,11964,11967,11965,11972,11975,10303,10307,10331,10334,10343,10345,11994,11995,11996,10337,12511,12509,12510,11154,11156,11155] 
set surface_color,  pcol1, surf_pocket1 
set_color pcol2 = [0.278,0.380,0.702]
select surf_pocket2, protein and id [16163,11119,13146,14265,14269,14270,13169,13168,13170,11110,11147,11117,11138,16161,16300,16138,16142,16123,16140,13605,16162,10336,10337,11145,12510,11143,11398,13617,14256,14267,13577,13614,13575,13576,12549,12556,12561,12566,12570,13149,13150,13147,12563,16298,12551,16281,16284,12473,12474,12569,12574,12467,12501,12508,16282] 
set surface_color,  pcol2, surf_pocket2 
set_color pcol3 = [0.361,0.400,0.902]
select surf_pocket3, protein and id [14161,14164,14187,14198,14199,14200,14158,14160,14186,13638,14163,14222,16096,16098,14220,13613,13608,13617,14255,15312,15313,15343,15344,16107,13682,13683,14166,14167,14165,14834,14835,14836,15280,13690,15301,15302,15307,15308,15305,15334,13691,14831,14838,14844,14833,16100,15827,15831,15833,16112,16114,16116,16105,16106,16108,16111,16102,16103,16104,13637,16119,16121,13639,13603,16118] 
set surface_color,  pcol3, surf_pocket3 
set_color pcol4 = [0.318,0.278,0.702]
select surf_pocket4, protein and id [11046,11047,11048,11049,13534,11324,11326,11303,11080,13532,11083,11074,11078,13569,13266,13267,13271,13272,13274,13276,13566,13555,13558,13268,13822,13824,13821,13530,13537,13538,13526,11086,13571,13552,13836,13834,13835,13511,13514,13515,13518,11088] 
set surface_color,  pcol4, surf_pocket4 
set_color pcol5 = [0.498,0.361,0.902]
select surf_pocket5, protein and id [15501,15070,15510,15158,15521,15017,15020,15021,15018,15071,15023,15024,15052,15054,15170,15173,15504,15505,16059,16061,15550,15939,15526,15544,15547,15527,15938,15523,16052,16054,16055,16057,15911,15918,15924] 
set surface_color,  pcol5, surf_pocket5 
set_color pcol6 = [0.455,0.278,0.702]
select surf_pocket6, protein and id [10603,10631,10634,10776,10778,10616,10594,10599,10605,10606,10607,10608,10609,10615,10622,10626,10619,10627,10628,10617,10641,11036,10604,11027,11023,10780,10783,10784] 
set surface_color,  pcol6, surf_pocket6 
set_color pcol7 = [0.675,0.361,0.902]
select surf_pocket7, protein and id [2759,2740,2742,2744,2745,2741,2743,2294,2296,2297,2305,2541,2542,2543,2567,3027,3028,2531,2592,2593,2758] 
set surface_color,  pcol7, surf_pocket7 
set_color pcol8 = [0.592,0.278,0.702]
select surf_pocket8, protein and id [14182,14799,14214,14216,14179,14412,14413,14414,14559,14556,14189,15240,15242,15276,15277,15243,15244,15246,15238,14591,14567] 
set surface_color,  pcol8, surf_pocket8 
set_color pcol9 = [0.851,0.361,0.902]
select surf_pocket9, protein and id [17129,18685,17502,17847,17853,18262,19498,19500,18272,18276,18269,18267,19494,19516,17507,17860,17871,17144,17145,17135,17137,17140,17154,17503,17493,17500] 
set surface_color,  pcol9, surf_pocket9 
set_color pcol10 = [0.702,0.278,0.671]
select surf_pocket10, protein and id [11681,14333,11665,11671,11678,11679,11382,14292,14387,14388,14317,14290,11359,14300,11357,13498,13495,13497,13507,13510,11692,11691] 
set surface_color,  pcol10, surf_pocket10 
set_color pcol11 = [0.902,0.361,0.773]
select surf_pocket11, protein and id [15762,15763,15369,15372,15794,15796,19961,19990,19991,19992,19999,20000,19998,20026,15790,16944,15783,15786,19933,19968,19953,19966,19993,19931,19954,19962,19963,19965,19967,20025] 
set surface_color,  pcol11, surf_pocket11 
set_color pcol12 = [0.702,0.278,0.533]
select surf_pocket12, protein and id [9866,9654,9656,9464,9663,9666,9456,9458,9635,9638,9123,9442,9443,9444,9876,10043,10053,9846,9850,9851,10030] 
set surface_color,  pcol12, surf_pocket12 
set_color pcol13 = [0.902,0.361,0.596]
select surf_pocket13, protein and id [481,466,429,458,459,465,482,445,446,742,469,694,428,431,722,735,737,732,733,734,736,765] 
set surface_color,  pcol13, surf_pocket13 
set_color pcol14 = [0.702,0.278,0.396]
select surf_pocket14, protein and id [2484,2982,2944,2946,2948,2950,2954,2491,2492,2493,2462,2464,2465,2466,2926,2953,2923,2949,2921,2922,2947,2951] 
set surface_color,  pcol14, surf_pocket14 
set_color pcol15 = [0.902,0.361,0.420]
select surf_pocket15, protein and id [16574,16476,16478,16572,16599,16559,16564,16424,16647,16537,16502,16509,16510,16653,16706,16654,16703] 
set surface_color,  pcol15, surf_pocket15 
set_color pcol16 = [0.702,0.302,0.278]
select surf_pocket16, protein and id [16075,16076,16084,15261,16077,15043,15260,16060,16059,16061,15297,15047,15052,15050,16058,15882,16083] 
set surface_color,  pcol16, surf_pocket16 
set_color pcol17 = [0.902,0.478,0.361]
select surf_pocket17, protein and id [16991,16993,19430,19449,19442,19446,19447,16756,17025,17050,17051,17054,19786,16757] 
set surface_color,  pcol17, surf_pocket17 
set_color pcol18 = [0.702,0.439,0.278]
select surf_pocket18, protein and id [12440,12442,12443,12572,12573,12437,12438,12441,12462,12465,12574,12551,12554,12650,12653,12624,12267,12268,12269,12306,12300,12434,12308,12436] 
set surface_color,  pcol18, surf_pocket18 
set_color pcol19 = [0.902,0.655,0.361]
select surf_pocket19, protein and id [11109,11396,11401,14266,11368,14279,11366,11111,13579,11367,11389] 
set surface_color,  pcol19, surf_pocket19 
set_color pcol20 = [0.702,0.576,0.278]
select surf_pocket20, protein and id [15674,19828,19831,17017,19861,19866,17010,17009,15660,15662,19812,19815,19814,19816] 
set surface_color,  pcol20, surf_pocket20 
set_color pcol21 = [0.902,0.831,0.361]
select surf_pocket21, protein and id [1516,1518,1520,1219,1220,1221,1237,1239,1554,1556,1542,1543,1544,1545] 
set surface_color,  pcol21, surf_pocket21 
set_color pcol22 = [0.686,0.702,0.278]
select surf_pocket22, protein and id [16520,16217,16499,15914,16498,15897,16195,15913,15915,15916] 
set surface_color,  pcol22, surf_pocket22 
   

deselect

orient
