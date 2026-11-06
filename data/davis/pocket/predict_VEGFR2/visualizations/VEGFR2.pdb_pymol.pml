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

load "data/VEGFR2.pdb", protein
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

load "data/VEGFR2.pdb_points.pdb.gz", points
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
select surf_pocket1, protein and id [8213,8212,6810,8207,8209,8211,8206,8223,8205,8203,8201,8128,7194,8127,7052,7191,6941,7154,7170,7175,7169,6940,7054,6974,6975,6663,6664,6605,6608,6661,7189,7190,7195,7201,8241,6634,6641,6809,6629,6637,6808,6793,6606,6609,6612,6614,6616,6618,6625,6611,6626,6645,8112,8098,7224,7227,7218,7221,7217,8247,8249,8252] 
set surface_color,  pcol1, surf_pocket1 
set_color pcol2 = [0.302,0.278,0.702]
select surf_pocket2, protein and id [7900,7902,7937,7938,7939,7940,7522,7523,9182,9185,7583,7927,7929,7931,9160,9162,7590,7560,7561,7558,7559,7562,7877,7880,8164,8165,8167,8156,7554,7584,7547,7033,7959,8175,9190,9192,9186,7867,7868,7869] 
set surface_color,  pcol2, surf_pocket2 
set_color pcol3 = [0.631,0.361,0.902]
select surf_pocket3, protein and id [6933,6410,6304,6314,6965,6967,6961,6966,6320,6321,6322,6989,6990,8017,6992,6993,6987,6929,6437,6954,6438,6399,6408,6397,6306,8028,8034,8036,8038] 
set surface_color,  pcol3, surf_pocket3 
set_color pcol4 = [0.678,0.278,0.702]
select surf_pocket4, protein and id [6279,6280,6282,6285,6286,8067,6294,6296,6298,6283,6273,8232,8233,8235,8063,8518,8514,8516,8236,8394,8387] 
set surface_color,  pcol4, surf_pocket4 
set_color pcol5 = [0.902,0.361,0.682]
select surf_pocket5, protein and id [3395,3396,4305,5079,5105,3414,3415,3416,4531,4543,5143,5144,5145,4318] 
set surface_color,  pcol5, surf_pocket5 
set_color pcol6 = [0.702,0.278,0.341]
select surf_pocket6, protein and id [8970,8975,8976,9144,9146,9148,9149,9150,9647,9670,8996,9000,9683,8936,8966,8937,9646,9112] 
set surface_color,  pcol6, surf_pocket6 
set_color pcol7 = [0.902,0.522,0.361]
select surf_pocket7, protein and id [8322,8297,8296,8097,8099,8100,8104,8308,8312,8424,8688,7280,7242,8643] 
set surface_color,  pcol7, surf_pocket7 
set_color pcol8 = [0.702,0.596,0.278]
select surf_pocket8, protein and id [8711,8576,9014,9015,9017,8855] 
set surface_color,  pcol8, surf_pocket8 
   

deselect

orient
