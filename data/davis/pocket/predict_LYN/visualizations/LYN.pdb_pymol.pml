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

load "data/LYN.pdb", protein
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

load "data/LYN.pdb_points.pdb.gz", points
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
select surf_pocket1, protein and id [2730,3599,3600,2728,2729,2614,3591,3519,3520,3132,2725,2613,2722,3066,3068,3083,3084,2713,2945,2947,3110,3106,3109,2571,2563,2564,2566,2568,2556,2558,3129,2611,2557,2560,3101,3499,3505,3497,2570,3161,3135,3069,2572,2598,3593,3609,2946,3594,3615,2873,3621] 
set surface_color,  pcol1, surf_pocket1 
set_color pcol2 = [0.490,0.278,0.702]
select surf_pocket2, protein and id [1626,1628,1650,4516,4539,4541,4542,4546,4543,4556,4576,4577,4578,1960,1962,1940,1942,1944,3313,4508,4513,4518,3283,3285,3288,3290,3291,1619,1624,1652,1644,1645,1651,1949,1951,1946,1658,1656,1647,1648,1649,1950,1969,3255,3257,3256,3260,3261,3263,1921,1685,3266,1686,1935] 
set surface_color,  pcol2, surf_pocket2 
set_color pcol3 = [0.902,0.361,0.682]
select surf_pocket3, protein and id [1600,1559,1567,1580,1586,1577,1438,1068,1459,1511,1527,1513,1515,1510,1512,1439,2365,2367,1079,1081,2345,2368,1536,1575,1576,2343,1533,1572,2350] 
set surface_color,  pcol3, surf_pocket3 
set_color pcol4 = [0.702,0.408,0.278]
select surf_pocket4, protein and id [3697,3757,3759,3761,3700,3740,3713,3634,3635,3620,3636,3639,3460,3444,3452,3453,3454,3456,3464,3466,2592,2594,3468,3768] 
set surface_color,  pcol4, surf_pocket4 
   

deselect

orient
