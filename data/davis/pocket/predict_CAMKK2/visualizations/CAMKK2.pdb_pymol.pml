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

load "data/CAMKK2.pdb", protein
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

load "data/CAMKK2.pdb_points.pdb.gz", points
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
select surf_pocket1, protein and id [2532,2534,2530,1438,1766,2528,2533,2531,2535,360,2400,2527,2542,1868,2453,2525,2014,1866,1869,2016,2026,2043,2039,2042,2045,1288,339,341,1290,2547,345,2555,2556,2549,377,358,379,2064,342,1310,1436,1437,1271,1309,2018,1257,1420,1272,378,1795,1767,1796,2017,2019,2021,2020] 
set surface_color,  pcol1, surf_pocket1 
set_color pcol2 = [0.329,0.278,0.702]
select surf_pocket2, protein and id [2688,3054,2995,2996,3001,2101,2103,2104,2098,2102,2111,2676,2681,2685,2683,369,371,351,352,353,359,2415,2416,2425,2428,2430,2699] 
set surface_color,  pcol2, surf_pocket2 
set_color pcol3 = [0.698,0.361,0.902]
select surf_pocket3, protein and id [1208,1892,1195,1902,1351,1416,1377,1057] 
set surface_color,  pcol3, surf_pocket3 
set_color pcol4 = [0.702,0.278,0.639]
select surf_pocket4, protein and id [1303,1444,1445,1317,1318,1319,1219,1162,1113,1973,1992,1995,1222,1159,1161,1178,1974,1975] 
set surface_color,  pcol4, surf_pocket4 
set_color pcol5 = [0.902,0.361,0.545]
select surf_pocket5, protein and id [2819,2851,3358,3360,2323,2818,2821,2825,2817,2824,2319,3362,3365,3368,3374,3375,2827,2617,2810,3351,2324,2823] 
set surface_color,  pcol5, surf_pocket5 
set_color pcol6 = [0.702,0.353,0.278]
select surf_pocket6, protein and id [1855,2272,1844,1846,2273,2494,2495,2496,2248,2274] 
set surface_color,  pcol6, surf_pocket6 
set_color pcol7 = [0.902,0.729,0.361]
select surf_pocket7, protein and id [1066,1081,1925,3671,1061,1906,1908,1921,1907,1744,1746,3662,1805] 
set surface_color,  pcol7, surf_pocket7 
   

deselect

orient
