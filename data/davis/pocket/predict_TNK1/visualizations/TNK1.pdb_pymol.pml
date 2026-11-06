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

load "data/TNK1.pdb", protein
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

load "data/TNK1.pdb_points.pdb.gz", points
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
select surf_pocket1, protein and id [1569,970,1572,1574,1021,1022,969,972,973,975,3828,976,978,980,3827,2020,2022,2023,2024,1157,1158,1001,986,994,984,985,2015,2017,1411,1526,1527,1942,1943,1141,1545,1548,1549,1566,1543,1921,1927,1913] 
set surface_color,  pcol1, surf_pocket1 
set_color pcol2 = [0.278,0.310,0.702]
select surf_pocket2, protein and id [1001,1002,1003,1004,988,991,993,985,2024,3825,3827,2046,1887,1888,1915,1916,1919,2181,2182,2188,2189,2191,2194,3858,3857,1886,1927,2177,2175,2176,2178,2179,2180] 
set surface_color,  pcol2, surf_pocket2 
set_color pcol3 = [0.498,0.361,0.902]
select surf_pocket3, protein and id [877,860,854,861,1090,1091,5045,1084,5044,5022,879,1069,1066,1068,901,902,1074] 
set surface_color,  pcol3, surf_pocket3 
set_color pcol4 = [0.525,0.278,0.702]
select surf_pocket4, protein and id [595,596,1464,1479,1256,1257,1491,1495,619,578,615,590,594,1220,626,1466,609,1467,1494,1463] 
set surface_color,  pcol4, surf_pocket4 
set_color pcol5 = [0.851,0.361,0.902]
select surf_pocket5, protein and id [455,491,493,495,390,516,318,320,348] 
set surface_color,  pcol5, surf_pocket5 
set_color pcol6 = [0.702,0.278,0.600]
select surf_pocket6, protein and id [1123,844,1084,1083,853,854,1122,1439,1069,1068] 
set surface_color,  pcol6, surf_pocket6 
set_color pcol7 = [0.902,0.361,0.596]
select surf_pocket7, protein and id [2861,2865,2858,2317,2319,1822,1823,1824,2316,2853,2855,1800,2874,2869,2872,1825] 
set surface_color,  pcol7, surf_pocket7 
set_color pcol8 = [0.702,0.278,0.325]
select surf_pocket8, protein and id [868,869,5076,5073,1352,1341,676,674,1340,663,1343,1344,679,660,675,1351] 
set surface_color,  pcol8, surf_pocket8 
set_color pcol9 = [0.902,0.478,0.361]
select surf_pocket9, protein and id [1915,1919,1912,3849,3851,1589,1590,1591,1592,2224,2477,2473,2475,2476,2471,3822,3827,3820] 
set surface_color,  pcol9, surf_pocket9 
set_color pcol10 = [0.702,0.510,0.278]
select surf_pocket10, protein and id [1665,1667,2683,2684,2451,2453,2454,1663,1668,1613,1669,1616] 
set surface_color,  pcol10, surf_pocket10 
set_color pcol11 = [0.902,0.831,0.361]
select surf_pocket11, protein and id [1792,1795,2338,1849,1821] 
set surface_color,  pcol11, surf_pocket11 
   

deselect

orient
