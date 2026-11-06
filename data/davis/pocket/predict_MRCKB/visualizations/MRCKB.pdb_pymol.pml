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

load "data/MRCKB.pdb", protein
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

load "data/MRCKB.pdb_points.pdb.gz", points
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
select surf_pocket1, protein and id [8815,8825,8826,8827,8442,8455,8626,8438,11655,8618,8620,9044,9045,9046,9048,11922,8601,8603,8604,8605,8606,8607,8608,8444,8435,8611,8462,11929,11935,11677,11873,8479,11676,11926,11930,11918,8477,8480,11939,9063,11913,11660,11673,11678,11652,11653,11654,8478,8516,8614] 
set surface_color,  pcol1, surf_pocket1 
set_color pcol2 = [0.278,0.341,0.702]
select surf_pocket2, protein and id [1691,1706,1317,1679,1680,1782,1784,676,678,732,1278,1280,3006,837,3004,3002,1705,695,854,1789,1791,1668,1785,1787,733,730,673,679,675,680,681,3011,1682,683,685,694,1258,1267,1018,1261,1262] 
set surface_color,  pcol2, surf_pocket2 
set_color pcol3 = [0.424,0.361,0.902]
select surf_pocket3, protein and id [695,854,1789,1791,1651,1668,1790,1812,1926,1928,1929,1936,713,966,706,710,712,1924,1691,701,698] 
set surface_color,  pcol3, surf_pocket3 
set_color pcol4 = [0.435,0.278,0.702]
select surf_pocket4, protein and id [9862,11752,11754,12204,12206,12230,12232,11792,11761,11745,12071,12056,12058,12059,12061,12054,12057,11747,12219,11768,11776,12223,9852] 
set surface_color,  pcol4, surf_pocket4 
set_color pcol5 = [0.698,0.361,0.902]
select surf_pocket5, protein and id [3184,3123,3115,901,1200,1198,1199,3131,3133,340,338,341,309,3181,3171,3173,318,3194,3192,3195] 
set surface_color,  pcol5, surf_pocket5 
set_color pcol6 = [0.651,0.278,0.702]
select surf_pocket6, protein and id [231,3231,202,1038,3322,3318,138,1036,1037,1066,1067,1068,3233,1026,1034,3226,180,139,179,194] 
set surface_color,  pcol6, surf_pocket6 
set_color pcol7 = [0.902,0.361,0.824]
select surf_pocket7, protein and id [3189,3191,3192,3195,888,1184,1189,310,545,546,1187,276,543,3190,3227,252,281,1180,1186,1181,1182,1183,254,249,309,1193,1194,1196] 
set surface_color,  pcol7, surf_pocket7 
set_color pcol8 = [0.702,0.278,0.533]
select surf_pocket8, protein and id [1216,1218,1219,875,872,705,707,601,715,860,862,714,3083,3086,3080,3084,723,724,726,3065] 
set surface_color,  pcol8, surf_pocket8 
set_color pcol9 = [0.902,0.361,0.545]
select surf_pocket9, protein and id [10401,10402,10245,10248,10250,10251,10404,10249,10399,10398,10240,10242,10575,10459,10439,10592,10458,10235] 
set surface_color,  pcol9, surf_pocket9 
set_color pcol10 = [0.702,0.278,0.318]
select surf_pocket10, protein and id [11735,11747,12051,11411,12050,11409,11036,11404,11418,11050,11746,10671,11043,11048] 
set surface_color,  pcol10, surf_pocket10 
set_color pcol11 = [0.902,0.451,0.361]
select surf_pocket11, protein and id [12651,12653,3160,360,359,418,290,3164,325,12692,386,12691,12650,12655,12652,12654,12659] 
set surface_color,  pcol11, surf_pocket11 
set_color pcol12 = [0.702,0.459,0.278]
select surf_pocket12, protein and id [9506,9508,9512,9513,9504,9493,9495,9264,9279,9515,9845,9869,9870,9846,11954,9273,9505,9876,9877] 
set surface_color,  pcol12, surf_pocket12 
set_color pcol13 = [0.902,0.729,0.361]
select surf_pocket13, protein and id [11196,10960,10961,10962,11204,11203,11205,10698,10723,10726,10854,10858,10938,10939,10955,10957,10958,10959] 
set surface_color,  pcol13, surf_pocket13 
set_color pcol14 = [0.702,0.675,0.278]
select surf_pocket14, protein and id [2676,1551,1584,2690,2671,2689,1569,1571,1570,1574,2095] 
set surface_color,  pcol14, surf_pocket14 
   

deselect

orient
