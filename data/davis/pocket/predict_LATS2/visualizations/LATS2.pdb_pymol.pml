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

load "data/LATS2.pdb", protein
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

load "data/LATS2.pdb_points.pdb.gz", points
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
select surf_pocket1, protein and id [6226,5141,5143,5148,6121,6147,6148,6225,5768,5142,7776,7778,7780,5742,5311,6230,6232,6132,7784,7786,7788,7785,6120,5195,5197,5198,5309,5149,5150,5151,5159,5147,5572,5293,5738] 
set surface_color,  pcol1, surf_pocket1 
set_color pcol2 = [0.302,0.278,0.702]
select surf_pocket2, protein and id [5311,6233,6234,6247,6248,6250,6255,6257,6092,6256,6756,6109,6769,5166,5175,5177,5178,5409,5411,5412,5413,5160,5163,5182,5310,5326,5443,5466,5430] 
set surface_color,  pcol2, surf_pocket2 
set_color pcol3 = [0.631,0.361,0.902]
select surf_pocket3, protein and id [4551,4546,4548,4549,4550,6359,6360,6362,6425,6427,5452,8035,4518,4519,4521,4522,4498,8037,4508,4510,4509,4511,4512,4513,4514,4515,8033,8034,8060,8062,6358,6310,6371,6369,6407,6379,8008,8009,6355,4557] 
set surface_color,  pcol3, surf_pocket3 
set_color pcol4 = [0.678,0.278,0.702]
select surf_pocket4, protein and id [5602,5582,5545,5543,5544,8195,8192,8183,5577,5580,5533,6210,6211,6164,5721,5723,5724,5725,5745,6160,6170,6172,5752,6162,6180,5730] 
set surface_color,  pcol4, surf_pocket4 
set_color pcol5 = [0.902,0.361,0.682]
select surf_pocket5, protein and id [8147,8148,8149,8150,4685,4683,4684,4985,4982,4984,4987,4979,4981,4983,680,682,684,4717,4720,677,679,4950,4958,4946,4947,4948,4953,4954,8105,8111,8138,8136] 
set surface_color,  pcol5, surf_pocket5 
set_color pcol6 = [0.702,0.278,0.341]
select surf_pocket6, protein and id [4557,4560,4562,4564,8068,4530,4532,4472,4489,4490,4492,4488,8064,8066] 
set surface_color,  pcol6, surf_pocket6 
set_color pcol7 = [0.902,0.522,0.361]
select surf_pocket7, protein and id [6841,6844,6846,6847,6853,6843,6869,6817,6762,6763,6077,6080,6081,6894,6084,6078] 
set surface_color,  pcol7, surf_pocket7 
set_color pcol8 = [0.702,0.596,0.278]
select surf_pocket8, protein and id [5450,5485,6316,6317,6296,5473,5474,5477,5484,8073,8072,8075,8077,4590,8076] 
set surface_color,  pcol8, surf_pocket8 
   

deselect

orient
