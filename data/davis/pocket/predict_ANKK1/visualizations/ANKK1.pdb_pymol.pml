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

load "data/ANKK1.pdb", protein
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

load "data/ANKK1.pdb_points.pdb.gz", points
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
select surf_pocket1, protein and id [645,647,3732,3981,3983,3733,3999,4000,4001,4256,656,1027,1030,657,1006,1029,637,638,644,646,1007,1008,1257,1258,1259,1086,1053,1055,1050,1084,3985,4239,1052,2301,2302,2303,4267,4270,4274,3991,4008,4014,4236,4237,4255,4247,4254,2271,2273,999,2269,997,1000,2299,2327,969,970,2357,2247,642,623,635,1059,1061,3987,3969,3993,3713,3714,3973,4002] 
set surface_color,  pcol1, surf_pocket1 
set_color pcol2 = [0.278,0.333,0.702]
select surf_pocket2, protein and id [1210,1187,818,821,1211,824,808,817,852,1185,826,229,850,223,800,795,799,1287,1289,1295,1195,1297,276,277,231,235,237,402,780,222,225,792,794,261,418,419,420,1296,774] 
set surface_color,  pcol2, surf_pocket2 
set_color pcol3 = [0.443,0.361,0.902]
select surf_pocket3, protein and id [1319,261,419,420,1483,1486,245,248,252,238,1315,1316,1317,1321,1322,1343,1344,1345,1349,1452,1325,1350,1339,1381,1155,1159,1195,1297,1175,1176,1294,1293,1295,1482,1498,1479,1480,1481,1187,1324,1424,1426,1449] 
set surface_color,  pcol3, surf_pocket3 
set_color pcol4 = [0.463,0.278,0.702]
select surf_pocket4, protein and id [349,3236,3237,377,693,398,698,695,376,690,691,98,100,119,358,359,351,352,353,354,355,3233,3224,3225,3232,3235,3226,3227] 
set surface_color,  pcol4, surf_pocket4 
set_color pcol5 = [0.741,0.361,0.902]
select surf_pocket5, protein and id [3902,3651,3653,3655,3657,3650,3648,3652,3654,3698,3620,3637,3407,3409,3716,3717,3635,3619,3618] 
set surface_color,  pcol5, surf_pocket5 
set_color pcol6 = [0.694,0.278,0.702]
select surf_pocket6, protein and id [1319,259,417,418,419,420,249,1320,758,760,416,423,425,1316,1317,528,1342,1344,1346,1348,533,535,537,538,452,526,427,428,430,451,438] 
set surface_color,  pcol6, surf_pocket6 
set_color pcol7 = [0.902,0.361,0.757]
select surf_pocket7, protein and id [591,774,686,760,775,1319,1296,1285,1290,1291,1306,1308,669,671] 
set surface_color,  pcol7, surf_pocket7 
set_color pcol8 = [0.702,0.278,0.475]
select surf_pocket8, protein and id [3970,3971,3972,3973,3974,3976,4211,3987,3986,3716,3657,3913,3914,3915,3954,4210] 
set surface_color,  pcol8, surf_pocket8 
set_color pcol9 = [0.902,0.361,0.459]
select surf_pocket9, protein and id [4921,4923,5129,5130,4903,5131,5144,5146,5224,5225,5158,5159,5163,5156,5157,5161,4987,4925] 
set surface_color,  pcol9, surf_pocket9 
set_color pcol10 = [0.702,0.318,0.278]
select surf_pocket10, protein and id [2922,2924,2961,3051,2725,2726,2742,2743,3045,3046,3044,2793,3091,2851,2804,3069,3071,3072,3073,3074,3075,2806] 
set surface_color,  pcol10, surf_pocket10 
set_color pcol11 = [0.902,0.561,0.361]
select surf_pocket11, protein and id [3469,3470,3220,3392,3404,3405,3406,3409,3410,3449,3451,3375,3161,3163] 
set surface_color,  pcol11, surf_pocket11 
set_color pcol12 = [0.702,0.553,0.278]
select surf_pocket12, protein and id [2937,3135,2910,2911,3147,3155,3159,3199,3136,3201,3200,2973,2952,2954] 
set surface_color,  pcol12, surf_pocket12 
set_color pcol13 = [0.902,0.859,0.361]
select surf_pocket13, protein and id [1634,1636,1645,1644,1646,1073,1075,1051,1074,1078,2230,2227,2225,2229] 
set surface_color,  pcol13, surf_pocket13 
   

deselect

orient
