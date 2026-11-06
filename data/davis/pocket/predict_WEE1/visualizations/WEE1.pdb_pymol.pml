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

load "data/WEE1.pdb", protein
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

load "data/WEE1.pdb_points.pdb.gz", points
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
select surf_pocket1, protein and id [2893,2753,2490,2491,3350,2386,2387,3351,3346,3348,3349,2920,3347,2935,2938,2503,2646,2506,2507,3578,3579,3580,2384,2333,2334,2332,2335,2336,2500,2754,2367,2348,2943,2964,2347,2338,2341,2343,2345,2374,3332,2941,3323,3322,3324,2890,2899] 
set surface_color,  pcol1, surf_pocket1 
set_color pcol2 = [0.365,0.278,0.702]
select surf_pocket2, protein and id [1395,1397,1398,1399,3311,1396,1388,1393,3700,3684,1389,2354,2359,3294,3602,3601,2370,3332,3310,3322,3324,2367,2369,2368,2348,3580,3678,2579,3676,3677,1412,1413] 
set surface_color,  pcol2, surf_pocket2 
set_color pcol3 = [0.792,0.361,0.902]
select surf_pocket3, protein and id [3717,2976,2977,2956,3309,3700,3318,3728,3317,3935,3937,3936,3956,3967,3969,3971,3973,2983,2953,2955,3306,3308,3312,3319,3322,3324,3315] 
set surface_color,  pcol3, surf_pocket3 
set_color pcol4 = [0.702,0.278,0.533]
select surf_pocket4, protein and id [3125,3529,3095,3550,3551,3097,3099,3532,3359,3531,3373,3376,3066,2968,3068,2969,2999,2998,3000] 
set surface_color,  pcol4, surf_pocket4 
set_color pcol5 = [0.902,0.361,0.361]
select surf_pocket5, protein and id [2800,2799,1757,1759,1761,1763,1769,1770,2801,2814,2817,1745,1746,1747,2661,2663,2666,1778,1780,2653,2860,2861,2627,2558,2797,2798] 
set surface_color,  pcol5, surf_pocket5 
set_color pcol6 = [0.702,0.533,0.278]
select surf_pocket6, protein and id [3578,3579,3580,3590,2614,3599,2370,2369,2585,2610,2615] 
set surface_color,  pcol6, surf_pocket6 
   

deselect

orient
