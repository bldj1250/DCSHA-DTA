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

load "data/YES.pdb", protein
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

load "data/YES.pdb_points.pdb.gz", points
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
select surf_pocket1, protein and id [3144,2248,2250,3223,3120,3122,2251,2198,16,18,2199,13,2204,2206,2211,2212,2586,2706,2585,3232,2584,3212,3214,3216,3143,3222,3,4,7,9,10,2238,2240,2357,2360,2234,2235,2236,2705,2727,2731,2344,2192,2193,2196,2197,35,2194,2711,2783,2757,2759,2751] 
set surface_color,  pcol1, surf_pocket1 
set_color pcol2 = [0.278,0.278,0.702]
select surf_pocket2, protein and id [3,8,9,3087,1,2,3091,3110,2220,3370,3392,3322,3324,3250,3248,3278,2412,2224,2228,2230,3242,3247,2403,2361,2362,2377,3245] 
set surface_color,  pcol2, surf_pocket2 
set_color pcol3 = [0.576,0.361,0.902]
select surf_pocket3, protein and id [2552,2555,2572,2969,2968,4112,4113,1255,1224,2563,1225,1228,1239,1242,1423,1248,1280,4145,4146,4147] 
set surface_color,  pcol3, surf_pocket3 
set_color pcol4 = [0.616,0.278,0.702]
select surf_pocket4, protein and id [3251,3292,3317,3319,3326,3275,3328,3330,3083,3253,3256,3456,3482,3483,3485,3079,3504,3077,3506,3507,3250,3332,3335,3342,3461,3384,3321,3324] 
set surface_color,  pcol4, surf_pocket4 
set_color pcol5 = [0.902,0.361,0.792]
select surf_pocket5, protein and id [3422,3423,3404,3406,3401,3734,3663,3676,3680,3681,2775,17,2811,3,9,10,5,3110,11,12,3365,3733,3370,3379,3387,3388,3389,3393] 
set surface_color,  pcol5, surf_pocket5 
set_color pcol6 = [0.702,0.278,0.447]
select surf_pocket6, protein and id [707,1198,1200,1983,1985,1991,1981,1223,1287,705,1072,2008,2006,1152,1184,1193,1138,1194,1196,694,695] 
set surface_color,  pcol6, surf_pocket6 
set_color pcol7 = [0.902,0.361,0.361]
select surf_pocket7, protein and id [728,749,752,1997,2000,2323,2011,2015,2614,2025,2329,1084,1087,723,2007,717,712,2019,732,2319,2324,2038,2046] 
set surface_color,  pcol7, surf_pocket7 
set_color pcol8 = [0.702,0.447,0.278]
select surf_pocket8, protein and id [4184,4171,4175,1581,1586,1590,1579,2917,1303,1247,1269,1264,1266,1267,4143,2920] 
set surface_color,  pcol8, surf_pocket8 
set_color pcol9 = [0.902,0.792,0.361]
select surf_pocket9, protein and id [2586,2706,2585,3232,2584,3212,3214,3216,3222,2705,2508,2691,3245,2357,2360] 
set surface_color,  pcol9, surf_pocket9 
   

deselect

orient
