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

load "data/EPHA1.pdb", protein
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

load "data/EPHA1.pdb_points.pdb.gz", points
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
select surf_pocket1, protein and id [5795,5809,5900,5901,5903,5897,5899,5025,4829,4834,4836,4841,4842,4884,4881,5423,5445,5448,5825,5824,5419,5008,5415,5417,4823,4824,4825,4827,4883,5418,5905,5907,4845,5451,5024,5026,5169,5021,5023,5397,5398,5403,5007,5009,5271] 
set surface_color,  pcol1, surf_pocket1 
set_color pcol2 = [0.278,0.298,0.702]
select surf_pocket2, protein and id [5528,7222,7483,7461,5539,6559,6560,6570,5530,5531,5532,7190,5529,6565,6566,6567,7462,7188,7512,5591,6331,6337,6339,6348,6350,6351,5554,5599,6582,6583,6602,5568,5569,5570,6334,5571,6336] 
set surface_color,  pcol2, surf_pocket2 
set_color pcol3 = [0.533,0.361,0.902]
select surf_pocket3, protein and id [6994,6361,6363,6550,6556,6559,6562,5531,7190,7191,7194,6990,6993,7512,6985,7009,6382,6384,6392,7010,7014,6540,6534,6380,6309,6338,6336,6359,6368,6337,6339,6348,6381] 
set surface_color,  pcol3, surf_pocket3 
set_color pcol4 = [0.565,0.278,0.702]
select surf_pocket4, protein and id [1522,1227,1268,1269,1514,840,844,525,520,1516,1226,1508,1510,537,1511,1512,539] 
set surface_color,  pcol4, surf_pocket4 
set_color pcol5 = [0.902,0.361,0.878]
select surf_pocket5, protein and id [5351,5352,5101,5103,5099,5041,5367,5105,5365,5102,5104,5106,5080,4647,5109,5321,5108] 
set surface_color,  pcol5, surf_pocket5 
set_color pcol6 = [0.702,0.278,0.533]
select surf_pocket6, protein and id [3571,3325,3966,3967,2598,2599,3957,3584,3586,3959,3960,3950,3339,3336,3588,3592,2606,2609,2610,2593,2601] 
set surface_color,  pcol6, surf_pocket6 
set_color pcol7 = [0.902,0.361,0.490]
select surf_pocket7, protein and id [668,298,301,665,674,316,239,245,246,234,235,237,250,241,270,225,689] 
set surface_color,  pcol7, surf_pocket7 
set_color pcol8 = [0.702,0.329,0.278]
select surf_pocket8, protein and id [5604,5854,5862,5867,5869,5254,5871,5603,5861,5629] 
set surface_color,  pcol8, surf_pocket8 
set_color pcol9 = [0.902,0.620,0.361]
select surf_pocket9, protein and id [1922,161,165,168,1976,1977,154,149,155,1641,1646,1656,1640] 
set surface_color,  pcol9, surf_pocket9 
set_color pcol10 = [0.702,0.631,0.278]
select surf_pocket10, protein and id [2423,2425,2426,2521,2719,2730,2718,2728,2729,2731,2732,2511,2309,2311] 
set surface_color,  pcol10, surf_pocket10 
   

deselect

orient
