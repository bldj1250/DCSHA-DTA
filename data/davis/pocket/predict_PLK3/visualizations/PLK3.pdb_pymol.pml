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

load "data/PLK3.pdb", protein
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

load "data/PLK3.pdb_points.pdb.gz", points
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
select surf_pocket1, protein and id [1154,498,502,1130,1132,1499,1500,1501,1509,1529,1531,1526,1527,1528,1530,1614,1615,1616,659,658,1609,508,510,529,1099,1082,1095,492,493,488,489,490,494,495,547,642,643,646,648,651,656,1076,545,932,1119,1121,1123,1488] 
set surface_color,  pcol1, surf_pocket1 
set_color pcol2 = [0.329,0.278,0.702]
select surf_pocket2, protein and id [4237,4611,4612,4251,3621,3622,3609,3613,3617,3615,3619,4547,4569,4592,4594,4595,4556,4590,4231,4228,4232,3598] 
set surface_color,  pcol2, surf_pocket2 
set_color pcol3 = [0.698,0.361,0.902]
select surf_pocket3, protein and id [508,509,510,511,512,515,529,522,1614,1615,1616,659,816,658,1629,791,547,782,783,1631,1630] 
set surface_color,  pcol3, surf_pocket3 
set_color pcol4 = [0.702,0.278,0.639]
select surf_pocket4, protein and id [3637,3653,3655,4402,4404,4406,4390,4394,4398,4403,4409,1188,1190,1191,2601,4418,1182,4415,3654,3811,3805,4407,3795,3797,3792,3789,3808,3806,3820,3821,4381] 
set surface_color,  pcol4, surf_pocket4 
set_color pcol5 = [0.902,0.361,0.545]
select surf_pocket5, protein and id [1493,1486,1487,1498,1490,1484,1177,1496,1144,1784,1797,1769,1795,1993,2032,2059] 
set surface_color,  pcol5, surf_pocket5 
set_color pcol6 = [0.702,0.353,0.278]
select surf_pocket6, protein and id [4728,4765,4713,4715,3492,4876,4774,4776] 
set surface_color,  pcol6, surf_pocket6 
set_color pcol7 = [0.902,0.729,0.361]
select surf_pocket7, protein and id [3649,4149,4151,4152,4154,4184,4186,3672,3682,3683,3646,3644,4188] 
set surface_color,  pcol7, surf_pocket7 
   

deselect

orient
