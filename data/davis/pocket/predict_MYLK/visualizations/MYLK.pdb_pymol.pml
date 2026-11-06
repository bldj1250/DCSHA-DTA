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

load "data/MYLK.pdb", protein
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

load "data/MYLK.pdb_points.pdb.gz", points
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
select surf_pocket1, protein and id [11446,11442,11445,11317,11314,11270,11264,11265,11272,12349,12354,12355,12357,12361,12245,12353,12233,11860,11813,11259,11262,11316,11433,11819,11832,11258,11260,12261,11836,12260,11690,11835,11838,12352,11274,11275] 
set surface_color,  pcol1, surf_pocket1 
set_color pcol2 = [0.278,0.298,0.702]
select surf_pocket2, protein and id [3936,3937,3934,3911,3915,4499,4501,302,304,4496,3899,4488,4490,4492,303,889,283,888,894,4497,249,275,277,278,248,4504,4508,4507,4509,869,878,245,3912,3903,3905,3908] 
set surface_color,  pcol2, surf_pocket2 
set_color pcol3 = [0.533,0.361,0.902]
select surf_pocket3, protein and id [1551,1586,1579,1581,3609,3249,1557,1683,3266,3264,1554,3506,3522,3525,3591,3593,3261] 
set surface_color,  pcol3, surf_pocket3 
set_color pcol4 = [0.565,0.278,0.702]
select surf_pocket4, protein and id [5085,5253,5240,5245,5084,4990,4994,4995,5251,5252,5082,5031,5032,5027] 
set surface_color,  pcol4, surf_pocket4 
set_color pcol5 = [0.902,0.361,0.878]
select surf_pocket5, protein and id [4803,4802,4805,10121,10120,10365,10347,10349,10356,10363,9962,9963,10111,9958,9959,9960,9932,9961,9935,9933] 
set surface_color,  pcol5, surf_pocket5 
set_color pcol6 = [0.702,0.278,0.533]
select surf_pocket6, protein and id [5099,5101,5103,5105,5106,5030,5024,5051,4971,4954,4958,4965,5163,4960,4963] 
set surface_color,  pcol6, surf_pocket6 
set_color pcol7 = [0.902,0.361,0.490]
select surf_pocket7, protein and id [11520,11546,11556,12374,11290,11292,11293,11295,11465,11282,11288,11558,12376,11519,11521,11587] 
set surface_color,  pcol7, surf_pocket7 
set_color pcol8 = [0.702,0.329,0.278]
select surf_pocket8, protein and id [11711,11428,11361,11362,11363,11720,11710,11716,11718,11210] 
set surface_color,  pcol8, surf_pocket8 
set_color pcol9 = [0.902,0.620,0.361]
select surf_pocket9, protein and id [10835,10836,10511,10698,10509,10700,10837,10450,10452,10454] 
set surface_color,  pcol9, surf_pocket9 
set_color pcol10 = [0.702,0.631,0.278]
select surf_pocket10, protein and id [3497,3659,3405,3646,3477,3479,3434,3438,3439,3686,3401,3649,3652] 
set surface_color,  pcol10, surf_pocket10 
   

deselect

orient
