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

load "data/LATS1.pdb", protein
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

load "data/LATS1.pdb_points.pdb.gz", points
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
select surf_pocket1, protein and id [6490,6493,6494,6161,7105,7108,7110,7107,7123,7098,7100,7147,7150,7104,7099,7102,5556,5533,5534,5535,5537,5540,7177,7164,7431,7457,5555,5557,5559,5572,6491,7114,7115,7117,7118,8160,7080,6145,6147,6148,6149,6163,7074,7084,6165,7075,7077,5529,5515,5521,5522,5523,5525,5517,7116,8153,8156,6094,6103,5671,6119,6098,5516,5519,8148,8150,8152,6598,6517,6518,5685,5569,5571,6620,6621,6601,6462,6623,6628,6629,6479,6502,6603,6605,6606,6607,6832,6833,7138,7134,7140,7141,7142,7143,6461,6477,7169,7183,7185,7144,7148,7173,7175,5786,5820,5549,5702,5703,5551,5552,5791,5687,5688,7132,7129,6630,6822,6824,6826,5807,5949,5842,6599,6600] 
set surface_color,  pcol1, surf_pocket1 
set_color pcol2 = [0.278,0.322,0.702]
select surf_pocket2, protein and id [8488,8498,8531,8533,190,192,195,8500,5881,5883,5396,5397,5884,5905,8506,8501,8514,8518,8524,8520,8523,8552,8553,5860,5862,5882,5859,5861,5827,5854,8468,8467,5829,5358,5359,5361,215,213,216,8535,8542,241,8538,5022,5023,193,4999,4997,4998,4996,175,173,187,178,184,180,157,6680,6687,6689,6690,155,6665,6666,6669,4964,4965,8472,8471,4928,8470,5892,5027,5029,5057,5097,188] 
set surface_color,  pcol2, surf_pocket2 
set_color pcol3 = [0.467,0.361,0.902]
select surf_pocket3, protein and id [5695,6069,5694,5444,5446,5447,5466,5590,5676,5678,5576,5578,5480,5481,5483,5486,5488,5564,5562,5563,5565,8219,8241,8242,8221,8218,5554,5709,6051,5465] 
set surface_color,  pcol3, surf_pocket3 
set_color pcol4 = [0.490,0.278,0.702]
select surf_pocket4, protein and id [4932,4934,4935,4936,4905,4907,4938,4842,8433,8434,4937,4939,4946,8459,8924,8421,4866,4868,4870,4867,8926] 
set surface_color,  pcol4, surf_pocket4 
set_color pcol5 = [0.792,0.361,0.902]
select surf_pocket5, protein and id [7957,5922,7981,7982,5933,5935,7983,7974,7977,7990,6402,6370,7875,7876,6345,6347,6348,6349,6371,6372,5929,6374,6376] 
set surface_color,  pcol5, surf_pocket5 
set_color pcol6 = [0.702,0.278,0.659]
select surf_pocket6, protein and id [156,157,6676,6678,6680,6689,6690,154,155,6666,6669,6662,6664,4965,6682,8472,4991,148,140,142,144,147,127,128,152,4990,153] 
set surface_color,  pcol6, surf_pocket6 
set_color pcol7 = [0.902,0.361,0.682]
select surf_pocket7, protein and id [5322,5319,5321,5324,5323,5325,275,5345,5348,8572,8573,8527,8528,8543,8571,5388,5344,5346,5353,5357,5350,5351,8545] 
set surface_color,  pcol7, surf_pocket7 
set_color pcol8 = [0.702,0.278,0.408]
select surf_pocket8, protein and id [6742,6735,4891,8429,4889,4893,4896,8431,6732,6737,6739,6740,6728,6762,4923,4924,4888,4894,4921,8428,8436,8439,8430] 
set surface_color,  pcol8, surf_pocket8 
set_color pcol9 = [0.902,0.361,0.361]
select surf_pocket9, protein and id [282,287,316,5265,289,285,288,657,5266,313,632,254,294,5131,5155,5153,5158,5192,658,5203,5204] 
set surface_color,  pcol9, surf_pocket9 
set_color pcol10 = [0.702,0.408,0.278]
select surf_pocket10, protein and id [8349,8351,8352,8354,8356,8395,8411,8413,8439,5755,5752,5782,5751,6740] 
set surface_color,  pcol10, surf_pocket10 
set_color pcol11 = [0.902,0.682,0.361]
select surf_pocket11, protein and id [8369,6032,8330,8331,5718,5754,5721,8418,8415,8422,8448,6019,5723] 
set surface_color,  pcol11, surf_pocket11 
set_color pcol12 = [0.702,0.659,0.278]
select surf_pocket12, protein and id [5632,8561,8578,8557,8559,5626,5387,5610,5611,5460,8512] 
set surface_color,  pcol12, surf_pocket12 
   

deselect

orient
