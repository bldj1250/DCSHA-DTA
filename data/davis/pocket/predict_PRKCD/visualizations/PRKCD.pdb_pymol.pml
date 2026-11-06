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

load "data/PRKCD.pdb", protein
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

load "data/PRKCD.pdb_points.pdb.gz", points
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
select surf_pocket1, protein and id [2825,2827,2832,2833,2836,2839,2841,2842,3796,3797,3433,3798,3799,3437,3457,3455,2869,2871,2872,2823,2813,2819,2820,2815,5092,5094,3410,2814,2817,2853,2855,2856,2845,3909,2988,2989,2990,2991,3808,3910,3906,3384,3385,3904,2973,3412,3822,3823,3901,3406,2851,2849,3004,3390,3923,3924,3926,3136,3137,3903,3246,1164,1156,3783,3784,3767,1167,1170,1171,3933,3931,5132,5097,5100,5133,1147,1148,1151,3492,5104,3461] 
set surface_color,  pcol1, surf_pocket1 
set_color pcol2 = [0.278,0.278,0.702]
select surf_pocket2, protein and id [1409,1387,1410,2128,2127,1851,1852,2215,2219,2114,2115,2116,2124,2269,2270,2244,2245,2248,2250,2254,2255,2246,2218,2231,2232,2242,1973,2122,1557,1981,1982,2203,1636,1638,1275,1276,1648,1649,1650,1655,1386,1388] 
set surface_color,  pcol2, surf_pocket2 
set_color pcol3 = [0.576,0.361,0.902]
select surf_pocket3, protein and id [2851,3083,3044,2849,3909,2991,3910,2847,2848,3103,3104,3106,3925,3923,3924,3105,3107,3113,3137,1188] 
set surface_color,  pcol3, surf_pocket3 
set_color pcol4 = [0.616,0.278,0.702]
select surf_pocket4, protein and id [1187,1188,1193,4031,4032,3932,3759,3930,3073,3106,3095,3927,3938,1206,1209,3948,3946,3128] 
set surface_color,  pcol4, surf_pocket4 
set_color pcol5 = [0.902,0.361,0.792]
select surf_pocket5, protein and id [1334,1365,1988,1997,1999,1350,1987,1989,1549,2171,2022,2172,2004,2153,1511,1512,1513,1551,1553,1552,1336] 
set surface_color,  pcol5, surf_pocket5 
set_color pcol6 = [0.702,0.278,0.447]
select surf_pocket6, protein and id [4059,1137,1152,1156,4085,3800,1128,1130,1132,3453,4305,4073,4074,4347,1127,1133,1126] 
set surface_color,  pcol6, surf_pocket6 
set_color pcol7 = [0.902,0.361,0.361]
select surf_pocket7, protein and id [3695,3699,4185,4189,4191,3670,3671,4224,4226,3694,3696,3665,3667,3669,4193,4181,4743,4745,4749,4750,4748] 
set surface_color,  pcol7, surf_pocket7 
set_color pcol8 = [0.702,0.447,0.278]
select surf_pocket8, protein and id [2677,2679,2681,3145,3176,3179,3178,5353,2667,3148,3152,2640,2642,2644,2668] 
set surface_color,  pcol8, surf_pocket8 
set_color pcol9 = [0.902,0.792,0.361]
select surf_pocket9, protein and id [3650,3673,3676,3674,3649,4786,4909,4910,4908,3667,3672,3221,4906,4907,3229,3231,3213,3680,4911] 
set surface_color,  pcol9, surf_pocket9 
   

deselect

orient
