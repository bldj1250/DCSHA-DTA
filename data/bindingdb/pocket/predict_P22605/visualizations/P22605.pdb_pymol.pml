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

load "data/P22605.pdb", protein
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

load "data/P22605.pdb_points.pdb.gz", points
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
select surf_pocket1, protein and id [2284,2285,2265,2288,3436,3291,3402,3259,2286,2295,2550,2551,2552,2553,2555,1979,1980,2574,1978,2544,2546,3313,3279,3277,1998,2000,1999,2005,2007,2429,2431,2030,2439,2028,2437,2289,1746,2317,2320,2322,2324,2434] 
set surface_color,  pcol1, surf_pocket1 
set_color pcol2 = [0.490,0.278,0.702]
select surf_pocket2, protein and id [2778,2780,2937,2938,2939,3187,205,217,216,218,219,2971,2783,3218,3217,3221,2809,3170,3159,3160,3161,3162,3183,3216] 
set surface_color,  pcol2, surf_pocket2 
set_color pcol3 = [0.902,0.361,0.682]
select surf_pocket3, protein and id [1060,1066,1069,1068,1070,1071,3018,3020,3022,3048,3049,3015,1624,1625,1626,3050,1651,1652,1654,1659,1683,1684,1687,1647,1649] 
set surface_color,  pcol3, surf_pocket3 
set_color pcol4 = [0.702,0.408,0.278]
select surf_pocket4, protein and id [1078,1095,1086,1091,1098,1046,1075,1076,1055,1105,1101,1102,1273,1275,1310,1336,1302,1096,1379,1380,1337,2694] 
set surface_color,  pcol4, surf_pocket4 
   

deselect

orient
