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

load "data/DMPK2.pdb", protein
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

load "data/DMPK2.pdb_points.pdb.gz", points
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
select surf_pocket1, protein and id [10222,10224,10225,10226,10498,7689,7690,7466,7103,7105,7116,7118,7261,7262,10243,10452,10454,10231,10244,10247,10521,7138,7141,7691,7123,7266,7269,7258,7256,7263,7270,7273,7276,7260,7282,7259,7174,10227,10249,10250,10500,10504,7465,10511,10508,10512,10517,7687,10248] 
set surface_color,  pcol1, surf_pocket1 
set_color pcol2 = [0.278,0.298,0.702]
select surf_pocket2, protein and id [619,628,667,1728,1721,1724,1628,1616,953,786,1203,1204,1643,1642,1209,1225,1232,1719,1060,1061,1617,1257,770,666,2925,2927,2929,612,610,1220,1222,2930,614,615,617,609,2934,664] 
set surface_color,  pcol2, surf_pocket2 
set_color pcol3 = [0.533,0.361,0.902]
select surf_pocket3, protein and id [3031,3033,836,279,282,287,284,3090,3088,3098,3102,3103,254,256,257,1136,3111,3114,1135,1140,297,3052,3054,10938] 
set surface_color,  pcol3, surf_pocket3 
set_color pcol4 = [0.565,0.278,0.702]
select surf_pocket4, protein and id [10314,9993,9652,9659,9998,10001,10005,10315,10630,10011,10012,10007,9282,9650,8952,10629,10312,9288,9293,9295,9667,9671,9657,9663,9664,9682,9301] 
set surface_color,  pcol4, surf_pocket4 
set_color pcol5 = [0.902,0.361,0.878]
select surf_pocket5, protein and id [787,788,1727,1728,1726,1589,1628,1605,1874,954,804,650,651,785,621,628,629,667,635,647,632,644,646,637,648,630,1749,1587,1588,1860,1864,1862,1858,901,900,902,1868,1866] 
set surface_color,  pcol5, surf_pocket5 
set_color pcol6 = [0.702,0.278,0.533]
select surf_pocket6, protein and id [8784,8786,8878,8879,8880,8891,8759,8905,11027,11030,8893,8895,8897,8627,8761,8762,8763,8758,8605,8604,8595,5319,5354,5317,5318,5352,5262,5293,5294,5283,5289,5292,8914,8917,8594,10966,11047,11048,11049,11050,11051,11052,10988,5356,5357,5358,5359] 
set surface_color,  pcol6, surf_pocket6 
set_color pcol7 = [0.902,0.361,0.490]
select surf_pocket7, protein and id [117,993,994,1001,115,154,150,144,148,153,972,1003,965,3177,3179,3182,165,168,3167,172,3186,3204,3211,3214] 
set surface_color,  pcol7, surf_pocket7 
set_color pcol8 = [0.702,0.329,0.278]
select surf_pocket8, protein and id [2597,2614,2045,2602,2613,1513,1515,1514,2071,2034,2036,1521,1522,1526,1494,1495] 
set surface_color,  pcol8, surf_pocket8 
set_color pcol9 = [0.902,0.620,0.361]
select surf_pocket9, protein and id [10649,8509,10769,10847,10812,10787,10790,10335,10375,10637,10324,10636] 
set surface_color,  pcol9, surf_pocket9 
set_color pcol10 = [0.702,0.631,0.278]
select surf_pocket10, protein and id [11179,11180,11183,11216,11217,1139,480,455,478,479,278,280,251,255,245,246,247,11152] 
set surface_color,  pcol10, surf_pocket10 
   

deselect

orient
