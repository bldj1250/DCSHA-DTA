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

load "data/SIK.pdb", protein
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

load "data/SIK.pdb_points.pdb.gz", points
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
select surf_pocket1, protein and id [308,310,311,428,431,432,433,830,251,258,415,847,255,252,256,1350,617,618,693,829,1355,1351,585,1353,1356,1348,1247,1259,884,882,1274,1275,253,855,849,874] 
set surface_color,  pcol1, surf_pocket1 
set_color pcol2 = [0.278,0.310,0.702]
select surf_pocket2, protein and id [4475,1490,4503,4505,1495,1498,1510,1508,4454,4479,5022,4453,1381,1492,1807,1517,1518,1781,1488,1834,5047,5048,5010,5016,5017,1484,1479,5082,5083,5056,1812,1817,1828,1829,5014,5015,1857,1809,4500,4507,4501,4530,4560,4562] 
set surface_color,  pcol2, surf_pocket2 
set_color pcol3 = [0.498,0.361,0.902]
select surf_pocket3, protein and id [2761,836,840,723,2721,2756,2758,2759,2760,2798,394,2754,698,701,839,400,2787,2789,654,656,651,703,2748,838,1335,1336,1291,864,2795,2796,2797,1292,1302,844,862,861,863,662,663,665,677] 
set surface_color,  pcol3, surf_pocket3 
set_color pcol4 = [0.525,0.278,0.702]
select surf_pocket4, protein and id [1742,1775,1780,1782,1767,1768,1770,4561,4560,4559,4562,1766,898,927,928,929,931,933,934,939,4586,1250,1528,4521,4501,4530,4502,4498,4500,901,903,904,1517,1518,1781,4503,4505] 
set surface_color,  pcol4, surf_pocket4 
set_color pcol5 = [0.851,0.361,0.902]
select surf_pocket5, protein and id [1355,1357,4446,4449,1382,4443,4444,4445,4474,4463,4464,4465,4469,271,4468,554,285,1370,1353,1356,311,431,432,433,296,263,270,297,1246,1247,1259,4526,4495,1234,1235,1383] 
set surface_color,  pcol5, surf_pocket5 
set_color pcol6 = [0.702,0.278,0.600]
select surf_pocket6, protein and id [743,3539,3541,5953,5955,180,3526,190,192,193,3528,3510,745,746,741,748,752,2661,731,2673,2674,5956] 
set surface_color,  pcol6, surf_pocket6 
set_color pcol7 = [0.902,0.361,0.596]
select surf_pocket7, protein and id [1056,1058,1059,1063,1029,2253,2329,2331,2258,1018,1019,2288,2287,1028,1025,1027,2198,1060,1061,1062,1065,1066,2353,2330,1072,2354,1074] 
set surface_color,  pcol7, surf_pocket7 
set_color pcol8 = [0.702,0.278,0.325]
select surf_pocket8, protein and id [702,703,650,2385,2386,2388,2725,2726,2728,2406,2390,2713,2716,2447,2441,2443,2446,2613,640,647,623,2657,2635,2639,2405,2404,2431] 
set surface_color,  pcol8, surf_pocket8 
set_color pcol9 = [0.902,0.478,0.361]
select surf_pocket9, protein and id [371,372,2704,2535,2539,2540,2684,3513,2532,2533,3512,2525,5535,2526,3504,3502,3501,3505,191,193] 
set surface_color,  pcol9, surf_pocket9 
set_color pcol10 = [0.702,0.510,0.278]
select surf_pocket10, protein and id [788,3569,3570,805,808,787,440,441,786,3553,178,3540,3546,3549,319] 
set surface_color,  pcol10, surf_pocket10 
set_color pcol11 = [0.902,0.831,0.361]
select surf_pocket11, protein and id [1565,1568,5109,5068,5075,5069,5074,1561,1585,1864,1865,5076,5078,5080,1478,1480,1481,1482,1483,1485,1487,1835,5082,1570] 
set surface_color,  pcol11, surf_pocket11 
   

deselect

orient
