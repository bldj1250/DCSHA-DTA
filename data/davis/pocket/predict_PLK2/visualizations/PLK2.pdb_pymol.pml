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

load "data/PLK2.pdb", protein
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

load "data/PLK2.pdb_points.pdb.gz", points
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
select surf_pocket1, protein and id [847,848,711,1123,727,846,1275,674,834,1281,1813,1806,1809,1811,1826,1827,1828,849,1812,1009,680,682,684,689,690,693,697,678,671,676,677,725,1834,1836,700,702,704,706,865,970,983,1337,1359,672,1728,1322,1324,1326,1327,1302,1700,1730,1729,1803,1725,1726,1727,1298,1301,1708] 
set surface_color,  pcol1, surf_pocket1 
set_color pcol2 = [0.278,0.278,0.702]
select surf_pocket2, protein and id [5052,5051,4671,4021,4029,4017,4652,4658,5214,4649,5211,5030,5032,5034,5035,5036,5031,5209,4037,4039,4041,4981,5003,4042,4035,4033,4990,4673,4653] 
set surface_color,  pcol2, surf_pocket2 
set_color pcol3 = [0.576,0.361,0.902]
select surf_pocket3, protein and id [4562,4564,4568,4593,4595,4597,4598,3208,4570,4555,4534,4558,4535,2980,2991,3179,4596,4599,3177,3178,3143,3145,3142,2981,3207,2920,2922,2933,2935,2931,2957,3166,3168,3172,3167,2924,3171] 
set surface_color,  pcol3, surf_pocket3 
set_color pcol4 = [0.616,0.278,0.702]
select surf_pocket4, protein and id [4569,4572,4564,4566,4567,4568,3208,4570,4535,3245,3244,3207,2932,2933,2934,2935,2930,2931,4092,2864,2843,2861,4064,4066,4069,4101,4102,4104,4538,4543] 
set surface_color,  pcol4, surf_pocket4 
set_color pcol5 = [0.902,0.361,0.792]
select surf_pocket5, protein and id [1151,1148,1149,607,793,627,771,830,1267,827,1160,1162,1163,593,630,573,594,605] 
set surface_color,  pcol5, surf_pocket5 
set_color pcol6 = [0.702,0.278,0.447]
select surf_pocket6, protein and id [3731,3734,3717,4794,4796,4812,3727,3729,3730,3737,4389,4390,3715,4376,3637,4371,3634,3635] 
set surface_color,  pcol6, surf_pocket6 
set_color pcol7 = [0.902,0.361,0.361]
select surf_pocket7, protein and id [4870,4994,4873,4992,5014,5015,5016,5017,5018,5408,4875,3560,5406,5378,5383,5367,5368,5369,5373,5374,5404] 
set surface_color,  pcol7, surf_pocket7 
set_color pcol8 = [0.702,0.447,0.278]
select surf_pocket8, protein and id [1685,1686,1689,1697,1349,1998,2000,1683,1692,1347,1350,1695,2242,2196,2243] 
set surface_color,  pcol8, surf_pocket8 
set_color pcol9 = [0.902,0.792,0.361]
select surf_pocket9, protein and id [1597,2093,2095,1593,1594,2617,2606,2608,2611,2616,2101,2103] 
set surface_color,  pcol9, surf_pocket9 
   

deselect

orient
