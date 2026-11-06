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

load "data/MAP3K4.pdb", protein
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

load "data/MAP3K4.pdb_points.pdb.gz", points
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
select surf_pocket1, protein and id [10698,10700,10757,10759,10760,10702,10854,11283,11277,10871,10872,11671,11766,11762,11332,11304,11300,11690,11303,11324,11686,11688,11295,11297,11663,11689,10699,10704] 
set surface_color,  pcol1, surf_pocket1 
set_color pcol2 = [0.278,0.349,0.702]
select surf_pocket2, protein and id [6301,6337,8174,8177,8082,8084,8085,8086,8087,8088,8089,8118,8175,8052,8047,8049,8050,6206,8115,8117,8156,8102,8083,8186,8058,8068,8173] 
set surface_color,  pcol2, surf_pocket2 
set_color pcol3 = [0.404,0.361,0.902]
select surf_pocket3, protein and id [10889,11032,11030,11001,11019,11024,11779,11781,11258,11259,11147,11149,11057,11059,11018,11025,10871,10872,11765,11771,11778,11770,10870,11277,11278,11774,11776,11128,11145,10732] 
set surface_color,  pcol3, surf_pocket3 
set_color pcol4 = [0.416,0.278,0.702]
select surf_pocket4, protein and id [4552,4561,4562,4554,5298,4573,4549,4551,4575,4578,4677,4658,4659,4656,5338,5340,5342,4650,5271,4649,4651,5306,5299,5302,5292,5294,5300,5335,5337,5339,5341,5269,5293] 
set surface_color,  pcol4, surf_pocket4 
set_color pcol5 = [0.663,0.361,0.902]
select surf_pocket5, protein and id [2936,2970,2963,2899,2971,2252,2256,2217,2188,2222,2223,2229,2225,2220,2908,2909,609,624,619,623,2025,2027,2028,2056,2060,2068,2067,2190] 
set surface_color,  pcol5, surf_pocket5 
set_color pcol6 = [0.616,0.278,0.702]
select surf_pocket6, protein and id [10669,10652,10653,11183,11249,11251,10457,10459,10464,10465,10470,10469,10454,10666,10673,10881,11231,10451,10452,10453,10670,11199,11198,11200,11201] 
set surface_color,  pcol6, surf_pocket6 
set_color pcol7 = [0.902,0.361,0.878]
select surf_pocket7, protein and id [3335,3914,3342,3341,3349,3353,4910,4928,4931,5455,5453,4932,4935,4965,4908,4166,4168,4898,4900,4904,4905] 
set surface_color,  pcol7, surf_pocket7 
set_color pcol8 = [0.702,0.278,0.584]
select surf_pocket8, protein and id [7516,7517,7523,7511,6663,6689,7310,6660,7218,7221,7248,7308,7304,7288,7202,7207,7222] 
set surface_color,  pcol8, surf_pocket8 
set_color pcol9 = [0.902,0.361,0.620]
select surf_pocket9, protein and id [5021,5022,5023,3950,3951,4992,4148,5000,4146,4932,4935,4966,4985,4989,4990,5460,5459,5461,5462,5483,3922,4960,4962,4963,4164,4166,4143,4144] 
set surface_color,  pcol9, surf_pocket9 
set_color pcol10 = [0.702,0.278,0.380]
select surf_pocket10, protein and id [12624,11847,11564,11565,12075,12079,12082,11863,12071,12074,11568,12620,12622,12626,11545,12625,12609] 
set surface_color,  pcol10, surf_pocket10 
set_color pcol11 = [0.902,0.361,0.361]
select surf_pocket11, protein and id [9022,8757,8759,8991,8992,8993,1778,1754,1781,1788,1790,8756,8758,8684,8687] 
set surface_color,  pcol11, surf_pocket11 
set_color pcol12 = [0.702,0.380,0.278]
select surf_pocket12, protein and id [4432,5341,5374,5375,5376,4685,4684,5342,4551,4555,4556,4528,4530,4552,4677] 
set surface_color,  pcol12, surf_pocket12 
set_color pcol13 = [0.902,0.620,0.361]
select surf_pocket13, protein and id [7091,7069,7100,7101,7093,7068,5874,5881,4580,4582,5924,5926,5914,4583,4584,4568,4558,4560,4564,5882,7061,7063,7064,5911] 
set surface_color,  pcol13, surf_pocket13 
set_color pcol14 = [0.702,0.584,0.278]
select surf_pocket14, protein and id [11776,11777,11119,11145,11080,11056] 
set surface_color,  pcol14, surf_pocket14 
set_color pcol15 = [0.902,0.878,0.361]
select surf_pocket15, protein and id [7084,7071,7072,7082,5851,5852,5853,5880,6590,6553,6552,6582,6589] 
set surface_color,  pcol15, surf_pocket15 
   

deselect

orient
