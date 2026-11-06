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

load "data/ERN1.pdb", protein
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

load "data/ERN1.pdb_points.pdb.gz", points
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
select surf_pocket1, protein and id [558,541,542,889,1267,556,857,869,887,2917,2916,2932,841,2910,657,659,693,729,712,2901,2903,2905,640,641,785,728,786,744,746] 
set surface_color,  pcol1, surf_pocket1 
set_color pcol2 = [0.329,0.278,0.702]
select surf_pocket2, protein and id [4484,4485,4486,4488,4544,4546,4547,4654,4655,4505,5564,5418,5431,5066,5057,5061,5093,4490,4491,4492,4496,4498,5045,4881,5446,5554,5556,5557,5560,5562,5563,5048,5049,5056,5058,5447,4639,5027,4656] 
set surface_color,  pcol2, surf_pocket2 
set_color pcol3 = [0.698,0.361,0.902]
select surf_pocket3, protein and id [6445,6447,6448,6450,6451,7592,7603,7607,7460,7457,7490,7491,7492,7597,6446,6470,7511,7513,6415,6416,6418,6420,6339,6340,6341,6314,6482,6399,7493,6449] 
set surface_color,  pcol3, surf_pocket3 
set_color pcol4 = [0.702,0.278,0.639]
select surf_pocket4, protein and id [4531,4655,4532,4675,4726,4521,4505,4511,4529,5564,4519,4728,4729,4730,4732,4733,4520,5587,5586,5406,5389,4508,4510,4512,4516,5562,5563,5585,5577,4766,4656,4674,4703] 
set surface_color,  pcol4, surf_pocket4 
set_color pcol5 = [0.902,0.361,0.545]
select surf_pocket5, protein and id [5345,5653,5618,5295,5317,5318,5656,6425,6427,6428,6433,6438,6439,6440,5886,5889,7631,6441,5881,5883,5884,5885,5887,5321] 
set surface_color,  pcol5, surf_pocket5 
set_color pcol6 = [0.702,0.353,0.278]
select surf_pocket6, protein and id [6354,6363,6368,6359,6355,6158,6169,6328] 
set surface_color,  pcol6, surf_pocket6 
set_color pcol7 = [0.902,0.729,0.361]
select surf_pocket7, protein and id [6990,7138,6949,6988,6984,6986,6987,6989,7137,7125,7127,7164,7207,7195,7199,6991,7194,7161,7163] 
set surface_color,  pcol7, surf_pocket7 
   

deselect

orient
