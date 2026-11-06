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

load "data/FLT3(N841I).pdb", protein
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

load "data/FLT3(N841I).pdb_points.pdb.gz", points
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
select surf_pocket1, protein and id [6526,6612,6614,6616,6635,4909,4914,6636,6525,6618,6617,6619,5510,5513,5516,5520,6497,6644,6647,5489,5480,5482,4959,4961,4907,4913,4908,4911,4912,5086,5485] 
set surface_color,  pcol1, surf_pocket1 
set_color pcol2 = [0.278,0.298,0.702]
select surf_pocket2, protein and id [2961,2953,2955,2957,2020,2034,2068,2013,2014,2015,2079,1292,1295,1299,1860,1863,1867,1868,1873,1326,1328,1888,2082,2083,1891,1869,2009,2058,2060,2061,2062,2063,1293,1308,1310,1304,1319,2069] 
set surface_color,  pcol2, surf_pocket2 
set_color pcol3 = [0.533,0.361,0.902]
select surf_pocket3, protein and id [7298,7296,7299,7300,6253,6255,6257,6259,7286,5747,5695,6250,5696,6256,6258,7304,5706,5707,5705,7284,5665,5669,5671,7275,5764] 
set surface_color,  pcol3, surf_pocket3 
set_color pcol4 = [0.565,0.278,0.702]
select surf_pocket4, protein and id [6659,6662,6663,4941,4498,4501,4942,6664,6669,6670,4510,4550,4551,4552,6708,4524,4930,6754,6757,6758,6750,6752,6772] 
set surface_color,  pcol4, surf_pocket4 
set_color pcol5 = [0.902,0.361,0.878]
select surf_pocket5, protein and id [5342,5235,5344,5461,5463,6598,6601,6604,5268,5269,5343,6605,6619] 
set surface_color,  pcol5, surf_pocket5 
set_color pcol6 = [0.702,0.278,0.533]
select surf_pocket6, protein and id [777,780,811,783,1052,1024,822,826,951,952,953,958,966,810] 
set surface_color,  pcol6, surf_pocket6 
set_color pcol7 = [0.902,0.361,0.490]
select surf_pocket7, protein and id [7281,5639,5640,5679,5678,5791,5798,5776,5700,5702,5668,5672,5765] 
set surface_color,  pcol7, surf_pocket7 
set_color pcol8 = [0.702,0.329,0.278]
select surf_pocket8, protein and id [2283,2284,2285,2286,2538,2306,2278,2488,2238,2276,2234] 
set surface_color,  pcol8, surf_pocket8 
set_color pcol9 = [0.902,0.620,0.361]
select surf_pocket9, protein and id [3609,3611,3925,3923,3927,3874,3871,3438,3437,3902,3903] 
set surface_color,  pcol9, surf_pocket9 
set_color pcol10 = [0.702,0.631,0.278]
select surf_pocket10, protein and id [6907,6910,4657,4660,4581,4600,6911,6399,6428,6429,6402,6430,6432,6445,6904] 
set surface_color,  pcol10, surf_pocket10 
   

deselect

orient
