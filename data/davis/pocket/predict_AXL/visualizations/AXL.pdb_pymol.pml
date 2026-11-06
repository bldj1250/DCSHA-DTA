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

load "data/AXL.pdb", protein
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

load "data/AXL.pdb_points.pdb.gz", points
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
select surf_pocket1, protein and id [5262,4238,4837,4841,5235,5263,4351,4354,4783,5336,4367,4368,4369,5337,5339,5341,5343,5249,4830,4803,4185,4807,4831,4834,4352,4789,4181,4182,4183,4186,4187,4188,4189,4193,4195,4200,4236,4239,4361,4364,4201,4801,4802,4815,5261,4615,4808,5243,4613,5334] 
set surface_color,  pcol1, surf_pocket1 
set_color pcol2 = [0.365,0.278,0.702]
select surf_pocket2, protein and id [4822,4824,4867,4873,4875,4876,4821,6411,6412,6414,6415,6409,6410,6399,4946,4964,4870,4895,4905,4931,4932,6435,6436,4896,4898,4899,4900,6437,6433,4942,6418,6419,6430,4902,4863] 
set surface_color,  pcol2, surf_pocket2 
set_color pcol3 = [0.792,0.361,0.902]
select surf_pocket3, protein and id [4788,4790,4623,4626,4619,4809,4810,5323,4605,4796,5275,5278,4590,4580,4587] 
set surface_color,  pcol3, surf_pocket3 
set_color pcol4 = [0.702,0.278,0.533]
select surf_pocket4, protein and id [4473,4479,4480,4474,4217,4384,4486,4221,4222,4223,4218,4219,4220,4214,4216,4401,5356,5358,4475,4369,4512] 
set surface_color,  pcol4, surf_pocket4 
set_color pcol5 = [0.902,0.361,0.361]
select surf_pocket5, protein and id [4099,4100,4641,3872,3874,3876,4639,4090,3880,4075,4080,4083,4081,4291,4282,4136,4292,4293,4276,4277,4101,3829,3831,3850,3854,3828,3848,3849] 
set surface_color,  pcol5, surf_pocket5 
set_color pcol6 = [0.702,0.533,0.278]
select surf_pocket6, protein and id [5686,5663,5664,5137,5107,6201,5108,6198,6218,6208,5654,5655,5656,5135] 
set surface_color,  pcol6, surf_pocket6 
   

deselect

orient
