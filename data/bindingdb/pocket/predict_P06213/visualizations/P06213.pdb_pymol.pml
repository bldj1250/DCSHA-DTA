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

load "data/P06213.pdb", protein
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

load "data/P06213.pdb_points.pdb.gz", points
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
select surf_pocket1, protein and id [9323,9324,9315,9316,9318,9321,9221,9325,9213,9212,9227,8194,8196,8748,8749,8239,8240,8237,8189,8190,8192,8182,8184,8791,8794,8797,8801,9224,9239,9240,9241,8754,8772,8378,8767,8770,8771,8186,8183,8187,8631,8202,8395,8394,8201] 
set surface_color,  pcol1, surf_pocket1 
set_color pcol2 = [0.278,0.341,0.702]
select surf_pocket2, protein and id [3415,3884,3887,3888,3904,3889,3627,3625,4728,3903,4730,4234,4236,4216,4217,4744,4326,4327,4328,4330,4329,4361,4360,4339,4341,3408,3410,3411,4362] 
set surface_color,  pcol2, surf_pocket2 
set_color pcol3 = [0.424,0.361,0.902]
select surf_pocket3, protein and id [2938,3138,3141,4335,4354,3145,3149,4334,3148,3150,3424,4338,4363,4369,4348,4333,4343,4350,4318,4321,3171,2939,2970,3162,3164,3197,4320] 
set surface_color,  pcol3, surf_pocket3 
set_color pcol4 = [0.435,0.278,0.702]
select surf_pocket4, protein and id [9322,9226,9325,9213,9212,9227,8196,9190,9215,9216,9368,9379,9386,9387,9428,9430,9346,9357,9358,9367,9369,9371,8208,9390,9339,9340,9341] 
set surface_color,  pcol4, surf_pocket4 
set_color pcol5 = [0.698,0.361,0.902]
select surf_pocket5, protein and id [3419,3409,3423,3663,3666,3664,3665,3657,3693,4339,4341,3408,3410,3411,4328,4329,4852,3888,3904,3625,3643,4730] 
set surface_color,  pcol5, surf_pocket5 
set_color pcol6 = [0.651,0.278,0.702]
select surf_pocket6, protein and id [8552,8553,9152,9355,9330,9150,9147,9159,9332,9329,9166] 
set surface_color,  pcol6, surf_pocket6 
set_color pcol7 = [0.902,0.361,0.824]
select surf_pocket7, protein and id [9274,9276,8833,8836,9275,9277,9034,8998,9033,8948,8997,8999,9000,9001,9024,8995] 
set surface_color,  pcol7, surf_pocket7 
set_color pcol8 = [0.702,0.278,0.533]
select surf_pocket8, protein and id [222,225,194,2010,2012,2015,2189,2237,2017,2024,2025,2030,209,191,219,174,175,176,177,2185,2201,2008,2194] 
set surface_color,  pcol8, surf_pocket8 
set_color pcol9 = [0.902,0.361,0.545]
select surf_pocket9, protein and id [1280,1077,1756,1872,1080,1706,1778,1718,1722,1777,1721,1762,1764,1763,1765,1874,1279,1282,1712] 
set surface_color,  pcol9, surf_pocket9 
set_color pcol10 = [0.702,0.278,0.318]
select surf_pocket10, protein and id [8606,8607,9269,9270,9271,9252,9260,9262,9263,8758,9304,9305] 
set surface_color,  pcol10, surf_pocket10 
set_color pcol11 = [0.902,0.451,0.361]
select surf_pocket11, protein and id [10300,10302,9026,10287,9024,9289,9053,9288,8608,9271,10335,10336] 
set surface_color,  pcol11, surf_pocket11 
set_color pcol12 = [0.702,0.459,0.278]
select surf_pocket12, protein and id [2920,4370,4383,2938,4335,2922,2924,2926,4347,4348,4333,4343,4344,4345,4350,4351,4395,2940,2941,2943,2939] 
set surface_color,  pcol12, surf_pocket12 
set_color pcol13 = [0.902,0.729,0.361]
select surf_pocket13, protein and id [5795,1328,5792,5794,5796,5798,5773,925,922,1337,1352,1334,1335,5797,5799,1356,1358,1345] 
set surface_color,  pcol13, surf_pocket13 
set_color pcol14 = [0.702,0.675,0.278]
select surf_pocket14, protein and id [541,786,327,714,739,445,446] 
set surface_color,  pcol14, surf_pocket14 
   

deselect

orient
