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

load "data/SRPK3.pdb", protein
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

load "data/SRPK3.pdb_points.pdb.gz", points
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
select surf_pocket1, protein and id [1676,3052,3054,3057,799,910,3060,1278,1649,1661,3061,603,604,605,607,599,600,601,658,661,617,618,619,621,647,797,798,634,638,781,1230,1236,1078,1254,660,1259,1248,1251,1252,593,594,595,597,1677] 
set surface_color,  pcol1, surf_pocket1 
set_color pcol2 = [0.329,0.278,0.702]
select surf_pocket2, protein and id [301,325,1873,1869,1871,1269,2920,296,2892,1303,1764,1765,2890,1784,1724,1725,1727,1819,1872,1818,581,586,593,594,595,598,1258,1246,1252,1257,1267,313,1268,323,324,1878,1876] 
set surface_color,  pcol2, surf_pocket2 
set_color pcol3 = [0.698,0.361,0.902]
select surf_pocket3, protein and id [634,854,812,852,636,638,640,637,639,641,849,647,798,911,3071,879,881,883,882,3080,3081,799,3060,3061,884,886,813] 
set surface_color,  pcol3, surf_pocket3 
set_color pcol4 = [0.702,0.278,0.639]
select surf_pocket4, protein and id [3477,3625,3627,3655,3656,3944,3945,3659,3662,3626,3950,3954,3994,3419,3993,4028] 
set surface_color,  pcol4, surf_pocket4 
set_color pcol5 = [0.902,0.361,0.545]
select surf_pocket5, protein and id [1648,1661,1620,1660,3061,3080,3081,638,640,641,1636,1637,3201] 
set surface_color,  pcol5, surf_pocket5 
set_color pcol6 = [0.702,0.353,0.278]
select surf_pocket6, protein and id [3477,3492,3625,3627,3629,3630,3628,3631,3655,3495,3496,3656,3926,3944,3945,3659,3662,3626,3650,3950,3994] 
set surface_color,  pcol6, surf_pocket6 
set_color pcol7 = [0.902,0.729,0.361]
select surf_pocket7, protein and id [3336,3326,3329,4261,4263,4265,4266,1517,1554,1541,1542,3328,1543,1546,4248,4259,3335] 
set surface_color,  pcol7, surf_pocket7 
   

deselect

orient
