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

load "data/RSK4(KinDom.2-C-terminal).pdb", protein
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

load "data/RSK4(KinDom.2-C-terminal).pdb_points.pdb.gz", points
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
select surf_pocket1, protein and id [1619,1607,1249,1253,1713,1714,1718,1715,1716,802,803,804,1635,1246,606,2878,2883,2885,1634,660,663,605,608,662,786,1219,1061,1204,1198,1195,1722,611,612,614,2919,2921,610,2891,2888,2875] 
set surface_color,  pcol1, surf_pocket1 
set_color pcol2 = [0.278,0.278,0.702]
select surf_pocket2, protein and id [4488,4489,4491,4356,4365,4380,4485,3976,4005,4381,3977,4493,4495,3822,3973,3978,3703,3604,3605,3473,3486,3434,3430,3432,3484,3465,3450,3439,3441,3443,3446,3447,3431,3436,3955,3956,3598,3588,3589,3971,3601,4359] 
set surface_color,  pcol2, surf_pocket2 
set_color pcol3 = [0.576,0.361,0.902]
select surf_pocket3, protein and id [2857,2860,2861,2863,2864,2865,2866,2868,3880,3860,3876,3859,3298,3300,3310,3311,3313,2901,2929,3686,3712,3922,1320,1289,3716,2809,3713,3714,3711,3744,3684,3685,2859,594,3320,593,3719,3720,3721] 
set surface_color,  pcol3, surf_pocket3 
set_color pcol4 = [0.616,0.278,0.702]
select surf_pocket4, protein and id [4753,5657,4784,4806,4808,4809,4813,5661,4807,4811,5660,4757,4760,5693,4758,5053,5024,5027,5055,5282,5284,5267,4810,4814,5315,5056,5051] 
set surface_color,  pcol4, surf_pocket4 
set_color pcol5 = [0.902,0.361,0.792]
select surf_pocket5, protein and id [1595,1610,1722,1578,1877,1735,1736,916,1737,1743,1744,1745,927,913,885,888,1720,1721,803,804,953,1619,640,642,856,887,818,819] 
set surface_color,  pcol5, surf_pocket5 
set_color pcol6 = [0.702,0.278,0.447]
select surf_pocket6, protein and id [4551,4298,4259,4261,4263,4774,5329,4798,5331,5333,4745,4746,4748,4738,4740,4772,4771,4773,4258,4260] 
set surface_color,  pcol6, surf_pocket6 
set_color pcol7 = [0.902,0.361,0.361]
select surf_pocket7, protein and id [3548,3549,3529,3530,3290,3291,3292,3293,3853,3852,3854,3383,3526,3584,3585,3564,3527,3274,3844,3841,3583,3565,3266] 
set surface_color,  pcol7, surf_pocket7 
set_color pcol8 = [0.702,0.447,0.278]
select surf_pocket8, protein and id [5699,5692,4313,5665,5667,4319,4315,4312,4514,4516,5666,5663,5694,4782,4784,5702,4755,4757,4767,4517,4519,4521] 
set surface_color,  pcol8, surf_pocket8 
set_color pcol9 = [0.902,0.792,0.361]
select surf_pocket9, protein and id [1599,1627,1259,2125,1268] 
set surface_color,  pcol9, surf_pocket9 
   

deselect

orient
