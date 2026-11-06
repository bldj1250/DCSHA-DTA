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

load "data/NIM1.pdb", protein
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

load "data/NIM1.pdb_points.pdb.gz", points
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
select surf_pocket1, protein and id [810,811,812,1601,1696,1699,1700,1713,1578,1714,1722,1724,1579,1725,1726,1222,637,639,641,693,695,696,1617,1619,680,643,646,648,650,652,664,653,656,3429,3431,3434,3418,3425,3436,638,1203,1067,1068,1069,1616,1618,1690,1693,1694,1208,1225,1228,794,932,934,964,931,900,901,926,929,1715,869,902,667,669,670,671,672,3462,828,857,1247,1249,1250,1615,1588,1589,1590,1229,1238,1239] 
set surface_color,  pcol1, surf_pocket1 
set_color pcol2 = [0.278,0.278,0.702]
select surf_pocket2, protein and id [3193,3185,3216,1663,1665,1053,1052,1421,2629,2631,1637,1635,1638,1657,1419,1420,1040,1042,1044,1077,1080,3125,3122,3153,3158,3159,3154,3157,3146,3148,2654,1211,1680,1043,1681] 
set surface_color,  pcol2, surf_pocket2 
set_color pcol3 = [0.576,0.361,0.902]
select surf_pocket3, protein and id [3374,3376,3379,2159,2147,2169,1292,1268,1296,2093,2133,2134,1269,1854,3398,3420,3423,3402,2214,3399,1865,3375,2120] 
set surface_color,  pcol3, surf_pocket3 
set_color pcol4 = [0.616,0.278,0.702]
select surf_pocket4, protein and id [578,143,144,145,146,148,149,407,183,187,193,137,3048,3050,2942,373,375,2944,184,3037,2982,3032,3034,3036,3040,3042,3024,2976,123] 
set surface_color,  pcol4, surf_pocket4 
set_color pcol5 = [0.902,0.361,0.792]
select surf_pocket5, protein and id [1908,1898,1930,2223,1835,1847,3449,3451,3452,3454,3453,3455,3456,1817,1818,1826,1827,1828,1830,1897,1910,2191,2221,1871] 
set surface_color,  pcol5, surf_pocket5 
set_color pcol6 = [0.702,0.278,0.447]
select surf_pocket6, protein and id [929,930,1813,1814,894,3458,3462,895,3463,3467,1722,1724,1829,3450,1819] 
set surface_color,  pcol6, surf_pocket6 
set_color pcol7 = [0.902,0.361,0.361]
select surf_pocket7, protein and id [559,609,820,1180,1179,689,705,1160,1161,1162,561,563,1138,1139,533,549,535,513] 
set surface_color,  pcol7, surf_pocket7 
set_color pcol8 = [0.702,0.447,0.278]
select surf_pocket8, protein and id [1767,1485,1768,1769,1978,1981,1982,1969,1994,2499,2502,2517,2479,2507,2505,2510,2017,1991] 
set surface_color,  pcol8, surf_pocket8 
set_color pcol9 = [0.902,0.792,0.361]
select surf_pocket9, protein and id [515,516,513,146,148,433,142,549,564,565,557,561,1136,1138] 
set surface_color,  pcol9, surf_pocket9 
   

deselect

orient
