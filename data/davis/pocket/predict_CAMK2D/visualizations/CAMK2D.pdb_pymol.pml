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

load "data/CAMK2D.pdb", protein
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

load "data/CAMK2D.pdb_points.pdb.gz", points
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
select surf_pocket1, protein and id [3258,3464,3450,2878,3224,3226,3238,3205,2869,3174,3204,2868,2870,3197,2933,2935,3466,3467,3468,3472,3470,3477,3482,3483,3489,3451,3433,3436,3592,3774,3778,3782,3773,3775,3776,3783,3196,3156,3158,3124,3789,3790,3556,3573,3742,3743,3746,3024,3721,3723,3725,3127,3541] 
set surface_color,  pcol1, surf_pocket1 
set_color pcol2 = [0.365,0.278,0.702]
select surf_pocket2, protein and id [1702,1706,1714,2412,2410,2375,1689,1676,1677,2350,2351,1674,2342,2344,2348,2367,2371,1405,1738,1740,1743,1772,1409,1410,1704,1703,1701,1407,1408,2437,1400,1131,1422,1424,2377,1129,1130,2381,2382,2408,2376,2406,2407] 
set surface_color,  pcol2, surf_pocket2 
set_color pcol3 = [0.792,0.361,0.902]
select surf_pocket3, protein and id [162,1240,1151,1154,1155,757,596,770,1248,1247,1249,1242,1243,1245,1257,333,217,218,727,731,733,595,204,167,160,161,164,323,755,338,336,337,489,732,734,1127,772,1139] 
set surface_color,  pcol3, surf_pocket3 
set_color pcol4 = [0.702,0.278,0.533]
select surf_pocket4, protein and id [1263,1264,1270,1272,1262,1249,2497,183,186,180,338,455,490,454,337,191,195,395,188,352,353,354,457,202,204,179,424,451,453,448,421,422,1271] 
set surface_color,  pcol4, surf_pocket4 
set_color pcol5 = [0.902,0.361,0.361]
select surf_pocket5, protein and id [817,848,908,1203,1199,1200,1163,788,936,927,930,1207] 
set surface_color,  pcol5, surf_pocket5 
set_color pcol6 = [0.702,0.533,0.278]
select surf_pocket6, protein and id [2875,2886,2883,386,387,2472,2506,2508,3255,3251,196,187,385,3225] 
set surface_color,  pcol6, surf_pocket6 
   

deselect

orient
