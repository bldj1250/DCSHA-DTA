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

load "data/RPS6KA4(KinDom.1-N-terminal).pdb", protein
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

load "data/RPS6KA4(KinDom.1-N-terminal).pdb_points.pdb.gz", points
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
select surf_pocket1, protein and id [3312,3308,3309,3296,3297,3299,3301,3303,3291,3332,3334,3345,3347,3289,3290,3294,3295,3325,3318,3321,3491,3327,4390,3317,4392,3880,2716,3328,3548,3523,3526,3527,3547,3556,2741,3585,4379,3474,3475,4364,4365,4366,4358,4354,4355,4357,3827,3846,3849,4262,4263,3850,3458,3833,4529,4223,4391,4206,4222,4247,4235,3545,4381,4408,4388,4511,4514,4516,3851] 
set surface_color,  pcol1, surf_pocket1 
set_color pcol2 = [0.278,0.349,0.702]
select surf_pocket2, protein and id [356,1428,317,320,491,492,493,328,508,355,332,303,2632,475,928,2634,1304,1426,1427,1330,1424,1305,1419,1420,1344,908,924,902,950,951,952,953,1317,1319,1318,5705,1345,311,313,316,2668,306,307,301,337,340,5731,2667] 
set surface_color,  pcol2, surf_pocket2 
set_color pcol3 = [0.404,0.361,0.902]
select surf_pocket3, protein and id [969,971,972,1001,1312,1843,5738,5739,5742,5737,1005,1007,1871,995,1873,1877,994,999,1321,5706,1617,1629,1322,5725,5776,5733,5735,5736] 
set surface_color,  pcol3, surf_pocket3 
set_color pcol4 = [0.416,0.278,0.702]
select surf_pocket4, protein and id [5569,5568,5534,5536,5537,5567,5557,4528,5559,4512,4521,4516,4524,4529] 
set surface_color,  pcol4, surf_pocket4 
set_color pcol5 = [0.663,0.361,0.902]
select surf_pocket5, protein and id [1428,320,323,332,334,1427,1288,1305,1444,1449,1450,1441,1442] 
set surface_color,  pcol5, surf_pocket5 
set_color pcol6 = [0.616,0.278,0.702]
select surf_pocket6, protein and id [1428,492,493,328,508,332,334,546,629,593,656,1441,1442,1443,1427,1444,1449,337] 
set surface_color,  pcol6, surf_pocket6 
set_color pcol7 = [0.902,0.361,0.878]
select surf_pocket7, protein and id [2724,2726,836,838,224,226,233,235,3036,2721,2723,271,2746,2748,2749,3050,3316,3053,3326,3039,3042,3046] 
set surface_color,  pcol7, surf_pocket7 
set_color pcol8 = [0.702,0.278,0.584]
select surf_pocket8, protein and id [451,776,794,795,910,429,2898,2902,2903,2931,2893,2895,2896,2897,2894,777] 
set surface_color,  pcol8, surf_pocket8 
set_color pcol9 = [0.902,0.361,0.620]
select surf_pocket9, protein and id [269,265,268,271,3519,272,2721,2723,2708,3035,3036,226,3039,3044,3045,3046,3515] 
set surface_color,  pcol9, surf_pocket9 
set_color pcol10 = [0.702,0.278,0.380]
select surf_pocket10, protein and id [4041,4043,3952,3953,4014,3915,3916,4270,4272,4275,4305,4301,4319,3984,4035,4307,4311,4312,4313,4010,4011,4012] 
set surface_color,  pcol10, surf_pocket10 
set_color pcol11 = [0.902,0.361,0.361]
select surf_pocket11, protein and id [5726,5727,5728,5731,2636,2638,5767,5768,5769,968,979,970] 
set surface_color,  pcol11, surf_pocket11 
set_color pcol12 = [0.702,0.380,0.278]
select surf_pocket12, protein and id [1215,2279,1218,1732,1734,2306,2288,2309,1214,1213] 
set surface_color,  pcol12, surf_pocket12 
set_color pcol13 = [0.902,0.620,0.361]
select surf_pocket13, protein and id [498,341,346,347,348,519,2735,516,860,366,367,499] 
set surface_color,  pcol13, surf_pocket13 
set_color pcol14 = [0.702,0.584,0.278]
select surf_pocket14, protein and id [195,197,243,412,409,410,407,406,3112,3083,232] 
set surface_color,  pcol14, surf_pocket14 
set_color pcol15 = [0.902,0.878,0.361]
select surf_pocket15, protein and id [1738,1723,1726,1735,1537,1729,2284,1722,2244,2235,2236] 
set surface_color,  pcol15, surf_pocket15 
   

deselect

orient
