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

load "data/TRKC.pdb", protein
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

load "data/TRKC.pdb_points.pdb.gz", points
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
select surf_pocket1, protein and id [4900,5353,5381,5476,5477,5494,5497,4272,4273,4276,4894,4897,4870,5367,4721,5380,4329,4328,4837,4839,4841,4275,4469,4861,4863,4869,4866,5451,5458,5465,5479,5447,5448,5450] 
set surface_color,  pcol1, surf_pocket1 
set_color pcol2 = [0.278,0.310,0.702]
select surf_pocket2, protein and id [1431,1433,1432,3717,1430,1386,1388,1390,1420,1665,1666,2277,2273,1375,1378,1437,2280,2284,1419,1177,1161,1150,1392,1393,1158,1118,3716,1159,1190,1191,2286,1160,1124,1128,2283] 
set surface_color,  pcol2, surf_pocket2 
set_color pcol3 = [0.498,0.361,0.902]
select surf_pocket3, protein and id [3936,3937,3938,4308,5486,5484,5485,4297,4298,5730,5549,5551,5552,5553,5526,5732,5734,3755,3757,3765,5313,5324,3944,4309,5304,5455,5457,5470,5456,5454,5459,5469,3934,3935,5316] 
set surface_color,  pcol3, surf_pocket3 
set_color pcol4 = [0.525,0.278,0.702]
select surf_pocket4, protein and id [3944,4305,4307,4616,4516,4512,4572,4577,4545,4544,4547,4486,4615,4302,4300,4303,4499,4509,3927,3928,3917,4541,4542,4576,3945,4298] 
set surface_color,  pcol4, surf_pocket4 
set_color pcol5 = [0.851,0.361,0.902]
select surf_pocket5, protein and id [2845,2846,2847,2848,2851,2853,2869,4525,4537,4521,4529,2842,2841,2840,4520,4559,4795,2765,2760,2761,2868,2767,2839,4522,2523,2524,2525,2526,2476,2472] 
set surface_color,  pcol5, surf_pocket5 
set_color pcol6 = [0.702,0.278,0.600]
select surf_pocket6, protein and id [5442,5447,5448,5450,4714,5453,5454,5466,5468,4646,5304,5306,5290,5292,4638,4668] 
set surface_color,  pcol6, surf_pocket6 
set_color pcol7 = [0.902,0.361,0.596]
select surf_pocket7, protein and id [5304,5291,5292,3944,5289,4638,4600,4599,4601,4608,4609,4611,4613,5454,5466,5297,5316,5317,5320,3978,3940,3943] 
set surface_color,  pcol7, surf_pocket7 
set_color pcol8 = [0.702,0.278,0.325]
select surf_pocket8, protein and id [5669,5671,5672,5673,5676,5657,5678,5674,5675,5614,6132,6187,5588,5593,6157,6156] 
set surface_color,  pcol8, surf_pocket8 
set_color pcol9 = [0.902,0.478,0.361]
select surf_pocket9, protein and id [4167,4168,4169,4150,4620,4583,4585,4765,4810,4775,4773,4774,4593,4594,4589,4591] 
set surface_color,  pcol9, surf_pocket9 
set_color pcol10 = [0.702,0.510,0.278]
select surf_pocket10, protein and id [5109,5099,5120,5104,5117,5118,6266,6268,6269,6270,6595,6598,5123,5124] 
set surface_color,  pcol10, surf_pocket10 
set_color pcol11 = [0.902,0.831,0.361]
select surf_pocket11, protein and id [5762,6081,6219,5964,6373,6083,6213,5935] 
set surface_color,  pcol11, surf_pocket11 
   

deselect

orient
