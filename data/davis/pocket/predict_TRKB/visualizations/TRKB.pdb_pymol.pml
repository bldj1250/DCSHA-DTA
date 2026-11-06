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

load "data/TRKB.pdb", protein
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

load "data/TRKB.pdb_points.pdb.gz", points
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
select surf_pocket1, protein and id [2587,2584,1087,1088,1090,1976,2581,1977,1974,1975,1971,1973,1821,1813,1819,1844,1811,1094,1096,925,927,929,931,1175,1178,1179,949,951] 
set surface_color,  pcol1, surf_pocket1 
set_color pcol2 = [0.278,0.298,0.702]
select surf_pocket2, protein and id [2587,2584,3391,3385,3386,2585,3384,1976,2581,2583,2645,1977,2628,2630,2593,1821,943,3390,951,925,924,3411,2892,3389,3412,3413,3410,3380,3382,3415,2651,2652,2918,2916,2919,2866,2891,2895,2890,2894,2897] 
set surface_color,  pcol2, surf_pocket2 
set_color pcol3 = [0.533,0.361,0.902]
select surf_pocket3, protein and id [3193,2400,3196,3197,3213,2402,1604,1608,1614,1615,1610,2383,3186,3198,3207,2424,2401,2419,2421,2423,1632,682,3184,691,696,697,1564,712,1576,1582,718,721,724,1580,713,715,717,1581,3227] 
set surface_color,  pcol3, surf_pocket3 
set_color pcol4 = [0.565,0.278,0.702]
select surf_pocket4, protein and id [1803,1805,1812,1806,905,904,2600,1836,1779,1784,1786,1234,1211,1539,1239,1212] 
set surface_color,  pcol4, surf_pocket4 
set_color pcol5 = [0.902,0.361,0.878]
select surf_pocket5, protein and id [916,393,395,890,404,406,657,938,912,868,888,426,425,869,374] 
set surface_color,  pcol5, surf_pocket5 
set_color pcol6 = [0.702,0.278,0.533]
select surf_pocket6, protein and id [2327,2329,2417,2433,2122,2396,2416,2321,2403,2326,2120,2434,2388,3191] 
set surface_color,  pcol6, surf_pocket6 
set_color pcol7 = [0.902,0.361,0.490]
select surf_pocket7, protein and id [3339,610,3313,411,412,440,409,433,640,442,3310,3312,3315,3316] 
set surface_color,  pcol7, surf_pocket7 
set_color pcol8 = [0.702,0.329,0.278]
select surf_pocket8, protein and id [2073,1740,1743,2314,1744,2313,2343,1739,1741,1750,1752,1745,1746] 
set surface_color,  pcol8, surf_pocket8 
set_color pcol9 = [0.902,0.620,0.361]
select surf_pocket9, protein and id [2621,2654,2658,2659,2660,2925,2556,2558,2657,2927,2926,2676] 
set surface_color,  pcol9, surf_pocket9 
set_color pcol10 = [0.702,0.631,0.278]
select surf_pocket10, protein and id [2556,2560,2557,2559,2969,2553,2555,3139,3104,2525,2976,2945,2947] 
set surface_color,  pcol10, surf_pocket10 
   

deselect

orient
