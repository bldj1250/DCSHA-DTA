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

load "data/PRKCE.pdb", protein
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

load "data/PRKCE.pdb_points.pdb.gz", points
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
select surf_pocket1, protein and id [3289,3273,3296,3427,3428,4353,4354,3429,3577,4358,4359,4373,4356,4360,3260,3261,3263,3267,3272,3253,3311,3312,3255,3265,5589,4351,4279,4253,4264,4280,3885,3889,5551,5549,5588,5586,3544,3546,3548,3549,3554,3578,3443,4381,4383,1269,1272,4223,3276,3279,3281,1273,4252,4255,4239,4240,1266,1251,1287,3522,3291,3292,4375,3695,3842,3836,3412,3837,3859,3854,3863,3257,3862,3865] 
set surface_color,  pcol1, surf_pocket1 
set_color pcol2 = [0.278,0.310,0.702]
select surf_pocket2, protein and id [1761,1760,1484,2068,1485,2067,1483,1488,1491,1735,1746,1494,2366,2352,1510,1513,2373,2374,2375,2368,1368,1661,1367,1486,2312,2318,2321,2233,2316,2232,2344,2229,2231,2214,2215,2216,2334,2336,2337,2307,2080,2079] 
set surface_color,  pcol2, surf_pocket2 
set_color pcol3 = [0.498,0.361,0.902]
select surf_pocket3, protein and id [196,197,189,218,1652,1654,1655,164,174,178,199,2280,2276,2277,2255,2117,2120,2102,2114,2258,2118,2087,2250,2252,229,2270,2259,2262,2265,2264,2163,2266,2269,1618,1619,1620,1447,1413,1422,1428,1408,2095,2097,2124,1462,1653,1668,2086,2085] 
set surface_color,  pcol3, surf_pocket3 
set_color pcol4 = [0.525,0.278,0.702]
select surf_pocket4, protein and id [4422,4436,4437,5125,5126,5113,5115,5161,5163,5164,5165,5210,5212,5159,5205,5202,4452,4623,4633,4622,4638,5116,4636,5114,4626,4629,4631,4632,4660,4414,4416,4418,4444,4420,4421,4605] 
set surface_color,  pcol4, surf_pocket4 
set_color pcol5 = [0.851,0.361,0.902]
select surf_pocket5, protein and id [1259,1256,1240,4527,4742,4501,4517,4235,1260,4238,3905,4256,4740,4741,1228,1230,1236,4803,4809,4782,4783,1263,4515,4516] 
set surface_color,  pcol5, surf_pocket5 
set_color pcol6 = [0.702,0.278,0.600]
select surf_pocket6, protein and id [689,690,281,305,460,667,669,670,680,682,730,206,208,280,215,207,183,695,210] 
set surface_color,  pcol6, surf_pocket6 
set_color pcol7 = [0.902,0.361,0.596]
select surf_pocket7, protein and id [3587,3586,5816,5818,3618,3589,3593,2836,2860,2893,2835,2867,2869] 
set surface_color,  pcol7, surf_pocket7 
set_color pcol8 = [0.702,0.278,0.325]
select surf_pocket8, protein and id [2418,1901,1903,1904,1906,2389,1754,2390,2462,2463,2496,2490,1750,1751,1902,1921,2486] 
set surface_color,  pcol8, surf_pocket8 
set_color pcol9 = [0.902,0.478,0.361]
select surf_pocket9, protein and id [4396,4398,4388,4215,3547,1288,1291,3541,1313,4473,4474,1308,1309,1310,3569,3537,4397] 
set surface_color,  pcol9, surf_pocket9 
set_color pcol10 = [0.702,0.510,0.278]
select surf_pocket10, protein and id [4100,4121,4124,5242,5243,4102,4104,5335,5329,5330,5369,5370,5371] 
set surface_color,  pcol10, surf_pocket10 
set_color pcol11 = [0.902,0.831,0.361]
select surf_pocket11, protein and id [212,213,1413,1432,1434,1435,1436,1439,177,200,203,178,199] 
set surface_color,  pcol11, surf_pocket11 
   

deselect

orient
