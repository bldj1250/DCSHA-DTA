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

load "data/PIK4CB.pdb", protein
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

load "data/PIK4CB.pdb_points.pdb.gz", points
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
select surf_pocket1, protein and id [5298,3029,6396,4829,4825,4831,5321,4112,4113,4115,4860,4861,4094,4098,4863,4086,5322,5396,5399,5400,5306,5401,5406,4803,5286,5285,5296,6408,6410,4834,4836,4858,4851,4854,4886,4887,4888,6395,4135,3002,3005,3006,2650,3003,4111,3010,3013,3057,4136,4693,4779,4780,4387,4695,4402,5407,4465,4801,4791,4797] 
set surface_color,  pcol1, surf_pocket1 
set_color pcol2 = [0.278,0.298,0.702]
select surf_pocket2, protein and id [944,292,293,326,323,328,303,1111,1082,1084,1087,927,933,924,1157,941,945,358,351,1136,1110,1116,1117,1119,1121,1112,1122,289] 
set surface_color,  pcol2, surf_pocket2 
set_color pcol3 = [0.533,0.361,0.902]
select surf_pocket3, protein and id [3029,6397,6396,5482,5483,5408,5265,5472,5481,5306,5286,5285,6410,6352,6354,6362,5263,5264,6331,6329] 
set surface_color,  pcol3, surf_pocket3 
set_color pcol4 = [0.565,0.278,0.702]
select surf_pocket4, protein and id [4402,4403,4466,5407,4419,4420,4421,3013,3057,3027,4426,4437,3042,4417,5408,5431,5433,5421,5400,5306,5406,3029] 
set surface_color,  pcol4, surf_pocket4 
set_color pcol5 = [0.902,0.361,0.878]
select surf_pocket5, protein and id [1299,1301,1595,1588,1589,1591,1620,2893,1583,1586,3180,1567,1569,1571,1618,2871,1297,2857,2892,2894,3160] 
set surface_color,  pcol5, surf_pocket5 
set_color pcol6 = [0.702,0.278,0.533]
select surf_pocket6, protein and id [4699,4701,4702,2857,1303,1296,1298,1302,4473,4705,4709,4721,4474,1648,1306,4506,1338,1339,4703,1620,1619,1621,1647,4496,4498,4530,1309,4528,4529,4504] 
set surface_color,  pcol6, surf_pocket6 
set_color pcol7 = [0.902,0.361,0.490]
select surf_pocket7, protein and id [5576,5578,4879,5293,5594,6419,6407,6339,6337,6304,6307,6335,6306,6308,5595,5593,6412] 
set surface_color,  pcol7, surf_pocket7 
set_color pcol8 = [0.702,0.329,0.278]
select surf_pocket8, protein and id [1307,1308,1309,1310,1311,1312,4540,1322,1034,1305,1041,4525,4527,4539,5858,5856,4561,4563] 
set surface_color,  pcol8, surf_pocket8 
set_color pcol9 = [0.902,0.620,0.361]
select surf_pocket9, protein and id [2893,1586,2837,2841,1578,3165,3167,3180,2894,2888,2880] 
set surface_color,  pcol9, surf_pocket9 
set_color pcol10 = [0.702,0.631,0.278]
select surf_pocket10, protein and id [2852,2491,2835,2859,2529,4771] 
set surface_color,  pcol10, surf_pocket10 
   

deselect

orient
