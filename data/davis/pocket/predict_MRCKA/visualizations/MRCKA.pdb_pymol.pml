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

load "data/MRCKA.pdb", protein
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

load "data/MRCKA.pdb_points.pdb.gz", points
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
select surf_pocket1, protein and id [8732,8733,8734,8373,8949,8951,8952,8953,8375,11872,11877,8434,8515,8516,8517,8518,8519,8380,8520,11606,11607,11608,11614,8533,8534,9752,8726,8950,8540,8564,8360,8362,8396,11630,11631,11632,11654,11627,11836,11626,11834,8395,8397,8973,11894,11898,9167,11888,11889,11885,8525,8527] 
set surface_color,  pcol1, surf_pocket1 
set_color pcol2 = [0.278,0.310,0.702]
select surf_pocket2, protein and id [3006,3009,1712,1789,1685,1696,1320,3011,1792,1794,1796,1798,739,742,855,856,1261,1264,1265,1020,1791,741,839,687,1281,1711,1270,1286,1293,1127,1128,689,684,685,3018] 
set surface_color,  pcol2, surf_pocket2 
set_color pcol3 = [0.498,0.361,0.902]
select surf_pocket3, protein and id [10996,11008,11704,11706,11692,11700,11703,12010,12011,12012,10595,12006,12009,12008,12018,10600,10977,10983,10990,10992,10586,10971,10975,11366,11373,10581,10960,11381,11385,11384,11708] 
set surface_color,  pcol3, surf_pocket3 
set_color pcol4 = [0.525,0.278,0.702]
select surf_pocket4, protein and id [12517,12555,12557,1206,3119,553,1204,12585,1202,3201,3204,1203,903,3203,313,314,342,344,345,346,3117,3140,312,310,311,316,317,323,322,3192,3188,3180] 
set surface_color,  pcol4, surf_pocket4 
set_color pcol5 = [0.851,0.361,0.902]
select surf_pocket5, protein and id [707,712,723,710,719,721,722,967,873,1812,1813,1819,1934,1936,1937,1938,1928,1930,1932,1796,1797,1798,1656,1673,856,857,704,705] 
set surface_color,  pcol5, surf_pocket5 
set_color pcol6 = [0.702,0.278,0.600]
select surf_pocket6, protein and id [1038,1040,1070,1036,1068,1069,176,1618,1620,1842,205,142,144,3241,1039,3235,996,998,233,3239,3240,232,3325,200,202,178,999] 
set surface_color,  pcol6, surf_pocket6 
set_color pcol7 = [0.902,0.361,0.596]
select surf_pocket7, protein and id [12264,12269,12526,12527,496,12534,12535,12252,12538,12456,495,12653,499,501,504,12498,12501,12497,12262,10082,12311,10106,10107,12310,10108,12244,12258,12246] 
set surface_color,  pcol7, surf_pocket7 
set_color pcol8 = [0.702,0.278,0.325]
select surf_pocket8, protein and id [10321,10360,10362,10364,10514,10515,10516,10365,10323,10324,10384,10381] 
set surface_color,  pcol8, surf_pocket8 
set_color pcol9 = [0.902,0.478,0.361]
select surf_pocket9, protein and id [1579,2106,2104,2107,2680,2698,2699,2685,1849,1575,1576,1589,1557,1879] 
set surface_color,  pcol9, surf_pocket9 
set_color pcol10 = [0.702,0.510,0.278]
select surf_pocket10, protein and id [1473,1477,2803,2804,2881,2883,2888,2806,2813,2856,2812] 
set surface_color,  pcol10, surf_pocket10 
set_color pcol11 = [0.902,0.831,0.361]
select surf_pocket11, protein and id [417,412,421,423,447,330,3171,3173,366,294] 
set surface_color,  pcol11, surf_pocket11 
   

deselect

orient
