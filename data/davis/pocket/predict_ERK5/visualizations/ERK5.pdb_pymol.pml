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

load "data/ERK5.pdb", protein
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

load "data/ERK5.pdb_points.pdb.gz", points
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
select surf_pocket1, protein and id [5669,5673,5688,5690,5676,5678,5680,5675,5692,5693,5694,5614,5606,5608,1462,1467,1117,1118,1119,1120,1465,1788,1762,1763,1784,1787,1452,1453,1454,5679,5629,1101,1126,5639,5636,2066,1800,1798] 
set surface_color,  pcol1, surf_pocket1 
set_color pcol2 = [0.329,0.278,0.702]
select surf_pocket2, protein and id [1575,481,5664,1749,5719,483,1598,1475,1437,1453,1454,1755,1596,5673,5690,5675,5694,5718,5720,1763,1753,1467,469,472] 
set surface_color,  pcol2, surf_pocket2 
set_color pcol3 = [0.698,0.361,0.902]
select surf_pocket3, protein and id [5457,5455,5458,5434,5465,4076,2769,5435,1520,1249,1250,1251,1253,1252,1255,2772,2767,1247] 
set surface_color,  pcol3, surf_pocket3 
set_color pcol4 = [0.702,0.278,0.639]
select surf_pocket4, protein and id [1848,2116,1767,1770,2126,2118,2122,2124,6105,1807,1811,1837,1741,1744,6126,1771,1737,1738,1739,6114,6115,6116,6110,6113,1842,1845,1862,2296,2324] 
set surface_color,  pcol4, surf_pocket4 
set_color pcol5 = [0.902,0.361,0.545]
select surf_pocket5, protein and id [1283,1292,1253,1255,1286,2811,2813,4077,2767,2765,2809,1322,1293,1295,862,861,854,4121,4076,5434,2769,5435] 
set surface_color,  pcol5, surf_pocket5 
set_color pcol6 = [0.702,0.353,0.278]
select surf_pocket6, protein and id [1707,1666,1607,1663,1615,2887,2885,2924,2927,2888,1610,1692,1694,2922,2920,1623] 
set surface_color,  pcol6, surf_pocket6 
set_color pcol7 = [0.902,0.729,0.361]
select surf_pocket7, protein and id [1822,2184,1820,2617,1855,2185,2160,2191] 
set surface_color,  pcol7, surf_pocket7 
   

deselect

orient
