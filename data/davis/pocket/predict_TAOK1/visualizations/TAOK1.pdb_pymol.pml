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

load "data/TAOK1.pdb", protein
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

load "data/TAOK1.pdb_points.pdb.gz", points
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
select surf_pocket1, protein and id [6667,6669,1826,6640,6676,5602,6677,5625,5630,5638,1816,1818,1819,1815,1821,1803,1805,1806,1807,3684,3655,3683,3685,5659,5661,5662,5663,5664,5665,6699,6702,1820,3712,3715,5604,5605,3692,5601,5603,5628,3693,6700,1840,1841,1843,1845,1846,1847,6668,1835,1838,1552,1553,1435,1437,1873,1882,1849,1851,1531,6726,6696,6697,6698,6734,6723,6724,6725,6760,6664,6666,6692,6694,6670,6671,6673,5570] 
set surface_color,  pcol1, surf_pocket1 
set_color pcol2 = [0.302,0.278,0.702]
select surf_pocket2, protein and id [451,327,861,326,866,434,883,887,276,1347,1235,1349,300,1345,292,295,291,324,925,3569,3570,3511,283,285,278,281,3571,904,906,1244,1268,897,898,1267,1234,1252,1455,1242,1243,1342,1343,1340,720,722] 
set surface_color,  pcol2, surf_pocket2 
set_color pcol3 = [0.631,0.361,0.902]
select surf_pocket3, protein and id [947,924,3536,1472,1782,1783,925,3569,3570,3511,3597,3568,285,3571,949,3562,1235,292,1757,1707,1735,1747,915,917,1470,1487,1233,1234,1252,1454,1488,1241,1242,1243,904,906,1244] 
set surface_color,  pcol3, surf_pocket3 
set_color pcol4 = [0.678,0.278,0.702]
select surf_pocket4, protein and id [299,312,3606,3607,3605,313,289,3638,3663,3639,515,303,305,473,545,546,470,474] 
set surface_color,  pcol4, surf_pocket4 
set_color pcol5 = [0.902,0.361,0.682]
select surf_pocket5, protein and id [3723,3692,3724,3689,3691,1818,1819,1811,1461,1462,3654,3656,1838,1448,1435,1437] 
set surface_color,  pcol5, surf_pocket5 
set_color pcol6 = [0.702,0.278,0.341]
select surf_pocket6, protein and id [1347,1370,1235,1349,300,310,311,295,1218,1455] 
set surface_color,  pcol6, surf_pocket6 
set_color pcol7 = [0.902,0.522,0.361]
select surf_pocket7, protein and id [3846,3847,3848,3849,5475,3871,3877,3872,3850,6824,6825,5512,3880,3878,5408,5451,5438,5445,5446,5442,3907] 
set surface_color,  pcol7, surf_pocket7 
set_color pcol8 = [0.702,0.596,0.278]
select surf_pocket8, protein and id [2270,2271,2287,2284,2286,2288,1051,1052,1075,2272,2275,2280,1103,1076,2312] 
set surface_color,  pcol8, surf_pocket8 
   

deselect

orient
