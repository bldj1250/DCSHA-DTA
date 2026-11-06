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

load "data/CSF1R.pdb", protein
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

load "data/CSF1R.pdb_points.pdb.gz", points
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
select surf_pocket1, protein and id [6203,6199,6201,4816,4817,4814,4657,4658,4674,5665,6124,4649,4650,4651,4653,4654,4647,4639,4644,4655,4628,4630,4631,4632,5646,4635,4636,4833,4656,4659,4889,6239,6226,6216,6217,6218,6219,4914,6242,6196,6197,6202,4885,4888,4916,4917,4919,4922,5579,5580,5581,5582,6099,5565,6098,5639,5641,6095,6096,5223,5661,5650,5658,5636,5638,6074,6372,6224,6225,6110,6370,6354,6369,5239] 
set surface_color,  pcol1, surf_pocket1 
set_color pcol2 = [0.302,0.278,0.702]
select surf_pocket2, protein and id [6203,6199,6201,4815,4816,4817,4812,5664,4674,5665,4673,6124,5166,4800,5188,5663,4621,5670,5183,4624,6196,6197,4945,4978,4979,5165,5057,5150,6096,5192,5213] 
set surface_color,  pcol2, surf_pocket2 
set_color pcol3 = [0.631,0.361,0.902]
select surf_pocket3, protein and id [6850,6855,6861,6867,6868,6870,6609,6640,6663,6664,6697,6695,5510,5490,5507,1330,5472,5479,5466,5483,5484,1463,1466] 
set surface_color,  pcol3, surf_pocket3 
set_color pcol4 = [0.678,0.278,0.702]
select surf_pocket4, protein and id [5579,5581,5582,6099,5565,6098,5570,5571,6095,6102,6372,6370,6365,6369,5569,6405,6404,6618,5568,5563,6672,5239] 
set surface_color,  pcol4, surf_pocket4 
set_color pcol5 = [0.902,0.361,0.682]
select surf_pocket5, protein and id [6439,6473,4274,4300,4275,4251,4253,4254,6367,6348,4252,6320,6323,6445] 
set surface_color,  pcol5, surf_pocket5 
set_color pcol6 = [0.702,0.278,0.341]
select surf_pocket6, protein and id [5003,4971,4455,4965,4968,4969,4970,4989,4429,4431,4432,4416,4456,4413,6230,6037,6038,4317,6028,6033,6035,6019,6042] 
set surface_color,  pcol6, surf_pocket6 
set_color pcol7 = [0.902,0.522,0.361]
select surf_pocket7, protein and id [6242,6300,6303,6305,6348,6282,6301,6323,6238,6239,6226,6218,4297,4299,4272,4275,6368] 
set surface_color,  pcol7, surf_pocket7 
set_color pcol8 = [0.702,0.596,0.278]
select surf_pocket8, protein and id [5208,5784,5785,5787,5788,5783,5795,5680,5198,5206,5688,5822,5197,5690,5184,5187,5684,5687,5762,5818] 
set surface_color,  pcol8, surf_pocket8 
   

deselect

orient
