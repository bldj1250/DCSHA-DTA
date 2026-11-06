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

load "data/DAPK1.pdb", protein
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

load "data/DAPK1.pdb_points.pdb.gz", points
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
select surf_pocket1, protein and id [8999,6119,6122,6136,9250,9252,6105,9380,6113,6422,6423,6123,6129,6130,6126,6128,9360,9386,9377,9378,9017,9020,8998,9000,9033,9034,9242,6416,6420,6424,6427,6430,8702,8276,9243,6132,8741,9251,6146,8715,9244,8695] 
set surface_color,  pcol1, surf_pocket1 
set_color pcol2 = [0.278,0.365,0.702]
select surf_pocket2, protein and id [9642,6482,6485,9043,6492,6494,6497,8069,8075,8077,8079,11188,11193,8065,11196,11198,11200,8086,8088,8080,8083,8085,8094,8095,11190,11158,11140,11151,11150,8087,9639,9641,9643,9644,9651,6481,9665,9074,8589,8590,8591,11139,8575,11142,11183,9624,8068] 
set surface_color,  pcol2, surf_pocket2 
set_color pcol3 = [0.361,0.361,0.902]
select surf_pocket3, protein and id [1307,1308,212,214,215,318,158,161,162,1303,1306,766,1189,783,333,331,332,760,628,627,779,782,785,164,163,804,1190,806,159,157,1174,1309,1311,1313,1314,1315,1162] 
set surface_color,  pcol3, surf_pocket3 
set_color pcol4 = [0.365,0.278,0.702]
select surf_pocket4, protein and id [8934,8941,8946,8947,8949,8951,8953,5903,5905,8954,8927,8919,8963,9718,9719,9876,9878,5902,9877,9896,8922,8921,8903,9717,9857,9374,5887,5890,5882,9394,9393,9398,5893,9373,9375] 
set surface_color,  pcol4, surf_pocket4 
set_color pcol5 = [0.576,0.361,0.902]
select surf_pocket5, protein and id [1133,1149,1150,177,1174,1313,1314,1315,452,453,1330,193,195,1336,1328,1329,1161,1166,351,197,200,174,173,524,333,332,186,175,189,1132,1468,1337,1338] 
set surface_color,  pcol5, surf_pocket5 
set_color pcol6 = [0.533,0.278,0.702]
select surf_pocket6, protein and id [9554,9559,9577,9709,9707,9550,9552,9526,11016,11037,9728,9731,9704,9729,8896,10115,11000,11014,11003,10998,11002,11022,9608,11030] 
set surface_color,  pcol6, surf_pocket6 
set_color pcol7 = [0.792,0.361,0.902]
select surf_pocket7, protein and id [6408,6422,6423,6116,6120,6130,6098,8982,9001,6119,6105,6725,6729,6731,5480,6099,5477] 
set surface_color,  pcol7, surf_pocket7 
set_color pcol8 = [0.702,0.278,0.702]
select surf_pocket8, protein and id [5497,5498,5523,6989,5508,5509,5488,5489,5490,6386,5513,5516,6229,6403,5484,5487,6220,6218] 
set surface_color,  pcol8, surf_pocket8 
set_color pcol9 = [0.902,0.361,0.792]
select surf_pocket9, protein and id [2807,2809,2810,2934,2582,2933,2930,2927,2549,2840,2880,2897,2898,2899,2920,2922,2924] 
set surface_color,  pcol9, surf_pocket9 
set_color pcol10 = [0.702,0.278,0.533]
select surf_pocket10, protein and id [6415,6227,6190,6223,6220,6222,6218,6188,6192,6412,6440,5484,5486,5487,6179,6180,6235,6226,6229,6403,5509,5488] 
set surface_color,  pcol10, surf_pocket10 
set_color pcol11 = [0.902,0.361,0.576]
select surf_pocket11, protein and id [9336,9351,9434,9435,8763,8765,8768,9841,9803,9824,9825,9826,9829,9835,9838,9800,9801,9802,9778,8795,9806,8789,9366,9418,9419,9839,8907,9831,9364] 
set surface_color,  pcol11, surf_pocket11 
set_color pcol12 = [0.702,0.278,0.365]
select surf_pocket12, protein and id [6986,6989,7001,7338,7343,7345,7346,5498,5520,5522,5523,5490] 
set surface_color,  pcol12, surf_pocket12 
set_color pcol13 = [0.902,0.361,0.361]
select surf_pocket13, protein and id [8366,8629,8643,8381,9153,9188,9131,9128,9120,9155] 
set surface_color,  pcol13, surf_pocket13 
set_color pcol14 = [0.702,0.365,0.278]
select surf_pocket14, protein and id [8944,10959,10960,8942,8943,9686,6787,6788,10301,9670,9679,9682,10302,10331,10335,10336,10338,10340,10341,10343,7247,10334,10364] 
set surface_color,  pcol14, surf_pocket14 
set_color pcol15 = [0.902,0.576,0.361]
select surf_pocket15, protein and id [2422,1165,2451,2452,2453,2454,1154,819,2420,2447,2426,2428,833,1483,1494,2424] 
set surface_color,  pcol15, surf_pocket15 
set_color pcol16 = [0.702,0.533,0.278]
select surf_pocket16, protein and id [6788,8945,7226,7228,7210,7213,7217,6760,8970,8965,8969,8964,8950,8958,8960,6758,8940] 
set surface_color,  pcol16, surf_pocket16 
set_color pcol17 = [0.902,0.792,0.361]
select surf_pocket17, protein and id [6680,6615,7014,7015,7018,7033,7103,7114,7105] 
set surface_color,  pcol17, surf_pocket17 
set_color pcol18 = [0.702,0.702,0.278]
select surf_pocket18, protein and id [4350,4297,4369,4309,4310,4120,4381,4384,4068,4067,4276,4280] 
set surface_color,  pcol18, surf_pocket18 
   

deselect

orient
