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

load "data/HIPK2.pdb", protein
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

load "data/HIPK2.pdb_points.pdb.gz", points
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
select surf_pocket1, protein and id [2531,2532,2170,2673,2559,2677,2544,2520,2681,2683,2685,1980,2678,2679,2120,2117,2119,1574,1713,1716,1717,2684,1594,1596,1597,1547,1556,1557,1543,1544,1545,1549,1700,2125,2142,1539,1541,1542,1535,1536,2560,2150,1537,2144,1981] 
set surface_color,  pcol1, surf_pocket1 
set_color pcol2 = [0.702,0.278,0.533]
select surf_pocket2, protein and id [2834,2836,2838,6873,6875,6853,6856,6857,3091,2848,2850,3098,2187,3046,3099,3087,3089,3092,6844,6847,6851,6838,2262,2188,2189,2191,2264,2263,2536,2534,2535,2819,3123,2813,2815,2816] 
set surface_color,  pcol2, surf_pocket2 
   

deselect

orient
