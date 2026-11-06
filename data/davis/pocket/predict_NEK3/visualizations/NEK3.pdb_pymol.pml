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

load "data/NEK3.pdb", protein
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

load "data/NEK3.pdb_points.pdb.gz", points
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
select surf_pocket1, protein and id [1033,1049,1173,1050,3789,3791,3793,1166,1073,1169,1171,1062,1064,1065,110,113,116,117,118,119,120,3756,109,1172,1186,1187,1188,1189,1190,1191,1194,256,259,261,403,260,258,277,136,111,112,114,121,100,101,102,124,632,658,1088,1092,684,1090,93,95,88,89,139,91,83,675,674,708,86,243,650,652,84,82,85,253,247,638,655,659,1031,1310,1311,1313,1319,3777,1307,1308,1309,3762,3757,3774,1193,365,370,363,374,364] 
set surface_color,  pcol1, surf_pocket1 
set_color pcol2 = [0.302,0.278,0.702]
select surf_pocket2, protein and id [1568,1615,1594,1599,725,1613,1616,3816,3832,3834,3814,734,732,698,700,735,3807,1607,1642] 
set surface_color,  pcol2, surf_pocket2 
set_color pcol3 = [0.631,0.361,0.902]
select surf_pocket3, protein and id [1390,1297,1398,1402,1709,1301,1323,1325,3920,3922,3924,1669,1419,1293,1295,1385,1666,1668,1670,1671,1672,1673,3770,3772,1393] 
set surface_color,  pcol3, surf_pocket3 
set_color pcol4 = [0.678,0.278,0.702]
select surf_pocket4, protein and id [1965,1966,1968,1957,1964,3684,2723,1434,3650,3645,3651,1453,1432,1961,1269,1271,1431,1433,1255] 
set surface_color,  pcol4, surf_pocket4 
set_color pcol5 = [0.902,0.361,0.682]
select surf_pocket5, protein and id [3643,3657,3658,3659,2004,1461,3646,2002,966,932,2016,2260,2010,2015,954,961] 
set surface_color,  pcol5, surf_pocket5 
set_color pcol6 = [0.702,0.278,0.341]
select surf_pocket6, protein and id [1873,1875,2061,2067,2022,2049,2052,2057,2058,2048,2050,1884,1845,1905,1995,1997,2031,1909,3593] 
set surface_color,  pcol6, surf_pocket6 
set_color pcol7 = [0.902,0.522,0.361]
select surf_pocket7, protein and id [931,2235,2228,940,2201,469,472,2198,936] 
set surface_color,  pcol7, surf_pocket7 
set_color pcol8 = [0.702,0.596,0.278]
select surf_pocket8, protein and id [1615,1616,3816,1348,1318,1334,700] 
set surface_color,  pcol8, surf_pocket8 
   

deselect

orient
