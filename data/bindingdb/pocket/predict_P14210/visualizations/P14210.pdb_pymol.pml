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

load "data/P14210.pdb", protein
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

load "data/P14210.pdb_points.pdb.gz", points
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
select surf_pocket1, protein and id [3044,5537,5538,2597,2601,2603,4319,4668,2590,3026,3027,3028,2611,5550,5555,4317,4667,2604,5533,5275,5277,5622,5619,5623,5230,5641,4657,4659,5542,5545,4654,5253,3072,3074,3048,3051,3058,3054,3055] 
set surface_color,  pcol1, surf_pocket1 
set_color pcol2 = [0.278,0.298,0.702]
select surf_pocket2, protein and id [2195,2148,2199,1985,2159,2160,2161,2200,2273,2283,2285,2287,2289,2215,1960,2218] 
set surface_color,  pcol2, surf_pocket2 
set_color pcol3 = [0.533,0.361,0.902]
select surf_pocket3, protein and id [5344,5351,5352,5613,5341,5571,5297,5598,5609,5612,5389,5531,5559,5541,5542,5543,5545,5547,5549,5546,5616,5619,5621,5199,5623,5620,5566,5544,5548] 
set surface_color,  pcol3, surf_pocket3 
set_color pcol4 = [0.565,0.278,0.702]
select surf_pocket4, protein and id [1810,1811,336,1854,1801,325,332,334,335,1062,1853,337,1000,1001,1002,1092,1095,1097,985,1060,1056,1059,1061,1046,1029,1033] 
set surface_color,  pcol4, surf_pocket4 
set_color pcol5 = [0.902,0.361,0.878]
select surf_pocket5, protein and id [339,596,600,984,593,599,337,338,334,671,1118,1000,1001,1002,1095,1117,1364,619,665] 
set surface_color,  pcol5, surf_pocket5 
set_color pcol6 = [0.702,0.278,0.533]
select surf_pocket6, protein and id [2596,2598,2600,4652,4651,2604,2597,2599,2601,2603,4666,4668,4307,4308,4667,4654,2594,3072,3074] 
set surface_color,  pcol6, surf_pocket6 
set_color pcol7 = [0.902,0.361,0.490]
select surf_pocket7, protein and id [1309,1310,1470,1482,1481,1483,1516,1520,1601,1603,1605,1536,1599,1600,1602,1590] 
set surface_color,  pcol7, surf_pocket7 
set_color pcol8 = [0.702,0.329,0.278]
select surf_pocket8, protein and id [2920,2930,3046,3043,3045,2758,2965,2963,2966,3062,3059,3060] 
set surface_color,  pcol8, surf_pocket8 
set_color pcol9 = [0.902,0.620,0.361]
select surf_pocket9, protein and id [5673,5676,3638,3845,3631,3633,4646,3805] 
set surface_color,  pcol9, surf_pocket9 
set_color pcol10 = [0.702,0.631,0.278]
select surf_pocket10, protein and id [938,939,940,780,723,407,480,401,402] 
set surface_color,  pcol10, surf_pocket10 
   

deselect

orient
