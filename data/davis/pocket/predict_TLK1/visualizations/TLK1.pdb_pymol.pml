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

load "data/TLK1.pdb", protein
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

load "data/TLK1.pdb_points.pdb.gz", points
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
select surf_pocket1, protein and id [497,499,671,670,672,3659,481,484,488,668,4845,4846,4847,4848,4849,4862,4695,4699,4868,4865,4716,4870,4871,5034,3825,3826,3827,4034,3679,3656,3974,495,3997,3967,3972,4004,3996,3843,4735,4715,686,669,683,666,667] 
set surface_color,  pcol1, surf_pocket1 
set_color pcol2 = [0.365,0.278,0.702]
select surf_pocket2, protein and id [4351,4343,4750,4727,4751,4337,4341,4735,3634,3635,3636,3638,3639,3640,3641,4317,4321,4335,4294,4842,4840,4841,3825,3826,3827,3692,3695,4843,4845,4848,4151,4291,3810,4300,3694] 
set surface_color,  pcol2, surf_pocket2 
set_color pcol3 = [0.792,0.361,0.902]
select surf_pocket3, protein and id [687,693,700,701,4406,4407,703,4364,4366,5308,4714,4723,5070,5072,686,688,4394,4393,4395,4431,5339,4404,5390,5359,5386,5056,5060,5059,5391] 
set surface_color,  pcol3, surf_pocket3 
set_color pcol4 = [0.702,0.278,0.533]
select surf_pocket4, protein and id [3275,3277,2458,3276,2460,3313,3343,725,726,2431,2494,2455] 
set surface_color,  pcol4, surf_pocket4 
set_color pcol5 = [0.902,0.361,0.361]
select surf_pocket5, protein and id [4613,4650,4903,4652,4653,4900,4902,4939,5802,4918,4940,4942,4954,5191,4945,5200] 
set surface_color,  pcol5, surf_pocket5 
set_color pcol6 = [0.702,0.533,0.278]
select surf_pocket6, protein and id [5079,5108,5015,5016,5023,5116,5118,5456,5114,5134,5013,5111,5008,5011] 
set surface_color,  pcol6, surf_pocket6 
   

deselect

orient
