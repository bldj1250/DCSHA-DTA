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

load "data/P08254.pdb", protein
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

load "data/P08254.pdb_points.pdb.gz", points
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
select surf_pocket1, protein and id [2756,2758,3299,3327,2926,2948,2950,2773,2790,2791,2792,2851,2852,3005,3190,3278,3280,3326,2929,365,366,2968,2964,2720,3298] 
set surface_color,  pcol1, surf_pocket1 
set_color pcol2 = [0.278,0.278,0.702]
select surf_pocket2, protein and id [748,749,1383,1385,2619,2651,2652,2649,735,1458,1460,1461,1381,1379,1380,1382,1377,2625,2899,762,1476,1482,1796,814,816,1485,1797,741,742,1469,1471] 
set surface_color,  pcol2, surf_pocket2 
set_color pcol3 = [0.576,0.361,0.902]
select surf_pocket3, protein and id [1441,1375,1377,1378,1390,1392,1407,2908,1367,1380,1382,2910,733,735,1440,1462,296,298,299,300,294,258,1411,1433,309,297] 
set surface_color,  pcol3, surf_pocket3 
set_color pcol4 = [0.616,0.278,0.702]
select surf_pocket4, protein and id [2459,2598,2600,2462,1491,1504,2233,2235,2599,1495,2582,1503,2252,2253,841,2585,2593,2580,875,2230,2234] 
set surface_color,  pcol4, surf_pocket4 
set_color pcol5 = [0.902,0.361,0.792]
select surf_pocket5, protein and id [3436,3438,3423,3424,3425,3426,3427,3704,3705,3143,3680,3141,3142,3681,3702,3176,3244,3246,3271,3388,3179] 
set surface_color,  pcol5, surf_pocket5 
set_color pcol6 = [0.702,0.278,0.447]
select surf_pocket6, protein and id [1347,1551,1297,1312,1550,1512,1514,1516,1345,1344,2541,1281,1283,956,957,1279,1536,1509,1510,1295] 
set surface_color,  pcol6, surf_pocket6 
set_color pcol7 = [0.902,0.361,0.361]
select surf_pocket7, protein and id [3795,3639,3583,3584,3586,3657,3779,3780,3781,3782,3791,3792,3796,3752,3534,3545,3547,2507] 
set surface_color,  pcol7, surf_pocket7 
set_color pcol8 = [0.702,0.447,0.278]
select surf_pocket8, protein and id [1975,1977,1698,1700,1701,1702,1932,1933,1699,1847,1848,1849,1852,1854,1836,1838,1983,1969,1887,1892,1903,1898,1906,1868] 
set surface_color,  pcol8, surf_pocket8 
set_color pcol9 = [0.902,0.792,0.361]
select surf_pocket9, protein and id [469,471,472,426,479,384,392,394,395,396,422,414,421,378,505,254,222,427,428,624,625,619] 
set surface_color,  pcol9, surf_pocket9 
   

deselect

orient
