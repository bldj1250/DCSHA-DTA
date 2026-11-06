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

load "data/GRK1.pdb", protein
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

load "data/GRK1.pdb_points.pdb.gz", points
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
select surf_pocket1, protein and id [1578,2573,2574,2575,1579,1581,1583,1585,1625,1627,1628,2146,2600,2677,2601,1720,2125,2132,1734,1735,1736,1590,1591,2683,2685,2586,2126,2678,2679,2681,1893,1573,1575,1576,3840,3849,3851,3853,1572,2201,2173,2174,3858,3859,3860,3861,3856,2147,2155,2163,2164,2165,2167] 
set surface_color,  pcol1, surf_pocket1 
set_color pcol2 = [0.329,0.278,0.702]
select surf_pocket2, protein and id [3057,3058,3059,3087,3097,3098,2848,3122,3124,3134,2189,2190,2576,2577,2578,2831,2835,2837,2847,3216,3125,3129,2825,2232,2235,3089,3136,2231,2233] 
set surface_color,  pcol2, surf_pocket2 
set_color pcol3 = [0.698,0.361,0.902]
select surf_pocket3, protein and id [1866,1894,2695,2696,2697,2703,2705,1867,1605,1607,1864,1863,1733,1735,1736,1753,2684,1590,1591,1594,1598,2685,1583,1628] 
set surface_color,  pcol3, surf_pocket3 
set_color pcol4 = [0.702,0.278,0.639]
select surf_pocket4, protein and id [1695,1696,1713,2134,2135,2133,2663,2009,2010,2011,4125,4158,4159,4160,4193,4194,1701,2139,2141] 
set surface_color,  pcol4, surf_pocket4 
set_color pcol5 = [0.902,0.361,0.545]
select surf_pocket5, protein and id [1539,1516,1486,1483,1485,2051,2052,1490,2067,1727,1744,1745,2104] 
set surface_color,  pcol5, surf_pocket5 
set_color pcol6 = [0.702,0.353,0.278]
select surf_pocket6, protein and id [2767,2952,3517,3519,3535,3543,3534,3530,3531,2954,2955,3521,2777,2944,2768,3548,3550] 
set surface_color,  pcol6, surf_pocket6 
set_color pcol7 = [0.902,0.729,0.361]
select surf_pocket7, protein and id [1968,2448,2418,3724,2440,2476,2477,1987,1989,3722,3720,3723,3725] 
set surface_color,  pcol7, surf_pocket7 
   

deselect

orient
