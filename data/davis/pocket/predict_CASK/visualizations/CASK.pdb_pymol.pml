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

load "data/CASK.pdb", protein
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

load "data/CASK.pdb_points.pdb.gz", points
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
select surf_pocket1, protein and id [587,715,588,1180,1270,1271,585,1273,143,1181,1155,148,200,201,321,714,716,717,718,719,324,1166,1127,326,485,1274,1276,1277,1289,1290,1291,1292,187,325,1297,1298,724,745,744,740,743,759,309,712,146] 
set surface_color,  pcol1, surf_pocket1 
set_color pcol2 = [0.278,0.278,0.702]
select surf_pocket2, protein and id [2460,2774,2459,2431,2433,2434,2435,2436,2805,2806,2830,2833,1407,1423,1408,1435,1419,1421,1678,1679,1415,1424,2554,2552,2513,2524,2537,2438,2401,2404,2437,1157,1159,1160,1156,1158,1141,1142,1143,2405,1436,2374,2372,2392,2395,2794] 
set surface_color,  pcol2, surf_pocket2 
set_color pcol3 = [0.576,0.361,0.902]
select surf_pocket3, protein and id [326,1289,1290,1291,486,170,187,325,174,169,178,180,418,380,381,445,1297,419] 
set surface_color,  pcol3, surf_pocket3 
set_color pcol4 = [0.616,0.278,0.702]
select surf_pocket4, protein and id [1745,1746,2899,2898,1840,1779,1743,1711,1707,1702,1704,1706,1709,1839,1688,1698,1684,1815,2921,2923,2925,2926,2897,2919,2922,2837,2924,2858,2863,2867] 
set surface_color,  pcol4, surf_pocket4 
set_color pcol5 = [0.902,0.361,0.792]
select surf_pocket5, protein and id [3993,5000,4113,5022,3980,3984,5291,4111,4373,5019,5020,5023,5012,5014,5286,3964,3962,3966,3968,3971,3976,3977] 
set surface_color,  pcol5, surf_pocket5 
set_color pcol6 = [0.702,0.278,0.447]
select surf_pocket6, protein and id [2767,3069,3071,3073,3037,2427,2823,2451,2452,2797,2469,2476,2745,2766,3098,3062,3063,3065,3067,3059,3061,3034,3045] 
set surface_color,  pcol6, surf_pocket6 
set_color pcol7 = [0.902,0.361,0.361]
select surf_pocket7, protein and id [1669,2832,1704,1706,1838,1852,1855,1836,1676,1835,1684,1832,1882,1671,2857,2860,2858] 
set surface_color,  pcol7, surf_pocket7 
set_color pcol8 = [0.702,0.447,0.278]
select surf_pocket8, protein and id [7105,6784,7106,7347,7374,7324,4880,7080,6742,7373,6785,7346,7070,7092,5787,4876] 
set surface_color,  pcol8, surf_pocket8 
set_color pcol9 = [0.902,0.792,0.361]
select surf_pocket9, protein and id [5970,5973,5963,5966,5969,5974,5941,5939,5940,5948,5949,5950,5952,5957,5955,5962,5959,6658,6662,5926,5937,5938] 
set surface_color,  pcol9, surf_pocket9 
   

deselect

orient
