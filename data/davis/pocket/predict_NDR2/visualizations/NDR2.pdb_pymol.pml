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

load "data/NDR2.pdb", protein
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

load "data/NDR2.pdb_points.pdb.gz", points
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
select surf_pocket1, protein and id [967,829,830,831,832,833,846,796,788,793,807,798,811,800,808,1776,1761,1938,1939,2294,2293,986,823,1773,1423,1424,1425,1772,1440,1441,952,789,843,845,791,3359,3387,3388,2303,2306,3365,3367,3369,1126,1161,1373,1875,969,1374,1880,1881,1882,1901,1911,1872,1227,1799,1800,1874,1379,1395,1162] 
set surface_color,  pcol1, surf_pocket1 
set_color pcol2 = [0.329,0.278,0.702]
select surf_pocket2, protein and id [2812,2814,2831,2188,2189,2126,2618,2620,2819,2827,2829,2735,2736,2650,2737,2632,2119,2125,2127,2128,2130,2797] 
set surface_color,  pcol2, surf_pocket2 
set_color pcol3 = [0.698,0.361,0.902]
select surf_pocket3, protein and id [1939,2286,2284,2290,2291,1774,1963,2335,2336,2285,1775,2261,2362,1440,2257,2370,1759,2360,1743,1962] 
set surface_color,  pcol3, surf_pocket3 
set_color pcol4 = [0.702,0.278,0.639]
select surf_pocket4, protein and id [1235,1830,1860,1859,1195,1197,3210,1199,3209,1828,1829,3745,3746,3748,1383,3751,1812,1814,1815,1816,1817] 
set surface_color,  pcol4, surf_pocket4 
set_color pcol5 = [0.902,0.361,0.545]
select surf_pocket5, protein and id [3660,596,3662,360,571,568,357,358,3692,594,398,359] 
set surface_color,  pcol5, surf_pocket5 
set_color pcol6 = [0.702,0.353,0.278]
select surf_pocket6, protein and id [3046,3049,2467,2468,1651,1683,3054,1681,3061] 
set surface_color,  pcol6, surf_pocket6 
set_color pcol7 = [0.902,0.729,0.361]
select surf_pocket7, protein and id [2208,2206,2211,2121,2212,2288,2246,2209,2249,2656,2651,2220] 
set surface_color,  pcol7, surf_pocket7 
   

deselect

orient
