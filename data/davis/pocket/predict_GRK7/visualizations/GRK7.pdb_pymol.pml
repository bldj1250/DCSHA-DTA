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

load "data/GRK7.pdb", protein
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

load "data/GRK7.pdb_points.pdb.gz", points
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
select surf_pocket1, protein and id [2603,2529,2605,2609,2135,2530,2142,2503,2515,2611,2612,2613,2504,1566,2114,2111,2115,2132,2101,1698,2095,1603,1712,1713,1714,1547,1549,1550,1602,1546,1548,3782,3791,3793,1552,1553,1554,1565,1551,2606,2607] 
set surface_color,  pcol1, surf_pocket1 
set_color pcol2 = [0.278,0.278,0.702]
select surf_pocket2, protein and id [4146,1673,1674,4145,4147,2546,2098,2100,2102,2103,1691,2107,2542,1694,4081,4114,1679,1977,2591,1975,4108,4113,4080] 
set surface_color,  pcol2, surf_pocket2 
set_color pcol3 = [0.576,0.361,0.902]
select surf_pocket3, protein and id [1514,1723,2058,1491,1620,2073,1722,2055,2057,1462,1463,1466,2017,2018,1460,2031,2033] 
set surface_color,  pcol3, surf_pocket3 
set_color pcol4 = [0.616,0.278,0.702]
select surf_pocket4, protein and id [688,724,518,519,559,560,473,474,475,1203,549,551,561,564,665,687,662,664,590,1180,690] 
set surface_color,  pcol4, surf_pocket4 
set_color pcol5 = [0.902,0.361,0.792]
select surf_pocket5, protein and id [1713,1714,1867,1580,1582,1573,1576,1570,2612,2613,1566,1567,1569,1731,1841,1837,1838,1839] 
set surface_color,  pcol5, surf_pocket5 
set_color pcol6 = [0.702,0.278,0.447]
select surf_pocket6, protein and id [4090,4092,4130,4166,1410,4094,4358,1484,4359,1636,1660] 
set surface_color,  pcol6, surf_pocket6 
set_color pcol7 = [0.902,0.361,0.361]
select surf_pocket7, protein and id [2988,2157,2158,2194,2198,2200,2192,2159,3056,3057,3058,3063,3074,3076,3078,3079,3080,3068,2756,3031,3054,2751,3152,2768,2770,3030,3025,2745,2489] 
set surface_color,  pcol7, surf_pocket7 
set_color pcol8 = [0.702,0.447,0.278]
select surf_pocket8, protein and id [2402,2880,2882,3465,3487,3493,3494,3496,3507,3509,3511,3515,3516,3518,2401,2405,2379] 
set surface_color,  pcol8, surf_pocket8 
set_color pcol9 = [0.902,0.792,0.361]
select surf_pocket9, protein and id [1594,1595,1596,2058,1588,1585,1735,1765,2059,1737,1739,1593,3861,3865,1591,1586] 
set surface_color,  pcol9, surf_pocket9 
   

deselect

orient
