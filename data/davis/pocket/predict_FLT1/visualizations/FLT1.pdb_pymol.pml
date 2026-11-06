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

load "data/FLT1.pdb", protein
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

load "data/FLT1.pdb_points.pdb.gz", points
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
select surf_pocket1, protein and id [8107,8108,8184,8182,8185,7023,8200,6636,6638,6639,6779,7141,6944,6945,7194,7197,7200,8078,6767,7167,7191,8092,8188,8190,8192,6600,6601,6783,6784,6911,6782,6587,6589,6579,6585,6586,6580,6583,6584,6581,6591] 
set surface_color,  pcol1, surf_pocket1 
set_color pcol2 = [0.416,0.278,0.702]
select surf_pocket2, protein and id [3812,3813,3807,3808,3810,3811,3818,3821,5072,4575,3823,4336,4339,4572,4577,4579,5060,3794,3786,3803,3730,3742,4566,4569,3741,3798,4316,4192,5069] 
set surface_color,  pcol2, surf_pocket2 
set_color pcol3 = [0.902,0.361,0.878]
select surf_pocket3, protein and id [8366,8367,8368,8231,8440,8473,8495,8472,8296,8295,8474,8475,8297,8298,8299,8273,8349,8211,8214,8215,8375,8043,8497,8494,8493,8212,8047,8227,8228,8246] 
set surface_color,  pcol3, surf_pocket3 
set_color pcol4 = [0.702,0.278,0.380]
select surf_pocket4, protein and id [6413,6414,6415,6935,6936,6937,8016,8018,6931,6387,6902,8222,8232,6375,6377,6376,6934,6969,8239,6284,6286,6381,8014,8019,8008,6291,8235] 
set surface_color,  pcol4, surf_pocket4 
set_color pcol5 = [0.902,0.620,0.361]
select surf_pocket5, protein and id [4776,4781,4785,4774,4977,4922,4924,4923,4773,4775,4664,4914] 
set surface_color,  pcol5, surf_pocket5 
   

deselect

orient
