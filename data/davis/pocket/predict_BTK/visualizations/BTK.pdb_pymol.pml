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

load "data/BTK.pdb", protein
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

load "data/BTK.pdb_points.pdb.gz", points
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
select surf_pocket1, protein and id [2966,3046,3048,3264,3266,3267,3268,3059,3229,3231,3233,3110,3111,3101,3260,3136,3259,3262,3265,3294,3295,3296,3297,3133,3135,3134,3108,3145,3149,3258,3156,3178,2941,2963,2967,3084,2962,2968,2971,2973,2964,3057,3061,2843,2846,2835,2838,2849,3137,3138,3356,3140,2856,2929,2930,3324,3325,3818,3299,3303] 
set surface_color,  pcol1, surf_pocket1 
set_color pcol2 = [0.490,0.278,0.702]
select surf_pocket2, protein and id [2738,2821,2819,2820,2798,2799,2801,2793,2795,2796,2797,2258,2310,2309,2304,2492,2494,2305,2307,2495,2574,2578,2580,2509,2510,2572,2576,2594,2739,2593] 
set surface_color,  pcol2, surf_pocket2 
set_color pcol3 = [0.902,0.361,0.682]
select surf_pocket3, protein and id [3363,3364,3374,3376,3658,3659,3306,3873,3331,3333,3871,3686,3870,3872,3902,3867,3895] 
set surface_color,  pcol3, surf_pocket3 
set_color pcol4 = [0.702,0.408,0.278]
select surf_pocket4, protein and id [3729,3726,3727,3728,3287,3317,3430,3285,3563,3724,3725,3289,3568,3558] 
set surface_color,  pcol4, surf_pocket4 
   

deselect

orient
