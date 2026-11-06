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

load "data/EPHB3.pdb", protein
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

load "data/EPHB3.pdb_points.pdb.gz", points
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
select surf_pocket1, protein and id [5974,5976,5978,5980,5247,4915,4918,4923,5100,5101,5098,5099,4951,4954,5093,5096,4912,5884,5900,5899,5493,5497,4901,4953,5489,5491,5524,5521,5523,4898,5274,5275,5471,5346,5472,5083,5082,5084,5870,5970,5972,5973,5527,5347] 
set surface_color,  pcol1, surf_pocket1 
set_color pcol2 = [0.416,0.278,0.702]
select surf_pocket2, protein and id [6654,6403,6430,6432,6459,6671,7545,6502,7286,7583,7584,7582,7547,7554,7557,6664,6669,6670,6658,6660,6433,6457,6458,7544,6497,6498,6499,6503,7273,7274,6511,6495,6496,6500,6493,6648,6623,7107,7108,7127,7276] 
set surface_color,  pcol2, surf_pocket2 
set_color pcol3 = [0.902,0.361,0.878]
select surf_pocket3, protein and id [313,315,316,739,742,404,408,392,389,759,755,747,740,741,743,351,306,311,362,318,322] 
set surface_color,  pcol3, surf_pocket3 
set_color pcol4 = [0.702,0.278,0.380]
select surf_pocket4, protein and id [7159,7161,7400,7398,7396,7679,7680,7681,7409,7410,7411,7675,7187,7160,7674,7174,7668,7170,7172,7173] 
set surface_color,  pcol4, surf_pocket4 
set_color pcol5 = [0.902,0.620,0.361]
select surf_pocket5, protein and id [6461,6463,6202,6477,6465,6466,5872,6203,6098,6099,6450,6412,5544] 
set surface_color,  pcol5, surf_pocket5 
   

deselect

orient
