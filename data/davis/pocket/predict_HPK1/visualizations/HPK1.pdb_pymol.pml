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

load "data/HPK1.pdb", protein
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

load "data/HPK1.pdb_points.pdb.gz", points
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
select surf_pocket1, protein and id [1116,1133,1224,1226,1228,1229,1230,1221,1223,1148,773,776,779,781,806,772,1125,1149,1124,206,208,201,202,204,250,196,194,247,249,195,198,199,761,755,347,741,757,766,756,209,210,219,222,231,363,364,523,735,736] 
set surface_color,  pcol1, surf_pocket1 
set_color pcol2 = [0.302,0.278,0.702]
select surf_pocket2, protein and id [4766,4762,4765,4237,4241,4243,4261,6339,6341,6354,6356,6344,3878,3889,6155,6157,6170,6367,6364,6355,6362,4767,4754,4234,4746,4750,4748,4228,6167,6169,4759,4259,4249,5519,5528,5142,5138,5140,5527,5533,5511,5130,5126] 
set surface_color,  pcol2, surf_pocket2 
set_color pcol3 = [0.631,0.361,0.902]
select surf_pocket3, protein and id [4450,4451,3990,3993,4447,4488,3934,3937,3974,3992,4087,4090,3957,3956,4163,4165,4084,4148,4480,4118] 
set surface_color,  pcol3, surf_pocket3 
set_color pcol4 = [0.678,0.278,0.702]
select surf_pocket4, protein and id [4944,4960,4961,796,797,798,1369,1376,1114,1115,1116,4947,4969,1375,1393,1409,1690,1691,1692,4970,4637,1383,4965,4636] 
set surface_color,  pcol4, surf_pocket4 
set_color pcol5 = [0.902,0.361,0.682]
select surf_pocket5, protein and id [6389,6274,6263,6275,6281,6391,6380,6378,6279,6278,5909,5954,6067] 
set surface_color,  pcol5, surf_pocket5 
set_color pcol6 = [0.702,0.278,0.341]
select surf_pocket6, protein and id [5457,5455,5476,5441,5240,5244,5335,5334,5442,5232,5237,5116,5118,5102,5444] 
set surface_color,  pcol6, surf_pocket6 
set_color pcol7 = [0.902,0.522,0.361]
select surf_pocket7, protein and id [71,72,616,617,624,133,642,644,147,294] 
set surface_color,  pcol7, surf_pocket7 
set_color pcol8 = [0.702,0.596,0.278]
select surf_pocket8, protein and id [243,372,692,114,117,113,162,259,260,261,713] 
set surface_color,  pcol8, surf_pocket8 
   

deselect

orient
