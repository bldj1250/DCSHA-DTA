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

load "data/TIE1.pdb", protein
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

load "data/TIE1.pdb_points.pdb.gz", points
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
select surf_pocket1, protein and id [994,986,997,1000,239,911,912,914,2262,981,2255,2256,2258,2259,917,918,990,1001,2201,2209,2133,238,2378,2359,2360,2361,2254,2214,2278,2257,894,2204] 
set surface_color,  pcol1, surf_pocket1 
set_color pcol2 = [0.278,0.322,0.702]
select surf_pocket2, protein and id [6652,6715,6712,7652,7653,7655,7637,6487,6488,6489,6490,6464,7639,7660,7510,7661,6479,6483,6485,6714,6717,6476,6465,6468,6636,6641,6506,6633,6635,6748,6749,6751,6755,6757,6776,7638,6743,7654,7662] 
set surface_color,  pcol2, surf_pocket2 
set_color pcol3 = [0.467,0.361,0.902]
select surf_pocket3, protein and id [7560,7561,7562,7032,7027,7036,6505,6450,6618,7063,7057,6446,6447,7029,7031,6636,6506,6634,6635,7010,7635,7630,7632,7639,7547,7533,7066,6452,7637] 
set surface_color,  pcol3, surf_pocket3 
set_color pcol4 = [0.490,0.278,0.702]
select surf_pocket4, protein and id [6074,6075,6076,6078,6080,6723,6762,6071,6326,6329,6308,6307,6311,6784,6097,6760,6763,6934,6932,6933,6057,6977,6929,6976,6973,6726,6957] 
set surface_color,  pcol4, surf_pocket4 
set_color pcol5 = [0.792,0.361,0.902]
select surf_pocket5, protein and id [1809,1812,1838,1839,1807,169,171,172,175,177,180,181,186,2018,1810,1813,2170,1865,1864,857,2162,2164,2165,858,1871,1866,1869,1870,2016,1894,2013,2014,1857,1860,1825,1827,1828,1847,1852,2022,2021,1911,1902,2020,2019,2166] 
set surface_color,  pcol5, surf_pocket5 
set_color pcol6 = [0.702,0.278,0.659]
select surf_pocket6, protein and id [812,813,179,647,459,461,819,437,438,440,444,446,814,816,365,178,354,356,369,364] 
set surface_color,  pcol6, surf_pocket6 
set_color pcol7 = [0.902,0.361,0.682]
select surf_pocket7, protein and id [1021,1022,1024,2185,2192,2206,2371,2373,2374,2375,2352,2353,2378,993,1005,2201,1797,1786,2190,1784] 
set surface_color,  pcol7, surf_pocket7 
set_color pcol8 = [0.702,0.278,0.408]
select surf_pocket8, protein and id [6373,6941,6965,6643,6514,6410,6412,6413,6414,6415,6416,6417,6644,6986,6989] 
set surface_color,  pcol8, surf_pocket8 
set_color pcol9 = [0.902,0.361,0.361]
select surf_pocket9, protein and id [1759,1668,1763,1764,1665,1745,1667,1798,1801,1663,1647,1796,1762,1792,1790,1755,1756,1039,1038] 
set surface_color,  pcol9, surf_pocket9 
set_color pcol10 = [0.702,0.408,0.278]
select surf_pocket10, protein and id [1773,2386,1779,2344,2342,2574,2391,2575,1772,2564,2562,2565] 
set surface_color,  pcol10, surf_pocket10 
set_color pcol11 = [0.902,0.682,0.361]
select surf_pocket11, protein and id [3620,3538,3544,3956,3599,3559,3596,3598,3561,3529,3540,3786,3787,3788] 
set surface_color,  pcol11, surf_pocket11 
set_color pcol12 = [0.702,0.659,0.278]
select surf_pocket12, protein and id [8261,8263,8704,8709,8267,8272,8727,8056,8725,8026,8249,8711,8247] 
set surface_color,  pcol12, surf_pocket12 
   

deselect

orient
