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

load "data/EPHB4.pdb", protein
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

load "data/EPHB4.pdb_points.pdb.gz", points
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
select surf_pocket1, protein and id [4941,5297,4944,4947,4948,4949,4813,4815,4816,4761,4763,4765,4758,4759,4760,5314,5315,5811,5813,4932,5711,5740,5741,5362,5365,5368,4931,5332,5334,5094,5093,5120,5817,5819,5820,5821,5814,5815,5299,5336,5339,5340,5361,5320,4774,4770,4772,4780] 
set surface_color,  pcol1, surf_pocket1 
set_color pcol2 = [0.329,0.278,0.702]
select surf_pocket2, protein and id [6340,6997,6999,7026,6336,6971,6962,6968,6972,6354,6355,6356,6383,6990,6991,6985,6987,6988,6989,6412,6414,6441,6487,6486,6457,6459,6945,6946,6453,6461] 
set surface_color,  pcol2, surf_pocket2 
set_color pcol3 = [0.698,0.361,0.902]
select surf_pocket3, protein and id [5265,5266,5267,5271,5274,5276,5277,5292,4955,1873,4953,4959,4961,4966,4974,4975,4970,4956,1707,1704,1705,4809,1708,1714,4730,1709,1712,1715,1872,5270,1877,1923,1925,1927] 
set surface_color,  pcol3, surf_pocket3 
set_color pcol4 = [0.702,0.278,0.639]
select surf_pocket4, protein and id [231,228,251,161,202,200,201,162,607,608,609,610,631,615] 
set surface_color,  pcol4, surf_pocket4 
set_color pcol5 = [0.902,0.361,0.545]
select surf_pocket5, protein and id [5713,5939,6044,6302,6287,6292,6298,5381,5385,5421,6043,5710,6250,5940] 
set surface_color,  pcol5, surf_pocket5 
set_color pcol6 = [0.702,0.353,0.278]
select surf_pocket6, protein and id [2053,2168,2169,2170,2174,2178,1613,1977,1982,1985,1974,1979,2143,2180,2181,1987,2024,2027,2050,2052] 
set surface_color,  pcol6, surf_pocket6 
set_color pcol7 = [0.902,0.729,0.361]
select surf_pocket7, protein and id [5178,5548,5767,5775,5780,5784,5785,5547,5517,5518,5519,5179,5542] 
set surface_color,  pcol7, surf_pocket7 
   

deselect

orient
