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

load "data/ULK2.pdb", protein
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

load "data/ULK2.pdb_points.pdb.gz", points
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
select surf_pocket1, protein and id [690,1254,302,695,715,1106,712,707,709,716,125,177,123,174,176,1079,732,733,734,741,1107,731,122,126,127,129,1091,1259,1261,1263,1256,319] 
set surface_color,  pcol1, surf_pocket1 
set_color pcol2 = [0.278,0.278,0.702]
select surf_pocket2, protein and id [4770,4739,4742,4758,4759,4762,4737,4764,4769,4743,4750,7169,7170,7207,7208,7143,7173,7175,7176,6693,7174,7263,7172,7236,7237,7238,4738,7262,7271,4748,7235] 
set surface_color,  pcol2, surf_pocket2 
set_color pcol3 = [0.576,0.361,0.902]
select surf_pocket3, protein and id [4586,4587,4588,7758,7391,4590,7781,7778,7779,7780,7782,4583,4564,4565,4572,4576,4578,4581,4582,4580,4560,7442,7550,7416,7813,7815,4566,4567,7817,7787] 
set surface_color,  pcol3, surf_pocket3 
set_color pcol4 = [0.616,0.278,0.702]
select surf_pocket4, protein and id [151,162,334,319,452,1262,1263,418,421,417,1276,1277,1278,423,395,396,155,1288,1289,424,426] 
set surface_color,  pcol4, surf_pocket4 
set_color pcol5 = [0.902,0.361,0.792]
select surf_pocket5, protein and id [4657,4659,4636,4642,4650,7718,7719,4634,4635,4637,7756,7760,4585,4587,4589,4591,7758,7752,7754,4590,7339,7340,7342,7717,7367,7368] 
set surface_color,  pcol5, surf_pocket5 
set_color pcol6 = [0.702,0.278,0.447]
select surf_pocket6, protein and id [7336,7338,7340,7342,7717,7729,4653,4655,4654,4675,4677,4656,4658,7693,7691,7694,4657,4659,7719,4660] 
set surface_color,  pcol6, surf_pocket6 
set_color pcol7 = [0.902,0.361,0.361]
select surf_pocket7, protein and id [6725,6726,6746,6748,7074,7055,6727,6753,7082,7084,7109,4762,4763,7076,7052,7054] 
set surface_color,  pcol7, surf_pocket7 
set_color pcol8 = [0.702,0.447,0.278]
select surf_pocket8, protein and id [1381,1042,1387,2766,1287,1283,1394,1396,1280,1285,1281,421,422,1294,2767,2768] 
set surface_color,  pcol8, surf_pocket8 
set_color pcol9 = [0.902,0.792,0.361]
select surf_pocket9, protein and id [1526,1531,1337,1340,1530,984,985,986,2094,1534,1339,1541,1543,2082] 
set surface_color,  pcol9, surf_pocket9 
   

deselect

orient
