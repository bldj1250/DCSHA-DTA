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

load "data/HIPK3.pdb", protein
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

load "data/HIPK3.pdb_points.pdb.gz", points
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
select surf_pocket1, protein and id [2878,2542,2853,2854,2858,2859,2862,2559,2560,5859,5861,5862,5863,5864,5865,1587,5846,1585,2575,2573,5849,5850,1603,1604,7123,7124,1595,1596,1598,2846,2848,2832,2835,2904,2584,2571,2572,2599,2714,2717,2718,2719,1575,1580,1583,1573,1577,1632,1634,1574,2207,2213,2199,2600,2022,1738,2156,2168,2181,2185,2541,2543,2747,1614,2722,2724,2725,2726,1878,2720,2727,1615,1612,1755,1635,1594,1618,1619,1753,1754,1605,1908,2161,2163,2160,2162,7132,2869] 
set surface_color,  pcol1, surf_pocket1 
set_color pcol2 = [0.616,0.278,0.702]
select surf_pocket2, protein and id [2877,2879,2891,2893,3141,2575,2230,2232,2234,5849,5855,5863,5864,3089,3142,2303,2305,2307,5872,3166,3134,3135] 
set surface_color,  pcol2, surf_pocket2 
set_color pcol3 = [0.902,0.361,0.361]
select surf_pocket3, protein and id [7091,7057,7056,7058,7085,2828,7089,2822,2843,7109,7111,1848,1849,1847,2798] 
set surface_color,  pcol3, surf_pocket3 
   

deselect

orient
