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

load "data/MKNK2.pdb", protein
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

load "data/MKNK2.pdb_points.pdb.gz", points
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
select surf_pocket1, protein and id [871,767,770,710,711,712,769,1291,1292,1293,1286,1290,714,715,1316,1336,886,1025,1823,1824,1138,1142,1814,1716,1816,1342,1689,1717,1339,1817,1818,1812,1822,1057,1058] 
set surface_color,  pcol1, surf_pocket1 
set_color pcol2 = [0.365,0.278,0.702]
select surf_pocket2, protein and id [2031,2047,1974,2030,1972,1973,2074,999,1001,1002,1003,1004,998,1000,973,975,976,2040,2044,2073,2011,1970,968,1987,1991,1068,1032,1066,2003,2004,1042,1064,1037,1997,2001,1999,1950,2050,2066] 
set surface_color,  pcol2, surf_pocket2 
set_color pcol3 = [0.792,0.361,0.902]
select surf_pocket3, protein and id [3118,2410,2421,2424,2426,3086,3111,3112,3114,3095,3097,2312,3018,3054,3085,3065,3067,3051,3084,3090,2413,2415,2419,2441,2447,2412,2414,2416,2418,2440,3138,3139,3140,3110,2355,2330,2356,2316,2331,2442] 
set surface_color,  pcol3, surf_pocket3 
set_color pcol4 = [0.702,0.278,0.533]
select surf_pocket4, protein and id [1987,1991,1993,1068,1070,1185,1183,1032,1066,1180,1042,1971,1181,1974,1973,1002,1004,1970,1006] 
set surface_color,  pcol4, surf_pocket4 
set_color pcol5 = [0.902,0.361,0.361]
select surf_pocket5, protein and id [2116,2117,2121,1652,2134,2100,1017,1845,1846,1848,1840,1862,1863,2095,2102,1620,1625,1627,1631,1610,1617,1618,1624,1049,1050,1851] 
set surface_color,  pcol5, surf_pocket5 
set_color pcol6 = [0.702,0.533,0.278]
select surf_pocket6, protein and id [2146,2148,2176,2189,2185,2186,2173,2837,2839,1605,1591,1567,1595,2840] 
set surface_color,  pcol6, surf_pocket6 
   

deselect

orient
