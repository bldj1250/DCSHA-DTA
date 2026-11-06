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

load "data/LIMK2.pdb", protein
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

load "data/LIMK2.pdb_points.pdb.gz", points
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
select surf_pocket1, protein and id [2820,2823,3178,3181,3707,3196,3197,2842,3721,3723,2689,2807,2808,2707,2710,2650,2653,2651,2655,2656,2657,2661,2824,2825,3706,2668,2669,3708,2654,3216,2935,2990,2933,2955,2958,2960,3701,3702,3704,3699,3611,3598,3249,2991,3709,3716,3718,3720,3711,3713,3061,3060,3062,3064,3202,3624,3625,3241,3223,2899] 
set surface_color,  pcol1, surf_pocket1 
set_color pcol2 = [0.278,0.278,0.702]
select surf_pocket2, protein and id [2944,2998,2536,2555,2557,2999,3002,2966,3102,2545,3097,3103,3082,3094,2543,848,657,748,750,2556,3115,3165,3119] 
set surface_color,  pcol2, surf_pocket2 
set_color pcol3 = [0.576,0.361,0.902]
select surf_pocket3, protein and id [2825,2669,3708,2672,2690,2675,2692,3598,3597,3599,3600,3601,3603,3704,3611,3586,4038,4041,3570,3571] 
set surface_color,  pcol3, surf_pocket3 
set_color pcol4 = [0.616,0.278,0.702]
select surf_pocket4, protein and id [681,682,683,693,1639,678,677,856,858,859,883,1837,1838,1620,1621,1616,1617,1206,1207,1831,886,1822,1638] 
set surface_color,  pcol4, surf_pocket4 
set_color pcol5 = [0.902,0.361,0.792]
select surf_pocket5, protein and id [741,760,620,744,759,2574,2575,657,658,656,750,751,2556,648,649,647,2586,3116,2572,2592,2562,2570,3115,646,629] 
set surface_color,  pcol5, surf_pocket5 
set_color pcol6 = [0.702,0.278,0.447]
select surf_pocket6, protein and id [145,147,148,149,66,67,69,71,73,50,181,186,187,206,182,184] 
set surface_color,  pcol6, surf_pocket6 
set_color pcol7 = [0.902,0.361,0.361]
select surf_pocket7, protein and id [3712,3714,3713,3533,3735,2982,3534,2989,3015,2955,2957,2958,2960,2990] 
set surface_color,  pcol7, surf_pocket7 
set_color pcol8 = [0.702,0.447,0.278]
select surf_pocket8, protein and id [765,782,941,930,796,731,602,781,938] 
set surface_color,  pcol8, surf_pocket8 
set_color pcol9 = [0.902,0.792,0.361]
select surf_pocket9, protein and id [1546,1548,1545,1563,1566,1031,1160,1156,1859,1165,991,1185,1199,1196] 
set surface_color,  pcol9, surf_pocket9 
   

deselect

orient
