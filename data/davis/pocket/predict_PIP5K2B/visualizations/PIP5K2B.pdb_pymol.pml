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

load "data/PIP5K2B.pdb", protein
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

load "data/PIP5K2B.pdb_points.pdb.gz", points
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
select surf_pocket1, protein and id [1029,1031,1634,1045,1650,1652,1044,1635,1189,1190,2286,1206,1207,1621,1642,2953,1616,1452,1053,1103,1104,1106,1108,2961,1658,1696,1699,1702,1646,1894,1043,1027,1032,1040,1700,1748,1750,1751,1752,2954,2962,1769,2249,2958,1730,1732,1905,1907,1908,2285,1927,1928,1809,1120,1122,1123,1154,1156,1157,1158] 
set surface_color,  pcol1, surf_pocket1 
set_color pcol2 = [0.365,0.278,0.702]
select surf_pocket2, protein and id [1205,2961,1473,1475,2971,1085,1220,2977,2974,2976,1206,1207,1615,1616,1452,2956,2957] 
set surface_color,  pcol2, surf_pocket2 
set_color pcol3 = [0.792,0.361,0.902]
select surf_pocket3, protein and id [2788,1440,1425,2124,2125,2126,2792,2793,2795,2807,2809,2811,2813,2085,1430,2093,2097,2099,2814,2062,2090] 
set surface_color,  pcol3, surf_pocket3 
set_color pcol4 = [0.702,0.278,0.533]
select surf_pocket4, protein and id [2390,2687,2388,2389,1672,1674,2706,2716,1677,1680,1673,1675,2685,1688,2314,2315,1689,2718,2720,2724,2328,2355,2353,1695,2360] 
set surface_color,  pcol4, surf_pocket4 
set_color pcol5 = [0.902,0.361,0.361]
select surf_pocket5, protein and id [362,649,658,364,358,692,659,267,383,239,245,257,265] 
set surface_color,  pcol5, surf_pocket5 
set_color pcol6 = [0.702,0.533,0.278]
select surf_pocket6, protein and id [565,564,567,755,757,582,1518,580] 
set surface_color,  pcol6, surf_pocket6 
   

deselect

orient
