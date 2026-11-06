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

load "data/YANK2.pdb", protein
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

load "data/YANK2.pdb_points.pdb.gz", points
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
select surf_pocket1, protein and id [1360,1366,1368,1359,415,416,417,1361,1362,1364,253,841,853,692,836,1278,1279,412,586,619,835,620,399,851,857,291,238,234,868,289,292,235,240,243,247,884,880,882,883,1252,2564,2565,898,1251,1254,863,865,873,874,877,2528,2530,2532,2533,2536,2518,911,941,942] 
set surface_color,  pcol1, surf_pocket1 
set_color pcol2 = [0.365,0.278,0.702]
select surf_pocket2, protein and id [1303,3247,3236,3243,3244,3245,3246,2419,860,1302,1304,842,843,665,1295,1342,1345,2421,655,662,664,700,844,840,375,722,647,3050,720,697,3256,3249,3251,3253,3254,3259,374,380,1312,1313] 
set surface_color,  pcol2, surf_pocket2 
set_color pcol3 = [0.792,0.361,0.902]
select surf_pocket3, protein and id [2633,274,266,441,2662,427,429,444,794,795,443,472,2630,2631,2644,2632,2657,2656,2643,2646] 
set surface_color,  pcol3, surf_pocket3 
set_color pcol4 = [0.702,0.278,0.533]
select surf_pocket4, protein and id [1094,2398,657,660,1091,2400,2402,2403,1124,2396,2361,2363,2379,2399,2401,1120,2254,1156,2362] 
set surface_color,  pcol4, surf_pocket4 
set_color pcol5 = [0.902,0.361,0.361]
select surf_pocket5, protein and id [1367,1368,416,417,1383,253,256,259,261,1386,556,269,271,544,550,545,523,587] 
set surface_color,  pcol5, surf_pocket5 
set_color pcol6 = [0.702,0.533,0.278]
select surf_pocket6, protein and id [3022,3061,331,350,104,96,101,105,141,175,178,121,84,3001] 
set surface_color,  pcol6, surf_pocket6 
   

deselect

orient
