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

load "data/RSK2(KinDom.1-N-terminal).pdb", protein
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

load "data/RSK2(KinDom.1-N-terminal).pdb_points.pdb.gz", points
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
select surf_pocket1, protein and id [5824,5827,1251,1225,1606,2882,1605,2884,1191,1195,592,593,581,583,585,587,629,632,580,770,631,757,1167,1176,775,924,1688,1690,1692,1693,1694,773,774,1685,1170,1686,1577,1578,1590,1579,2875,2880,2918,575,2885,573,574,579,577] 
set surface_color,  pcol1, surf_pocket1 
set_color pcol2 = [0.278,0.322,0.702]
select surf_pocket2, protein and id [3602,3605,3475,3608,3609,3610,3825,3827,3958,3959,3597,3486,3488,3441,3434,3438,3436,3593,3977,3980,3981,3432,3433,3708,3944,3741,3826,3943,4496,4497,4499,4501,4503,4370,4385,4493,4361,4386,3448,3449,3445] 
set surface_color,  pcol2, surf_pocket2 
set_color pcol3 = [0.467,0.361,0.902]
select surf_pocket3, protein and id [5690,5692,4765,4792,4794,5322,4796,4816,4822,5276,5275,4826,4764,4767,5291,4832,5664,5667,5665,5691,5038,5694,5064,4818,4819,4820,4821,5668,5061,4779,4317,4320,4324,5710,5697,5703,5701,5676,4318] 
set surface_color,  pcol3, surf_pocket3 
set_color pcol4 = [0.490,0.278,0.702]
select surf_pocket4, protein and id [2851,2852,2857,2859,563,2844,2850,2898,2896,2926,2861,2842,2878,2846,2848,2855,3676,3691,3642,3643,3882,3884,3885,3886,3926,3883,3879,3717,3869,3864,3865,3684] 
set surface_color,  pcol4, surf_pocket4 
set_color pcol5 = [0.792,0.361,0.902]
select surf_pocket5, protein and id [601,609,611,1715,888,1709,775,1692,1693,1694,774,925,1707,1708,1710,605,790,899,860,593] 
set surface_color,  pcol5, surf_pocket5 
set_color pcol6 = [0.702,0.278,0.659]
select surf_pocket6, protein and id [5848,1850,1864,5847,1865,1866,1581,1582,1877,1573,2092,2093,2134,5811,5812,1243,5809,5810,5808,5817] 
set surface_color,  pcol6, surf_pocket6 
set_color pcol7 = [0.902,0.361,0.682]
select surf_pocket7, protein and id [4180,4182,4183,4160,4161,4184,4185,4186,4187,5444,5448,4158,5450,4157,5441,5443,5445,5446,5447,5451,5417] 
set surface_color,  pcol7, surf_pocket7 
set_color pcol8 = [0.702,0.278,0.408]
select surf_pocket8, protein and id [4266,4265,4267,4269,4303,4559,4784,4287,4750,4752,4757,4758,5336,5334,4751] 
set surface_color,  pcol8, surf_pocket8 
set_color pcol9 = [0.902,0.361,0.361]
select surf_pocket9, protein and id [3332,3882,3883,3879,3322,3323,3325,3328,2859,563,2850,2923,2926,2922,2842,562,2832,2924] 
set surface_color,  pcol9, surf_pocket9 
set_color pcol10 = [0.702,0.408,0.278]
select surf_pocket10, protein and id [4503,4370,3452,3457,4529,3449,4528,5675,4348,4349,4360,4362,5651] 
set surface_color,  pcol10, surf_pocket10 
set_color pcol11 = [0.902,0.682,0.361]
select surf_pocket11, protein and id [1308,4621,2106,2325,2327,2336,1314,2109,1335,1322,1326,1328,1333,2322,4604,4619] 
set surface_color,  pcol11, surf_pocket11 
set_color pcol12 = [0.702,0.659,0.278]
select surf_pocket12, protein and id [1618,1640,1629,1630,1631,1184,1198,1175,1060,1041,1177,1179,1178,1622,2724,1670,1671] 
set surface_color,  pcol12, surf_pocket12 
   

deselect

orient
