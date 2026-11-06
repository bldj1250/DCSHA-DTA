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

load "data/GSK3B.pdb", protein
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

load "data/GSK3B.pdb_points.pdb.gz", points
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
select surf_pocket1, protein and id [1597,1603,1604,1605,1488,1036,624,625,513,459,464,510,512,465,467,476,475,499,1598,1599,1601,1500,1042,1047,1058,1062,608,1055,458,460,461,462,1069,1074,1076,1086,1515,1516] 
set surface_color,  pcol1, surf_pocket1 
set_color pcol2 = [0.329,0.278,0.702]
select surf_pocket2, protein and id [269,519,523,435,437,438,522,525,416,283,414,191,192,282,635,907,1014,617,616,925,633,521] 
set surface_color,  pcol2, surf_pocket2 
set_color pcol3 = [0.698,0.361,0.902]
select surf_pocket3, protein and id [735,489,639,641,642,647,493,488,490,491,657,658,659,660,713,714,1618,715,719,1620,61,709,716,703] 
set surface_color,  pcol3, surf_pocket3 
set_color pcol4 = [0.702,0.278,0.639]
select surf_pocket4, protein and id [1537,1534,1536,1162,1248,1245,1247,1249,1251,1223,2801,1216,1123,1119,1124,1160,1287,1146,1147,1144,1538] 
set surface_color,  pcol4, surf_pocket4 
set_color pcol5 = [0.902,0.361,0.545]
select surf_pocket5, protein and id [1892,1893,1895,2615,2635,1393,1920,1388,1389,1390,1396,1891,1889,1885,1886,1362,1365,2643,2942,2944,2633] 
set surface_color,  pcol5, surf_pocket5 
set_color pcol6 = [0.702,0.353,0.278]
select surf_pocket6, protein and id [3067,3066,3034,2755,2778,2842,2761,2763,2760,2847,2870,2858,2736,2872,2855,2834,2840,3031] 
set surface_color,  pcol6, surf_pocket6 
set_color pcol7 = [0.902,0.729,0.361]
select surf_pocket7, protein and id [1840,2108,2313,2315,2316,1826,1832,1833,2289,1838,2284,2286,1828,1830,2078,2083] 
set surface_color,  pcol7, surf_pocket7 
   

deselect

orient
