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

load "data/CSNK1E.pdb", protein
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

load "data/CSNK1E.pdb_points.pdb.gz", points
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
select surf_pocket1, protein and id [646,174,176,177,267,1070,1167,648,178,1163,629,285,652,659,697,3068,3069,3071,3072,3070,125,127,129,132,136,3109,139,1175,695,3105,3108,3110,3111,124,696,672,670,1042,1039,1040,1168,1051,3058,3057,3064,3059,3091] 
set surface_color,  pcol1, surf_pocket1 
set_color pcol2 = [0.490,0.278,0.702]
select surf_pocket2, protein and id [686,688,1638,687,1430,1042,1043,3125,1428,3108,3110,3111,3112,2543,2546,2575,1401,3121,3126,3131,3130,1415,1418,1712,722,723,724,758,2501,2498,2500,2505,3098] 
set surface_color,  pcol2, surf_pocket2 
set_color pcol3 = [0.902,0.361,0.682]
select surf_pocket3, protein and id [1401,3129,3131,3130,1759,2546,2570,2573,2574,2575,1829,1408,1411,1403,1406,1798,1801,1415,1418,1706,1708,1710,1413,1695,3125,1714,1788,1789,1787,2571,1757] 
set surface_color,  pcol3, surf_pocket3 
set_color pcol4 = [0.702,0.408,0.278]
select surf_pocket4, protein and id [1115,1116,1114,2371,2376,3001,665,2360,2362,2366,3026,3028,3029,2998,2995,2997,2999,3033,1082,1090,666,1074] 
set surface_color,  pcol4, surf_pocket4 
   

deselect

orient
