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

load "data/ERBB4.pdb", protein
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

load "data/ERBB4.pdb_points.pdb.gz", points
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
select surf_pocket1, protein and id [6694,5675,5676,5824,5825,5826,6695,5631,5673,5821,5639,5818,5662,6687,6688,6581,6595,6689,6690,6692,6609,6183,6185,5808,6167,6189,7852,7853,5623,5624,5627,5629,5809,6610,6211,6214,6217,6219,6696,5640,6166,6149,6152,6243,6244,5625,5630,9689,9690,9691,9688,5637,5635] 
set surface_color,  pcol1, surf_pocket1 
set_color pcol2 = [0.278,0.310,0.702]
select surf_pocket2, protein and id [2170,2169,2063,2065,2171,2172,2518,2515,2519,2502,2350,2501,2360,2361,2364,2203,2177,2225,2223,2282,2204,2076,2077] 
set surface_color,  pcol2, surf_pocket2 
set_color pcol3 = [0.498,0.361,0.902]
select surf_pocket3, protein and id [5796,6181,6182,7936,7960,7964,7980,7967,7973,7974,6196,6198,7863,6184,7885,7889,5696,5697,7886,7860,7862,7864,7897,7939,6180] 
set surface_color,  pcol3, surf_pocket3 
set_color pcol4 = [0.525,0.278,0.702]
select surf_pocket4, protein and id [2152,4629,4630,2146,2151,2092,2094,2139,9161,9169,9178,9175,9180,4609,4562,4578,4564,4565,2130,2138,4610,4593,9173,9174,4458,2142] 
set surface_color,  pcol4, surf_pocket4 
set_color pcol5 = [0.851,0.361,0.902]
select surf_pocket5, protein and id [1981,1984,2001,191,2003,1927,644,1941,1945,1948,1950,1933,2262,2264] 
set surface_color,  pcol5, surf_pocket5 
set_color pcol6 = [0.702,0.278,0.600]
select surf_pocket6, protein and id [925,5340,5343,1180,1182,1185,927,1183,1430,1206,1405,893,961,971,894,895,5750,884,887,260,963,964] 
set surface_color,  pcol6, surf_pocket6 
set_color pcol7 = [0.902,0.361,0.596]
select surf_pocket7, protein and id [4115,4116,3475,4118,4119,3501,3502,4038,4059,4138,4049,4051,4044,4096,4098,4291,4293,4113] 
set surface_color,  pcol7, surf_pocket7 
set_color pcol8 = [0.702,0.278,0.325]
select surf_pocket8, protein and id [9155,9156,9149,9166,2532,2533,9164,9167,2074,2076,2077,2075,2361,2365,2363,2364,2518] 
set surface_color,  pcol8, surf_pocket8 
set_color pcol9 = [0.902,0.478,0.361]
select surf_pocket9, protein and id [2291,2239,2241,2276,2257,2269,188,205,2259,2260,2261,2262,2263,2264,184,179,181,1982,1994,1995,1999,1983,1985,2307,2308] 
set surface_color,  pcol9, surf_pocket9 
set_color pcol10 = [0.702,0.510,0.278]
select surf_pocket10, protein and id [227,243,489,329,330,365,394,396,359,360,357,226,398,328,326,362,266,508,279,281,280] 
set surface_color,  pcol10, surf_pocket10 
set_color pcol11 = [0.902,0.831,0.361]
select surf_pocket11, protein and id [5524,5353,5519,5515,5378,5375,5376,5377,5756,5738,5741,5742,5344,5345,5351,5336,5535,5569,5722,5568,5734] 
set surface_color,  pcol11, surf_pocket11 
   

deselect

orient
