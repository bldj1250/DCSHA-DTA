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

load "data/CAMK2B.pdb", protein
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

load "data/CAMK2B.pdb_points.pdb.gz", points
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
select surf_pocket1, protein and id [2411,1703,2370,1673,1674,1699,1700,2369,2375,2376,2409,1711,2341,2343,2347,1686,1698,1767,1407,1408,1420,1422,2349,2350,1671,1406,1400,1403,1398,1128,2378,2380,1127,1129] 
set surface_color,  pcol1, surf_pocket1 
set_color pcol2 = [0.278,0.298,0.702]
select surf_pocket2, protein and id [4741,5080,4173,4884,5036,5034,5078,5081,4147,4151,4174,4903,4475,4327,4430,4459,4463,4461,4462,4342,4237,4239,4477,5032,4509,4510,4511,5085] 
set surface_color,  pcol2, surf_pocket2 
set_color pcol3 = [0.533,0.361,0.902]
select surf_pocket3, protein and id [1125,1137,1153,1238,1152,756,593,594,728,1243,1245,1247,1248,337,338,489,1240,1241,1246,520,1255,731,732,733,729,161,163,164,168,216,218,166,323,750,726,738,754,219,333,336,730] 
set surface_color,  pcol3, surf_pocket3 
set_color pcol4 = [0.565,0.278,0.702]
select surf_pocket4, protein and id [935,844,847,960,926,929,787,1217,907,1186,1198,1205,814,815,816,1193,1197,1160,1161] 
set surface_color,  pcol4, surf_pocket4 
set_color pcol5 = [0.902,0.361,0.878]
select surf_pocket5, protein and id [1245,1247,337,338,1246,490,1260,1261,1262,457,448,451,454,422,455,421,203,205,184,189,192,196,198,181,354,353,394,395,1269,1268,1270,187] 
set surface_color,  pcol5, surf_pocket5 
set_color pcol6 = [0.702,0.278,0.533]
select surf_pocket6, protein and id [4529,4531,4532,4511,5085,5093,5092,4498,4499,4500,4755,4771,4773,4563,4182,5079,5080] 
set surface_color,  pcol6, surf_pocket6 
set_color pcol7 = [0.902,0.361,0.490]
select surf_pocket7, protein and id [174,177,2470,188,2503,2505,2507,2442,183,4202,4189,4226,2445,2449,2450,2477] 
set surface_color,  pcol7, surf_pocket7 
set_color pcol8 = [0.702,0.329,0.278]
select surf_pocket8, protein and id [2486,2489,4578,2454,2456,2457,2455,4181,4579,2992,2976,2979,2978,2484,4591,4593,4595,4121,4123,4125,4127,4152,2994] 
set surface_color,  pcol8, surf_pocket8 
set_color pcol9 = [0.902,0.620,0.361]
select surf_pocket9, protein and id [1659,1661,1662,1663,1664,1665,1667,1886,1888,1887,1865,2313,4014,3993,3995] 
set surface_color,  pcol9, surf_pocket9 
set_color pcol10 = [0.702,0.631,0.278]
select surf_pocket10, protein and id [226,345,346,704,82,128,683,685,707,661,682,684,211,230] 
set surface_color,  pcol10, surf_pocket10 
   

deselect

orient
