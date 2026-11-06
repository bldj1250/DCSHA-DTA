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

load "data/MERTK.pdb", protein
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

load "data/MERTK.pdb_points.pdb.gz", points
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
select surf_pocket1, protein and id [4621,4623,5648,5180,4741,5166,4624,4756,4757,4906,5160,5724,5727,5005,5729,5731,4930,4931,4565,4566,4567,4569,4570,4571,6832,5176,5178,4572,4573,4575,4574,5220,5209,5210,5216,5647,5646,5184,5185,5620,5634,5628,5722] 
set surface_color,  pcol1, surf_pocket1 
set_color pcol2 = [0.365,0.278,0.702]
select surf_pocket2, protein and id [1307,1022,1338,6340,1062,1238,1240,1335,6298,6300,6301,6338,6339,1078,6330,1076,1086,1245,1067,1300,1308,1266,6267,6269,1248,1253,1255,1262,1252,1261,6302] 
set surface_color,  pcol2, surf_pocket2 
set_color pcol3 = [0.792,0.361,0.902]
select surf_pocket3, protein and id [5730,4600,4602,4604,4603,4606,4758,4881,4605,4607,4867,4868,4869,4874,4875,4907,5744,5745,5746,5754,4843,4773,4842,4844,4877,4601] 
set surface_color,  pcol3, surf_pocket3 
set_color pcol4 = [0.702,0.278,0.533]
select surf_pocket4, protein and id [5254,5257,5362,5363,5394,5687,5689,5691,6795,6797,6798,5342,5371,5395] 
set surface_color,  pcol4, surf_pocket4 
set_color pcol5 = [0.902,0.361,0.361]
select surf_pocket5, protein and id [5201,6816,6818,6814,6834,6840,6827,6823,5279,5280,5282,5283,5285,5277,5281,5337,5324,5328,6833] 
set surface_color,  pcol5, surf_pocket5 
set_color pcol6 = [0.702,0.533,0.278]
select surf_pocket6, protein and id [6468,6472,6495,6497,6498,6499,6500,6501,6503,6461,6463,6466] 
set surface_color,  pcol6, surf_pocket6 
   

deselect

orient
