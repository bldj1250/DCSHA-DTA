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

load "data/EPHA2.pdb", protein
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

load "data/EPHA2.pdb_points.pdb.gz", points
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
select surf_pocket1, protein and id [4969,4972,4973,4974,5841,5842,5767,4831,5110,5135,4830,4774,4776,4778,4775,5838,5840,5768,5387,5390,5417,5844,5846,5847,5848,5393,5738,4780,4957,4956,5356,5358,5321,5136,5323,5338,4966,5339,5361,5365,5209] 
set surface_color,  pcol1, surf_pocket1 
set_color pcol2 = [0.302,0.278,0.702]
select surf_pocket2, protein and id [5715,5846,5847,5848,5901,5902,5903,5861,5862,5863,5864,5868,5872,5867,4795,4808,4800,4810,4811,5075,4789,4792,5882,5893,5076,5111,4973,4974] 
set surface_color,  pcol2, surf_pocket2 
set_color pcol3 = [0.631,0.361,0.902]
select surf_pocket3, protein and id [6943,6948,6947,6949,7042,6996,6998,7022,7040,7041,7492,7491,7544,7545,7546,7118,7119,7117,7126,6986,6991,6993,6995,6946] 
set surface_color,  pcol3, surf_pocket3 
set_color pcol4 = [0.678,0.278,0.702]
select surf_pocket4, protein and id [1482,1487,1490,792,1267,1224,1226,1480,1476,1478,1479,493,510,512,434,1265,1268,1507,494,418] 
set surface_color,  pcol4, surf_pocket4 
set_color pcol5 = [0.902,0.361,0.682]
select surf_pocket5, protein and id [5449,6301,6304,6306,5737,5410,5406,5741,5744,5740,5739,6052,6262,5924,5928,5948,6318,6317,6316,6311,6312] 
set surface_color,  pcol5, surf_pocket5 
set_color pcol6 = [0.702,0.278,0.341]
select surf_pocket6, protein and id [6311,6314,6362,6310,6344,6346,6347,6360,7411,7419,7420,7407,7429,7432,7144,7457,7461,6305,6307] 
set surface_color,  pcol6, surf_pocket6 
set_color pcol7 = [0.902,0.522,0.361]
select surf_pocket7, protein and id [5193,5194,5571,5572,5575,5577,5548,5547,5812,5794,5800,5802,5183,5811,5807,5549,5186] 
set surface_color,  pcol7, surf_pocket7 
set_color pcol8 = [0.702,0.596,0.278]
select surf_pocket8, protein and id [6353,7484,7448,6253,6251,6497,6503,6310,6284,6507] 
set surface_color,  pcol8, surf_pocket8 
   

deselect

orient
