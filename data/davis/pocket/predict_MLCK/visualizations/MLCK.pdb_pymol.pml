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

load "data/MLCK.pdb", protein
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

load "data/MLCK.pdb_points.pdb.gz", points
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
select surf_pocket1, protein and id [3786,4747,3784,3785,3788,4317,4868,4186,3939,4322,4867,4775,4774,4339,4342,4343,4870,4759,4864,4869,4872,4874,4749,4750,3798,3824,3827,3815,3816,3826,3952,3953,4876,3792,3794,3796,3840,3843,3791,3790,3842,3820,3797,3799] 
set surface_color,  pcol1, surf_pocket1 
set_color pcol2 = [0.302,0.278,0.702]
select surf_pocket2, protein and id [966,984,986,987,6039,968,6063,6065,6021,6030,6033,6034,6060,6061,6068,6069,6019,6035,988,199,6075,6104,6066,6064,997,999,963,6038,224,6020,6026] 
set surface_color,  pcol2, surf_pocket2 
set_color pcol3 = [0.631,0.361,0.902]
select surf_pocket3, protein and id [6002,289,290,943,944,941,946,5993,5994,5996,6026,5995,5997,919,966,6027,6029,6035,256] 
set surface_color,  pcol3, surf_pocket3 
set_color pcol4 = [0.678,0.278,0.702]
select surf_pocket4, protein and id [990,1030,1031,199,6103,1063,6129,6159,167,166] 
set surface_color,  pcol4, surf_pocket4 
set_color pcol5 = [0.902,0.361,0.682]
select surf_pocket5, protein and id [4459,4461,4826,3520,4825,4810,4511,4509,4510,4464,4466,4462,4465,4485,3514,3530] 
set surface_color,  pcol5, surf_pocket5 
set_color pcol6 = [0.702,0.278,0.341]
select surf_pocket6, protein and id [6064,6067,1070,6096,1059,1069,997,1071,1033,1035,993,6104,1062,989] 
set surface_color,  pcol6, surf_pocket6 
set_color pcol7 = [0.902,0.522,0.361]
select surf_pocket7, protein and id [3819,3821,4058,4084,4891,3969,4019,4020,4017,4047,4051] 
set surface_color,  pcol7, surf_pocket7 
set_color pcol8 = [0.702,0.596,0.278]
select surf_pocket8, protein and id [5163,5164,5172,5710,5712,5177,5178,5166,5168,5170,5708,4638,4639,4643,4646,5724,4640] 
set surface_color,  pcol8, surf_pocket8 
   

deselect

orient
