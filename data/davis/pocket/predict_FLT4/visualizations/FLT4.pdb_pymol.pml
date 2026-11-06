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

load "data/FLT4.pdb", protein
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

load "data/FLT4.pdb_points.pdb.gz", points
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
select surf_pocket1, protein and id [7338,7340,7343,8200,7337,8229,8230,8302,8304,6734,6790,6913,7288,7167,7272,7287,7089,7346,7307,7309,7312,7313,7319,6737,6742,6744,6752,6753,6788,6791,6925,8305,8310,8312,8308,7056,6928,6929,6930,8214,6730,6731,6732,6735,6736,7308] 
set surface_color,  pcol1, surf_pocket1 
set_color pcol2 = [0.302,0.278,0.702]
select surf_pocket2, protein and id [8088,7142,7135,7138,8058,8060,8063,7146,7602,7605,7606,7728,7702,7727,7701,7724,7736,8092,8094,7638,7634,7636,7637,7687,7675,7633,7635,7665,7673,7608,7611,7644,8081,8086,8112,8082,8084,8114,8122] 
set surface_color,  pcol2, surf_pocket2 
set_color pcol3 = [0.631,0.361,0.902]
select surf_pocket3, protein and id [8465,8435,8464,8442,8477,8480,8482,8483,10079,10082,10083,10107,10108,10109,10110,8592,8593,8366,10105,10118,10147,8498,8499,10068,10069] 
set surface_color,  pcol3, surf_pocket3 
set_color pcol4 = [0.678,0.278,0.702]
select surf_pocket4, protein and id [8259,7735,7737,7772,7759,8242,8289,7292,7297,6855,7192,7302,8257,8244,7145,7730,7725] 
set surface_color,  pcol4, surf_pocket4 
set_color pcol5 = [0.902,0.361,0.682]
select surf_pocket5, protein and id [8063,7145,7146,7761,7764,7765,7766,7602,7605,7606,7728,7763,7142,7730,7729,7736,7725,7727,7701,7724,7638,7578,7580,7582,7541,8259,7759,7762,8257,8274,7544] 
set surface_color,  pcol5, surf_pocket5 
set_color pcol6 = [0.702,0.278,0.341]
select surf_pocket6, protein and id [7996,9249,9252,9010,9011,9250,9295,9296,9297,9029,9253,7959,7960,7962,7965,7966,7459,7968,9355] 
set surface_color,  pcol6, surf_pocket6 
set_color pcol7 = [0.902,0.522,0.361]
select surf_pocket7, protein and id [8347,8351,8335,6771,6767,6769,6997,6990,6988,6992,8423,8415,8417,8418,8419,8420,8421,6989,8396,8464,8459,8462,8344,8356,8366,8361,8392,6760] 
set surface_color,  pcol7, surf_pocket7 
set_color pcol8 = [0.702,0.596,0.278]
select surf_pocket8, protein and id [7378,7380,8266,7979,7980,7934,7906,7520,7490,7521,7519,7948,7981] 
set surface_color,  pcol8, surf_pocket8 
   

deselect

orient
