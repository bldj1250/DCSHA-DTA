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

load "data/EPHA3.pdb", protein
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

load "data/EPHA3.pdb_points.pdb.gz", points
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
select surf_pocket1, protein and id [4994,4939,4940,4942,4992,5996,5997,5892,5993,5995,5999,5922,5542,5921,5516,5519,5520,5513,5515,5299,5300,5122,5477,5479,5112,5113,5493,5494,5499,5111,4995,5129,5130,6001,4949,4951,4952,4953,4944,5125,5128,5272,5545,5548,5550] 
set surface_color,  pcol1, surf_pocket1 
set_color pcol2 = [0.278,0.298,0.702]
select surf_pocket2, protein and id [6412,6664,6666,6670,6465,6466,6467,6468,7545,5628,7554,6660,6673,6674,6681,6685,7582,5631,5633,7552,6505,6506,6507,6509,6511,6504,7556,7589,6675,6677,7549,7555,7580,7563,7564,7591,6440,6441,6442,6434,6439,6451,6453,5692,5648,5668,6437] 
set surface_color,  pcol2, surf_pocket2 
set_color pcol3 = [0.533,0.361,0.902]
select surf_pocket3, protein and id [7320,7561,7563,7531,7532,7524,7525,7527,7276,7562,7597,7599,7589,7586,7299,7280,7286,7287,7289] 
set surface_color,  pcol3, surf_pocket3 
set_color pcol4 = [0.565,0.278,0.702]
select surf_pocket4, protein and id [7251,7627,7459,7437,7350,7259,7258,7598] 
set surface_color,  pcol4, surf_pocket4 
set_color pcol5 = [0.902,0.361,0.878]
select surf_pocket5, protein and id [523,524,1532,428,436,545,1310,1547,1548,824,825,443,439] 
set surface_color,  pcol5, surf_pocket5 
set_color pcol6 = [0.702,0.278,0.533]
select surf_pocket6, protein and id [1529,1232,840,1521,1524,556,1272,1532,545,1311] 
set surface_color,  pcol6, surf_pocket6 
set_color pcol7 = [0.902,0.361,0.490]
select surf_pocket7, protein and id [7193,7212,7214,7216,7192,7194,7220,7224,7414,7412,7436,7648,7241,7645,7649,7626,7413] 
set surface_color,  pcol7, surf_pocket7 
set_color pcol8 = [0.702,0.329,0.278]
select surf_pocket8, protein and id [5356,5966,5957,5968,5961,5962,5967,5955,5728,5731,5355,5357,5704,5727,5732,5733,5346,5702,5703] 
set surface_color,  pcol8, surf_pocket8 
set_color pcol9 = [0.902,0.620,0.361]
select surf_pocket9, protein and id [6057,5819,5820,5821,6314,6088,5800,5801,6305,6307,6308,6316,6318,6309,6311,6315,6312,6313,6866,6867,6868] 
set surface_color,  pcol9, surf_pocket9 
set_color pcol10 = [0.702,0.631,0.278]
select surf_pocket10, protein and id [6626,6629,6488,6506,6507,6509,6511,6512,6503,6528,6655,6654,7121,6648] 
set surface_color,  pcol10, surf_pocket10 
   

deselect

orient
