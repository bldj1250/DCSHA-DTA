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

load "data/NDR1.pdb", protein
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

load "data/NDR1.pdb_points.pdb.gz", points
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
select surf_pocket1, protein and id [1873,1903,1872,1874,1752,1775,1790,1864,1866,1764,1414,1416,1791,1763,1767,2288,2289,1415,1432,3366,1431,1439,3364,1462,1930,958,960,943,835,837,838,783,3356,799,800,792,2298,788,790,2300,780,785,3385,3386,3362,3359,3358,811,977,815,821,1365,823] 
set surface_color,  pcol1, surf_pocket1 
set_color pcol2 = [0.329,0.278,0.702]
select surf_pocket2, protein and id [2821,2823,2824,2070,2788,2790,2626,2789,2806,2819,2116,2119,2181,2182,2136,2148,2120,2123,2118,2804,2565,2727,2728,2729,2112,2644,2180,2612,2614] 
set surface_color,  pcol2, surf_pocket2 
set_color pcol3 = [0.698,0.361,0.902]
select surf_pocket3, protein and id [1954,1955,2329,2256,2354,2356,2325,2331,1734,2364,1750,2350,1765,1766,1767,2286,2288,1431,2281,2279,2285,2280,1931] 
set surface_color,  pcol3, surf_pocket3 
set_color pcol4 = [0.702,0.278,0.639]
select surf_pocket4, protein and id [2986,2379,2382,2377,2387,2982,2375,2759,2763,2412,2413,2968,2970,2998,2774,2741,2773] 
set surface_color,  pcol4, surf_pocket4 
set_color pcol5 = [0.902,0.361,0.545]
select surf_pocket5, protein and id [1156,3652,3654,310,305,3693,3675,3694,3678,345,3669,307,308,309,1157,623,3659] 
set surface_color,  pcol5, surf_pocket5 
set_color pcol6 = [0.702,0.353,0.278]
select surf_pocket6, protein and id [2462,1641,2495,2497,3048,3051,3053,3044,3045,2461,1672,1674] 
set surface_color,  pcol6, surf_pocket6 
set_color pcol7 = [0.902,0.729,0.361]
select surf_pocket7, protein and id [1106,1143,1694,1699,1703,1080,1887,1724,1727] 
set surface_color,  pcol7, surf_pocket7 
   

deselect

orient
