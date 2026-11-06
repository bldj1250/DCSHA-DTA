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

load "data/LCK.pdb", protein
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

load "data/LCK.pdb_points.pdb.gz", points
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
select surf_pocket1, protein and id [2007,2013,2015,2017,2019,2012,2060,2063,2174,2177,2020,2578,2570,2573,2601,2576,2009,2062,2162,2171,2556,2541,2006,2010,2958,2957,3025,3027,3029,2394,2396,3035,2317,2506,2544,2521,2522,2548,3045,2395,2934,2942,3034,3036,3030,3058,2021,2543] 
set surface_color,  pcol1, surf_pocket1 
set_color pcol2 = [0.278,0.278,0.702]
select surf_pocket2, protein and id [2135,1886,2108,2110,2120,2142,2133,2134,2131,2132,1842,1846,2141,1824,571,578,580,581,1825,1820,1823,554,570,569,1830,1834,1847,1821] 
set surface_color,  pcol2, surf_pocket2 
set_color pcol3 = [0.576,0.361,0.902]
select surf_pocket3, protein and id [1121,1380,1384,2700,1374,1360,1361,1365,1086,2732,2733,1081,1092,2696,2730,2734,2702,2708,2709,2710,2697,4030,1386,1390,1055,1064,1084,1085,1083,3984,3992,3994,3995,3996,4003,4004,3968,3960,4008,2698,2727,3999] 
set surface_color,  pcol3, surf_pocket3 
set_color pcol4 = [0.616,0.278,0.702]
select surf_pocket4, protein and id [2042,2031,2043,3091,3087,3090,3032,3033,3063,3055,3060,3061,3064,2941,2901,2905,3193,3194,3196,3198,3205,3181,3183,3188,3195,3197,3179,3108] 
set surface_color,  pcol4, surf_pocket4 
set_color pcol5 = [0.902,0.361,0.792]
select surf_pocket5, protein and id [1009,1011,1106,1779,1781,1782,1806,1807,883,517,520,530,531,996,1004,1014,949,1017,951,954,950,521,966,972,1018,1105] 
set surface_color,  pcol5, surf_pocket5 
set_color pcol6 = [0.702,0.278,0.447]
select surf_pocket6, protein and id [3274,3145,3146,3148,3213,3128,3130,3140,3269,3299,3298,3193,3198,3191,3195,3197,3177,3318,3319,3132] 
set surface_color,  pcol6, surf_pocket6 
set_color pcol7 = [0.902,0.361,0.361]
select surf_pocket7, protein and id [2034,2036,2039,3089,3091,2221,2219,3055,3056,3059,3079,3082,2228,2193,2192] 
set surface_color,  pcol7, surf_pocket7 
set_color pcol8 = [0.702,0.447,0.278]
select surf_pocket8, protein and id [1042,1234,1044,1072,2780,2781,2782,3971,3972,3942] 
set surface_color,  pcol8, surf_pocket8 
set_color pcol9 = [0.902,0.792,0.361]
select surf_pocket9, protein and id [2592,2593,2629,3438,2930,3475,3480,2933,2924,2920,3235,3488,3492,3494,3487,3236] 
set surface_color,  pcol9, surf_pocket9 
   

deselect

orient
