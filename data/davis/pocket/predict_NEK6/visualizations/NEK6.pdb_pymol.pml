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

load "data/NEK6.pdb", protein
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

load "data/NEK6.pdb_points.pdb.gz", points
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
select surf_pocket1, protein and id [1698,1539,1564,1566,1573,1574,1600,1626,1627,1576,1578,1371,1372,1694,1728,1731,1382,1384,1386,1385,1402,1403,1652,424,1599,1646,1625,1779,1777,1722,1725,1726,1661,1663,567,1531,568,1514,1515,1528,1536,1537,1565,1569,420,1512,1513,1374,1538,1540,1541,1543,404,405,408,417,431,433] 
set surface_color,  pcol1, surf_pocket1 
set_color pcol2 = [0.490,0.278,0.702]
select surf_pocket2, protein and id [550,979,1439,966,1440,1441,446,448,449,563,977,388,384,983,1008,1415,385,390,391,393,1508,1521,1509,1511,1513,566,1514,1515,960,1423] 
set surface_color,  pcol2, surf_pocket2 
set_color pcol3 = [0.902,0.361,0.682]
select surf_pocket3, protein and id [1046,1930,1022,1055,1974,1976,1978,1088,1414,1657,1659,1674,1676,1935,1906,1943,1939,1400,1401,1407,1398,1409,1410,1688,1690] 
set surface_color,  pcol3, surf_pocket3 
set_color pcol4 = [0.702,0.408,0.278]
select surf_pocket4, protein and id [530,532,512,298,503,488,500,545,851,854,855,952,852,850,859,863,285] 
set surface_color,  pcol4, surf_pocket4 
   

deselect

orient
