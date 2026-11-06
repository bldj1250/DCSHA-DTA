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

load "data/GAK.pdb", protein
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

load "data/GAK.pdb_points.pdb.gz", points
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
select surf_pocket1, protein and id [1402,337,340,396,496,497,498,507,935,351,345,514,397,510,956,757,940,953,951,1387,1478,1480,1482,1484,1474,1476,1477,1403,513,515,934,649,681,917,969,977,968,341,955,957,979,336,338] 
set surface_color,  pcol1, surf_pocket1 
set_color pcol2 = [0.365,0.278,0.702]
select surf_pocket2, protein and id [3767,3765,5018,5002,5008,5011,5639,5000,5001,5003,5004,5005,5006,3778,3781,3785,5693,5667,5668,5670,5672,5673,5266,5267,4484,4486,4492,4493,4495,4479,5642,5641,5657,4743,4741,4744] 
set surface_color,  pcol2, surf_pocket2 
set_color pcol3 = [0.792,0.361,0.902]
select surf_pocket3, protein and id [4002,4012,4013,4014,3996,3999,4004,3722,3724,3736,3726,3727,3731,4330,4331,4300,4301,4302,4303,4305,4307,4286,4280,4033,4035,4038,3720,3721,3741,3706,3705,3759] 
set surface_color,  pcol3, surf_pocket3 
set_color pcol4 = [0.702,0.278,0.533]
select surf_pocket4, protein and id [80,82,86,87,89,91,109,5386,60,54,55,58,4294,4338,4339,4309,4314,4315,5387,4287,4291,4292] 
set surface_color,  pcol4, surf_pocket4 
set_color pcol5 = [0.902,0.361,0.361]
select surf_pocket5, protein and id [6006,5250,5995,5296,6028] 
set surface_color,  pcol5, surf_pocket5 
set_color pcol6 = [0.702,0.533,0.278]
select surf_pocket6, protein and id [5729,5730,4458,4473,4419,5731,4456,3812,4422,5684,5685] 
set surface_color,  pcol6, surf_pocket6 
   

deselect

orient
