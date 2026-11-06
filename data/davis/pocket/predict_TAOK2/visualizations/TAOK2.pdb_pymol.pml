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

load "data/TAOK2.pdb", protein
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

load "data/TAOK2.pdb_points.pdb.gz", points
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
select surf_pocket1, protein and id [897,899,1235,908,909,910,1234,894,918,917,1224,1225,1226,1227,2855,1233,2852,943,2847,2849,2851,2854,2856,1738,2842,1773,1698,1478,1726,1334,1244,280,1336,271,273,266,269,1236,880,886,891,892,261,2506,2508,1338,1329,1238,1258,1259,1260,879,314,315,264,260,598,1331,1332,1339,437,438,1337,853,854,876,859,421,713] 
set surface_color,  pcol1, surf_pocket1 
set_color pcol2 = [0.278,0.298,0.702]
select surf_pocket2, protein and id [3902,1836,1838,1840,5743,5744,5745,5746,1522,1825,1826,1827,1831,1832,1834,1811,1806,1807,1808,1531,1864,1873,3913,3914,1423,1424,1540,1542,1543,1544,1425,1426,1427,1428,1829,3882,3883,2901,1810,1520,1538,1552,3911,3899,3900,3903,3905,5710,3944] 
set surface_color,  pcol2, surf_pocket2 
set_color pcol3 = [0.533,0.361,0.902]
select surf_pocket3, protein and id [1209,1211,1359,2909,283,1338,2868,1244,280,1336,273,1436,2908,2910,1226,1227,1210,1438,1439,1446,2856,1350,1354,1351,1337,288,296,298] 
set surface_color,  pcol3, surf_pocket3 
set_color pcol4 = [0.565,0.278,0.702]
select surf_pocket4, protein and id [1768,1772,1773,1774,2845,2844,1461,1463,1465,1787,2853,2854,2856,2871,2873,2881,2883,1479,2855,1445] 
set surface_color,  pcol4, surf_pocket4 
set_color pcol5 = [0.902,0.361,0.878]
select surf_pocket5, protein and id [8688,8689,8528,8747,8746,8400,8399,8465,8467,8714,8715,8716,8526,8527,8531,8532,8682,8407,8369,8367,8495,8497,8748,8524] 
set surface_color,  pcol5, surf_pocket5 
set_color pcol6 = [0.702,0.278,0.533]
select surf_pocket6, protein and id [7665,8084,8085,8221,8216,8217,8218,7666,7626,8246,8239,8241,8242] 
set surface_color,  pcol6, surf_pocket6 
set_color pcol7 = [0.902,0.361,0.490]
select surf_pocket7, protein and id [8623,8625,8626,8627,8628,8629,8630,8573,8574,8724,8539,9397,9400,9401,8758,8760,8603,8604,8601,8663,8636,8638] 
set surface_color,  pcol7, surf_pocket7 
set_color pcol8 = [0.702,0.329,0.278]
select surf_pocket8, protein and id [79,26,27,28,101,545,53,556,557,579,580,541,33] 
set surface_color,  pcol8, surf_pocket8 
set_color pcol9 = [0.902,0.620,0.361]
select surf_pocket9, protein and id [1067,2299,2265,1042,1044,1045,1071,2262,697,1095,1294,1296,1302,1303] 
set surface_color,  pcol9, surf_pocket9 
set_color pcol10 = [0.702,0.631,0.278]
select surf_pocket10, protein and id [1590,1137,1390,1136,1595,1596,1140,1604,2137,2139,2146,1594,1160] 
set surface_color,  pcol10, surf_pocket10 
   

deselect

orient
