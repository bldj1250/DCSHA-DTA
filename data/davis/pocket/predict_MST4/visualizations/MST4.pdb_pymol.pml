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

load "data/MST4.pdb", protein
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

load "data/MST4.pdb_points.pdb.gz", points
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
select surf_pocket1, protein and id [228,230,232,285,388,798,800,807,803,229,234,802,404,286,780,781,1166,1188,1189,826,777,643,786,406,405,239,241,246,247,1174,1165,1269,1268,1270,1264,1263,1266,644,1261,546,848,2342,823,849,820,2297,814,819,828] 
set surface_color,  pcol1, surf_pocket1 
set_color pcol2 = [0.616,0.278,0.702]
select surf_pocket2, protein and id [1403,1777,1780,1752,1496,1776,1778,2810,2812,1782,1783,1785,1789,1791,3115,3146,1494,1814,2801,2800,2803,2782,2802,2773,2793,2795,1396,2804,1514,2618,2776,2774,2603,1754,1755,2831,2602,2833,1399,1401,2565,2615] 
set surface_color,  pcol2, surf_pocket2 
set_color pcol3 = [0.902,0.361,0.361]
select surf_pocket3, protein and id [2596,253,255,1269,1139,1268,1270,2590,2584,2588,2576,1421,1155,1156,1174,1291,1283,1284,1286,251,250,248,241,247] 
set surface_color,  pcol3, surf_pocket3 
   

deselect

orient
