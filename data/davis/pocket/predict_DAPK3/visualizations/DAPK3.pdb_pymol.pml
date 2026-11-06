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

load "data/DAPK3.pdb", protein
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

load "data/DAPK3.pdb_points.pdb.gz", points
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
select surf_pocket1, protein and id [486,488,2635,2636,186,193,195,173,174,2673,2671,487,2631,2633,184,185,177,2564,2566,2605,2607,525,1332,1333,1334,1335,1340,1341,334,335,1317,1318,1319,485,1452,1454,1456,1181,1457,1458,1459,1460,1138,1139,1140,1467,1156,1157,1449,2595,2598,2604,2574,2576,2573,2570,354,452,453,200,483,383,189,197] 
set surface_color,  pcol1, surf_pocket1 
set_color pcol2 = [0.616,0.278,0.702]
select surf_pocket2, protein and id [333,1312,161,789,1196,1197,1307,1311,334,335,1313,1315,1317,1319,634,636,1310,772,788,791,169,164,167,213,216,158,159,171,1169,811,813,215,320,766] 
set surface_color,  pcol2, surf_pocket2 
set_color pcol3 = [0.902,0.361,0.361]
select surf_pocket3, protein and id [1535,1532,1537,1536,1821,1822,1473,1784,1787,1527,1525,1531,2621,2623,2599,2601,2620,2622,2625,2591,2624,2626,1529,1444,2662,1445] 
set surface_color,  pcol3, surf_pocket3 
   

deselect

orient
