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

load "data/PRKD3.pdb", protein
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

load "data/PRKD3.pdb_points.pdb.gz", points
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
select surf_pocket1, protein and id [5505,5506,5507,5518,5131,5132,5533,5634,5532,5114,5628,5630,5091,5092,4959,5111,4530,4537,4532,4585,4588,4536,4587,3150,3152,5140,3160,3161,5165,5123,5129,5130,4531,4534,4535,5115,4688,5121,1341,1334,1335,1336,1338,1340,4540,4544,4542,4546,4547,4548,4550,4553,4558,4704,4705,4706,5509,5636,5637,5638,5663,5664,5477,5493,5494,5780,5782,5783,5787,5788,5781,5795] 
set surface_color,  pcol1, surf_pocket1 
set_color pcol2 = [0.329,0.278,0.702]
select surf_pocket2, protein and id [696,697,699,698,700,701,461,735,657,659,660,694,723,1052,1053,1037,1047,1038,733,736,738,1054,798] 
set surface_color,  pcol2, surf_pocket2 
set_color pcol3 = [0.698,0.361,0.902]
select surf_pocket3, protein and id [3121,6096,3144,6097,5509,1337,1341,5799,5810,5812,6062,5787,5155,5156,3096,5507,5510,3143,3128,3129] 
set surface_color,  pcol3, surf_pocket3 
set_color pcol4 = [0.702,0.278,0.639]
select surf_pocket4, protein and id [4162,4173,4176,4156,4158,4160,4442,4440,4437,4487,5068,5052,5070,4172,4183] 
set surface_color,  pcol4, surf_pocket4 
set_color pcol5 = [0.902,0.361,0.545]
select surf_pocket5, protein and id [2366,2364,2096,2097,2383,2385,2496,2499,2501,2523,2502,2488,2486,2365,2507] 
set surface_color,  pcol5, surf_pocket5 
set_color pcol6 = [0.702,0.353,0.278]
select surf_pocket6, protein and id [6909,6912,6782,6784,6786,6964,6965,6942,6943,6917,6946] 
set surface_color,  pcol6, surf_pocket6 
set_color pcol7 = [0.902,0.729,0.361]
select surf_pocket7, protein and id [5918,5912,5917,5919,5921,5909,5911,6466,6477,6449,6458,6460,6463,5408,6469] 
set surface_color,  pcol7, surf_pocket7 
   

deselect

orient
