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

load "data/TAOK3.pdb", protein
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

load "data/TAOK3.pdb_points.pdb.gz", points
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
select surf_pocket1, protein and id [2816,2819,913,1209,872,881,883,1207,1673,1233,914,915,1701,267,2835,2820,264,1312,1314,1198,1199,1200,1217,1308,1305,1307,1310,280,414,415,272,273,3555,3556,3557,3558,890,891,3498,3499,864,1232,852,243,245,244,859,853,849,287,257,250,413,296,298,299,826,827,246,248,397,1748,2821,1749,1713,1715,2812,3621,3622,3579,3580,3585,2798,2800,3584,3549,3586,3554] 
set surface_color,  pcol1, surf_pocket1 
set_color pcol2 = [0.302,0.278,0.702]
select surf_pocket2, protein and id [3680,2828,3646,3682,3683,3684,3671,3676,1777,3647,1767,1769,1774,2807,2806,2808,5589,5590,5591,5595,5596,5624,5626,5628,5629,5630,5632,5667,6603,5668,5671,6567,3698,3712,5593,5592,6655,6656,1784,1785,1781,1782,1783,1787,1773,1779,1788,1792,1786,3706,3700,3701,3702,3703,3738,6635,6626,6623,6629,6630,6632,6599,1771,1772,5603,5566,5565,2829,2813,2814,2815,3643,5660,5699,3607,3608,3609,3613,5656,5700,2842,1426,2834,3714,3715,2837,1517,1518,1395,1397,1398,1400,1392,1804,3751,3753,2854,3784,1515,1382,6653] 
set surface_color,  pcol2, surf_pocket2 
set_color pcol3 = [0.631,0.361,0.902]
select surf_pocket3, protein and id [1494,1514,1517,1518,1400,1496,1804,1839,1806,1807,1801,6661,1786,3706,5533,6659,1785,3745,5568,6719,1505,1848,1813,1815,6683,6684,6685,6680,6682,6686,6691,6693] 
set surface_color,  pcol3, surf_pocket3 
set_color pcol4 = [0.678,0.278,0.702]
select surf_pocket4, protein and id [1522,5469,5470,5471,3809,1526,5506,5468,5504,5493,5494,6726,6692,3769,3776,3773,3745,5534,5495,1525,3779,3781,3777,1524,6749] 
set surface_color,  pcol4, surf_pocket4 
set_color pcol5 = [0.902,0.361,0.682]
select surf_pocket5, protein and id [279,281,282,283,2848,499,510,544,2843,2847,3715,3713,2846,2834,2850,2856,478,3655,3658,3690,3653] 
set surface_color,  pcol5, surf_pocket5 
set_color pcol6 = [0.702,0.278,0.341]
select surf_pocket6, protein and id [7,776,777,522,30,31,32,526,47,446,448,450,764,527,749,484,487,493,494,517,519,520,521,524] 
set surface_color,  pcol6, surf_pocket6 
set_color pcol7 = [0.902,0.522,0.361]
select surf_pocket7, protein and id [1018,1041,1042,1044,1045,1067,1070,1284,1276,1017,2242,2245,2240,2285,2250,2277,2254,2260,1277,2257] 
set surface_color,  pcol7, surf_pocket7 
set_color pcol8 = [0.702,0.596,0.278]
select surf_pocket8, protein and id [1284,674,1275,1276,1278,1018,1041,1044,1045,1067,1277,1268,1270] 
set surface_color,  pcol8, surf_pocket8 
   

deselect

orient
