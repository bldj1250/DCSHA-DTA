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

load "data/STK36.pdb", protein
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

load "data/STK36.pdb_points.pdb.gz", points
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
select surf_pocket1, protein and id [1065,1144,1146,702,704,1053,85,1080,1081,658,682,663,679,694,683,695,696,267,268,422,1147,1150,1152,1153,1154,266,455,456,529,657,144,86,89,141,143,88,250,83,263,119,90,91,93,115,126] 
set surface_color,  pcol1, surf_pocket1 
set_color pcol2 = [0.329,0.278,0.702]
select surf_pocket2, protein and id [6019,6021,6317,6318,6549,6550,6567,6603,6604,6629,6630,6268,6267,6286,6294,6295,6296,7151,7152] 
set surface_color,  pcol2, surf_pocket2 
set_color pcol3 = [0.698,0.361,0.902]
select surf_pocket3, protein and id [6813,6817,6827,6776,7287,7289,6822,6826,6866,6824,315,6782,6788,333,330,318,320,327,328,7314,7358,7309,7337,7338,7354,7359,7362,7366,7313,7315,6846,7370,6849] 
set surface_color,  pcol3, surf_pocket3 
set_color pcol4 = [0.702,0.278,0.639]
select surf_pocket4, protein and id [6542,6537,5636,5639,5640,5264,5265,5205,5208,5266,5269,5270,5637,6534,6536,5209,5214,6529,5203,5620,6556,5262,5263,5267,5260,5237,5239,5240] 
set surface_color,  pcol4, surf_pocket4 
set_color pcol5 = [0.902,0.361,0.545]
select surf_pocket5, protein and id [1915,2253,2206,2196,2200,1908,1912,1916,1935,1953,1955,1951,1976,2276,2277,1429,1437,1438,2175,2191,2193,2212,1445,1439,1956,1959,1446,1428,2252,2251] 
set surface_color,  pcol5, surf_pocket5 
set_color pcol6 = [0.702,0.353,0.278]
select surf_pocket6, protein and id [1178,1180,118,120,122,116,326,115,356,358,385,354,355,382,387,388,423,390,393,1169,1167] 
set surface_color,  pcol6, surf_pocket6 
set_color pcol7 = [0.902,0.729,0.361]
select surf_pocket7, protein and id [4678,5201,5180,5182,5587,5159,5160,4648,5559,5562,5203,5906,5585,5176,5178,5179,5204,5177] 
set surface_color,  pcol7, surf_pocket7 
   

deselect

orient
