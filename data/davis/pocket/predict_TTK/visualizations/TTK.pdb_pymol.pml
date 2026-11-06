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

load "data/TTK.pdb", protein
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

load "data/TTK.pdb_points.pdb.gz", points
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
select surf_pocket1, protein and id [4821,5189,5284,5280,5282,5283,5196,5290,5292,4356,4357,4358,4234,4236,4237,4782,5281,4192,4193,4196,4186,4188,4823,4825,4187,4191,4818,5215,4811,5216,4340,4798,5188] 
set surface_color,  pcol1, surf_pocket1 
set_color pcol2 = [0.365,0.278,0.702]
select surf_pocket2, protein and id [896,1145,1179,1594,1595,1596,1628,1592,1593,1141,1143,1144,1422,1626,1554,1172,1147,868,870,839,1146,873,1597,932] 
set surface_color,  pcol2, surf_pocket2 
set_color pcol3 = [0.792,0.361,0.902]
select surf_pocket3, protein and id [6507,6522,6484,6515,5223,5240,5241,5243,5236,4805,4807,4816,4854,4858,4954,4956,4992,4995,4950,4981,4983,4896,4952] 
set surface_color,  pcol3, surf_pocket3 
set_color pcol4 = [0.702,0.278,0.533]
select surf_pocket4, protein and id [4757,4365,4367,4364,4366,4368,4370,4731,4734,4736,4739,4084,4086,4756,4759,4247,4248,4228,4230,4723,4384,4157] 
set surface_color,  pcol4, surf_pocket4 
set_color pcol5 = [0.902,0.361,0.361]
select surf_pocket5, protein and id [5288,5292,4357,4358,4510,4237,5353,5327,5328,4479,4482,5319,4509,4219,4221,4215] 
set surface_color,  pcol5, surf_pocket5 
set_color pcol6 = [0.702,0.533,0.278]
select surf_pocket6, protein and id [4840,4877,4878,4841,5478,5480,5184,5764,5762,5813,5814,5839,5841,5467,5444,5425,5443,5445,5446,5175,5767] 
set surface_color,  pcol6, surf_pocket6 
   

deselect

orient
