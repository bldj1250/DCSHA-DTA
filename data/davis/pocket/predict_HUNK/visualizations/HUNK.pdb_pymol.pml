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

load "data/HUNK.pdb", protein
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

load "data/HUNK.pdb_points.pdb.gz", points
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
select surf_pocket1, protein and id [657,658,830,673,1599,1613,1614,1615,1616,825,787,788,793,796,766,672,755,767,762,757,790,1600,511,502,503,527,526,506,512,519,521,515,1621,1622,1623,1598,543] 
set surface_color,  pcol1, surf_pocket1 
set_color pcol2 = [0.365,0.278,0.702]
select surf_pocket2, protein and id [1765,2079,5224,5225,5226,2075,5221,5223,5220,5222,5216,2035,2043,2119,2120,5242,5236,5239,5248,5247,2045,2022,2047,5283,2049,2064,5286,5256,2053,1752,1754,1761,1774,1776,5246,1485,1486] 
set surface_color,  pcol2, surf_pocket2 
set_color pcol3 = [0.792,0.361,0.902]
select surf_pocket3, protein and id [940,945,961,2959,2993,2995,891,896,2671,893,2644,2951,2961,2963,2954,1075,1078,1079,1080,2996,2997,2998,1555,901,908,910,1526,1575,1576,2988,3023,3024,1557,1543,1558,1530,1535,2672] 
set surface_color,  pcol3, surf_pocket3 
set_color pcol4 = [0.702,0.278,0.533]
select surf_pocket4, protein and id [1469,5172,5179,497,5174,1747,1749,1750,1754,5209,5211,5207,5246,1481,1484,1485,1486,1600,511,503,526,506,1452,1621,1622,1746,1623,1592,1482,1598,1494,5231,5220,5216,5236,5239,1599,657] 
set surface_color,  pcol4, surf_pocket4 
set_color pcol5 = [0.902,0.361,0.361]
select surf_pocket5, protein and id [1592,1596,485,490,540,542,543,483,484,1600,1509,1510,1108,487,1093,1107,1588,1591,1593,640,1071,1087,1089,657,829,656,1594] 
set surface_color,  pcol5, surf_pocket5 
set_color pcol6 = [0.702,0.533,0.278]
select surf_pocket6, protein and id [382,664,1045,1048,381,390,663,1024,449,531,534,536,550,551,554] 
set surface_color,  pcol6, surf_pocket6 
   

deselect

orient
