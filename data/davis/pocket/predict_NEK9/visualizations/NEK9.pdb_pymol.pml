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

load "data/NEK9.pdb", protein
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

load "data/NEK9.pdb_points.pdb.gz", points
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
select surf_pocket1, protein and id [1009,1014,575,578,997,577,468,596,598,854,855,1445,1447,1444,1448,1449,1524,1525,599,751,991,1531,1527,1529,601,412,413,415,416,411,417,418,1011,1013,1017,1034,1036,1039,1032,1033,1042,1018] 
set surface_color,  pcol1, surf_pocket1 
set_color pcol2 = [0.278,0.310,0.702]
select surf_pocket2, protein and id [2938,3384,3800,5547,2952,2957,3398,3403,5560,5552,2944,5532,5538,5539,4217,4215,4216,3808,3813,4724,4222,4722,4709,4714,4716,5106,4704,5098,5089,3794] 
set surface_color,  pcol2, surf_pocket2 
set_color pcol3 = [0.498,0.361,0.902]
select surf_pocket3, protein and id [2831,5466,2833,5468,5469,5470,5483,5614,5629,5630,2766,2767,2769,2770,2772,5498,5500,5501,2753,5218,2793] 
set surface_color,  pcol3, surf_pocket3 
set_color pcol4 = [0.525,0.278,0.702]
select surf_pocket4, protein and id [3045,3048,3356,3477,1025,1026,1027,1023,1465,3476,3473,3475,1461,1463,1464,1477,2587,1493,2578,2580,2558,3028,3047,554,2579,561,2608,1006,1005,2585,1000,547,557,560,562,563,1008] 
set surface_color,  pcol4, surf_pocket4 
set_color pcol5 = [0.851,0.361,0.902]
select surf_pocket5, protein and id [367,534,984,2659,2688,2686,2604,515,518,982,983,2613,2627,2630,878,876,888,891,879,532,533,351,352,353,354,355,365,349,2687] 
set surface_color,  pcol5, surf_pocket5 
set_color pcol6 = [0.702,0.278,0.600]
select surf_pocket6, protein and id [1336,2391,1284,1303,2366,2545,839,1285,2537,823,827,829,831,2473,2476,2510,2511,2512,2472,1253,1255,2506,2508,2509,2535,820,1334,1309,1305,1307] 
set surface_color,  pcol6, surf_pocket6 
set_color pcol7 = [0.902,0.361,0.596]
select surf_pocket7, protein and id [616,726,658,448,659,1531,1530,600,601,752,617,1546,1547,688,718,1545,717,719,723,724,444] 
set surface_color,  pcol7, surf_pocket7 
set_color pcol8 = [0.702,0.278,0.325]
select surf_pocket8, protein and id [463,475,476,609,462,610,496,379,2712,592,2699,2713,2709,2711,5685,5686] 
set surface_color,  pcol8, surf_pocket8 
set_color pcol9 = [0.902,0.478,0.361]
select surf_pocket9, protein and id [3255,3119,3120,3108,3115,3110,3095,3256,3103,2838,2814,2860,2779] 
set surface_color,  pcol9, surf_pocket9 
set_color pcol10 = [0.702,0.510,0.278]
select surf_pocket10, protein and id [5507,5508,5509,5510,5199,5505,344,5649,5655,5652,5634,5639,341,375,524] 
set surface_color,  pcol10, surf_pocket10 
set_color pcol11 = [0.902,0.831,0.361]
select surf_pocket11, protein and id [2966,2969,5569,5589,5592,5566,3130,3129,5575,5577,5579,5581,5124,5120,4737] 
set surface_color,  pcol11, surf_pocket11 
   

deselect

orient
