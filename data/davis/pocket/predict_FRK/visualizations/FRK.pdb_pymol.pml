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

load "data/FRK.pdb", protein
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

load "data/FRK.pdb_points.pdb.gz", points
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
select surf_pocket1, protein and id [2992,2994,2120,2121,2122,2999,3000,3001,2117,2005,2007,2008,1949,1955,2899,2886,2885,2887,1956,1957,1959,1961,1963,1965,3023,1985,1989,1966,1992,2496,2500,2525,2526,2914,1953,1954,1950,2529,2532,2560,1951,2913,2346,2348,2477,2478,2105,2271,2462] 
set surface_color,  pcol1, surf_pocket1 
set_color pcol2 = [0.329,0.278,0.702]
select surf_pocket2, protein and id [2858,2860,2862,3026,3028,3029,3051,3185,3204,3052,3184,1987,1988,1977,1985,3074,1966,1969,2848,3179,3025,2898,2899,2886,2888,2887,2997,2998,2121,2122,3001] 
set surface_color,  pcol2, surf_pocket2 
set_color pcol3 = [0.698,0.361,0.902]
select surf_pocket3, protein and id [991,1008,3962,1188,2696,1018,1010,2330,2332,2721,2740,2742,2713,2714,2715,3964,3922,3925,3963,3965,981,990,2316,2317] 
set surface_color,  pcol3, surf_pocket3 
set_color pcol4 = [0.702,0.278,0.639]
select surf_pocket4, protein and id [2482,2487,2980,2981,2488,2492,2092,2319,2321,2322,1733,1734,1736,2378,2376,1723,1727,2959,2923,2502,2926,2958] 
set surface_color,  pcol4, surf_pocket4 
set_color pcol5 = [0.902,0.361,0.545]
select surf_pocket5, protein and id [1731,409,1698,1699,1700,1701,1696,397,837,857,964,966,973,974,955,963,910,912,985,989,1049,965,968,1714] 
set surface_color,  pcol5, surf_pocket5 
set_color pcol6 = [0.702,0.353,0.278]
select surf_pocket6, protein and id [3953,3993,3995,3989,3958,3961,3986,4002,2662,2690,2691,2693,2695,2661,2663,1006,1010,1032,1009,1008,1040,2696,2714] 
set surface_color,  pcol6, surf_pocket6 
set_color pcol7 = [0.902,0.729,0.361]
select surf_pocket7, protein and id [1734,1736,2378,1744,2086,2376,454,2094,451,1724,1730,414,419,425,434,852,2092] 
set surface_color,  pcol7, surf_pocket7 
   

deselect

orient
