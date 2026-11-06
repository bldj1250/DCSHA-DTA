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

load "data/PDPK1.pdb", protein
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

load "data/PDPK1.pdb_points.pdb.gz", points
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
select surf_pocket1, protein and id [135,652,1294,133,136,656,1296,661,654,662,687,821,987,681,665,944,954,121,123,107,670,679,945,947,948,950,108,953,1635,105,101,104,927,1659,1757,986,1759,1760,1762,1764,1765,1766,946,1779,1780,1927,1618,1919,1920,1787,1915,1911,1917,1289,1675,1647,643,644,649,698,700,701,646,803,650,820,819,1258,150,1266,1674,1758,1263,1249,1240,1243,1286,1267] 
set surface_color,  pcol1, surf_pocket1 
set_color pcol2 = [0.490,0.278,0.702]
select surf_pocket2, protein and id [4199,3724,3665,4188,4195,3664,3666,3721,3667,3002,3003,3004,3007,3706,3036,3037,3038,3040,3041,3039,2858,2872,2873,4077,4079,4080,2849,2978,2980,2852,3681,3683,3684,3685,3688,4175,4178,4180,1358,3034,3035,1347,3668,4198,3015,1369,1365,1367,1371,4052] 
set surface_color,  pcol2, surf_pocket2 
set_color pcol3 = [0.902,0.361,0.682]
select surf_pocket3, protein and id [4218,4220,4230,4231,4232,4207,3330,3639,3644,4256,3634,4254,4267,4269] 
set surface_color,  pcol3, surf_pocket3 
set_color pcol4 = [0.702,0.408,0.278]
select surf_pocket4, protein and id [2741,2760,2767,1526,2663,1504,1061,1064,2783,2784,2768,1081,1070,1071,1503] 
set surface_color,  pcol4, surf_pocket4 
   

deselect

orient
