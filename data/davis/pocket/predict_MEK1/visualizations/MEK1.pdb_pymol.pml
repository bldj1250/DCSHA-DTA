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

load "data/MEK1.pdb", protein
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

load "data/MEK1.pdb_points.pdb.gz", points
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
select surf_pocket1, protein and id [627,743,744,1101,1115,1622,1623,1100,919,896,990,1111,1114,991,1001,1005,760,1702,606,607,1721,613,1670,1672,1620,1486,1462,1470,1471,1472,1482,1636,1628,1678,1729,1731,1732,1680,1606,1611,1616,1617,1618,1619,1523,1632,917,920,1634,1501,1502,1750,598,591,593,594,595,601,1513,1514,1515] 
set surface_color,  pcol1, surf_pocket1 
set_color pcol2 = [0.365,0.278,0.702]
select surf_pocket2, protein and id [1575,1581,3013,3015,3016,3023,3026,1325,3025,2843,2845,1302,1303,1304,320,321,345,347,1354,1300,1329,975,1299,1592,978,1324,1585,1583,1577,1588,964,1301,2874,2888] 
set surface_color,  pcol2, surf_pocket2 
set_color pcol3 = [0.792,0.361,0.902]
select surf_pocket3, protein and id [1164,1156,1187,1188,1189,1513,1514,1515,580,584,579,581,585,586,587,1538,1539,723,1114,627,1623,624,626,1523,583,1139,1135] 
set surface_color,  pcol3, surf_pocket3 
set_color pcol4 = [0.702,0.278,0.533]
select surf_pocket4, protein and id [1129,1121,1125,1128,709,405,435,436,409,1020,1571,1568,400,1550,1123,1583,1553,1601,372,374,1584,371,373] 
set surface_color,  pcol4, surf_pocket4 
set_color pcol5 = [0.902,0.361,0.361]
select surf_pocket5, protein and id [2050,2053,2052,2060,2452,2454,2384,2416,2233,2236,2383,2413,2368,2224,2226,2230,2234,2356,2358,2359,2363] 
set surface_color,  pcol5, surf_pocket5 
set_color pcol6 = [0.702,0.533,0.278]
select surf_pocket6, protein and id [958,983,994,1124,1601,995,386,408,1583,372,371,381,373,380,407,405] 
set surface_color,  pcol6, surf_pocket6 
   

deselect

orient
