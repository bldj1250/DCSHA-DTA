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

load "data/ROCK1.pdb", protein
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

load "data/ROCK1.pdb_points.pdb.gz", points
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
select surf_pocket1, protein and id [727,724,726,672,1272,1273,837,1290,2981,2983,2985,1691,1690,1765,1295,853,854,1774,1770,1767,669,674,1663,1325,1664,1675,675,677,679,681,688] 
set surface_color,  pcol1, surf_pocket1 
set_color pcol2 = [0.329,0.278,0.702]
select surf_pocket2, protein and id [1652,1918,1675,1636,1651,956,1915,1790,1795,1913,1917,1919,704,706,707,695,697,688,689,692,871,854,975,977,1772,1773,1774,1788,1789,1787,971] 
set surface_color,  pcol2, surf_pocket2 
set_color pcol3 = [0.698,0.361,0.902]
select surf_pocket3, protein and id [9850,10572,10586,10587,9835,9650,9651,9652,9653,9654,9834,9665,9668,9669,9672,10388,10390,10369,10377,10378,10379,10380,10391,9713,10620,10622,10623,10585,10605,10624,9648,10554,10570,10604] 
set surface_color,  pcol3, surf_pocket3 
set_color pcol4 = [0.702,0.278,0.639]
select surf_pocket4, protein and id [10395,10397,10398,10217,10517,10210,10508,10530,10544,10545,10546,10520,10523,10524,10525,10381,10518,10095,10534,10379,10380] 
set surface_color,  pcol4, surf_pocket4 
set_color pcol5 = [0.902,0.361,0.545]
select surf_pocket5, protein and id [341,340,342,3087,3086,1207,300,3167,299,302,1203,314,298,1204,3090,3158] 
set surface_color,  pcol5, surf_pocket5 
set_color pcol6 = [0.702,0.353,0.278]
select surf_pocket6, protein and id [6976,6978,6974,2357,2023,1996,2301,2318,2327,2355,2324,2322,1995,2302,2328,2330] 
set surface_color,  pcol6, surf_pocket6 
set_color pcol7 = [0.902,0.729,0.361]
select surf_pocket7, protein and id [9642,9644,9867,10863,9613,9618,10573,10576,10598,10600,10862,10864,10857,10859,10861,10842,10843,10860,9625,9883,9885,9623,10833,10559,10562] 
set surface_color,  pcol7, surf_pocket7 
   

deselect

orient
