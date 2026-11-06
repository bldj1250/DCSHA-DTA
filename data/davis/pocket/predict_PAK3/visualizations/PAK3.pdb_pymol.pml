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

load "data/PAK3.pdb", protein
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

load "data/PAK3.pdb_points.pdb.gz", points
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
select surf_pocket1, protein and id [3183,3171,3173,3174,3175,3167,2298,2276,2283,2284,2285,2287,2292,3161,3422,3426,3427,1220,1222,3459,3460,3659,3704,2290,1210,1212,1214,2863,1696,1690,1692,1693,1694,2901,2892,3688,2890,2893,1678,1217,1704,3299,3144,3419,3289,3290,3291,2295,2297,1193,1195,1196,1197,1199,3300,3301,3302,3276,2492,2493,2486,2523,2524,2527,2497,1206,1207,1224,3730,3731,1190,1192,1200,1201,1202,1208,3420,1130,1191,3267,2847,2849,3172,2842,2844,2872,3199,2871,2301,2312,2315,2264,2266,2270,2271,2272,2274,3198,2823,2818,2820,2841,2827,2314,2408,2267,2269,2561,2426,3274,3275,3272,2534,2425,2442,2424,2800,3268,2530,2529] 
set surface_color,  pcol1, surf_pocket1 
set_color pcol2 = [0.616,0.278,0.702]
select surf_pocket2, protein and id [1662,3673,1655,3674,3918,2913,2915,2920,1636,1656] 
set surface_color,  pcol2, surf_pocket2 
set_color pcol3 = [0.902,0.361,0.361]
select surf_pocket3, protein and id [3555,3557,3558,4100,3548,3549,3562,3564,3565,3566,3376,3377,4061,3071] 
set surface_color,  pcol3, surf_pocket3 
   

deselect

orient
