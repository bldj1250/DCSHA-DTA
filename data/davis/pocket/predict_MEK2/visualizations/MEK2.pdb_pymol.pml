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

load "data/MEK2.pdb", protein
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

load "data/MEK2.pdb_points.pdb.gz", points
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
select surf_pocket1, protein and id [1558,1189,1194,1549,1548,1550,1574,1650,623,626,638,641,615,619,622,1573,1022,1141,1144,1145,753,1165,652,654,655,1027,1655,774,1651,1652,1654,1656,1657,1658,1659,1667,635,636,773,1131,1736,1026,1028,1029,1031,1035,1130,1517,1521,1536,1537,1785,629,634,1663,1671,1674,1713,1715,1681,1685,1703,1707,1737,926,949,950,1507,1767,1506,1509,1766,1714,1764,1021,1219,608,609,612,611,607,613,614,1169,1177,1185,1186,1218] 
set surface_color,  pcol1, surf_pocket1 
set_color pcol2 = [0.616,0.278,0.702]
select surf_pocket2, protein and id [1332,1334,1336,1337,1338,2954,2940,1339,371,377,379,353,1335,1356,1360,1359,2906,1620,1610,994,1612,1616,409,1625,1627,1005,1608,2956,2962,2965,1600] 
set surface_color,  pcol2, surf_pocket2 
set_color pcol3 = [0.902,0.361,0.361]
select surf_pocket3, protein and id [1151,1153,1636,439,466,465,432,435,402,403,430,1619,1048,738,1050,1155,1159,1178,1179,1180,734,1585,1603,1606] 
set surface_color,  pcol3, surf_pocket3 
   

deselect

orient
