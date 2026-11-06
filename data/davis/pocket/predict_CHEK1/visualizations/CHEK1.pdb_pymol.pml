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

load "data/CHEK1.pdb", protein
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

load "data/CHEK1.pdb_points.pdb.gz", points
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
select surf_pocket1, protein and id [2719,2728,2731,2735,153,155,157,367,2725,2726,1345,389,390,391,417,1212,2713,1187,1188,1189,2732,1202,1203,1204,426,397,2751,2752,305,304] 
set surface_color,  pcol1, surf_pocket1 
set_color pcol2 = [0.416,0.278,0.702]
select surf_pocket2, protein and id [269,660,662,663,665,664,666,667,71,75,553,554,556,558,555,583,44,45,587,72,68,69,70,73] 
set surface_color,  pcol2, surf_pocket2 
set_color pcol3 = [0.902,0.361,0.878]
select surf_pocket3, protein and id [1370,2727,3575,3577,2729,3368,3346,3581,3583,3584,3586,3590,1369,3580,3582,3579,3383,1377,2722,2721,2723,2718,3380,3382,3384,2536,2538,2534,2537,1384,1385,1395,1365,1371,1073,1056,1058,1071,1072,1074,2736,2739,2740,2741,3389,3571,3568] 
set surface_color,  pcol3, surf_pocket3 
set_color pcol4 = [0.702,0.278,0.380]
select surf_pocket4, protein and id [135,3295,3427,109,112,115,3296,3271,2785,2787,103,2802,97,101,3442,3443,3444,3551,3552,3555,113,114,120] 
set surface_color,  pcol4, surf_pocket4 
set_color pcol5 = [0.902,0.620,0.361]
select surf_pocket5, protein and id [206,2780,194,2982,2820,2961,2805,2807,2813,2833,108,2818,261,693,696,706] 
set surface_color,  pcol5, surf_pocket5 
   

deselect

orient
