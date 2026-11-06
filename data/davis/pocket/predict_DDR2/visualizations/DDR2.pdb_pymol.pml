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

load "data/DDR2.pdb", protein
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

load "data/DDR2.pdb_points.pdb.gz", points
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
select surf_pocket1, protein and id [4516,4521,4525,4529,4531,4532,4792,4903,4864,4895,4868,4896,4897,4891,4892,4227,4534,4536,4522,4533,4509,4510,4511,4513,4859,5759,5758,5765,5757,4552,4793,5749,5784,5748,4927,4930,4932,4210,4229,4231,4242,4236,4240] 
set surface_color,  pcol1, surf_pocket1 
set_color pcol2 = [0.278,0.322,0.702]
select surf_pocket2, protein and id [5766,5767,5741,5157,5156,4133,4776,4964,4965,5658,5735,5036,5037,5737,4788,4791,5138] 
set surface_color,  pcol2, surf_pocket2 
set_color pcol3 = [0.467,0.361,0.902]
select surf_pocket3, protein and id [423,806,549,551,1399,807,810,393,1391,1382,1384,861,863,391,395,1385,1386,518,522,388,389,556,390,392] 
set surface_color,  pcol3, surf_pocket3 
set_color pcol4 = [0.490,0.278,0.702]
select surf_pocket4, protein and id [5703,5668,5671,5674,5706,5705,5722,5009,5011,5012,4692,5185,5171,5165,4700,4690,4693,4694,5723] 
set surface_color,  pcol4, surf_pocket4 
set_color pcol5 = [0.792,0.361,0.902]
select surf_pocket5, protein and id [4413,4412,4411,4576,4438,4439,4560,4561,4801,4453,4457,4441,4800] 
set surface_color,  pcol5, surf_pocket5 
set_color pcol6 = [0.702,0.278,0.659]
select surf_pocket6, protein and id [6255,6598,6599,6601,6373,6596,6101] 
set surface_color,  pcol6, surf_pocket6 
set_color pcol7 = [0.902,0.361,0.682]
select surf_pocket7, protein and id [4272,5561,5567,5569,4283,4270,4282,5556,5548,4315,4316,4990,5550,4955,4324,4956,4982,4954,4978,4323,4322,4312,5547,4946] 
set surface_color,  pcol7, surf_pocket7 
set_color pcol8 = [0.702,0.278,0.408]
select surf_pocket8, protein and id [6208,5230,5231,6229,6231,6228,6223,5829,5956,6166,5828,5802,5807,5809,5830] 
set surface_color,  pcol8, surf_pocket8 
set_color pcol9 = [0.902,0.361,0.361]
select surf_pocket9, protein and id [6253,5929,5962,6101,6348,6315,6370,6255,6341] 
set surface_color,  pcol9, surf_pocket9 
set_color pcol10 = [0.702,0.408,0.278]
select surf_pocket10, protein and id [199,221,224,226,249,193,1464,195,183,189,222,218,251] 
set surface_color,  pcol10, surf_pocket10 
set_color pcol11 = [0.902,0.682,0.361]
select surf_pocket11, protein and id [5873,5871,5916,6005,6325,5931,6323,6324,6007] 
set surface_color,  pcol11, surf_pocket11 
set_color pcol12 = [0.702,0.659,0.278]
select surf_pocket12, protein and id [1451,282,284,1454,478,1178,1198,1197,1179] 
set surface_color,  pcol12, surf_pocket12 
   

deselect

orient
