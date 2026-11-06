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

load "data/PRKCH.pdb", protein
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

load "data/PRKCH.pdb_points.pdb.gz", points
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
select surf_pocket1, protein and id [3958,3959,3961,3963,3301,3956,3879,2918,2915,2878,2879,2866,2871,2873,2859,2861,2865,5175,5177,5178,5148,3856,5152,3853,3865,3490,3491,3854,3880,3508,3033,3034,3035,3184,3220,3436,3439,3440,2900,2901,2902,2917,5140,5142,3465,3464,3509,3511,5145,2863,3018,3445,3461,3467,2860,3965,3841,2891,2895,3050,2899,2882,2887] 
set surface_color,  pcol1, surf_pocket1 
set_color pcol2 = [0.278,0.310,0.702]
select surf_pocket2, protein and id [1450,1435,1645,1646,2122,2123,2124,2134,740,742,1423,1434,1611,1612,739,745,1430,1431,1469,247,1470,2132,2157,2139,2296,741,743,1461,1454,1456,1457,1458,212,213,193,231,233,234,235,238,218,2309,2310,229,232,242,244,245,246,248,2311,2312,2315,2308,738,761,737,762,728,763,725,210,1660,1661,1678,1680,1681,2342,1319,1320,1323,1418,1444,1483,1484,1451,1462,1467] 
set surface_color,  pcol2, surf_pocket2 
set_color pcol3 = [0.498,0.361,0.902]
select surf_pocket3, protein and id [1773,2369,1508,1687,1787,2368,2370,2377,2378,2381,2385,2252,2254,1988,2340,2351,2354,2349,1389,2104,2267,2269,2270,2271,2105,2116,2117,1510,1513,1516,1532,1535,1507,2253,1780,2401,2396,2399,1774,2395] 
set surface_color,  pcol3, surf_pocket3 
set_color pcol4 = [0.525,0.278,0.702]
select surf_pocket4, protein and id [3978,3979,3980,3185,3964,2893,2895,2897,2898,2882,2887,3986,3988,3822,3823,3824,3965,3841,1594,1595,1596,1598,1599,1597,3963,2879,2873,3034,3035,3113,3130,3131,3132,3152,3154,4074,4080,4090,3987,4093,4095,4096,1591,1593,1601,1592,1301,3089,3161,3049] 
set surface_color,  pcol4, surf_pocket4 
set_color pcol5 = [0.851,0.361,0.902]
select surf_pocket5, protein and id [743,4447,1461,1458,4085,4169,4172,740,742,1434,1436,1438,1440,1611,1612,745,4079,4083,4192,733,1320,1323,1439,1600,1601,1437,1442,4081,4082,4084,4086,4440,4475,4472,4474,4468,4175] 
set surface_color,  pcol5, surf_pocket5 
set_color pcol6 = [0.702,0.278,0.600]
select surf_pocket6, protein and id [4223,4226,4233,4222,4213,4766,4767,4768,4229,4754,4023,4231,4232,4236,4158,4713,4712,4714,4758,4761,4756,4790,4021,4026,4027,4031,4055,4040,4041,4047,4039,4211,4206,4715,4718,4722,3750,4259,4263,4799,4800,4793,4798] 
set surface_color,  pcol6, surf_pocket6 
set_color pcol7 = [0.902,0.361,0.596]
select surf_pocket7, protein and id [713,760,762,728,695,698,763,217,218,219,312,313,314,727,721,711] 
set surface_color,  pcol7, surf_pocket7 
set_color pcol8 = [0.702,0.278,0.325]
select surf_pocket8, protein and id [3705,3706,4959,3702,4831,3704,4926,4920,3723,3726,3727] 
set surface_color,  pcol8, surf_pocket8 
set_color pcol9 = [0.902,0.478,0.361]
select surf_pocket9, protein and id [1318,1319,1320,1323,684,749,753,357,683,355,446,688,1313,1316,1317,1307,685,687,371,686,427,447] 
set surface_color,  pcol9, surf_pocket9 
set_color pcol10 = [0.702,0.510,0.278]
select surf_pocket10, protein and id [1351,1301,1306,1327,1328,1422,1348,1637,1419,1324,1610,1612,1720,3113,3104,1330,1334,3120] 
set surface_color,  pcol10, surf_pocket10 
set_color pcol11 = [0.902,0.831,0.361]
select surf_pocket11, protein and id [3615,3612,3614,4900,3650,4997,5003,4896,3646,3638,4908] 
set surface_color,  pcol11, surf_pocket11 
   

deselect

orient
