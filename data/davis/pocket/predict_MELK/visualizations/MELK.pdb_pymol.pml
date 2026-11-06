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

load "data/MELK.pdb", protein
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

load "data/MELK.pdb_points.pdb.gz", points
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
select surf_pocket1, protein and id [1223,188,314,315,316,424,448,449,1219,1221,1224,691,478,331,4284,4286,4290,4292,167,1225,4291,174,185,181,183,177,372,1246,1247,416,1239,386,1238,4293,4303,4305,166,189,204,205,154,298,742,1097,4310,1217,4316,4315,1124,697,714,709,1066,1068,1067,1085,1213,1216,1218,558,4274,4257,4258,4259] 
set surface_color,  pcol1, surf_pocket1 
set_color pcol2 = [0.302,0.278,0.702]
select surf_pocket2, protein and id [1140,1144,1150,1161,1152,1163,2623,2652,2653,2654,2645,1181,725,1201,700,527,529,2246,2247,530,587,699,276,279,2620,2622,2657,2615,283,706,705,698,708,701,562,564,567,2591,2594,2616,2618,2602,584,284,280,274] 
set surface_color,  pcol2, surf_pocket2 
set_color pcol3 = [0.631,0.361,0.902]
select surf_pocket3, protein and id [774,776,778,1135,1136,780,4510,4511,4513,4505,4508,4498,739,730,1173,728,1174,1175,771,3564,3581,3582,872,3555,3552,3554,3556,3558,3559,782,813] 
set surface_color,  pcol3, surf_pocket3 
set_color pcol4 = [0.678,0.278,0.702]
select surf_pocket4, protein and id [5112,1100,5093,5095,5099,5101,5102,5113,1379,1381,1402,1404,4289,4296,5116,1098,5072,743,1085,4288,4294,4301,5110,5127,1390,1393,4267,4268,1733,1382,1385,4264,4266,4269,1654,1679,1680,1681] 
set surface_color,  pcol4, surf_pocket4 
set_color pcol5 = [0.902,0.361,0.682]
select surf_pocket5, protein and id [897,898,896,2158,920,924,927,2153,2155,2175,2176,2178,2201,2143,2148,3533,3535,3537,3513,544,933,1184] 
set surface_color,  pcol5, surf_pocket5 
set_color pcol6 = [0.702,0.278,0.341]
select surf_pocket6, protein and id [3507,897,896,2158,920,924,2193,2155,2201,3533,934,935,543,544,933,531,2239,1181,1182,1183,1184,955,957,921,2191,533,2197,2196,2238] 
set surface_color,  pcol6, surf_pocket6 
set_color pcol7 = [0.902,0.522,0.361]
select surf_pocket7, protein and id [4895,4826,4699,4825,5166,4823,4060,5125,4046,4048,5126,4708,4831,4063,4884,4887,5160,4047,4707,4710] 
set surface_color,  pcol7, surf_pocket7 
set_color pcol8 = [0.702,0.596,0.278]
select surf_pocket8, protein and id [730,4328,4330,4331,4352,5060,4511,4513,4341,4343,766,769,5062,5066,5054,5058,5059,5061,5056,771,767,4517,4520,5046,4329] 
set surface_color,  pcol8, surf_pocket8 
   

deselect

orient
