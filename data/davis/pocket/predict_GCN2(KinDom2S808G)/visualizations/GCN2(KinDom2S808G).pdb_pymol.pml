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

load "data/GCN2(KinDom2S808G).pdb", protein
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

load "data/GCN2(KinDom2S808G).pdb_points.pdb.gz", points
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
select surf_pocket1, protein and id [4755,5632,5633,5637,5638,5630,5635,4754,4807,5169,5171,5172,6357,6359,6337,6354,6351,6358,4758,6349,4757,4806,4905,6332,6865,6867,6868,4922,4921,4919,6882,6883,6884,4784,5634,4773,4785,4794,4795,4788,4790,6862,6863,6331,6859,6869,6727,6890,6892,5628,5639,5643,5657,6781,6783,6784,6785,6756,6389,5614,5615,6379,6380,6382,6384] 
set surface_color,  pcol1, surf_pocket1 
set_color pcol2 = [0.278,0.333,0.702]
select surf_pocket2, protein and id [3431,3052,3430,3502,2865,3406,3510,3407,3501,3404,3073,3076,3078,3064,3065,2338,2339,2466,2469,2285,2287,2351,2353,2354,2279,2284,2282,2448,2300,2293,2296,2289,2291] 
set surface_color,  pcol2, surf_pocket2 
set_color pcol3 = [0.443,0.361,0.902]
select surf_pocket3, protein and id [9225,10749,10947,10731,10734,10752,10735,9096,9097,9100,8853,9793,9796,9820,9822,10522,10523,10512,10514,10510,10605,10961,10740,10745,10746,9207,9222,9220,10958,10959,10948,10952] 
set surface_color,  pcol3, surf_pocket3 
set_color pcol4 = [0.463,0.278,0.702]
select surf_pocket4, protein and id [9784,10030,10032,10063,10062,10069,9816,10060,9893,9894,9808,9852,9857,9858,9860,9846,9807,9809,9810] 
set surface_color,  pcol4, surf_pocket4 
set_color pcol5 = [0.741,0.361,0.902]
select surf_pocket5, protein and id [9814,9815,9816,10474,10060,10088,10494,10715,10717,10733,10735,10606,10640,9558,9560,10090] 
set surface_color,  pcol5, surf_pocket5 
set_color pcol6 = [0.694,0.278,0.702]
select surf_pocket6, protein and id [9587,10320,10568,10571,10576,10768,9322,9320,10564,10565,10566,9295,10772,10792,9602,10283,10286] 
set surface_color,  pcol6, surf_pocket6 
set_color pcol7 = [0.902,0.361,0.757]
select surf_pocket7, protein and id [5616,5607,5619,6751,6757,6758,6404,6405,6406,6409,7484,7480,7167,7135,5620,6742,7169] 
set surface_color,  pcol7, surf_pocket7 
set_color pcol8 = [0.702,0.278,0.475]
select surf_pocket8, protein and id [4678,4679,4930,4933,6281,6284,6287,6283,6285,4929,6307,5270,5271] 
set surface_color,  pcol8, surf_pocket8 
set_color pcol9 = [0.902,0.361,0.459]
select surf_pocket9, protein and id [5071,5045,5047,5049,5050,5218,5219,6003,6004,6002,5220,6294,5012,5013] 
set surface_color,  pcol9, surf_pocket9 
set_color pcol10 = [0.702,0.318,0.278]
select surf_pocket10, protein and id [8651,8634,8693,8625,8887,8629,10843,10841] 
set surface_color,  pcol10, surf_pocket10 
set_color pcol11 = [0.902,0.561,0.361]
select surf_pocket11, protein and id [3596,3595,3597,3659,2497,3656,3657,3658,2493,2330,3634] 
set surface_color,  pcol11, surf_pocket11 
set_color pcol12 = [0.702,0.553,0.278]
select surf_pocket12, protein and id [11851,11534,11823,11853,11734,11737,11640,11830,11818,11825,11820,11654,11656,11855,11721] 
set surface_color,  pcol12, surf_pocket12 
set_color pcol13 = [0.902,0.859,0.361]
select surf_pocket13, protein and id [7401,7415,7682,7630,6471,7421,6469,7410,7412,7404] 
set surface_color,  pcol13, surf_pocket13 
   

deselect

orient
