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

load "data/YANK3.pdb", protein
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

load "data/YANK3.pdb_points.pdb.gz", points
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
select surf_pocket1, protein and id [1876,1771,1869,1871,1873,1874,1875,1759,752,3019,3022,3025,3053,3054,1095,1128,1332,921,924,1349,925,926,798,800,801,745,747,749,744,743,1762,762,761,754,756,1204,1206,1786,1866,1867,1868,1371,1388,1391,1787,3017,3006,3008,3010,3016,1394,1396,1397,1398,1760,1757,1421,1425,1129,1205,1350,1355,908,1365,3005,1379] 
set surface_color,  pcol1, surf_pocket1 
set_color pcol2 = [0.329,0.278,0.702]
select surf_pocket2, protein and id [461,466,467,498,470,890,891,830,831,892,525,435,436,430,427,814,431,469,471,473,474,719,722,707,465,500,502] 
set surface_color,  pcol2, surf_pocket2 
set_color pcol3 = [0.698,0.361,0.902]
select surf_pocket3, protein and id [1309,3121,3133,3120,950,1308,3132,952,953,775,980,981,3122,783,784,936,791,793,759,782,785] 
set surface_color,  pcol3, surf_pocket3 
set_color pcol4 = [0.702,0.278,0.639]
select surf_pocket4, protein and id [616,3560,840,859,865,3518,3523,684,687,594,614,631,595,606,610,611,612,650,3502] 
set surface_color,  pcol4, surf_pocket4 
set_color pcol5 = [0.902,0.361,0.545]
select surf_pocket5, protein and id [1214,1356,1357,1363,1374,2901,2902,1799,1803,1176,1181,1179,2900,1352,1359] 
set surface_color,  pcol5, surf_pocket5 
set_color pcol6 = [0.702,0.353,0.278]
select surf_pocket6, protein and id [1892,780,1893,762,765,770,778,1894,1065,945,1096,925,926] 
set surface_color,  pcol6, surf_pocket6 
set_color pcol7 = [0.902,0.729,0.361]
select surf_pocket7, protein and id [1890,1901,1872,1771,1873,1874,1875,1759,1730,1731,1732,1747,1748,2012,1900,1902,1893] 
set surface_color,  pcol7, surf_pocket7 
   

deselect

orient
