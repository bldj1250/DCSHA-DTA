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

load "data/ALK.pdb", protein
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

load "data/ALK.pdb_points.pdb.gz", points
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
select surf_pocket1, protein and id [4592,4265,4267,4585,3998,3999,4599,4602,5086,5097,3954,3950,3951,3963,3995,3980,5093,5095,5096,5098,5099,5100,3982,4000,4002,4608,4873,4874,4866,4580,4576,4579,4581,4583,4584,3935,4582,4586,3955,4588,3910,3911,3957,4578,4590,3952,3953,3515] 
set surface_color,  pcol1, surf_pocket1 
set_color pcol2 = [0.278,0.333,0.702]
select surf_pocket2, protein and id [6576,6578,5832,6567,5820,5833,5828,10396,10400,7366,7369,7371,10423,10427,10429,10395,10430,10431,7367,5838,5840,5841,5842,7394,10460,5839,6580,5811,6512,6552,6565,10590,10501,5813,5815,10500,10503,5814] 
set surface_color,  pcol2, surf_pocket2 
set_color pcol3 = [0.443,0.361,0.902]
select surf_pocket3, protein and id [9563,9674,9582,9583,9132,8541,8542,9129,9133,9569,8558,9678,8551,8593,8596,8538,8595,9150,8539,9555,9153,9157,9147,9146,11563,8544,8545,8537,8543,9670,9110,8726,8743,8742,8741,9669,9116] 
set surface_color,  pcol3, surf_pocket3 
set_color pcol4 = [0.463,0.278,0.702]
select surf_pocket4, protein and id [7374,7378,7380,7385,7386,7376,10422,7361,10386,10389,7375,7377,10420,7421,5733,5857,5859,5736,5734,7341,7342,10321,10322,10314,10293,10284,10292,10294,5870,5874,5718,5720] 
set surface_color,  pcol4, surf_pocket4 
set_color pcol5 = [0.741,0.361,0.902]
select surf_pocket5, protein and id [493,495,4942,4944,487,489,491,490,492,526,527,1829,4931,4928,4930,4932,3661,3662,4170,3354,3355,4943,4910,3655,3683,3684,462,464,1830,454,456] 
set surface_color,  pcol5, surf_pocket5 
set_color pcol6 = [0.694,0.278,0.702]
select surf_pocket6, protein and id [4604,4606,4608,4612,4873,5099,4605,5085,4592,4267,4599,4602,5086,5097,4580,4579,4578,4590,3529,3530,3531,3514,3515] 
set surface_color,  pcol6, surf_pocket6 
set_color pcol7 = [0.902,0.361,0.757]
select surf_pocket7, protein and id [8558,9678,8551,8596,9554,11546,9555,11559,9153,9155,9157,11507,11508,11563,11565,8544,8547] 
set surface_color,  pcol7, surf_pocket7 
set_color pcol8 = [0.702,0.278,0.475]
select surf_pocket8, protein and id [1916,1917,2593,2597,1555,2844,2843,2592,2594,2595,2599,1893,1896,1934,1900,2589,2591,3082,2590,3084,2616,1558] 
set surface_color,  pcol8, surf_pocket8 
set_color pcol9 = [0.902,0.361,0.459]
select surf_pocket9, protein and id [9835,9700,8561,8564,9678,12132,9532,9568,9569,9528,9674,9558,8576,9693,9717,9691,9692,9701,9725,9675,9677,9690,9694,9699,9676,8574] 
set surface_color,  pcol9, surf_pocket9 
set_color pcol10 = [0.702,0.318,0.278]
select surf_pocket10, protein and id [9786,9787,9788,9789,9791,9785,9968,9970,9520,9731,9733,9949,9701,9721,9698,9845,9846,9853,9919,9700] 
set surface_color,  pcol10, surf_pocket10 
set_color pcol11 = [0.902,0.561,0.361]
select surf_pocket11, protein and id [1976,2002,2003,2004,2007,2010,2607,1942,1943,2084,2583,3288,2591,2602,2604,2606,1933,3293,3290,3291,1975,2000,2001] 
set surface_color,  pcol11, surf_pocket11 
set_color pcol12 = [0.702,0.553,0.278]
select surf_pocket12, protein and id [938,940,937,939,916,917,936,1094,911,912,1069,1070,1434,1433,1435,1091] 
set surface_color,  pcol12, surf_pocket12 
set_color pcol13 = [0.902,0.859,0.361]
select surf_pocket13, protein and id [3689,3698,3633,3691,3693,3710,3734,3635,3638,3731,3738,3660,3664,3755,3757,3758,3668,3629] 
set surface_color,  pcol13, surf_pocket13 
   

deselect

orient
