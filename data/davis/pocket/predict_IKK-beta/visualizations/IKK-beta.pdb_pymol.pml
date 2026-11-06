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

load "data/IKK-beta.pdb", protein
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

load "data/IKK-beta.pdb_points.pdb.gz", points
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
select surf_pocket1, protein and id [815,1219,1330,164,165,170,171,173,214,216,1329,217,1331,1332,343,344,1334,1336,809,812,819,772,789,327,167,786,793,168,767,180,202,191,1180,1192,1193,1205,1181,1476,181,177,175,1164,1468,195,1338,1360,1362,184,188,1469,606,1220,810,792,605] 
set surface_color,  pcol1, surf_pocket1 
set_color pcol2 = [0.302,0.278,0.702]
select surf_pocket2, protein and id [1748,1750,1752,1753,1754,1746,1758,1798,864,1720,3437,1986,1989,1993,1992,1997,1800,1801,1994,1995,2002,3430,3432,3434,3435,3433,3406,3408,914,916,917,3422,1808,3397,3399,3394,3423,3424,3425,3428,4632,875] 
set surface_color,  pcol2, surf_pocket2 
set_color pcol3 = [0.631,0.361,0.902]
select surf_pocket3, protein and id [2973,3079,2505,2509,2476,2492,2497,2510,2468,2508,2529,2511,2979,2992,3008,980,3009,3040,3038,3039,955,2163,3037,3005] 
set surface_color,  pcol3, surf_pocket3 
set_color pcol4 = [0.678,0.278,0.702]
select surf_pocket4, protein and id [3634,3636,3630,3629,3637,3638,3641,4440,4441,4443,3607,4434,4436,3667,5936,5938,5940,5941,5942,5945,5946,5939,5943,4402,4400,4403,5909,3690,3657,3659,4404,4407] 
set surface_color,  pcol4, surf_pocket4 
set_color pcol5 = [0.902,0.361,0.682]
select surf_pocket5, protein and id [2124,3055,2122,3239,2130,2132,2137,2102,2104,3044,2123,2125,2121,2127,2116,3501,3502,2593,2594,2590,3063,3591,3557,3558,3531,3532] 
set surface_color,  pcol5, surf_pocket5 
set_color pcol6 = [0.702,0.278,0.341]
select surf_pocket6, protein and id [3271,2087,2089,2091,2043,2046,1974,2063,2097,3470,3263,3266,3272,3437,1986,1988,1993,1999,2001,1757,3275,3277,2011,2006] 
set surface_color,  pcol6, surf_pocket6 
set_color pcol7 = [0.902,0.522,0.361]
select surf_pocket7, protein and id [1286,853,854,856,1228,851,935,936,1305,911,912,3021,3023,1304,964] 
set surface_color,  pcol7, surf_pocket7 
set_color pcol8 = [0.702,0.596,0.278]
select surf_pocket8, protein and id [247,335,745,354,692,77,667,691,249,668,76,78,130] 
set surface_color,  pcol8, surf_pocket8 
   

deselect

orient
