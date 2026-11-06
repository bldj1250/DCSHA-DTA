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

load "data/BRSK2.pdb", protein
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

load "data/BRSK2.pdb_points.pdb.gz", points
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
select surf_pocket1, protein and id [4158,814,816,4125,4127,4126,4156,844,846,848,853,843,1669,3797,3798,3799,3830,4134,4140,4143,4144,4146,4148,4150,3832,3833,4112,852,4107,4135,4116,1680,1668,1670,1671,1673,1675,1418,1420,1421,1422,1432,1434,1681,1706,1707,1708,1151] 
set surface_color,  pcol1, surf_pocket1 
set_color pcol2 = [0.490,0.278,0.702]
select surf_pocket2, protein and id [1271,1273,1275,241,749,352,350,351,222,1157,1169,1266,1184,1185,1268,606,185,188,238,240,334,769,774,755,770,1161,203,204,190,191,1156,798,796,788,184,186] 
set surface_color,  pcol2, surf_pocket2 
set_color pcol3 = [0.902,0.361,0.682]
select surf_pocket3, protein and id [1298,465,460,1296,1297,1288,1290,1393,222,221,1274,1275,1128,1145,1398,5236,5237,1399,210,215,5233,5234,1126,1405,1400,1388,1391,1396,5270] 
set surface_color,  pcol3, surf_pocket3 
set_color pcol4 = [0.702,0.408,0.278]
select surf_pocket4, protein and id [135,137,640,641,329,2805,2923,2794,276,278,279,124,134,2800,629,631,314,2772] 
set surface_color,  pcol4, surf_pocket4 
   

deselect

orient
