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

load "data/INSRR.pdb", protein
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

load "data/INSRR.pdb_points.pdb.gz", points
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
select surf_pocket1, protein and id [7674,7676,7681,8712,8713,7675,7679,7678,8711,8114,8255,8254,7694,7682,7686,7688,7876,7877,8233,7731,7732,8232,7860,8278,8281,8286,8288,8685,8693,8284,7878,8795,8797,8791,8790,8793] 
set surface_color,  pcol1, surf_pocket1 
set_color pcol2 = [0.278,0.298,0.702]
select surf_pocket2, protein and id [604,381,599,603,2080,2084,1875,202,203,1853,595,372,1886,1921,1888,1923,1925,1927,1951,1952,1953,1879,1869,1868,1865,1846,1851,1883,1964] 
set surface_color,  pcol2, surf_pocket2 
set_color pcol3 = [0.533,0.361,0.902]
select surf_pocket3, protein and id [9653,9641,9643,9645,9663,9646,9649,9657,9662,9898,9903,9104,9137,9115,9116,9925,9103,9105,9106,8591,8592,8593,8594,8568,8595,8597,9896,9895,8565,9823,9825,9877] 
set surface_color,  pcol3, surf_pocket3 
set_color pcol4 = [0.565,0.278,0.702]
select surf_pocket4, protein and id [1628,1631,1645,1647,1232,1231,1678,1679,1680,1681,1686,1691,1690,1039,1043,1787,1693,1792,1037,1634,1240,1646,1235,1636,1642] 
set surface_color,  pcol4, surf_pocket4 
set_color pcol5 = [0.902,0.361,0.878]
select surf_pocket5, protein and id [8819,8858,8899,8901,8688,8662,8818,8699,8841,8847,8854,7700,7702,8795,8797,8811,8812,8813,7713,7694,7695,7697,8870,7688,8685,8687] 
set surface_color,  pcol5, surf_pocket5 
set_color pcol6 = [0.702,0.278,0.533]
select surf_pocket6, protein and id [8318,8320,8321,8353,8747,8749,8750,8751,8752,8753,8754,9757,8429,8354,8475,8510,8511,8512,8499,8501,8448,8477,8478,8479,8435,8452,8474,8748] 
set surface_color,  pcol6, surf_pocket6 
set_color pcol7 = [0.902,0.361,0.490]
select surf_pocket7, protein and id [4131,4134,4135,2772,2969,2972,2976,4120,2979,4143,4144,2960,4179,4149,4187,2755,4177,4184,4185,2764,2767,2980,2756,2779,2748,2749,2750,4121] 
set surface_color,  pcol7, surf_pocket7 
set_color pcol8 = [0.702,0.329,0.278]
select surf_pocket8, protein and id [8247,8242,8776,8777,8724,8727,8741,8742,8743,8090,8091] 
set surface_color,  pcol8, surf_pocket8 
set_color pcol9 = [0.902,0.620,0.361]
select surf_pocket9, protein and id [5601,5602,870,872,5571,868,635,638,857,427] 
set surface_color,  pcol9, surf_pocket9 
set_color pcol10 = [0.702,0.631,0.278]
select surf_pocket10, protein and id [3689,3692,4543,3683,4555,4558,4549,3432,3435,3438,3440,3661,3652,3657,3658,3659,3660,3627,3694] 
set surface_color,  pcol10, surf_pocket10 
   

deselect

orient
