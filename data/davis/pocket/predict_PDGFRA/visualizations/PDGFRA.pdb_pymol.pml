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

load "data/PDGFRA.pdb", protein
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

load "data/PDGFRA.pdb_points.pdb.gz", points
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
select surf_pocket1, protein and id [5843,5845,5777,5778,6626,6627,6630,6625,6623,5752,5760,5755,6668,6670,6672,5339,5340,5341,5360,5363,6480,5850,4722,4724,4729,6618,6602,6600,4723,4726,4774,5854,6619,5305,5322,5331,5334,5865,5866,6509,6510,5856,5860,5301,4907] 
set surface_color,  pcol1, surf_pocket1 
set_color pcol2 = [0.329,0.278,0.702]
select surf_pocket2, protein and id [4377,4380,4334,4326,4328,4757,6639,6642,6646,6645,4745,6652,6738,6741,6742,6745,6747,6732,6729,4342,4348,4350,4353,4357,4356,4756] 
set surface_color,  pcol2, surf_pocket2 
set_color pcol3 = [0.698,0.361,0.902]
select surf_pocket3, protein and id [6023,6017,6022,6569,5140,5287,7720,7723,6007,6008,7679,7681,5993,5995,5283,5285,4887] 
set surface_color,  pcol3, surf_pocket3 
set_color pcol4 = [0.702,0.278,0.639]
select surf_pocket4, protein and id [5130,5121,6377,6379,7654,7689,7653,6342,5133,6348,6368,6399,7690] 
set surface_color,  pcol4, surf_pocket4 
set_color pcol5 = [0.902,0.361,0.545]
select surf_pocket5, protein and id [6581,4388,6574,6584,4390,4394,5162,5086,5087,5078,5161,5163,4924,5047,5050,5051,5053,5075,6587,4368,4384] 
set surface_color,  pcol5, surf_pocket5 
set_color pcol6 = [0.702,0.353,0.278]
select surf_pocket6, protein and id [3536,3537,3522,3702,3679,3700,3902,3845,3903,3870,3859] 
set surface_color,  pcol6, surf_pocket6 
set_color pcol7 = [0.902,0.729,0.361]
select surf_pocket7, protein and id [1058,1061,993,994,1005,1009,1021,1015,1545,1541,1547,1535] 
set surface_color,  pcol7, surf_pocket7 
   

deselect

orient
