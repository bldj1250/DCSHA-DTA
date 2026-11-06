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

load "data/MET.pdb", protein
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

load "data/MET.pdb_points.pdb.gz", points
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
select surf_pocket1, protein and id [8680,8541,8484,8540,8480,8482,9562,9474,9472,9473,9556,9558,9553,9555,9061,9062,9085,9086,8681,8814,8664,8917,9037,9058,9096,9092,9446,8481,8486,8491,8493,9617,8501,8500,8528] 
set surface_color,  pcol1, surf_pocket1 
set_color pcol2 = [0.278,0.322,0.702]
select surf_pocket2, protein and id [9617,9423,9585,8501,8516,8517,8521,8525,8500,8518,8526,9616,9664,9667,9448,9460,9459,9594,9597,9595,9598,8681,8815,9561,9577,8695,8680,9562,9558,9559,9560] 
set surface_color,  pcol2, surf_pocket2 
set_color pcol3 = [0.467,0.361,0.902]
select surf_pocket3, protein and id [8219,8220,8225,8213,8215,8216,8217,8722,8687,8692,8999,9001,8996,8551,8550,8553,8447,8448,8450,9016,8976,8987,8993,8451,8452,8194,8195,8201,8698,8700,8200,8198,8199,8189,8701,8702,8697,8703,8181,8183,8534,8532,8211,8705] 
set surface_color,  pcol3, surf_pocket3 
set_color pcol4 = [0.490,0.278,0.702]
select surf_pocket4, protein and id [2567,2569,2571,2572,1987,1991,1992,2576,3889,3890,1423,418,931,419,3891,3895,3903,409,413,923,414,927,2559,1979,1984,1986,1988,1975,1417,1418,1416,3879] 
set surface_color,  pcol4, surf_pocket4 
set_color pcol5 = [0.792,0.361,0.902]
select surf_pocket5, protein and id [10663,10656,10660,10661,10681,10225,10228,10671,10666,10664,10078,10087,10254,10025,10249,9991,10240,10242,10246,10234,10226,10045,10016,10021,10022,10023,10024,9993] 
set surface_color,  pcol5, surf_pocket5 
set_color pcol6 = [0.702,0.278,0.659]
select surf_pocket6, protein and id [1057,896,700,699,680,1042,897,1055,1033,1041,1085,1101,1061,1064,768,775,777,678,769,771,782,1099,1249,1251,671] 
set surface_color,  pcol6, surf_pocket6 
set_color pcol7 = [0.902,0.361,0.682]
select surf_pocket7, protein and id [10615,10628,10260,10262,10264,9200,9204,9210,9216,10258,10034,10037,10016,10021,10022,10024,10030,10032,10033,9240,10632,10646,10644] 
set surface_color,  pcol7, surf_pocket7 
set_color pcol8 = [0.702,0.278,0.408]
select surf_pocket8, protein and id [3245,3244,3256,2237,3249,2043,3253,3254,3255,3324,3325,3327,2983,2309,2234,2329,2308,2310,3267] 
set surface_color,  pcol8, surf_pocket8 
set_color pcol9 = [0.902,0.361,0.361]
select surf_pocket9, protein and id [4166,4628,4630,4632,4636,4168,4644,4465,4626,4451,4280,4171,4276,4278,233,235,4160] 
set surface_color,  pcol9, surf_pocket9 
set_color pcol10 = [0.702,0.408,0.278]
select surf_pocket10, protein and id [4891,4895,4898,4910,240,239,4900,4179,4183,4184,4188,4180,4170,4211,4181,4721] 
set surface_color,  pcol10, surf_pocket10 
set_color pcol11 = [0.902,0.682,0.361]
select surf_pocket11, protein and id [4280,4174,4274,4276,4278,4292,4644,4465,4451,4442,4447,4437,4450,4453,4413] 
set surface_color,  pcol11, surf_pocket11 
set_color pcol12 = [0.702,0.659,0.278]
select surf_pocket12, protein and id [3050,3052,3059,3060,3062,3332,3344,3156,3157,3182,3184,3043,3045,3046,3188,3189,3190,3192,3206,3209,3219,3220,3167,3112,3328,3319,3311,3317] 
set surface_color,  pcol12, surf_pocket12 
   

deselect

orient
