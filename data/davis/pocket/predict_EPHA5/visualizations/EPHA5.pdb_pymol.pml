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

load "data/EPHA5.pdb", protein
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

load "data/EPHA5.pdb_points.pdb.gz", points
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
select surf_pocket1, protein and id [5477,5478,5670,5450,5671,6093,6094,5676,5693,5696,5697,5718,5719,5307,5308,5451,6175,6064,6188,6174,6169,6171,6173,6168,5725,5727,5722,6165,6167,5303,5306,5169,5171,5172,5300,5290,5116,5117,5121,5115,5119,5130,5122,5656,5654,5291,5688] 
set surface_color,  pcol1, surf_pocket1 
set_color pcol2 = [0.616,0.278,0.702]
select surf_pocket2, protein and id [6841,6845,6844,6846,7726,7727,7728,7729,6605,6856,7757,6637,6681,7764,7765,7736,6583,6611,6825,6609,6830,6832,6834,6835,6636,6638,6617,6612,5801,5802,5803,7718,6610,5805,6635] 
set surface_color,  pcol2, surf_pocket2 
set_color pcol3 = [0.902,0.361,0.361]
select surf_pocket3, protein and id [6675,6682,6637,6677,6679,6681,7764,7765,7766,7446,7458,7736,7739,6583,6611,6835,6636,6638,6841,6846,6674,6826] 
set surface_color,  pcol3, surf_pocket3 
   

deselect

orient
