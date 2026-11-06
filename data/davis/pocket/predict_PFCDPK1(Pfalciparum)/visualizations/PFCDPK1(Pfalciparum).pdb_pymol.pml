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

load "data/PFCDPK1(Pfalciparum).pdb", protein
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

load "data/PFCDPK1(Pfalciparum).pdb_points.pdb.gz", points
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
select surf_pocket1, protein and id [637,638,1047,1049,1050,581,582,2998,580,1178,1186,621,625,433,435,2986,2992,2993,2995,3003,1180,3013,3018,3019,3007,3011,597,595,578,593,596,421,422,423,583,3756,604,606,618,2963,3752,3753,3754,3755,3782,2985,331,1048,2962,3787,1062,373,374] 
set surface_color,  pcol1, surf_pocket1 
set_color pcol2 = [0.278,0.298,0.702]
select surf_pocket2, protein and id [492,541,540,642,486,489,499,1585,1723,1725,1572,1597,76,1573,1727,75,77,502,505,1229,485,487,490,1584,1586,57,58,655,658,659,1171,1172,652,660,1721,1726,517,519,1026,1716,1719,1720,1177,1200,1612,1613,1219,1193,1197,1189] 
set surface_color,  pcol2, surf_pocket2 
set_color pcol3 = [0.533,0.361,0.902]
select surf_pocket3, protein and id [1248,1249,37,39,1896,1898,1588,60,1892,1894,2160,2141,2143,1274,1281,1272,1304,1310,1277,1280,1579,2114,1246,2115,1910,2159,1307] 
set surface_color,  pcol3, surf_pocket3 
set_color pcol4 = [0.565,0.278,0.702]
select surf_pocket4, protein and id [913,914,911,915,1762,1767,145,1832,147,148,149,150,151,152,131,880,884,1755,1760,123,126,1548,1851,886,122] 
set surface_color,  pcol4, surf_pocket4 
set_color pcol5 = [0.902,0.361,0.878]
select surf_pocket5, protein and id [1145,1147,1150,399,403,405,406,548,402,404,427,651,563,401,447,450,453,426,428,666,1123,1125,533] 
set surface_color,  pcol5, surf_pocket5 
set_color pcol6 = [0.702,0.278,0.533]
select surf_pocket6, protein and id [968,967,1501,303,307,314,981,305,966,965,306,3565,3567,3534,3518,3531,1504,985,3563] 
set surface_color,  pcol6, surf_pocket6 
set_color pcol7 = [0.902,0.361,0.490]
select surf_pocket7, protein and id [990,1015,1034,1035,3577,1181,1704,3082,1030,3049,3046,3020] 
set surface_color,  pcol7, surf_pocket7 
set_color pcol8 = [0.702,0.329,0.278]
select surf_pocket8, protein and id [1455,1486,2584,2587,2593,2596,2586,1479,2009,2599,2011,1454,1487,1489,1480] 
set surface_color,  pcol8, surf_pocket8 
set_color pcol9 = [0.902,0.620,0.361]
select surf_pocket9, protein and id [893,516,518,521,717,719,887,515,517,519,924,1742,881,882,883] 
set surface_color,  pcol9, surf_pocket9 
set_color pcol10 = [0.702,0.631,0.278]
select surf_pocket10, protein and id [2903,2904,3526,3527,266,2885,2925,3471,3484] 
set surface_color,  pcol10, surf_pocket10 
   

deselect

orient
