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

load "data/ARK5.pdb", protein
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

load "data/ARK5.pdb_points.pdb.gz", points
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
select surf_pocket1, protein and id [1602,759,1705,5100,5101,1706,758,760,761,479,481,482,491,492,494,735,736,1578,1592,1593,1594,1595,1607,1599,1429,1614,1615,757,755,791,1601,4736,4738,4734,4739,1726,1727,5132,1711,1719,1721,1724,1577,1579,1435,1436,1437,1600,1454,1733,4747,4752,5051,5054,5099,5123,5125,5128,5035,5037,5039,4742,4744] 
set surface_color,  pcol1, surf_pocket1 
set_color pcol2 = [0.278,0.322,0.702]
select surf_pocket2, protein and id [903,1038,1039,1570,1572,1573,832,454,457,616,513,1056,1058,458,1061,1044,1494,1495,1090,1467,1082,1085,1065,1092,1575,1577,1579,455,460,799,632,633,634,511,514] 
set surface_color,  pcol2, surf_pocket2 
set_color pcol3 = [0.467,0.361,0.902]
select surf_pocket3, protein and id [4731,4769,4771,5190,5221,5220,2072,4721,4732,4726,4729,1746,2045,2043,1741,1748,1737,2099,4723,1747,2050,2044,4770,4730,1740,1734,1739] 
set surface_color,  pcol3, surf_pocket3 
set_color pcol4 = [0.490,0.278,0.702]
select surf_pocket4, protein and id [632,633,634,800,1578,1592,1593,1594,1595,476,481,482,490,486,492,1602,483,473,495,496,497,646,648,767,754,762,756,755,1577,1579,1600,1601] 
set surface_color,  pcol4, surf_pocket4 
set_color pcol5 = [0.792,0.361,0.902]
select surf_pocket5, protein and id [1111,1113,4707,1758,4725,1747,2013,2014,4706,1141,1109,1147,1471,1760,1461,1968,1139,4701,2000,2008,4709,1138,1999,1143] 
set surface_color,  pcol5, surf_pocket5 
set_color pcol6 = [0.702,0.278,0.659]
select surf_pocket6, protein and id [2689,2691,2692,2693,2694,2695,2699,2663,2667,2668,2407,2293,2297,2438,2433,2448,2696,2698,2291,2292,2404,2409,2654,2653,2655,2662,2657,2427] 
set surface_color,  pcol6, surf_pocket6 
set_color pcol7 = [0.902,0.361,0.682]
select surf_pocket7, protein and id [638,637,640,1000,998,4572,4567,4594,374,4568,4597,641,643,645,649,654,655,639,520,521,522,502,523,505,366,424,425] 
set surface_color,  pcol7, surf_pocket7 
set_color pcol8 = [0.702,0.278,0.408]
select surf_pocket8, protein and id [2696,2698,2284,2285,2287,2289,2290,2291,2292,2294,2320,2256,2276,2293,2297,2438,2693,2694,2441] 
set surface_color,  pcol8, surf_pocket8 
set_color pcol9 = [0.902,0.361,0.361]
select surf_pocket9, protein and id [2540,2544,2549,2553,1382,1322,1347,1349,1353,1343,1344,1380,871,868,2548] 
set surface_color,  pcol9, surf_pocket9 
set_color pcol10 = [0.702,0.408,0.278]
select surf_pocket10, protein and id [345,333,335,337,953,326,365,359,362,950,952,974,970,972,4573,973,962,1015,997,999,1000,4574] 
set surface_color,  pcol10, surf_pocket10 
set_color pcol11 = [0.902,0.682,0.361]
select surf_pocket11, protein and id [877,888,2537,2540,1301,885,1299,1323,1287,1321,2541,1286,1290] 
set surface_color,  pcol11, surf_pocket11 
set_color pcol12 = [0.702,0.659,0.278]
select surf_pocket12, protein and id [937,938,405,408,553,555,554,922,1030,290,594,611,926] 
set surface_color,  pcol12, surf_pocket12 
   

deselect

orient
