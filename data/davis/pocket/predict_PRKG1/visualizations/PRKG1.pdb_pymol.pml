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

load "data/PRKG1.pdb", protein
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

load "data/PRKG1.pdb_points.pdb.gz", points
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
select surf_pocket1, protein and id [506,514,517,3885,3902,4056,4057,4058,3926,4028,4030,4031,4032,4045,4021,4023,4024,4025,3366,3367,3096,3097,3098,3514,3515,4026,3080,3520,2933,2934,2946,2929,2930,2951,2944,2948,2966,2968,2969,3095,2950,3114,526,508,3203,3231,2947,3201,3202,3265,529,531,530,504,3913,3915,510,3914,2924,2926,3941,2919,3557,3559,2920,2922,2913,2914,3942,3533,2916,3530,5219,5192,499] 
set surface_color,  pcol1, surf_pocket1 
set_color pcol2 = [0.278,0.322,0.702]
select surf_pocket2, protein and id [1355,1357,1358,1431,1274,1281,1222,1295,1425,1432,1435,1436,1221,1359,1415,1351,1080,1339,1340,1350,1325,1331,1329,1450,1360,1420] 
set surface_color,  pcol2, surf_pocket2 
set_color pcol3 = [0.467,0.361,0.902]
select surf_pocket3, protein and id [1840,3823,1839,1841,2654,4856,2640,3788,4876,4878,4873,4869,4870,4863,4865,1872,4309,4340,4835,4848,3789,3812,3813,3814,3820,3821,4102,4100] 
set surface_color,  pcol3, surf_pocket3 
set_color pcol4 = [0.490,0.278,0.702]
select surf_pocket4, protein and id [2351,2331,2339,2340,2341,2350,2352,2355,2358,2359,2428,2360,2012,2448,2422,2433,2429,2432,2013,2318,2157,2269,2270,2273,2287,2342,2361,2417,2412,2414] 
set surface_color,  pcol4, surf_pocket4 
set_color pcol5 = [0.792,0.361,0.902]
select surf_pocket5, protein and id [2845,2886,3087,3089,3488,3491,2843,2844,3444,2864,2842,2863,3105,3106,2884] 
set surface_color,  pcol5, surf_pocket5 
set_color pcol6 = [0.702,0.278,0.659]
select surf_pocket6, protein and id [4550,841,4549,4551,1359,1392,4512,1390,4253,4574,853,849,837,846,836,1350] 
set surface_color,  pcol6, surf_pocket6 
set_color pcol7 = [0.902,0.361,0.682]
select surf_pocket7, protein and id [1647,1667,1645,1646,4124,4126,1676,4274,4276,4277,4275,1892,1890,1669,1670,4146,1614,1644,920,4272] 
set surface_color,  pcol7, surf_pocket7 
set_color pcol8 = [0.702,0.278,0.408]
select surf_pocket8, protein and id [1625,633,572,574,576,569,4147,1654,1655,605,4136,4148,551,4137,4122,573,4072,4133] 
set surface_color,  pcol8, surf_pocket8 
set_color pcol9 = [0.902,0.361,0.361]
select surf_pocket9, protein and id [4124,1678,1680,4118,1676,4108,4110,4114,4112,1681,1682,1655,4146,4115] 
set surface_color,  pcol9, surf_pocket9 
set_color pcol10 = [0.702,0.408,0.278]
select surf_pocket10, protein and id [4506,4504,4507,4515,1404,1406,1430,1402,524,525,4188] 
set surface_color,  pcol10, surf_pocket10 
set_color pcol11 = [0.902,0.682,0.361]
select surf_pocket11, protein and id [671,674,700,701,666,1574,668,1548,975,991] 
set surface_color,  pcol11, surf_pocket11 
set_color pcol12 = [0.702,0.659,0.278]
select surf_pocket12, protein and id [2601,1791,2326,2617,2327,1781,2567,2381] 
set surface_color,  pcol12, surf_pocket12 
   

deselect

orient
