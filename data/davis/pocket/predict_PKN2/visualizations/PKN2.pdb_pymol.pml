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

load "data/PKN2.pdb", protein
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

load "data/PKN2.pdb_points.pdb.gz", points
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
select surf_pocket1, protein and id [3949,3950,3923,3924,5277,5285,5265,7542,7544,7547,7549,7552,7586,5270,5273,5264,5267,5288,5309,5310,5275,5284,5271,5291,7559,5449,5450,5451,5452,6364,6366,6368,5434,5864,5869,5328,5327,5886,5308,5543,6391,5305,5307,6381,6382,6383,6384,5595,6367,5538,5465,5501,5503,5564,5565,5566,5562,5571,5539,5568,6243,6256,6268,6262,6257,6283,6284,6359,6226,6227,6244,6390,6514,6387,6389,6506,6508,5962,5911,5935] 
set surface_color,  pcol1, surf_pocket1 
set_color pcol2 = [0.278,0.278,0.702]
select surf_pocket2, protein and id [1758,1761,1763,1731,3552,1801,3543,3544,1800,2157,1764,1769,1771,3547,3537,3538,3539,3711,3713,3592,3594,977,980,987,3559,3558,972,1762,3564,3565,3569,3593,979] 
set surface_color,  pcol2, surf_pocket2 
set_color pcol3 = [0.576,0.361,0.902]
select surf_pocket3, protein and id [3621,3656,3659,3638,3653,1087,1091,979,960,1089,1061,1086,1117,1081,952,953,954,958,1062,3643,3651,1092,1093,1096,3593,3591,3671,968,967,3592,980,3603,3590] 
set surface_color,  pcol3, surf_pocket3 
set_color pcol4 = [0.616,0.278,0.702]
select surf_pocket4, protein and id [205,371,373,183,185,204,214,203,215,230,232,233,349,278,276,213,825,855,857,798,835,856,853,372,409,826,859] 
set surface_color,  pcol4, surf_pocket4 
set_color pcol5 = [0.902,0.361,0.792]
select surf_pocket5, protein and id [1877,1849,1851,1868,2107,2129,2132,2133,2389,1812,2390,2407,2077,2078,1896,2103,2105,2140] 
set surface_color,  pcol5, surf_pocket5 
set_color pcol6 = [0.702,0.278,0.447]
select surf_pocket6, protein and id [6913,4105,4103,6876,6877,6881,6878,6582,6585,6579,6581,6853,6854,4131,4041,4044,4040,6883,6496,6497,4056] 
set surface_color,  pcol6, surf_pocket6 
set_color pcol7 = [0.902,0.361,0.361]
select surf_pocket7, protein and id [3388,3389,2578,1791,1792,3390,1801,2552,1789,2553,2577,3566,3569] 
set surface_color,  pcol7, surf_pocket7 
set_color pcol8 = [0.702,0.447,0.278]
select surf_pocket8, protein and id [7873,7874,5181,5367,5370,5157,5159,5160,5161,5156,5158,5386,5154,7870,7872] 
set surface_color,  pcol8, surf_pocket8 
set_color pcol9 = [0.902,0.792,0.361]
select surf_pocket9, protein and id [3146,3147,3148,3402,3407,3548,1832,1831,1799,3134,3141,3385,3389,3133,3139,3386] 
set surface_color,  pcol9, surf_pocket9 
   

deselect

orient
