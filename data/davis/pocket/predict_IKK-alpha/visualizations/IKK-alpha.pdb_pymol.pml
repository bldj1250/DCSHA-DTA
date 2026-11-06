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

load "data/IKK-alpha.pdb", protein
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

load "data/IKK-alpha.pdb_points.pdb.gz", points
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
select surf_pocket1, protein and id [3499,3529,2578,2581,2582,2513,3434,3436,3437,3187,2089,2113,2596,2579,3435,3460,3464,3491,3492,4487,924,2097,2098,2094,2095,2096,2103,3002,3004,2108,2110,920,922,909,915,890,906,878,877,3008] 
set surface_color,  pcol1, surf_pocket1 
set_color pcol2 = [0.278,0.278,0.702]
select surf_pocket2, protein and id [151,331,219,221,349,125,347,734,53,126,127,50,51,54,23,24,25,34,35,155,158,207,123,239,241,333,660] 
set surface_color,  pcol2, surf_pocket2 
set_color pcol3 = [0.576,0.361,0.902]
select surf_pocket3, protein and id [175,179,182,186,1305,193,195,342,343,1304,491,1315,1316,1327,1329,1141,1158,1441,1182] 
set surface_color,  pcol3, surf_pocket3 
set_color pcol4 = [0.616,0.278,0.702]
select surf_pocket4, protein and id [1293,1297,490,215,341,343,756,212,214,778,1296,1196,761,755,162,168,165,773,775,166,325,795,796,798,801,805,782,163,1298,1301,1299] 
set surface_color,  pcol4, surf_pocket4 
set_color pcol5 = [0.902,0.361,0.792]
select surf_pocket5, protein and id [1951,1953,1955,1957,1958,1962,1777,1758,1713,1715,1716,1717,1718,1719,1944,1945,1946,1709,1711,1765,1767,1768,1776,1726,1751,1752,3378,3380,3377,3375] 
set surface_color,  pcol5, surf_pocket5 
set_color pcol6 = [0.702,0.278,0.447]
select surf_pocket6, protein and id [1607,1609,2379,1576,1581,2296,1571,1574,1368,1372,1376,1377,2380,2405,2407,2360,1567,1569,1570,2310,2324,1063,1071,1062,1064,1065,1068,1110,1035,1076] 
set surface_color,  pcol6, surf_pocket6 
set_color pcol7 = [0.902,0.361,0.361]
select surf_pocket7, protein and id [1709,892,895,4549,4583,4584,3364,1713,846,857,3365,3405] 
set surface_color,  pcol7, surf_pocket7 
set_color pcol8 = [0.702,0.447,0.278]
select surf_pocket8, protein and id [944,946,1252,1254,1250,1253,841,1205,840,1271] 
set surface_color,  pcol8, surf_pocket8 
set_color pcol9 = [0.902,0.792,0.361]
select surf_pocket9, protein and id [3971,5239,5236,3972,5206,5207,5208,3904,3907,3905,4085,3940,3937,3938,3944] 
set surface_color,  pcol9, surf_pocket9 
   

deselect

orient
