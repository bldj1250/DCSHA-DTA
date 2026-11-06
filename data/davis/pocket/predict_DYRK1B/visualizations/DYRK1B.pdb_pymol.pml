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

load "data/DYRK1B.pdb", protein
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

load "data/DYRK1B.pdb_points.pdb.gz", points
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
select surf_pocket1, protein and id [952,953,954,956,958,961,2005,2121,965,988,990,1007,1009,1010,1114,1574,1127,1566,1568,1587,1254,2110,2113,2114,1131,1132,2117,2112,1569,1129,1130,1590,1592,1593,1599,2020,2021,1591,1602,1613,1619,1993] 
set surface_color,  pcol1, surf_pocket1 
set_color pcol2 = [0.616,0.278,0.702]
select surf_pocket2, protein and id [1964,1981,2005,2121,4413,4414,4415,965,4420,4425,4432,974,977,979,981,4397,1195,1197,1192,986,988,983,971,2134,2135,2140,2142,1221,1222,1224,2136,1188,1193,1219,1225,1255,1228,1226,4396,4398,4388,2211,2213,1996,1980,2259,4436,1992,1994] 
set surface_color,  pcol2, surf_pocket2 
set_color pcol3 = [0.902,0.361,0.361]
select surf_pocket3, protein and id [4440,4441,4442,4427,4444,2291,1996,1997,2259,2257,4430,2293,2493,2538,2539,2278,2280,4459,2276,1636,1638,1995,1640,4449,4447,4453,4454] 
set surface_color,  pcol3, surf_pocket3 
   

deselect

orient
