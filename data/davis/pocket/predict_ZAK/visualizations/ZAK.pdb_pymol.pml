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

load "data/ZAK.pdb", protein
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

load "data/ZAK.pdb_points.pdb.gz", points
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
select surf_pocket1, protein and id [348,345,219,222,418,221,333,448,1187,648,649,519,521,654,727,174,697,691,692,694,1120,671,674,675,1121,666,668,670,183,184,180,173,175,177,178,179,181,185,186,209,1092,1094,1093,1107,1189,699,1196,1197,1190,1191,1193,1195,202,1095] 
set surface_color,  pcol1, surf_pocket1 
set_color pcol2 = [0.365,0.278,0.702]
select surf_pocket2, protein and id [3281,3278,3307,2673,2806,2650,2715,2737,2808,2834,2829,2828,2830,2835,2836,2867,2868,2869,3309,3342,3303,3308,2656,2660,2667,2670,2666,2671,2689,2694,2696,2686,3248,3271,3272,3275,3276,3273,2841,3245,3247,3274] 
set surface_color,  pcol2, surf_pocket2 
set_color pcol3 = [0.792,0.361,0.902]
select surf_pocket3, protein and id [3316,3319,3058,3314,2717,3025,3027,3028,3029,3031,4671,4674,4676,4672,4702,3288,4643,3067,4682,4684,3325,3327,3055,3056,4642,4678,4639] 
set surface_color,  pcol3, surf_pocket3 
set_color pcol4 = [0.702,0.278,0.533]
select surf_pocket4, protein and id [354,135,229,230,231,232,234,356,616,97,357,358,359,605,607,611,98,352,140,142,138,340,137,139] 
set surface_color,  pcol4, surf_pocket4 
set_color pcol5 = [0.902,0.361,0.361]
select surf_pocket5, protein and id [3705,4267,4271,4274,4376,4278,4287,4371,4355,3573,3565,3582,3584,4347] 
set surface_color,  pcol5, surf_pocket5 
set_color pcol6 = [0.702,0.533,0.278]
select surf_pocket6, protein and id [1594,1584,1587,1833] 
set surface_color,  pcol6, surf_pocket6 
   

deselect

orient
