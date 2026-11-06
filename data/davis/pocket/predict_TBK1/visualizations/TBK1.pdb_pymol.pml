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

load "data/TBK1.pdb", protein
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

load "data/TBK1.pdb_points.pdb.gz", points
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
select surf_pocket1, protein and id [1120,1244,168,1246,1249,1251,1252,1253,171,295,296,294,742,743,745,750,1112,1135,1136,119,117,118,123,124,125,127,136,718,722,726,706,278,700,701,122,121,170,1245,1110,1100,1101,131,129] 
set surface_color,  pcol1, surf_pocket1 
set_color pcol2 = [0.329,0.278,0.702]
select surf_pocket2, protein and id [2571,2573,3007,3008,2574,2555,3147,3407,3408,3420,3412,2557,2140,2142,876,2129,2135,2145,2127,2126,2123,2148,3462,3471,3474,3435,3437,3472,3141,3143,3438,3006,3009,2547,2549,3134,2554] 
set surface_color,  pcol2, surf_pocket2 
set_color pcol3 = [0.698,0.361,0.902]
select surf_pocket3, protein and id [1084,1394,1396,1272,1101,1404,1397,1388,1100,131,137,140,143,1120,1251,1252,1253,151,150,1250,1267,1268,1269,156] 
set surface_color,  pcol3, surf_pocket3 
set_color pcol4 = [0.702,0.278,0.639]
select surf_pocket4, protein and id [2100,2102,2104,2118,2105,1978,1980,1709,1712,2008,2055,1988,1991,1783,1754,1786,1747,1749,1990,2099,2087,2076] 
set surface_color,  pcol4, surf_pocket4 
set_color pcol5 = [0.902,0.361,0.545]
select surf_pocket5, protein and id [274,575,572,573,583,53,54,214,215,216,218,217,600,255,577,579] 
set surface_color,  pcol5, surf_pocket5 
set_color pcol6 = [0.702,0.353,0.278]
select surf_pocket6, protein and id [5352,5355,3872,5329,5358,5387,3941,3942,3900,5363,5331,5330,3870] 
set surface_color,  pcol6, surf_pocket6 
set_color pcol7 = [0.902,0.729,0.361]
select surf_pocket7, protein and id [667,353,311,665,355,419,450,407,412,309] 
set surface_color,  pcol7, surf_pocket7 
   

deselect

orient
