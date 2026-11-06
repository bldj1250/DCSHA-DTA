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

load "data/ULK1.pdb", protein
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

load "data/ULK1.pdb_points.pdb.gz", points
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
select surf_pocket1, protein and id [4777,4779,4781,6349,6824,6320,6825,6348,6800,7651,7653,7674,7676,7677,7679,7680,6340,4780,6372,6338,4804,6803,6821,4786,4798,4803,6823,7686,7673,7675] 
set surface_color,  pcol1, surf_pocket1 
set_color pcol2 = [0.278,0.310,0.702]
select surf_pocket2, protein and id [224,210,221,223,171,758,169,749,732,344,754,209,359,360,361,731,174,176,168,173,178,186,1127,1155,1154,1139,1298,1299,1301,600,1296,1303,1304,1305,779,773,774,776] 
set surface_color,  pcol2, surf_pocket2 
set_color pcol3 = [0.498,0.361,0.902]
select surf_pocket3, protein and id [198,374,437,456,457,469,373,209,360,361,491,204,200,202,1329,1318,1319,1330,1303,1304,1305,1320,458,205,460] 
set surface_color,  pcol3, surf_pocket3 
set_color pcol4 = [0.525,0.278,0.702]
select surf_pocket4, protein and id [224,210,188,190,195,202,209,360,361,187,178,180,186,176,1115,1139,1114,1127,1330,1303,1304,1305,1298,1301,1296,1126] 
set surface_color,  pcol4, surf_pocket4 
set_color pcol5 = [0.851,0.361,0.902]
select surf_pocket5, protein and id [1395,1033,1372,1381,1378,1380,1570,1581,1567,1571,1569,1572,1573,2131,2133,2134,2127,2132,1032,1034,1026,1029,1583,2119,2124,1367,1363,1364,1058,1020,1051,1052,1025,997,1068] 
set surface_color,  pcol5, surf_pocket5 
set_color pcol6 = [0.702,0.278,0.600]
select surf_pocket6, protein and id [4779,4781,6349,6824,6320,6825,6848,6318,6288,6850,4788,4760,4762,6879,4767] 
set surface_color,  pcol6, surf_pocket6 
set_color pcol7 = [0.902,0.361,0.596]
select surf_pocket7, protein and id [1422,460,461,2773,1090,2770,2771,2772,1428,1435,1437,1327,1329,1325,1336,1340,204] 
set surface_color,  pcol7, surf_pocket7 
set_color pcol8 = [0.702,0.278,0.325]
select surf_pocket8, protein and id [4854,4856,4924,4853,4876,4913,4926,4927,4912,4877,4873,7267,7199,7200,7237,7266,7239,7203,7169,7170,7212,7214] 
set surface_color,  pcol8, surf_pocket8 
set_color pcol9 = [0.902,0.478,0.361]
select surf_pocket9, protein and id [4755,4758,6280,6339,6341,6337,6338,6335,7647,7649,7676,7677,7679,7680,4778,6340,4780,4756,6303,6304,4781,6309,6310] 
set surface_color,  pcol9, surf_pocket9 
set_color pcol10 = [0.702,0.510,0.278]
select surf_pocket10, protein and id [138,365,688,690,706,709,370,379,372,367,63,214,217,234,235] 
set surface_color,  pcol10, surf_pocket10 
set_color pcol11 = [0.902,0.831,0.361]
select surf_pocket11, protein and id [1686,934,975,1659,908,910] 
set surface_color,  pcol11, surf_pocket11 
   

deselect

orient
