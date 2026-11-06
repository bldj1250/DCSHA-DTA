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

load "data/PRKD1.pdb", protein
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

load "data/PRKD1.pdb_points.pdb.gz", points
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
select surf_pocket1, protein and id [3128,4529,4528,3122,3123,3124,3129,4522,4524,4526,3130,5475,5500,5487,5488,5644,5476,5615,5617,5619,5459,1393,4530,4532,4535,4540,3132,3149,3150,5122,5113,5114,3135,4567,4570,5073,5074,5611,4941,5609,4519,4520,4569,4512,4513,4514,4518,4516,5515,4670,5514,5096,5093,4686,4687,4688,5612,5618,5097,5079,3127,3126,5491,5762,5768,5776,5769,5764,1274,1280,1283] 
set surface_color,  pcol1, surf_pocket1 
set_color pcol2 = [0.278,0.298,0.702]
select surf_pocket2, protein and id [659,660,661,562,587,654,657,720,722,957,972,966,969,361,363,956,646,586,639,619,620,621,623,622,624] 
set surface_color,  pcol2, surf_pocket2 
set_color pcol3 = [0.533,0.361,0.902]
select surf_pocket3, protein and id [4692,4696,4155,4482,4156,4169,4170,4466,4695,5034,1419,1420,1421,1423,1425,4563,4580,4582,4708,4712,4693] 
set surface_color,  pcol3, surf_pocket3 
set_color pcol4 = [0.565,0.278,0.702]
select surf_pocket4, protein and id [5307,6490,6719,6789,6760,6761,6762,6582,6584,6617,6728,6587,6487,6543,6544,6486,6532,6537,6549,6802] 
set surface_color,  pcol4, surf_pocket4 
set_color pcol5 = [0.902,0.361,0.878]
select surf_pocket5, protein and id [3872,3312,3301,3749,3339,3732,3733,3800,3869,3871,3874,3774] 
set surface_color,  pcol5, surf_pocket5 
set_color pcol6 = [0.702,0.278,0.533]
select surf_pocket6, protein and id [2340,2342,2319,2321,2334,2320,2441,2051,2443,2167,2456,2457,2451,2454] 
set surface_color,  pcol6, surf_pocket6 
set_color pcol7 = [0.902,0.361,0.490]
select surf_pocket7, protein and id [5904,6449,5892,5894,5928,6447,6452,5897,5900,5895,5386,5390,5391,6458,6466] 
set surface_color,  pcol7, surf_pocket7 
set_color pcol8 = [0.702,0.329,0.278]
select surf_pocket8, protein and id [1037,1039,1041,973,661,1056,1058,636,642,644,645,646] 
set surface_color,  pcol8, surf_pocket8 
set_color pcol9 = [0.902,0.620,0.361]
select surf_pocket9, protein and id [3497,3222,3422,3440,3442,3463,3475,3478,3419,3496] 
set surface_color,  pcol9, surf_pocket9 
set_color pcol10 = [0.702,0.631,0.278]
select surf_pocket10, protein and id [1353,1340,1478,1085,1473,1476,1463,1466,1465] 
set surface_color,  pcol10, surf_pocket10 
   

deselect

orient
