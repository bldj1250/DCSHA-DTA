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

load "data/DYRK1A.pdb", protein
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

load "data/DYRK1A.pdb_points.pdb.gz", points
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
select surf_pocket1, protein and id [2009,2411,5929,5930,1394,1521,1372,1522,1345,1355,5928,5935,5939,5926,2501,2503,2504,1645,2505,1523,1958,1959,2003,2412,1987,1989,1991,1992,1391,1393,1505,1338,5942,1342,1337,5945,5946,2038,1983,1952,1954,1956,1964,1980,1982,2396,2508,2351,2353,2354,2355,2371,2372,2650,2510,2512,1363,1367,1614,2511,2533,1613,1612,5923,5914,5917,5919,1358,1361,1646,2509,2525,2526,2528,1340,1979,1981,1336,5961,1997,1977] 
set surface_color,  pcol1, surf_pocket1 
set_color pcol2 = [0.490,0.278,0.702]
select surf_pocket2, protein and id [2388,2684,2682,2885,2669,2671,2386,2387,5919,5921,2930,2026,2028,2030] 
set surface_color,  pcol2, surf_pocket2 
set_color pcol3 = [0.902,0.361,0.682]
select surf_pocket3, protein and id [4859,4861,4862,4869,4871,4872,4882] 
set surface_color,  pcol3, surf_pocket3 
set_color pcol4 = [0.702,0.408,0.278]
select surf_pocket4, protein and id [4862,4851,4841,4842,4849,4850,4840,4852] 
set surface_color,  pcol4, surf_pocket4 
   

deselect

orient
