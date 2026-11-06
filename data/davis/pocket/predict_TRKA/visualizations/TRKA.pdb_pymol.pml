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

load "data/TRKA.pdb", protein
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

load "data/TRKA.pdb_points.pdb.gz", points
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
select surf_pocket1, protein and id [5070,3940,3942,3943,5074,4976,4975,3886,3889,3890,4494,4502,4519,4520,4493,5071,3891,3892,5078,5107,4948,5117,5119,4523,4526,4530,4553,3885,3887,2241,4557,4461,4085,4473,4490] 
set surface_color,  pcol1, surf_pocket1 
set_color pcol2 = [0.278,0.298,0.702]
select surf_pocket2, protein and id [2628,2632,2525,2527,2281,2650,2653,2526,2545,3863,3874,3877,2546,3881,3880,3882,3878,2237,2239,2241,2256] 
set surface_color,  pcol2, surf_pocket2 
set_color pcol3 = [0.533,0.361,0.902]
select surf_pocket3, protein and id [1253,1204,1210,1242,1006,2054,1037,1039,1007,1041,1043,1016,1012,1474,2061,2065,2058,1255,1249,1251,1283,1294] 
set surface_color,  pcol3, surf_pocket3 
set_color pcol4 = [0.565,0.278,0.702]
select surf_pocket4, protein and id [2542,3849,2551,2563,2566,2621,2589,3855,3950,3952,2545,3846,3847,3953,3954,2588,3808,4425,4413,4426] 
set surface_color,  pcol4, surf_pocket4 
set_color pcol5 = [0.902,0.361,0.878]
select surf_pocket5, protein and id [4513,4516,4565,4567,4593,4661,4662,4663,4602,4603,4686,4559,4656,4517,4510,4512,4502] 
set surface_color,  pcol5, surf_pocket5 
set_color pcol6 = [0.702,0.278,0.533]
select surf_pocket6, protein and id [4225,4227,4229,4232,4230,4231,3542,3536,5049,5051,5047,5048,4253,4254,4887,4262,3688,4102,3920,3922,3538,5050,3918,3919,3921,3923] 
set surface_color,  pcol6, surf_pocket6 
set_color pcol7 = [0.902,0.361,0.490]
select surf_pocket7, protein and id [4901,5051,4885,5047,4848,4254,4284,4887,4262,4849,4330,4336,5042,5044] 
set surface_color,  pcol7, surf_pocket7 
set_color pcol8 = [0.702,0.329,0.278]
select surf_pocket8, protein and id [3520,3522,3524,3525,3538,4908,3526,4909,5207,5224,4911,4915,3663,3664,4899,3537,3540] 
set surface_color,  pcol8, surf_pocket8 
set_color pcol9 = [0.902,0.620,0.361]
select surf_pocket9, protein and id [5847,5417,5659,5244,5446,5851,5848,5849,5562,5700,5564,5692,5657] 
set surface_color,  pcol9, surf_pocket9 
set_color pcol10 = [0.702,0.631,0.278]
select surf_pocket10, protein and id [2415,2746,2413,2414,2749,2416,2417,2707,2500,2716,2450] 
set surface_color,  pcol10, surf_pocket10 
   

deselect

orient
