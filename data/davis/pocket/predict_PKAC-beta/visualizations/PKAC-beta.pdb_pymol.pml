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

load "data/PKAC-beta.pdb", protein
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

load "data/PKAC-beta.pdb_points.pdb.gz", points
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
select surf_pocket1, protein and id [402,404,407,408,411,416,431,397,398,400,449,1033,2709,2679,1372,1519,1542,1543,1544,1545,1388,1389,1413,1400,1401,673,425,426,427,674,675,676,446,448,390,392,396,2677,2681,430,433,434,982,575,576,1511,1428,1510,987,1429,1004,1008,1517,1531,1532,1533,1535,1540,1518,1515,558,999] 
set surface_color,  pcol1, surf_pocket1 
set_color pcol2 = [0.416,0.278,0.702]
select surf_pocket2, protein and id [143,145,107,108,2388,2482,2486,2488,130,101,103,2507,2510,2508,2487,2521,132,133,134,135,1243,1274,1273,1246,1271,811,2509,2505,810] 
set surface_color,  pcol2, surf_pocket2 
set_color pcol3 = [0.902,0.361,0.878]
select surf_pocket3, protein and id [107,108,2388,2482,2486,2488,2363,75,86,79,2387,2383,2473,2477,2394,2386,1246,2470,1273] 
set surface_color,  pcol3, surf_pocket3 
set_color pcol4 = [0.702,0.278,0.380]
select surf_pocket4, protein and id [1668,1669,1670,1088,1667,1955,1933,1653,1680,1891,1892,1665,1932,1404,1050,1052] 
set surface_color,  pcol4, surf_pocket4 
set_color pcol5 = [0.902,0.620,0.361]
select surf_pocket5, protein and id [1816,2354,2356,2313,2351,2326,2341,2348,2343,1266,1269,1297,1783] 
set surface_color,  pcol5, surf_pocket5 
   

deselect

orient
