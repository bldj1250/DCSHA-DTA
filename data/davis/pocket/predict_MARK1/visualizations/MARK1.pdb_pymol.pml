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

load "data/MARK1.pdb", protein
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

load "data/MARK1.pdb_points.pdb.gz", points
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
select surf_pocket1, protein and id [1526,1138,1525,1599,1601,1604,954,1089,1090,953,1127,1128,1129,1165,1121,1112,1116,1119,1095,1608,1634,696,1606,1607,519,521,577,523,579,680,580,563,526,6098,528,537,538,564,518,520,525,6081,6082,1136,1498,1487,1497,1499,1510,1131,1488,1633] 
set surface_color,  pcol1, surf_pocket1 
set_color pcol2 = [0.490,0.278,0.702]
select surf_pocket2, protein and id [547,4019,1608,1634,4018,4020,782,808,1622,1623,781,803,806,809,810,696,697,847,1607,1621,544,546,558,552,556,559,4036,563,712,713,815,754,780,1633,1632] 
set surface_color,  pcol2, surf_pocket2 
set_color pcol3 = [0.902,0.361,0.682]
select surf_pocket3, protein and id [2627,2644,2647,914,912,913,2638,2640,903,910,2642,962,963,2952,2660,886,2890,2662,2869,2922,2948,2941,2943,2972,2973,2974,2705,2648,2953,2981,2982,2951] 
set surface_color,  pcol3, surf_pocket3 
set_color pcol4 = [0.702,0.408,0.278]
select surf_pocket4, protein and id [6128,6115,6117,6131,2029,1766,1492,1501,1777,1779] 
set surface_color,  pcol4, surf_pocket4 
   

deselect

orient
