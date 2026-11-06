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

load "data/DYRK2.pdb", protein
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

load "data/DYRK2.pdb_points.pdb.gz", points
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
select surf_pocket1, protein and id [2855,2858,2859,602,603,2368,2739,2766,2352,2767,1710,1742,1761,1762,1740,2181,2327,1708,1869,2338,2340,2344,2343,2345,2863,2867,2865,2866,2018,2322,2860,1885,1886,1887,2321,2179,2318,2317,2319,618,619,1704,1705,2355,2362,2350] 
set surface_color,  pcol1, surf_pocket1 
set_color pcol2 = [0.490,0.278,0.702]
select surf_pocket2, protein and id [2710,2708,2709,2886,2888,2882,1954,1957,1959,1961,1990,1991,2966,2998,3007,1950,2982,2991,2964,601,584,586,1723,1726,1729,1731,1732,2727,3012,583,572,580,2867,2866,2880,2881,1887,2019,1735,1901,1740,1738] 
set surface_color,  pcol2, surf_pocket2 
set_color pcol3 = [0.902,0.361,0.682]
select surf_pocket3, protein and id [2385,2387,3289,3290,2384,2386,2389,592,594,3024,3032,3033,3034,580,3013,3016,576,578,3044,2740,2741,2742,3010,3012,586,3046,3031,3023] 
set surface_color,  pcol3, surf_pocket3 
set_color pcol4 = [0.702,0.408,0.278]
select surf_pocket4, protein and id [2231,1624,2230,2240,2228,1307,1309,1299,1644,1328,1319,1302,1304,1625] 
set surface_color,  pcol4, surf_pocket4 
   

deselect

orient
