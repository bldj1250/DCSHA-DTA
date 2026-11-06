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

load "data/KIT(D816V).pdb", protein
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

load "data/KIT(D816V).pdb_points.pdb.gz", points
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
select surf_pocket1, protein and id [6402,6403,6404,6405,6406,6400,4930,6423,6424,6430,5695,5697,6432,5097,5173,5175,6386,5064,5096,6389,5266,5307,5722,6310,4790,4915,5282,6309,6407,4788,4927,5304,5335,5721,4739,4743,4744,4751,5337,5339,5696,5699,5704,5703,5281,5287] 
set surface_color,  pcol1, surf_pocket1 
set_color pcol2 = [0.490,0.278,0.702]
select surf_pocket2, protein and id [6411,4770,6549,6553,4771,4998,5006,4996,5008,5033,4400,4402,4392,6396,6409,4391,4394,4768,6410,6417,6419] 
set surface_color,  pcol2, surf_pocket2 
set_color pcol3 = [0.902,0.361,0.682]
select surf_pocket3, protein and id [7258,6709,6700,6711,6702,4466,4465,7271,7274,7256,6192,6189,6191,7260,7263,7267,7254,6190,6696] 
set surface_color,  pcol3, surf_pocket3 
set_color pcol4 = [0.702,0.408,0.278]
select surf_pocket4, protein and id [6356,5153,5183,7482,6374,5180,5200,5286,5289,5291,5296,4897,6357,6322,6324,6325,6373,7476,7483,5146,5140,5147,5150,5151] 
set surface_color,  pcol4, surf_pocket4 
   

deselect

orient
