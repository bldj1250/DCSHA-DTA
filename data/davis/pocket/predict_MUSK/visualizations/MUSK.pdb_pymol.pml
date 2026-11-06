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

load "data/MUSK.pdb", protein
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

load "data/MUSK.pdb_points.pdb.gz", points
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
select surf_pocket1, protein and id [5813,2228,5140,5144,5776,5779,4522,5134,5112,5676,5677,5133,5768,4524,4525,4720,5120,5105,5107,5649,5657,5786,5761,5663,5765,5767] 
set surface_color,  pcol1, surf_pocket1 
set_color pcol2 = [0.365,0.278,0.702]
select surf_pocket2, protein and id [5920,5794,5797,4832,4833,5756,5757,4294,4831,5612,4263,4290,4292,5588,4241,5609,5593,5600,5620,5622,5624,4546,4557,4558,4874,4869,4871,5770,5662,5792,4254,4260,4256] 
set surface_color,  pcol2, surf_pocket2 
set_color pcol3 = [0.792,0.361,0.902]
select surf_pocket3, protein and id [1078,1062,1079,1061,1064,6419,6422,6424,6429,6432,6434,982,997,996,6269,6273,6292,6412,6418,6181,6216,6258,6263,6283,6290,6438,1048,1051,6214,1052,6239,6272,6274,6275,6236,6240,960,6361,6364,6407,6362] 
set surface_color,  pcol3, surf_pocket3 
set_color pcol4 = [0.702,0.278,0.533]
select surf_pocket4, protein and id [2234,2235,2236,1617,2237,2238,2239,5199,2204,2200,1022,2192,5810,1616,6276,6278,6280,1042,5160,6241,6242,6244,1599,2205,5835,6247,6248,6249,5815,5820,5842,5843,5844,5816] 
set surface_color,  pcol4, surf_pocket4 
set_color pcol5 = [0.902,0.361,0.361]
select surf_pocket5, protein and id [4168,6022,6339,6340,6020,6012,4167,4169,4198,4199,6010,5928,5943] 
set surface_color,  pcol5, surf_pocket5 
set_color pcol6 = [0.702,0.533,0.278]
select surf_pocket6, protein and id [2407,2960,2943,2944,2945,2946,2420,2409,2411,2357] 
set surface_color,  pcol6, surf_pocket6 
   

deselect

orient
