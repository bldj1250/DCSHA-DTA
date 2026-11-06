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

load "data/PIK3C2G.pdb", protein
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

load "data/PIK3C2G.pdb_points.pdb.gz", points
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
select surf_pocket1, protein and id [4023,5094,5096,5121,5122,5127,6583,1934,1936,5063,5053,5061,5052,5054,5028,5029,5294,5018,5137,5139,6550,1933,1935,1937,1943,1921,1922,1923,1931,1940,4052,4028,4031,6581,1959,6900,4055,6928,6930,5286,5298,6568,6571,6573,6574,5251,5252,6896,5270,5281,1930,5087,5090,5097] 
set surface_color,  pcol1, surf_pocket1 
set_color pcol2 = [0.278,0.376,0.702]
select surf_pocket2, protein and id [8811,7772,8826,8214,8722,8748,8749,8829,8830,7792,8838,8733,7633,7604,7606,8068,8070,8156,8162,8175,8168,7771,7791,8157,8832,8831,7852,8721,7586,7588,7591,8172,8174,8179,7589,8201] 
set surface_color,  pcol2, surf_pocket2 
set_color pcol3 = [0.361,0.392,0.902]
select surf_pocket3, protein and id [5703,5771,5966,332,5743,5965,5999,6001,4496,4497,5959,5964,5976,5977,5988,5713,6238,6241,5701,6243,6245,6244,5702,4483] 
set surface_color,  pcol3, surf_pocket3 
set_color pcol4 = [0.329,0.278,0.702]
select surf_pocket4, protein and id [2818,2820,6433,6434,6435,2180,2181,6745,6740,6742,6738,6741,8074,8076,8086,8094,8095,7454,7461,7479,6732,8077,8078,8081,6712,7890,7888,6432,6437,6441,6444,7915,6439,6470,6708,6707,7880,7885,7883,7858,7886,7913,7918,8072,8085,8082] 
set surface_color,  pcol4, surf_pocket4 
set_color pcol5 = [0.514,0.361,0.902]
select surf_pocket5, protein and id [9753,9745,9062,9165,9168,9170,9140,9137,9139,9719,9721,9722,11593,11590,11544,11550,11551,11567,11565,9098,9100,9101,9116] 
set surface_color,  pcol5, surf_pocket5 
set_color pcol6 = [0.471,0.278,0.702]
select surf_pocket6, protein and id [2162,2163,2168,2167,2752,2755,2757,2758,2746,2748,2749,2750,2751,2776,2767,6693,6695,2158,2161,6401,6685,2131,2133,2165,2146,2954,2667,6390,6395,6398,6394,2102,2108,2105,2099,2638,6410,6408,6409] 
set surface_color,  pcol6, surf_pocket6 
set_color pcol7 = [0.698,0.361,0.902]
select surf_pocket7, protein and id [8680,8883,8967,8885,8641,8644,8665,8672,8987,8989,8992,8899,8950,9531,8646,9566,9704,9529,8952,8968,9705] 
set surface_color,  pcol7, surf_pocket7 
set_color pcol8 = [0.616,0.278,0.702]
select surf_pocket8, protein and id [10663,10667,10178,10172,10174,10334,10336,10337,10338,10560,10566,10556,10196,10198,10132,10173,10175] 
set surface_color,  pcol8, surf_pocket8 
set_color pcol9 = [0.886,0.361,0.902]
select surf_pocket9, protein and id [2970,2360,2361,2732,2939,2734,7705,2682,2920,2921,2704,7720] 
set surface_color,  pcol9, surf_pocket9 
set_color pcol10 = [0.702,0.278,0.639]
select surf_pocket10, protein and id [8793,8777,8779,8791,8792,8048,8049,8050,8763,8761,8180,2851,2852,2853,2863,2864,8055,8039,8044,8051,8186,8187,8188] 
set surface_color,  pcol10, surf_pocket10 
set_color pcol11 = [0.902,0.361,0.729]
select surf_pocket11, protein and id [883,885,886,876,877,881,887,882,884,7985,7988,873,863,875,7983,7996,9317] 
set surface_color,  pcol11, surf_pocket11 
set_color pcol12 = [0.702,0.278,0.494]
select surf_pocket12, protein and id [9158,9160,9161,8555,8557,8558,8559,8560,8561,8562,8519,8522,8523,8521,8572,8525,8527,9185,9189] 
set surface_color,  pcol12, surf_pocket12 
set_color pcol13 = [0.902,0.361,0.545]
select surf_pocket13, protein and id [5998,6043,6011,6012,6041,6044,6076,4808,4813,4815,5993,5445,5468,5459,5460,5443,4793,4837,6275,6270,4838,4825,5442,4822,6286,6288] 
set surface_color,  pcol13, surf_pocket13 
set_color pcol14 = [0.702,0.278,0.353]
select surf_pocket14, protein and id [8688,8853,8837,8851,8852,7853,7814,7792,8838,7604,7606,7607,7615,7618,7610,7825,7805,7809,7807,7808] 
set surface_color,  pcol14, surf_pocket14 
set_color pcol15 = [0.902,0.361,0.361]
select surf_pocket15, protein and id [6443,7948,6414,6416,6417,6444,6407,2194,2196,2192,883,885,886,6418,6183,6454,6386] 
set surface_color,  pcol15, surf_pocket15 
set_color pcol16 = [0.702,0.353,0.278]
select surf_pocket16, protein and id [8688,8908,8836,8837,8851,8684,8732,8838,8733,8709,9843,8708] 
set surface_color,  pcol16, surf_pocket16 
set_color pcol17 = [0.902,0.545,0.361]
select surf_pocket17, protein and id [9181,11278,11279,9188,9150,11962,11964,11966,11259,11131,9216,9215,11130] 
set surface_color,  pcol17, surf_pocket17 
set_color pcol18 = [0.702,0.494,0.278]
select surf_pocket18, protein and id [8163,8165,7749,7491,7492,7748,2699,8077,8078,7471] 
set surface_color,  pcol18, surf_pocket18 
set_color pcol19 = [0.902,0.729,0.361]
select surf_pocket19, protein and id [2576,2584,2617,2354,2927,2361,2945,2352,2947,2358,2357,2925,2931,2932,2933,2940,2551,2930,2657,2660] 
set surface_color,  pcol19, surf_pocket19 
set_color pcol20 = [0.702,0.639,0.278]
select surf_pocket20, protein and id [4495,5995,4492,316,359,5982,5986,4474,4514,5989] 
set surface_color,  pcol20, surf_pocket20 
set_color pcol21 = [0.886,0.902,0.361]
select surf_pocket21, protein and id [2204,908,910,2230,911,2197,2201,2801,2774,2783,918,920] 
set surface_color,  pcol21, surf_pocket21 
   

deselect

orient
