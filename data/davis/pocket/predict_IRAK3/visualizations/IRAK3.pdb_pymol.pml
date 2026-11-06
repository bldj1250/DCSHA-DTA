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

load "data/IRAK3.pdb", protein
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

load "data/IRAK3.pdb_points.pdb.gz", points
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
select surf_pocket1, protein and id [2671,2673,4096,4097,4105,2700,2702,2704,2985,2988,2980,2706,2987,4119,4079,4081,4086,4088,4093,4077,4078,4082,4083,4084,2371,2362,2352,2370,2715,2717,2660,2668,2669,2670,2676,2679,1350,1353,1358,2658,2672,4085,1366,2477,2478,2494,2479,2336,2501,2502,2683,1654,4090,4100,4098,4099,2967,2970,2986,3003,2003,2006,2007,2009,2358,2975,1991] 
set surface_color,  pcol1, surf_pocket1 
set_color pcol2 = [0.702,0.278,0.533]
select surf_pocket2, protein and id [1624,1626,1627,1628,1629,1630,1631,1634,1899,1633,1900,1028,1522,1592,1537,1539,1542] 
set surface_color,  pcol2, surf_pocket2 
   

deselect

orient
