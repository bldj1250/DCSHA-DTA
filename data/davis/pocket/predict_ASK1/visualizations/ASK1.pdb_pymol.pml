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

load "data/ASK1.pdb", protein
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

load "data/ASK1.pdb_points.pdb.gz", points
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
select surf_pocket1, protein and id [2980,3326,3327,3328,3329,3719,3006,3240,3004,3005,3008,3238,3037,3982,3957,3984,3033,3717,3346,3715,3354,3989,3991,3992,4012,4014,3066,3740,4021,3671,3672,3674,3682,3684,3678,3680,3959,3681,3718,2708,2710,2718,2719,2720,2979,2981,3949,3948,2449,2453,2745,2747,3009,3011,2978,3688] 
set surface_color,  pcol1, surf_pocket1 
set_color pcol2 = [0.278,0.341,0.702]
select surf_pocket2, protein and id [5425,5472,5473,5590,5413,5415,5420,5421,5423,5427,5432,5433,5972,6418,6419,5991,5995,5574,5971,5977,5592,6509,6404,6504,6506,6508,6503,6500,6502,6393,5839,6016,6010,6013,5414,5417,5418,5987] 
set surface_color,  pcol2, surf_pocket2 
set_color pcol3 = [0.424,0.361,0.902]
select surf_pocket3, protein and id [1772,1773,1774,1721,1738,1743,1614,1616,1602,1612,1841,1842,1805,1624,1815,1801,1802,1810] 
set surface_color,  pcol3, surf_pocket3 
set_color pcol4 = [0.435,0.278,0.702]
select surf_pocket4, protein and id [3887,5021,3910,3912,3880,3881,3921,4266,3917,3874,3876,4863,4864,4287,5028,3934,3931,3932,3969,4286,3909,3911,4867] 
set surface_color,  pcol4, surf_pocket4 
set_color pcol5 = [0.698,0.361,0.902]
select surf_pocket5, protein and id [4943,4953,4955,4956,4957,4415,4421,4422,4403,4408,4413,4972,4974,4397,4626,4414,4691,4724,4726] 
set surface_color,  pcol5, surf_pocket5 
set_color pcol6 = [0.651,0.278,0.702]
select surf_pocket6, protein and id [3525,3526,3527,3445,3443,3763,3765,3769,3770,3447,3747,3764,3547,3550,3578,3552,3557,3772] 
set surface_color,  pcol6, surf_pocket6 
set_color pcol7 = [0.902,0.361,0.824]
select surf_pocket7, protein and id [3775,3776,4048,4197,4059,4205,4057,4087,4174,3781,3799,4173,3759,4238,3825,3782,3824,3790] 
set surface_color,  pcol7, surf_pocket7 
set_color pcol8 = [0.702,0.278,0.533]
select surf_pocket8, protein and id [5706,5708,5714,5715,5743,5722,5719,4783,4784,4905,4787,4965,5687,4907,4963,4964,4948,5720,5721] 
set surface_color,  pcol8, surf_pocket8 
set_color pcol9 = [0.902,0.361,0.545]
select surf_pocket9, protein and id [3857,3859,3860,3861,3862,3839,4451,4474,4656,4165,4191,4473,3832,4190] 
set surface_color,  pcol9, surf_pocket9 
set_color pcol10 = [0.702,0.278,0.318]
select surf_pocket10, protein and id [4907,4889,5688,4802,4804,4910,4887,5709,5710,5712,5713,4824,4826,4809,5679,5707,5711] 
set surface_color,  pcol10, surf_pocket10 
set_color pcol11 = [0.902,0.451,0.361]
select surf_pocket11, protein and id [6631,5694,6627,6628,6615,6618,5692,5451,5454,6632,6635,5690,5721,6527,6530,6537,6359,6525,5693,5722,6545,6546] 
set surface_color,  pcol11, surf_pocket11 
set_color pcol12 = [0.702,0.459,0.278]
select surf_pocket12, protein and id [6396,6685,6683,6655,6032,6893,6064,6933,6673] 
set surface_color,  pcol12, surf_pocket12 
set_color pcol13 = [0.902,0.729,0.361]
select surf_pocket13, protein and id [6183,6184,6197,6178,6180,6181,6182,9077,9078,9059,6162,9069] 
set surface_color,  pcol13, surf_pocket13 
set_color pcol14 = [0.702,0.675,0.278]
select surf_pocket14, protein and id [8956,9161,9191,9188,8928,8930,9186,9307,8932,9308,9309,9270,9305,9216,9189] 
set surface_color,  pcol14, surf_pocket14 
   

deselect

orient
