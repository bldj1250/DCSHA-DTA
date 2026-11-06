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

load "data/PRKCQ.pdb", protein
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

load "data/PRKCQ.pdb_points.pdb.gz", points
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
select surf_pocket1, protein and id [4074,4197,4199,4195,4073,4086,4088,4098,4089,4192,4193,1182,1185,4072,3093,3094,3096,3098,3100,3105,3106,5423,5425,5426,3142,3088,3274,3275,4190,3273,3680,3681,3145,3144,4087,3732,3733,3734,3748,3751,3752,3788,4114,5397,3087,3090,5387,5385,5390,5380,4113,3257,3686,3703,3707,3114,3124,1188,3129,5396,5395,3789] 
set surface_color,  pcol1, surf_pocket1 
set_color pcol2 = [0.278,0.322,0.702]
select surf_pocket2, protein and id [1409,2287,1402,1400,1401,1424,1425,1287,1573,2004,2005,2221,2233,2250,2231,2237,1870,1871,1995,1996,2146,2144,2147,2148,2260,2261,2262,2134,2135,1308,2288,1288,1665,1671,2236,2264,2268,2285,2249,2280,1652] 
set surface_color,  pcol2, surf_pocket2 
set_color pcol3 = [0.467,0.361,0.902]
select surf_pocket3, protein and id [3366,3367,4222,4212,3364,3397,3421,4220,3114,3122,3124,3125,3115,3118,3120,1188,1189,3287,4074,4199,4198,3274,3275,3106,3388,4214,4213,3387,3389,3391] 
set surface_color,  pcol3, surf_pocket3 
set_color pcol4 = [0.490,0.278,0.702]
select surf_pocket4, protein and id [4802,4803,4805,4825,4804,4806,4807,4629,4800,4628,1069,1068,1070,1071,1072,1073,1075,1074,1044,1047] 
set surface_color,  pcol4, surf_pocket4 
set_color pcol5 = [0.792,0.361,0.902]
select surf_pocket5, protein and id [4217,4219,4317,4318,4049,3385,3390,4227,3378,3412,4237,4235,1206,1204,1205,4221,3379] 
set surface_color,  pcol5, surf_pocket5 
set_color pcol6 = [0.702,0.278,0.659]
select surf_pocket6, protein and id [3986,3987,4270,4476,3956,3960,4477,4478,5034,3993,3994,3959,3962,4259,3990,4512,4475,4510] 
set surface_color,  pcol6, surf_pocket6 
set_color pcol7 = [0.902,0.361,0.682]
select surf_pocket7, protein and id [5539,5540,5562,1491,1500,1601,1603,1604,1605,1606,1591,1598,1594,1457,3333,3332,3331,3337,3338,3342,5561,5564,1607,1610,3335] 
set surface_color,  pcol7, surf_pocket7 
set_color pcol8 = [0.702,0.278,0.408]
select surf_pocket8, protein and id [4130,5232,5233,4128,4178,3690,4147,3549,3550,3510,3513,3512,5231,4126,4138,4131,3710] 
set surface_color,  pcol8, surf_pocket8 
set_color pcol9 = [0.902,0.361,0.361]
select surf_pocket9, protein and id [1270,1271,1272,1674,1779,1780,1781,2339,1658,1660,1818,2369,1820] 
set surface_color,  pcol9, surf_pocket9 
set_color pcol10 = [0.702,0.408,0.278]
select surf_pocket10, protein and id [181,147,139,141,140,641,593,643,180,642,110,596,623,627] 
set surface_color,  pcol10, surf_pocket10 
set_color pcol11 = [0.902,0.682,0.361]
select surf_pocket11, protein and id [1975,1974,1978,1971,1387,1389,1390,1980,1419,1420,1386,1388,1423,1989,1383,1421,1385,1969,1993,1994,1995] 
set surface_color,  pcol11, surf_pocket11 
set_color pcol12 = [0.702,0.659,0.278]
select surf_pocket12, protein and id [204,206,404,406,407,408,409,410,412,200,202,203,205,208,591,618,619] 
set surface_color,  pcol12, surf_pocket12 
   

deselect

orient
