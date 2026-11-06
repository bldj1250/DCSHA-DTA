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

load "data/MAP4K2.pdb", protein
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

load "data/MAP4K2.pdb_points.pdb.gz", points
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
select surf_pocket1, protein and id [196,197,188,191,193,195,182,184,786,787,788,335,717,1131,753,754,737,743,738,4642,748,234,236,237,189,183,187,186,185,1108,1110,1132,1204,1116,760,1213,1206,1209,1211,1212,473,504,206,350,351,352,718] 
set surface_color,  pcol1, surf_pocket1 
set_color pcol2 = [0.278,0.333,0.702]
select surf_pocket2, protein and id [5553,5539,5555,2749,2725,2726,4765,4756,5153,4757,4760,5152,6196,6197,6199,6200,6202,6185,6191,6210,6201,6203,6204,6205,6207,5878,5882,5886,3830,3836,4201,4212,3824,4195,4761,4189,4193,4214] 
set surface_color,  pcol2, surf_pocket2 
set_color pcol3 = [0.443,0.361,0.902]
select surf_pocket3, protein and id [1713,1714,1376,1378,1374,3049,4980,4982,1677,1678,1679,1358,1392,1097,1098,1099,1107,1391,777,778,779,808,818,817,1634,1653,1639,3026,3014,3041,3013,2991,3016,1366] 
set surface_color,  pcol3, surf_pocket3 
set_color pcol4 = [0.463,0.278,0.702]
select surf_pocket4, protein and id [3764,6149,6353,2537,6354,2540,3765,2539,6283,6285,6335,2561,2582,2604,6136,6334,2517,3768,2513,2510] 
set surface_color,  pcol4, surf_pocket4 
set_color pcol5 = [0.741,0.361,0.902]
select surf_pocket5, protein and id [3875,3876,4400,3916,3936,4031,4403,4405,4057,4058,4059,3934,4028,4118,4014,4115,4116,4054,4081,4083,4117,4101,3889,3896,4401,4440,4443,4432,4437,4438,4473,4472,4416,4025] 
set surface_color,  pcol5, surf_pocket5 
set_color pcol6 = [0.694,0.278,0.702]
select surf_pocket6, protein and id [3038,3040,3041,197,200,195,1359,1098,1099,1116,1107,205,206,1082,3020,1234,1213,1209,1211,1212,1226,351,352,3015,3016,3017] 
set surface_color,  pcol6, surf_pocket6 
set_color pcol7 = [0.902,0.361,0.757]
select surf_pocket7, protein and id [4675,4323,4676,4677,2381,4307,4322,4302,4156,4157,4158,4159,4345,2405,2403,2404,4293,2393,4290,4291] 
set surface_color,  pcol7, surf_pocket7 
set_color pcol8 = [0.702,0.278,0.475]
select surf_pocket8, protein and id [4156,4158,4159,4574,4346,4659,4661,4142,4396,4141,4360] 
set surface_color,  pcol8, surf_pocket8 
set_color pcol9 = [0.902,0.361,0.459]
select surf_pocket9, protein and id [1465,1748,1750,1752,1753,2912,1719,2936,2938,1721,2937,1716,1433,1742,1776,2928,2930] 
set surface_color,  pcol9, surf_pocket9 
set_color pcol10 = [0.702,0.318,0.278]
select surf_pocket10, protein and id [4904,4908,5065,5068,5416,5082,5099,5393,5374,5378,5385,5432,5433,5383] 
set surface_color,  pcol10, surf_pocket10 
set_color pcol11 = [0.902,0.561,0.361]
select surf_pocket11, protein and id [5638,5640,5671,5641,5689,5508,5509,5797,5288,5296,5292,5293,5294,5279,5649,5655,5658,5669,5646] 
set surface_color,  pcol11, surf_pocket11 
set_color pcol12 = [0.702,0.553,0.278]
select surf_pocket12, protein and id [2762,4976,4237,4229,4835,4948,4823,4825,4829,4971,4974] 
set surface_color,  pcol12, surf_pocket12 
set_color pcol13 = [0.902,0.859,0.361]
select surf_pocket13, protein and id [6161,6163,2633,6255,2631,5987,5988,5995] 
set surface_color,  pcol13, surf_pocket13 
   

deselect

orient
