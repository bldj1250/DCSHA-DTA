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

load "data/MAST1.pdb", protein
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

load "data/MAST1.pdb_points.pdb.gz", points
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
select surf_pocket1, protein and id [4082,4083,4081,4006,5367,3610,4086,4088,4090,3991,3968,2997,3004,3006,5365,5363,3031,3051,3048,3050,3000,3171,3019,3016,3002,3588,3593,3188,3980,4007,3641,5371,3979,3982] 
set surface_color,  pcol1, surf_pocket1 
set_color pcol2 = [0.278,0.298,0.702]
select surf_pocket2, protein and id [1606,1722,1726,1602,1604,1716,1642,1640,1633,1607,1728,4129,4132,4133,4134,1760,1761,4125,4127,1724,1727,4136,1688,3369,1689,1638,3306,3308,3309,3327,3329,3330,3318,3341,4126,4128,1717] 
set surface_color,  pcol2, surf_pocket2 
set_color pcol3 = [0.533,0.361,0.902]
select surf_pocket3, protein and id [4487,5032,4269,4470,4480,4481,4484,4498,4499,4243,4240,4270,4237,4241,4242,4472,4162,4489,4490,4491,4492,4181,4184,4182,4183,4148,4265,4267,4268,1790,1793,4144,4141,4145,4293,1788,3922,4294,4304,4305,4266,4264,4292] 
set surface_color,  pcol3, surf_pocket3 
set_color pcol4 = [0.565,0.278,0.702]
select surf_pocket4, protein and id [7970,7524,7808,7809,7810,7720,7793,8271,8269,8263,8256,8252,8254,8247,8258,7984,8041,8046,7511,7509,7741,7980,7982,7983,7975] 
set surface_color,  pcol4, surf_pocket4 
set_color pcol5 = [0.902,0.361,0.878]
select surf_pocket5, protein and id [3210,3213,3549,3550,3551,3537,3061,3063,3196,3040,3014,3043,3198,2924,5448,5475,5479,5447,5449,5450,5446,5444,3194,3207,3193,3037] 
set surface_color,  pcol5, surf_pocket5 
set_color pcol6 = [0.702,0.278,0.533]
select surf_pocket6, protein and id [4162,4160,4490,3876,3877,3878,5038,3891,5044,3850,3852,3846,4487,5032,4499,4192,4191,5036,5035,5037,5046,5039,5041] 
set surface_color,  pcol6, surf_pocket6 
set_color pcol7 = [0.902,0.361,0.490]
select surf_pocket7, protein and id [1949,1951,2197,49,1950,2193,2196,2165,2203,35,1984,2657,69,50,10] 
set surface_color,  pcol7, surf_pocket7 
set_color pcol8 = [0.702,0.329,0.278]
select surf_pocket8, protein and id [1882,2286,1905,1917,1881,1907,1921,1923,1906,1951,2249,49,1950,21,43,47,12,2248,2250] 
set surface_color,  pcol8, surf_pocket8 
set_color pcol9 = [0.902,0.620,0.361]
select surf_pocket9, protein and id [3981,3982,3983,4391,3683,3651,3649,3652,4362,4374,4376,4377,4378,4389,3675,4603,4641,4646,4647] 
set surface_color,  pcol9, surf_pocket9 
set_color pcol10 = [0.702,0.631,0.278]
select surf_pocket10, protein and id [7679,7658,7666,7672,8130,8106,8105,8137,7638,7641,8139,7645] 
set surface_color,  pcol10, surf_pocket10 
   

deselect

orient
