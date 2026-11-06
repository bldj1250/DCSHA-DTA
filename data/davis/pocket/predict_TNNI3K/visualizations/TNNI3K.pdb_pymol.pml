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

load "data/TNNI3K.pdb", protein
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

load "data/TNNI3K.pdb_points.pdb.gz", points
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
select surf_pocket1, protein and id [3679,3681,3723,3674,3677,3722,3822,4664,4665,3811,3812,4215,3813,4635,4636,4637,4638,4639,4640,4641,4264,4262,3668,3669,3670,3672,4287,4289,4241,4259,4256,4744,4748,4739,4741,3990,4742,4746,4747,3825,4214,3683,3684,3707,3692,3693,3696,3829,3704,3828,6344,6345,6347,4609,4624,4625,4648,4649,4915,4087,6321,6323,6324,6325,6326,6328,4769,3700,3702,4771,4749,4902] 
set surface_color,  pcol1, surf_pocket1 
set_color pcol2 = [0.416,0.278,0.702]
select surf_pocket2, protein and id [5271,5272,4949,4935,4932,5214,5215,5238,4640,4641,4282,4283,4915,6315,6321,6322,6324,6326,6332,6333] 
set surface_color,  pcol2, surf_pocket2 
set_color pcol3 = [0.902,0.361,0.878]
select surf_pocket3, protein and id [1290,161,185,187,196,1291,194,1049,1054,1056,1283,1279,1067] 
set surface_color,  pcol3, surf_pocket3 
set_color pcol4 = [0.702,0.278,0.380]
select surf_pocket4, protein and id [37,2701,2703,34,2656,3032,2394,2374,2669,2668,2705,2737,38] 
set surface_color,  pcol4, surf_pocket4 
set_color pcol5 = [0.902,0.620,0.361]
select surf_pocket5, protein and id [88,1895,1899,87,1833,1830,2160,2161] 
set surface_color,  pcol5, surf_pocket5 
   

deselect

orient
