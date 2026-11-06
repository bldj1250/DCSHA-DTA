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

load "data/RIPK4.pdb", protein
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

load "data/RIPK4.pdb_points.pdb.gz", points
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
select surf_pocket1, protein and id [215,263,217,218,261,212,213,264,222,211,220,221,664,1283,1285,1286,769,1201,1202,1178,768,1186,1289,386,774,1177,796,791,795,816,819,214,786,788,850,822,824,849,237,226,227,236,1291,1293,402,403,238,248] 
set surface_color,  pcol1, surf_pocket1 
set_color pcol2 = [0.416,0.278,0.702]
select surf_pocket2, protein and id [775,776,777,365,779,3570,3320,3322,359,360,357,3601,3600,3602,3362,631,1271,1270,778,783,3316,3318,3319,3324,3344,3349,3363,632,1249,1218,1214,1219,1222,3327,1231,1232,668,670,687,690,771,382,3590] 
set surface_color,  pcol2, surf_pocket2 
set_color pcol3 = [0.902,0.361,0.878]
select surf_pocket3, protein and id [4272,4540,4542,4793,4199,4445,4446,4198,4447,4273,4514,4516,4474,4470,4519,4455,4469,4471,4473,4443,4466,4468,4442,4444,4720,4775,4551,4536,4538,4543] 
set surface_color,  pcol3, surf_pocket3 
set_color pcol4 = [0.702,0.278,0.380]
select surf_pocket4, protein and id [968,971,927,994,2310,1003,964,966,967,1005,648,2308,2309,3044,2285,2287,997] 
set surface_color,  pcol4, surf_pocket4 
set_color pcol5 = [0.902,0.620,0.361]
select surf_pocket5, protein and id [4020,3954,3955,3956,3959,3960,3752,3999,4001,4019,3957,3935,3937] 
set surface_color,  pcol5, surf_pocket5 
   

deselect

orient
