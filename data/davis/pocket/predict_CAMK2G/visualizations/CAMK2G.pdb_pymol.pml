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

load "data/CAMK2G.pdb", protein
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

load "data/CAMK2G.pdb_points.pdb.gz", points
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
select surf_pocket1, protein and id [2423,2425,1420,1421,1713,1717,1685,1687,1688,1700,2389,2384,2385,2388,2358,2361,2363,2364,1416,1754,1781,1712,1725,1411,1433,1140,2392,2394,2390,2420,1418,1419] 
set surface_color,  pcol1, surf_pocket1 
set_color pcol2 = [0.302,0.278,0.702]
select surf_pocket2, protein and id [215,216,159,162,593,595,757,1250,755,1255,336,337,338,489,1257,1253,1260,1248,1252,594,732,202,177,165,158,160,333,323,733,727,729,731,734,1165,1164,769,770,1259] 
set surface_color,  pcol2, surf_pocket2 
set_color pcol3 = [0.631,0.361,0.902]
select surf_pocket3, protein and id [3464,3465,3466,4371,3751,3529,3531,3769,4373,4376,4196,4300,3588,3755,3721,3724,3621,3636,3754,3753,4326] 
set surface_color,  pcol3, surf_pocket3 
set_color pcol4 = [0.678,0.278,0.702]
select surf_pocket4, protein and id [178,200,202,421,424,448,451,1273,1275,1274,337,338,490,1257,1258,1272,353,422,457,454,455,184,189,193,195,181,186,395,423,1280,1281,1108,1259,1282] 
set surface_color,  pcol4, surf_pocket4 
set_color pcol5 = [0.902,0.361,0.682]
select surf_pocket5, protein and id [906,927,930,788,817,936,848,1229,1173,1217,1210,1211,1213,1209,903,905,908] 
set surface_color,  pcol5, surf_pocket5 
set_color pcol6 = [0.702,0.278,0.341]
select surf_pocket6, protein and id [188,190,355,358,361,387,2538,2520,2522,684,2569,2507,2513,176,185,175,203,343,198,199] 
set surface_color,  pcol6, surf_pocket6 
set_color pcol7 = [0.902,0.522,0.361]
select surf_pocket7, protein and id [2463,2493,3428,2486,3424,3555,3515,3516,3518,3545,3547,3494] 
set surface_color,  pcol7, surf_pocket7 
set_color pcol8 = [0.702,0.596,0.278]
select surf_pocket8, protein and id [3867,3871,3853,2927,3470,3473,2504,3864,2501,2916,2921] 
set surface_color,  pcol8, surf_pocket8 
   

deselect

orient
