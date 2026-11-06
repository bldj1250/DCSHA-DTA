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

load "data/ADCK4.pdb", protein
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

load "data/ADCK4.pdb_points.pdb.gz", points
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
select surf_pocket1, protein and id [3759,3789,3790,3791,3792,3793,3823,3794,3795,3796,3446,3415,3418,3393,3394,3423,3660,3106,3107,3109,2755,3140,3422,3132,3294,3701,3698,3726,3728,3729,3757,3760,3762,3763,3290,3292,3289,3447,3845,3568,3570,3841,3842,3843,3844,3820,3821,3825,3826,3442,3443,3444,3448,3449,3421,3158,2687,3478,3848,3824,3849,3477,2754,3139,3135,3828,1199,3605,3637,3633,3636,3657,3768,1208,2021,3697,3855,3856,3857,3850,3829,3572,3573,3575,3576,3872,3553,1197,1202,1206,3612,3639,1205,3638,3667,3669,2026,2024,3614] 
set surface_color,  pcol1, surf_pocket1 
set_color pcol2 = [0.278,0.278,0.702]
select surf_pocket2, protein and id [1649,1650,2500,2889,2890,2975,1698,1788,2498,2863,2871,2843,2862,1699,1800,1803,1804,1805,1789,2980,2984,554,1654,552,1664,1660,2512,2504,2503,2976,2972,2487,2218,2977,2470,2481,2478,2978] 
set surface_color,  pcol2, surf_pocket2 
set_color pcol3 = [0.576,0.361,0.902]
select surf_pocket3, protein and id [1150,2159,2160,2161,2162,2828,2829,1169,1170,1671,2983,2984,2157,1805,1677,2871,2843,1666,1664,1660,1662,1663,1669,1137,1140] 
set surface_color,  pcol3, surf_pocket3 
set_color pcol4 = [0.616,0.278,0.702]
select surf_pocket4, protein and id [323,324,325,326,327,328,321,3509,2624,2627,3912,2660,2661,2662,3929,3930,3951,3955,2655,2657,2658,2659,3919,3924,3926,2630,2632,2634,2670] 
set surface_color,  pcol4, surf_pocket4 
set_color pcol5 = [0.902,0.361,0.792]
select surf_pocket5, protein and id [2683,2684,2687,3478,3848,3824,2714,3477] 
set surface_color,  pcol5, surf_pocket5 
set_color pcol6 = [0.702,0.278,0.447]
select surf_pocket6, protein and id [2089,2092,2090,3768,1208,3800,3803,1199,3765,3766,1171,1200,1174,2068,2098,1172,1175,1176,1206,1207,2125,2093,2126,3807] 
set surface_color,  pcol6, surf_pocket6 
set_color pcol7 = [0.902,0.361,0.361]
select surf_pocket7, protein and id [1280,1235,1236,1248,1185,1964,1997,2005,1991,1186,1183,1213,2028] 
set surface_color,  pcol7, surf_pocket7 
set_color pcol8 = [0.702,0.447,0.278]
select surf_pocket8, protein and id [2852,2854,2857,2858,2853,2855,3856,3853,3831,2835,2838,2845,2844,1356,2834] 
set surface_color,  pcol8, surf_pocket8 
set_color pcol9 = [0.902,0.792,0.361]
select surf_pocket9, protein and id [1177,1178,2045,2042,2044,1157,2076,2004,2005,1943,1156] 
set surface_color,  pcol9, surf_pocket9 
   

deselect

orient
