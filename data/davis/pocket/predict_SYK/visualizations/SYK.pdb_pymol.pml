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

load "data/SYK.pdb", protein
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

load "data/SYK.pdb_points.pdb.gz", points
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
select surf_pocket1, protein and id [2537,2539,2993,3610,3611,2542,2995,2996,3032,3034,3035,3173,3174,3535,3536,3005,3007,3017,4225,3010,3014,2594,2595,2596,2598,2600,3563,2981,3609,2980,2983,3157,2591,2593,2597,2979,2986,2987,2989,2984,2991,3021,3018,3942,3956,4050,4052,4058,4059,4060,3416,3944,3945,3948,3917,3919,3918,4247,4249,3577,3586,3971,3585,3558,3970,3541] 
set surface_color,  pcol1, surf_pocket1 
set_color pcol2 = [0.302,0.278,0.702]
select surf_pocket2, protein and id [5074,348,1213,1218,958,959,960,1247,1885,1921,1887,153,5072,5073,181,182,183,1961,897,136,1958,1918,1919,1920,1895,1896,1894,1892,1831,1929,1847,1893,1925,1849,1212,1214,1219,1220,5075] 
set surface_color,  pcol2, surf_pocket2 
set_color pcol3 = [0.631,0.361,0.902]
select surf_pocket3, protein and id [3941,3944,3945,3948,3601,4280,4555,4553,4556,4557,4245,4247,4234,2530,2538,2523,2540,3005,4279,4565,4266,4264,4540] 
set surface_color,  pcol3, surf_pocket3 
set_color pcol4 = [0.678,0.278,0.702]
select surf_pocket4, protein and id [4976,4977,4978,4796,594,502,592,492,5012,5010,5016,4975,5007,4765,4767,4769,480,498,501,504,487,4801,4768,597,595,4981] 
set surface_color,  pcol4, surf_pocket4 
set_color pcol5 = [0.902,0.361,0.682]
select surf_pocket5, protein and id [4356,4359,4233,4235,4237,4239,4236,4240,4257,4189,4318,4321,4288,4326,4324,4354,4379,4290] 
set surface_color,  pcol5, surf_pocket5 
set_color pcol6 = [0.702,0.278,0.341]
select surf_pocket6, protein and id [3917,3919,4087,4089,3918,4249,4250,4239,4243,4126,3002,3005,3017,4225,4224,3015,4292] 
set surface_color,  pcol6, surf_pocket6 
set_color pcol7 = [0.902,0.522,0.361]
select surf_pocket7, protein and id [5000,353,376,1183,5042,364,968,966,360,1155,5044,1004,1131,1152,1159,4996,1161] 
set surface_color,  pcol7, surf_pocket7 
set_color pcol8 = [0.702,0.596,0.278]
select surf_pocket8, protein and id [3415,3341,3432,4053,4054,4059,3535,4082,4069,4071] 
set surface_color,  pcol8, surf_pocket8 
   

deselect

orient
