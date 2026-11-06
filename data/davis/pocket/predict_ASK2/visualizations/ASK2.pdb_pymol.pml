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

load "data/ASK2.pdb", protein
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

load "data/ASK2.pdb_points.pdb.gz", points
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
select surf_pocket1, protein and id [4089,4758,4759,4031,4032,4036,3991,4056,4058,4068,4076,4042,4043,4045,4099,4727,4729,4730,4030,3987,3989,4009,4022,4018,4008,4013,4097,4079,4085,4078] 
set surface_color,  pcol1, surf_pocket1 
set_color pcol2 = [0.278,0.341,0.702]
select surf_pocket2, protein and id [3435,3437,3051,3070,3069,3077,3674,3706,3676,114,118,2745,3705,3698,3701,3704,3727,3730,3729,2778,3699,3697,2749,3461] 
set surface_color,  pcol2, surf_pocket2 
set_color pcol3 = [0.424,0.361,0.902]
select surf_pocket3, protein and id [5087,5088,5092,5093,5089,5145,5091,5255,5655,5669,6177,6178,6180,6182,5143,5146,5649,5650,5524,5094,5099,5101,5107,5106,6093,6092,5687,5673,5694,5696,5688,5691,6078,6067,6174,6176] 
set surface_color,  pcol3, surf_pocket3 
set_color pcol4 = [0.435,0.278,0.702]
select surf_pocket4, protein and id [3740,3741,3777,3806,3810,3942,3911,3953,3771,3773,3775,3837,3839,3822,3945,3544,3484,3479,3482,3506,3766,3515,3516,3518,3520,3521,3876,3902,3905,3864,3866,3868,3847] 
set surface_color,  pcol4, surf_pocket4 
set_color pcol5 = [0.698,0.361,0.902]
select surf_pocket5, protein and id [3294,3467,3468,3243,3269,3241,3264,3267,3242,3489,3488,3490,3494,3495,3497,3162,3163,3159,3161,3160,3270] 
set surface_color,  pcol5, surf_pocket5 
set_color pcol6 = [0.651,0.278,0.702]
select surf_pocket6, protein and id [152,154,131,135,3390,3392,3395,174,1856,1863,2188,181,171,1857,3641,2184,2185,2186,2187,3643,3644,3621,3629,3631] 
set surface_color,  pcol6, surf_pocket6 
set_color pcol7 = [0.902,0.361,0.824]
select surf_pocket7, protein and id [4128,4143,4647,4661,4145,4193,4639,4643,4652,4642,4644,4645,4657,4663,4662,4424,4425,4426,4427,4429,4430,4422,4423,4331,4332,4635,4637] 
set surface_color,  pcol7, surf_pocket7 
set_color pcol8 = [0.702,0.278,0.533]
select surf_pocket8, protein and id [4655,6246,6247,6225,4603,4601,4654,5400,5401,5402,6220,6221,6218,6249,4606,5423,5397,5395,5399,6232,6227,6228,5398,6222] 
set surface_color,  pcol8, surf_pocket8 
set_color pcol9 = [0.902,0.361,0.545]
select surf_pocket9, protein and id [6264,6283,6249,4651,4652,5400,5401,6220,6221,4655,4603,5367,4586,4582,4584] 
set surface_color,  pcol9, surf_pocket9 
set_color pcol10 = [0.702,0.278,0.318]
select surf_pocket10, protein and id [3612,4539,4543,3609,3613,4185,4528,4569,4685,3604,3602,4136,4137,4186,4670,4184,3600,4169] 
set surface_color,  pcol10, surf_pocket10 
set_color pcol11 = [0.902,0.451,0.361]
select surf_pocket11, protein and id [86,87,89,90,111,2693,3017,3032,3034,3019,3021,77,2685,2683,3046,3049,3043,2720] 
set surface_color,  pcol11, surf_pocket11 
set_color pcol12 = [0.702,0.459,0.278]
select surf_pocket12, protein and id [3645,3650,3652,4558,4559,4705,4707,1902,4713,4716,4710,4717,4709,2185,3632,1898,1901] 
set surface_color,  pcol12, surf_pocket12 
set_color pcol13 = [0.902,0.729,0.361]
select surf_pocket13, protein and id [848,853,1064,1065,851,838,1698,1712,1079,1729,1730,1732,1735,1045,1056,1055,303,306] 
set surface_color,  pcol13, surf_pocket13 
set_color pcol14 = [0.702,0.675,0.278]
select surf_pocket14, protein and id [1002,972,973,898,1103,958] 
set surface_color,  pcol14, surf_pocket14 
   

deselect

orient
