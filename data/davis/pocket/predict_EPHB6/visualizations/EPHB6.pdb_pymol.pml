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

load "data/EPHB6.pdb", protein
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

load "data/EPHB6.pdb_points.pdb.gz", points
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
select surf_pocket1, protein and id [5143,6139,6146,5144,5289,5292,5293,5294,5121,5413,5417,5420,5627,5391,5626,5396,5394,6147,5698,6148,5094,5141,5105,6067,5519,6066,5642,5643,5660,5662,5663,5092,5276,5277,5088,5668,5689,5690,5699,5089,6141,6142,6152,5414,5444,5445,5412,5421,6156] 
set surface_color,  pcol1, surf_pocket1 
set_color pcol2 = [0.416,0.278,0.702]
select surf_pocket2, protein and id [6544,6545,6546,6548,6550,6557,6558,6559,6566,6567,6556,6565,6721,6451,6480,6504,6507,7152,6698,6700,6693,6699,6673,6674,6671,6709,6705,7582,7583,7584,7585,7580,7592,7566,7577,6720,7595] 
set surface_color,  pcol2, surf_pocket2 
set_color pcol3 = [0.902,0.361,0.878]
select surf_pocket3, protein and id [6525,6509,6258,6259,5711,5715,6460,6498,6040,6042,6043,6044,6226,6218] 
set surface_color,  pcol3, surf_pocket3 
set_color pcol4 = [0.702,0.278,0.380]
select surf_pocket4, protein and id [5988,6007,6008,6011,5982,4858,4837,4839,6166,6168,5437,6161,6162,6163,5995] 
set surface_color,  pcol4, surf_pocket4 
set_color pcol5 = [0.902,0.620,0.361]
select surf_pocket5, protein and id [5502,6108,6112,6113,6114,5852,5851,5853,6103,5877,5883] 
set surface_color,  pcol5, surf_pocket5 
   

deselect

orient
