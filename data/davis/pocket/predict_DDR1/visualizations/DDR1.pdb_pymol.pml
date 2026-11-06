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

load "data/DDR1.pdb", protein
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

load "data/DDR1.pdb_points.pdb.gz", points
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
select surf_pocket1, protein and id [4770,4773,4768,4769,4772,4775,5517,5518,6088,4829,5981,5980,6069,6071,6073,6075,6076,5486,5489,5483,5493,5516,5461,5457,5482,5054,5441,5436,6090,6092,6089,5953,6083,6084,6085] 
set surface_color,  pcol1, surf_pocket1 
set_color pcol2 = [0.278,0.278,0.702]
select surf_pocket2, protein and id [6105,6077,6078,6079,6080,5071,4514,4515,4516,4517,5211,5174,5170,5176,4532,4500,4510,4788,6086,4791,4811,4812,4803,5147,5178,4799,4809,4810,4794,4807,5144,5143,5070,5182,5184] 
set surface_color,  pcol2, surf_pocket2 
set_color pcol3 = [0.576,0.361,0.902]
select surf_pocket3, protein and id [6248,6281,6417,6419,6909,6625,6680,6256,6910,6564,6565,6768,6763,6447,6769,6913,6911,6908,6912,6677,6650,6679,6624,6652,6653,6326,6655] 
set surface_color,  pcol3, surf_pocket3 
set_color pcol4 = [0.616,0.278,0.702]
select surf_pocket4, protein and id [4838,4839,5079,5413,4687,5398,5399,5078,4712,4713,4715,4686,4685,4731,4728,4854] 
set surface_color,  pcol4, surf_pocket4 
set_color pcol5 = [0.902,0.361,0.792]
select surf_pocket5, protein and id [1189,3976,1905,1906,1911,1891,1062,1061,4014,4015,198,1198,1219,200,1896,1903,1904,1815,1196,1202,1203,1044,1045,1048] 
set surface_color,  pcol5, surf_pocket5 
set_color pcol6 = [0.702,0.278,0.447]
select surf_pocket6, protein and id [1375,545,785,1358,1360,1362,1367,418,516,788,387,389,391,392,550,384,385,386,388,543,1363,839,840] 
set surface_color,  pcol6, surf_pocket6 
set_color pcol7 = [0.902,0.361,0.361]
select surf_pocket7, protein and id [1819,1820,1821,1826,1895,2248,2245,2600,2588,2590,136,2603,173,174,1822,169,171,172,150,151,143,145,1816] 
set surface_color,  pcol7, surf_pocket7 
set_color pcol8 = [0.702,0.447,0.278]
select surf_pocket8, protein and id [6148,6150,6275,5508,5509,6521,6534,6536,6538,6539,6128,6130,6123,6149,6544,6545,6546,6540,6542,6484,6554] 
set surface_color,  pcol8, surf_pocket8 
set_color pcol9 = [0.902,0.792,0.361]
select surf_pocket9, protein and id [5993,5996,5997,5998,6027,5999,6001,4978,5440,5442,5443,5444,5449,6024,6026,6043,6044,5463,5464,5990] 
set surface_color,  pcol9, surf_pocket9 
   

deselect

orient
