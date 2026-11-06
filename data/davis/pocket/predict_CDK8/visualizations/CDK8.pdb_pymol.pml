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

load "data/CDK8.pdb", protein
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

load "data/CDK8.pdb_points.pdb.gz", points
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
select surf_pocket1, protein and id [261,265,1282,1290,1410,1411,1413,1415,1408,1305,1306,248,431,432,433,532,637,638,793,287,289,290,2923,428,229,231,2920,415,247,273,272,233,818,819,815,791,877,846,1281] 
set surface_color,  pcol1, surf_pocket1 
set_color pcol2 = [0.278,0.278,0.702]
select surf_pocket2, protein and id [1591,1627,1277,1265,1267,1268,1269,1278,1281,1276,1589,1592,861,865,863,867,859,935,1613,1617,1841,1616] 
set surface_color,  pcol2, surf_pocket2 
set_color pcol3 = [0.576,0.361,0.902]
select surf_pocket3, protein and id [1590,1577,1633,1635,1636,1637,1640,1668,1724,1727,1557,1553,1525,1528,1524,1239,1249,1438,1251,1252,1578] 
set surface_color,  pcol3, surf_pocket3 
set_color pcol4 = [0.616,0.278,0.702]
select surf_pocket4, protein and id [1053,1051,1029,2746,2748,1855,1858,2530,1031,2486,2487,2482,2488,1032,1035,1062,1063,2776,1026,1009,1014,1030,1028,2515,2517] 
set surface_color,  pcol4, surf_pocket4 
set_color pcol5 = [0.902,0.361,0.792]
select surf_pocket5, protein and id [1530,1553,1525,1727,1557,1528,1524,1554,1562,1578,1988,1994,2026,1999,2001,2003,2004,1640,1666,1981,1572,1576,1601,1575,1985] 
set surface_color,  pcol5, surf_pocket5 
set_color pcol6 = [0.702,0.278,0.447]
select surf_pocket6, protein and id [2185,2238,2631,2624,2639,2202,2226,2201,2205,2227,1691,1693,1656,1658,1734,1756,1733,1695,1709,1710] 
set surface_color,  pcol6, surf_pocket6 
set_color pcol7 = [0.902,0.361,0.361]
select surf_pocket7, protein and id [2126,2599,2604,2609,2610,2613,2615,2122,2574,2119,2139,2171,2170,2172,2173,2174,2606,2608] 
set surface_color,  pcol7, surf_pocket7 
set_color pcol8 = [0.702,0.447,0.278]
select surf_pocket8, protein and id [1487,1488,1699,1707,1716,1223,1719,1720,1494,1498,1505,1508,1509,1522,1526,1449,1451,1452,1453,1557,1245,1725,1242,1723,1548] 
set surface_color,  pcol8, surf_pocket8 
set_color pcol9 = [0.902,0.792,0.361]
select surf_pocket9, protein and id [299,206,224,280,283,223,302,442,766] 
set surface_color,  pcol9, surf_pocket9 
   

deselect

orient
