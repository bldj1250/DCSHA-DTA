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

load "data/RAF1.pdb", protein
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

load "data/RAF1.pdb_points.pdb.gz", points
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
select surf_pocket1, protein and id [3841,3843,3761,2934,3842,2917,3313,2916,2918,3760,3337,3332,3335,3757,3742,3719,3703,3894,3730,3720,3731,3759,2836,2789,2790,2786,3327,3330,3331,2782,2784,2788,2833,2835,3357,3360,3362,3350,3352,3354,3336,2815,2817,2929,2932,2933,2798,2822,2792,2799,2802,2807,2808,3836,3307,3308,3190,3189] 
set surface_color,  pcol1, surf_pocket1 
set_color pcol2 = [0.365,0.278,0.702]
select surf_pocket2, protein and id [1482,1483,1485,1487,4617,4618,4621,4614,4616,1481,1450,1460,1463,1464,1466,1330,1329,1331,717,4668,4670,4647,4649,4615,4638,4648,4640,4639,4641,1343,1345,1347,1435,1437,1207,1478,1484,1488,1517,1518,1521,4510,4513,4491,730,731,732] 
set surface_color,  pcol2, surf_pocket2 
set_color pcol3 = [0.792,0.361,0.902]
select surf_pocket3, protein and id [1210,1334,1335,1151,1153,1208,1209,1354,1355,1356,1333,1300,1204,1206,1303,4816,4817,4819,4820,1137,4729,4795,1232,1233,1189,4793,4761,4763,4791,4617,4618,4621,4590,4593,1330,4592,4794,4821,4822,4827,4851,4853,4628,4645,4647,4649,4731,4622,4623,4625,4648] 
set surface_color,  pcol3, surf_pocket3 
set_color pcol4 = [0.702,0.278,0.533]
select surf_pocket4, protein and id [1877,1884,1886,1887,1888,1885,1860,1287,1288,1290,1291,1292,1385,1087,1105,1109,1088,1106,1111,1443,4976,4977,1873,1876,1428,1404,1407,1289,1366,1367,1406,1430,1436] 
set surface_color,  pcol4, surf_pocket4 
set_color pcol5 = [0.902,0.361,0.361]
select surf_pocket5, protein and id [4003,3994,3996,4000,3889,3998,4043,3980,3986,3992,4045,3971,3702,3894,3892,4149,3689,3870,4150,4151,4099,3871,3895,3896,3898,3974,3970] 
set surface_color,  pcol5, surf_pocket5 
set_color pcol6 = [0.702,0.533,0.278]
select surf_pocket6, protein and id [3837,3111,3836,3307,3848,3110,3294,3293,3864,3852,3190,3187,3842,3865,2932] 
set surface_color,  pcol6, surf_pocket6 
   

deselect

orient
