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

load "data/CAMK2A.pdb", protein
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

load "data/CAMK2A.pdb_points.pdb.gz", points
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
select surf_pocket1, protein and id [3199,3203,3205,3776,3192,3785,3788,3779,3783,3789,2859,2861,2863,3166,2862,3206,2865,2868,3229,3230,3197,3227,3187,3189,3808,3807,3196,3277,3438,3441,3455,3456,3257,3259,3260,3791,2840,2869,3559,3576,3745,3746,3777,3726,3769,3773,3595,3723,3724,3120,3121,3119,3116,3152,3118,2925,2927] 
set surface_color,  pcol1, surf_pocket1 
set_color pcol2 = [0.365,0.278,0.702]
select surf_pocket2, protein and id [1417,1419,1697,2342,2344,2345,1669,1671,1672,1395,1400,1402,1403,1404,1767,1405,2371,2373,2374,2375,2407,1122,2376,2370,2431,1701,2365,2404,2406,1709,2401,2361,2364] 
set surface_color,  pcol2, surf_pocket2 
set_color pcol3 = [0.792,0.361,0.902]
select surf_pocket3, protein and id [213,214,329,330,331,724,725,726,727,720,722,723,166,168,170,164,163,158,1146,748,750,744,586,588,732,157,316,317,160,742,482,1236,1237,1239,1119,1147,1234,1251] 
set surface_color,  pcol3, surf_pocket3 
set_color pcol4 = [0.702,0.278,0.533]
select surf_pocket4, protein and id [1241,1242,1243,1090,483,1256,1257,1258,1259,1264,1266,417,441,444,446,414,415,2491,1265,200,346,347,345,388,450,179,182,184,187,191,193,330,331,176] 
set surface_color,  pcol4, surf_pocket4 
set_color pcol5 = [0.902,0.361,0.361]
select surf_pocket5, protein and id [841,901,920,923,1194,810,1154,1155,929,954,1201,1197,1193] 
set surface_color,  pcol5, surf_pocket5 
set_color pcol6 = [0.702,0.533,0.278]
select surf_pocket6, protein and id [2466,190,192,2502,2503,378,3254,3242,3253,379,380,3228,183,2465,2877,2464,2868,3258,2867] 
set surface_color,  pcol6, surf_pocket6 
   

deselect

orient
