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

load "data/ZAP70.pdb", protein
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

load "data/ZAP70.pdb_points.pdb.gz", points
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
select surf_pocket1, protein and id [3301,3303,3304,2286,2290,2292,2294,3331,2716,2717,2719,2723,2711,2715,2763,2710,2714,2309,2323,2324,2299,3321,3657,3660,3661,2310,2275,2282,3769,3658,3672,3151,3686,3687,3294,3295,3285,3281,2713,2891,3280,3287,3288,3289,2725,2726,2764,2908,2909,2751,3635,3779,2746,2729,2732,2734,2735,3777,3263,3778] 
set surface_color,  pcol1, surf_pocket1 
set_color pcol2 = [0.278,0.322,0.702]
select surf_pocket2, protein and id [6,1,1168,1173,17,29,30,882,884,332,333,334,23,294,918,919,923,897,499,500,503,1826,336,338,354,1167,1169,1202,1863,517,8,1181,4790,523,532,4807,529,530,549,1175,1179] 
set surface_color,  pcol2, surf_pocket2 
set_color pcol3 = [0.467,0.361,0.902]
select surf_pocket3, protein and id [2743,2920,2924,2741,2925,3074,3040,3045,3794,3049,3248,3247,3075,3791,3784,3792,2907,3262,2909,2952,2929,2981,3011,3014,3013,3015,3016] 
set surface_color,  pcol3, surf_pocket3 
set_color pcol4 = [0.490,0.278,0.702]
select surf_pocket4, protein and id [978,980,1016,1854,1009,1267,1248,1245,1246,1259,1216,1855,1260,1007,1008] 
set surface_color,  pcol4, surf_pocket4 
set_color pcol5 = [0.792,0.361,0.902]
select surf_pocket5, protein and id [2585,2616,2804,2807,2610,2820,2651,2546,2504,2581,2542,2567,2568,2507,2821,2827,2584,2587,2602,2617] 
set surface_color,  pcol5, surf_pocket5 
set_color pcol6 = [0.702,0.278,0.659]
select surf_pocket6, protein and id [938,1009,942,1886,1888,1915,1917,1887,1854,1266,1267,1260,1852,1007,1008,966,970] 
set surface_color,  pcol6, surf_pocket6 
set_color pcol7 = [0.902,0.361,0.682]
select surf_pocket7, protein and id [4780,4489,4487,4488,4799,631,4800,654,47,49,50,622,58,4772,4470] 
set surface_color,  pcol7, surf_pocket7 
set_color pcol8 = [0.702,0.278,0.408]
select surf_pocket8, protein and id [1115,1119,1110,1112,4764,928,1140,1172,3,5,9,10,12,927,929,930,931,925,4766] 
set surface_color,  pcol8, surf_pocket8 
set_color pcol9 = [0.902,0.361,0.361]
select surf_pocket9, protein and id [3319,3322,3657,3659,3660,3661,4205,3983,4266,3984,4241,4246,4252,4258,4256] 
set surface_color,  pcol9, surf_pocket9 
set_color pcol10 = [0.702,0.408,0.278]
select surf_pocket10, protein and id [876,1898,879,1934,870,873,107,108,109,309,887,889,306,305,890,1798] 
set surface_color,  pcol10, surf_pocket10 
set_color pcol11 = [0.902,0.682,0.361]
select surf_pocket11, protein and id [3918,3939,3941,3943,4056,4058,3961,4025,4022,4028,4081] 
set surface_color,  pcol11, surf_pocket11 
set_color pcol12 = [0.702,0.659,0.278]
select surf_pocket12, protein and id [3802,2745,3924,3921,3946,3896,3913,3920,3945,3627,3882,3894,3928,3942,3898,3914,3885] 
set surface_color,  pcol12, surf_pocket12 
   

deselect

orient
