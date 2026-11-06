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

load "data/ITK.pdb", protein
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

load "data/ITK.pdb_points.pdb.gz", points
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
select surf_pocket1, protein and id [3990,3991,4065,4072,3971,3963,4071,3087,4073,3977,3593,3597,3603,3063,3605,3051,3620,3621,3624,3627,3629,3054,3208,3106,3107,3224,3085,3225,3226,3056,3059,3065,3066,3069,3050,3052,3568,3569,3570,3571,3577,3565,3567,3447,4063,4066] 
set surface_color,  pcol1, surf_pocket1 
set_color pcol2 = [0.329,0.278,0.702]
select surf_pocket2, protein and id [2888,3384,3380,2940,2924,2925,2927,2943,2947,1723,3379,3381,3390,3392,3354,3357,3356,3358,3359,3361,1737,2886,2905,1717,1720,1709,1712,1714,1716,1703,1705,1706,1707,1708,2921,2923,614,1733] 
set surface_color,  pcol2, surf_pocket2 
set_color pcol3 = [0.698,0.361,0.902]
select surf_pocket3, protein and id [3753,3776,5032,2233,2234,2235,3747,3796,3799,3800,2238,2226,2229,2232,5010,2051,2053,3433,3807,3830,2039,3801,3795,2040,3806,3808,4035,4024,3777,3778] 
set surface_color,  pcol3, surf_pocket3 
set_color pcol4 = [0.702,0.278,0.639]
select surf_pocket4, protein and id [3599,4052,3422,4034,4051,4032,2876,3576,3580,3581,3586,4000,3582,3419,3421,2870,4007,2857,3608,3609,4003,4006,4008,4009,2864,2866,4035] 
set surface_color,  pcol4, surf_pocket4 
set_color pcol5 = [0.902,0.361,0.545]
select surf_pocket5, protein and id [1871,1873,2874,2884,1724,3407,3405,1725,3406,3408,1867,1868,1869] 
set surface_color,  pcol5, surf_pocket5 
set_color pcol6 = [0.702,0.353,0.278]
select surf_pocket6, protein and id [3928,3932,4359,4360,4362,3926,4100,4101,4172,4174,4241,4170,4183,4231,4233] 
set surface_color,  pcol6, surf_pocket6 
set_color pcol7 = [0.902,0.729,0.361]
select surf_pocket7, protein and id [220,599,600,199,201,1046,1069] 
set surface_color,  pcol7, surf_pocket7 
   

deselect

orient
