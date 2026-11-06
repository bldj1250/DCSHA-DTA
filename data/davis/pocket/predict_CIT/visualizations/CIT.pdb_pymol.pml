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

load "data/CIT.pdb", protein
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

load "data/CIT.pdb_points.pdb.gz", points
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
select surf_pocket1, protein and id [12836,15028,12843,15040,13134,14702,15030,15032,15035,15054,12850,15045,13113,13551,13114,13124,13126,13127,13128,13563,14706,14318,14681,14317,14686,14690,14694,11121,11124,14680,14688,15018,15024,11209,11210,11211,11109,11212,11213,11214,11215,11216,13907,11111,11113,11115,11106,13906,14325,12835,12839] 
set surface_color,  pcol1, surf_pocket1 
set_color pcol2 = [0.278,0.341,0.702]
select surf_pocket2, protein and id [986,1395,1396,1917,1920,872,870,873,3124,819,822,1841,1449,1813,1812,3101,3103,815,973,1840,1413,1415,1825,1928,1800,1801,828,829,824,826,989,990,1921,1147,1922,991,1924] 
set surface_color,  pcol2, surf_pocket2 
set_color pcol3 = [0.424,0.361,0.902]
select surf_pocket3, protein and id [1825,1928,1800,1801,1949,1784,2078,2070,842,845,835,849,851,856,829,830,832,2072,2066,1067,1068,990,991,1927,1109,1941,1943,1103,1105,1106,2067] 
set surface_color,  pcol3, surf_pocket3 
set_color pcol4 = [0.435,0.278,0.702]
select surf_pocket4, protein and id [338,319,320,337,384,385,363,3381,3385,3361,3367,3386,3387,3419,373,376,3380,1188,3354,3356,1205,3364,3368,1195,253,254,252,3406,3388,3416,246] 
set surface_color,  pcol4, surf_pocket4 
set_color pcol5 = [0.698,0.361,0.902]
select surf_pocket5, protein and id [11289,11302,11304,11305,11043,11412,11151,11414,11408,11411,11452,11378,11044,11384,11385,11418,11420,11423,11424,11288] 
set surface_color,  pcol5, surf_pocket5 
set_color pcol6 = [0.651,0.278,0.702]
select surf_pocket6, protein and id [13247,13250,13095,13098,13094,13085,13479,13244,13478,13297,13243,13245,13246,13282,13493,13495,13262,13267] 
set surface_color,  pcol6, surf_pocket6 
set_color pcol7 = [0.902,0.361,0.824]
select surf_pocket7, protein and id [12371,12355,12357,11140,11141,14669,11188,14811,14800,14803,14793,14654,14657,14824,14666,14662,14665,14806,14814] 
set surface_color,  pcol7, surf_pocket7 
set_color pcol8 = [0.702,0.278,0.533]
select surf_pocket8, protein and id [11224,11227,11186,14305,11236,11231,13888,14301,14303,11326,11329,11180,11181,14285,14472,14284] 
set surface_color,  pcol8, surf_pocket8 
set_color pcol9 = [0.902,0.361,0.545]
select surf_pocket9, protein and id [723,1314,1320,1322,692,694,696,728,732,734,693,1315,1316,1321,1323,1327,1318,1024,470,471,472,430,432,434] 
set surface_color,  pcol9, surf_pocket9 
set_color pcol10 = [0.702,0.278,0.318]
select surf_pocket10, protein and id [451,487,8,573,3259,3261,521,522,559,568,567,547] 
set surface_color,  pcol10, surf_pocket10 
set_color pcol11 = [0.902,0.451,0.361]
select surf_pocket11, protein and id [1816,2089,2091,2093,2344,2345,2346,2347,2394,2418,1807,1815,1817,2103,2105,1464,1465] 
set surface_color,  pcol11, surf_pocket11 
set_color pcol12 = [0.702,0.459,0.278]
select surf_pocket12, protein and id [12215,11793,12212,11801,12213,11804,11803,11815,11813,11728,12203,11730,12430,12432,12197,12198,12223,11817] 
set surface_color,  pcol12, surf_pocket12 
set_color pcol13 = [0.902,0.729,0.361]
select surf_pocket13, protein and id [12742,13010,15211,15063,15066,15068,15073] 
set surface_color,  pcol13, surf_pocket13 
set_color pcol14 = [0.702,0.675,0.278]
select surf_pocket14, protein and id [12851,12996,15104] 
set surface_color,  pcol14, surf_pocket14 
   

deselect

orient
