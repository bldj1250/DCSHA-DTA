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

load "data/PAK4.pdb", protein
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

load "data/PAK4.pdb_points.pdb.gz", points
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
select surf_pocket1, protein and id [3337,3339,3340,3449,3338,3363,1530,1531,1532,1533,1534,1535,3043,3011,3012,3013,3016,3019,3310,3472,3327,3445,1528,1543,2445,2447,2431,2438,2439,2426,2429,2433,2442,2578,3441,3447,3448,2419,2421,2425,2424,3474,2453,3462,3446,3461,1542,3362,2975,2991,2995,2987,2989,3003,2470,2473,2420,2422,2472,2561,2576,2577,2970,2969,2454] 
set surface_color,  pcol1, surf_pocket1 
set_color pcol2 = [0.702,0.278,0.533]
select surf_pocket2, protein and id [1543,1558,1560,3064,3867,1562,3883,3911,3912,3913,3603,3602,3618,3636,1551,1554,1555,3943,3944,3620,3907,3622,3333,3341,3839,3034,3058,3635,3339,3340,3327] 
set surface_color,  pcol2, surf_pocket2 
   

deselect

orient
