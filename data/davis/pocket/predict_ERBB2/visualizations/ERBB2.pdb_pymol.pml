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

load "data/ERBB2.pdb", protein
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

load "data/ERBB2.pdb_points.pdb.gz", points
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
select surf_pocket1, protein and id [6632,6554,6555,6540,6526,6165,6168,5585,6171,6173,6197,6193,5764,6119,6124,5763,5765,5628,5630,5631,5774,5777,5578,5579,5580,5586,6137,6140,6141,7789,5582,7788,7786,6637,6639,6640,6641,5781,5610,6633,5950,6118,5780] 
set surface_color,  pcol1, surf_pocket1 
set_color pcol2 = [0.278,0.349,0.702]
select surf_pocket2, protein and id [2280,2288,2313,2315,2299,2302,3536,3540,3748,3750,3751,3752,3542,3543,2228,2230,177,187,190,192,193,367,3337,3544,3553,179,431,182,183,178,3766,3763,2382,2381,3311,3313,3316,9358,2290] 
set surface_color,  pcol2, surf_pocket2 
set_color pcol3 = [0.404,0.361,0.902]
select surf_pocket3, protein and id [3118,3345,3348,2870,3133,3135,3138,3347,2869,3329,3115,3335,9326,9328,3349,9319,209,3356,9347,9331,9335,210,212,208,9314,244,248,9311,9313,9330,2694,2695,2697,9321,9323,3415,267,3355,3414,3357,3350,265] 
set surface_color,  pcol3, surf_pocket3 
set_color pcol4 = [0.416,0.278,0.702]
select surf_pocket4, protein and id [1948,1957,1958,2027,1357,9379,9380,9383,9385,9390,9392,9395,1144,1152,1155,1145,1372,1356,1371,1374,9388,9386,9425,9427,9429,6716,6718,6720,9422,6719,1946,1947] 
set surface_color,  pcol4, surf_pocket4 
set_color pcol5 = [0.663,0.361,0.902]
select surf_pocket5, protein and id [9347,9335,212,208,3329,3331,3335,9345,9358,824,442,825,3316,193,200,3357,3358,3360,202,9359,433] 
set surface_color,  pcol5, surf_pocket5 
set_color pcol6 = [0.616,0.278,0.702]
select surf_pocket6, protein and id [1926,1920,590,594,595,776,163,1995,1906,1996,1997,1935,1940,2011,1931,604,601,602,603,415,1975,1976,1977,2245] 
set surface_color,  pcol6, surf_pocket6 
set_color pcol7 = [0.902,0.361,0.878]
select surf_pocket7, protein and id [6148,6150,6151,6133,5752,6136,7894,7910,7825,7799,7801,7822,7875,7834] 
set surface_color,  pcol7, surf_pocket7 
set_color pcol8 = [0.702,0.278,0.584]
select surf_pocket8, protein and id [2388,2609,2821,2824,2826,2389,2636,2390,2393,2394,3102,2425,2593,2828,2612,2594,2644] 
set surface_color,  pcol8, surf_pocket8 
set_color pcol9 = [0.902,0.361,0.620]
select surf_pocket9, protein and id [2032,2039,2043,1968,2034,2036,2037,2038,2035,9404,9405,9407,2218,9400,9402] 
set surface_color,  pcol9, surf_pocket9 
set_color pcol10 = [0.702,0.278,0.380]
select surf_pocket10, protein and id [5523,5690,5324,5325,5694,5698,5697,5297,5299,5713,5320,5323,5470,5471,5474,5467,5490,5677,7942,7945,5321,5479,5711] 
set surface_color,  pcol10, surf_pocket10 
set_color pcol11 = [0.902,0.361,0.361]
select surf_pocket11, protein and id [2366,9351,9353,9368,2312,9350,9352,9375,9362,816,9364,9355,429,430,431,617,2232,2231] 
set surface_color,  pcol11, surf_pocket11 
set_color pcol12 = [0.702,0.380,0.278]
select surf_pocket12, protein and id [9609,9582,5598,5595,6540,6526,6528,6529,6638,6662,6503,5612,5613,5601,6641,5610] 
set surface_color,  pcol12, surf_pocket12 
set_color pcol13 = [0.902,0.620,0.361]
select surf_pocket13, protein and id [2388,2445,2609,2821,2824,2389,2636,3102,2379] 
set surface_color,  pcol13, surf_pocket13 
set_color pcol14 = [0.702,0.584,0.278]
select surf_pocket14, protein and id [180,2226,2228,2224,2243,2245,414,2238,164,162] 
set surface_color,  pcol14, surf_pocket14 
set_color pcol15 = [0.902,0.878,0.361]
select surf_pocket15, protein and id [7265,7415,7416,7417,7418,7226,7136,6847,6996,6824,7420] 
set surface_color,  pcol15, surf_pocket15 
   

deselect

orient
