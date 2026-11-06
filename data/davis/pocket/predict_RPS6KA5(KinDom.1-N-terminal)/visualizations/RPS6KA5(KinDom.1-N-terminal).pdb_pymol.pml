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

load "data/RPS6KA5(KinDom.1-N-terminal).pdb", protein
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

load "data/RPS6KA5(KinDom.1-N-terminal).pdb_points.pdb.gz", points
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
select surf_pocket1, protein and id [414,423,601,418,420,424,397,399,402,403,425,426,406,5855,409,422,5840,5852,5818,5819,599,584,585,586,1001,439,441,442,568,395,2778,2777,392,385,386,387,389,1388,1430,1527,1417,5856,1387,1404,1405,1549,1525,1526,1418,1523,1446,1518,1683,1686,1692,1684,1685,1687,1691,1682,1519,866,1445,1007,1023,1419,5881,1052,1054,1018,2742,2744,705,712,718,1540,1541,1542,745,684,685,709,710,1550,1548,1677,1681,1669,673,676] 
set surface_color,  pcol1, surf_pocket1 
set_color pcol2 = [0.278,0.298,0.702]
select surf_pocket2, protein and id [4624,4632,4634,4636,4666,5716,4301,4502,4294,4295,4682,4671,4665,4669,5692,5690,5691,4505,4507,4508,4509,5715,4308,4326,4781,4783,4785,5708,4784,4821,4689,5734,5707,5675,5677,5678,5679,4324,4321,4748,4696,4697,4698,4699,4752,4763,5322,4776,4779,4780,5353,4778,4687,5308,5309,5324,4342,5652,5656,5658,5659] 
set surface_color,  pcol2, surf_pocket2 
set_color pcol3 = [0.533,0.361,0.902]
select surf_pocket3, protein and id [2971,2973,788,2992,4643,3442,3444,3445,789,3014,3438,3632,3635,3636,3601,3665,252,253,254,255,260,268,3656,3657,3658,3654,3653,3659,2962,4638,4505,4507,4508,4509,3602,4497,3586,4482,4483,4496,3585,3692,4623,4625,4525,4628,4622,4624,4637,4498,3435,3426,3427,3429,3451,2965,2975,2978,2979,2981] 
set surface_color,  pcol3, surf_pocket3 
set_color pcol4 = [0.565,0.278,0.702]
select surf_pocket4, protein and id [4475,4337,3408,4338,4365,4366,3960,3407,3410,3569,3941,3958,3413,3414,3415,3416,3418,3425,3465,3420,4483,3584,4472,4326,3936,4350,4471,3796,4474] 
set surface_color,  pcol4, surf_pocket4 
set_color pcol5 = [0.902,0.361,0.878]
select surf_pocket5, protein and id [3177,3178,3175,3433,3436,3437,3446,3447,3591,3458,3892,3895,3893,3894,3593,3201,3206,3210,3211,3448,3450,3021,3023,3606,3608,3439,3603,3020,3884,3885,3202,3203,3204,3200,3156,3154,3019] 
set surface_color,  pcol5, surf_pocket5 
set_color pcol6 = [0.702,0.278,0.533]
select surf_pocket6, protein and id [1409,5889,1412,1937,1074,1071,1073,5887,5888,1974,5883,5886,5927,5924,5926,1105,1100,1101,5913,1709,5892,1938,1421,1422,1971,1965,1097,1099] 
set surface_color,  pcol6, surf_pocket6 
set_color pcol7 = [0.902,0.361,0.490]
select surf_pocket7, protein and id [542,543,544,3033,3034,873,872,890,1009,3035,3005,812,2997,3160,2999] 
set surface_color,  pcol7, surf_pocket7 
set_color pcol8 = [0.702,0.329,0.278]
select surf_pocket8, protein and id [234,243,246,249,4617,927,2942,2943,2962,256,925,926,2961,2963,242] 
set surface_color,  pcol8, surf_pocket8 
set_color pcol9 = [0.902,0.620,0.361]
select surf_pocket9, protein and id [708,711,1664,696,736,1380,1563,1564,1565,1645,1643,1555,1562] 
set surface_color,  pcol9, surf_pocket9 
set_color pcol10 = [0.702,0.631,0.278]
select surf_pocket10, protein and id [2980,2981,269,3015,3621,3625,3628,280,270,3619,3622,285,514,515,301,283] 
set surface_color,  pcol10, surf_pocket10 
   

deselect

orient
