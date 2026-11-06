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

load "data/CDC2L1.pdb", protein
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

load "data/CDC2L1.pdb_points.pdb.gz", points
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
select surf_pocket1, protein and id [1684,2592,2594,2597,2599,2600,2601,2610,2611,2602,2603,2598,2588,2591,2499,2496,2505,1952,2065,1866,1867,2606,1937,2519,1534,2613,1537,1703,1806,1808,1842,1834,1836,1831,1835,1559,1560,1683,1507,1508,1509,1510,2064,2079,2080,1666,1682,1535,1699,2105,2520,2521,1501,2096,2127,2130,2132,2134,1500,1708,1802] 
set surface_color,  pcol1, surf_pocket1 
set_color pcol2 = [0.490,0.278,0.702]
select surf_pocket2, protein and id [2704,2705,2706,2707,2709,2701,2703,2796,2459,2683,2877,2822,2453,2787,2824,2792,2793,2456,2452,2821,2825,2819,2714,2744,2620,2741,2743] 
set surface_color,  pcol2, surf_pocket2 
set_color pcol3 = [0.902,0.361,0.682]
select surf_pocket3, protein and id [216,3098,3304,3306,2830,3338,3339,3340,3358,3087,217,3092,2841,3124,3327,195] 
set surface_color,  pcol3, surf_pocket3 
set_color pcol4 = [0.702,0.408,0.278]
select surf_pocket4, protein and id [1567,1569,1572,1464,1466,1422,2054,2057,1691,1570,1695,1421,1420] 
set surface_color,  pcol4, surf_pocket4 
   

deselect

orient
