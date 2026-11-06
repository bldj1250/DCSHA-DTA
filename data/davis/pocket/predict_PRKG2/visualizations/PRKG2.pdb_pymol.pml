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

load "data/PRKG2.pdb", protein
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

load "data/PRKG2.pdb_points.pdb.gz", points
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
select surf_pocket1, protein and id [4018,4773,4775,4777,4778,4780,4782,4783,4784,4797,4800,4682,4776,932,935,3682,4317,4698,5980,4669,4670,4125,4126,4278,4293,4288,4292,973,968,970,971,4658,966,981,984,985,4805,4808,4809,4810,4641,960,986,3984,3985,3854,3855,3856,3870,4019,3716,4272,3737,3838,3694,3697,3698,3692,3688,3684,3734,3736,3687,3690,3992,3712,3705,3708,3710,3701,3714,3715,3982,3955,3956,3957] 
set surface_color,  pcol1, surf_pocket1 
set_color pcol2 = [0.302,0.278,0.702]
select surf_pocket2, protein and id [2385,2386,2350,2353,5090,5607,5615,5620,5057,5051,5055,2347,2349,4851,4852,4566,4565,4564,4572,4573,5648,5651,5645,5628,5641,5642,4577,5043,5047,2376,4854,4855,4853,2383,4860] 
set surface_color,  pcol2, surf_pocket2 
set_color pcol3 = [0.631,0.361,0.902]
select surf_pocket3, protein and id [1957,1939,1944,1714,1713,1923,1933,1848,1849,1837,1839,1847,1859,1567,1790,1850,1871,1868,1928,1858,1863,1865,1866,1778,1943,1833] 
set surface_color,  pcol3, surf_pocket3 
set_color pcol4 = [0.678,0.278,0.702]
select surf_pocket4, protein and id [1037,4823,4824,4901,4880,1097,1056,1078,1080,1085,1086,1088,1098,1006,2093,2094,2100,2106,2095,2105,2107,2130,2134,4840,4869,4877,4881,4894,4862,4859,4864,4883,4895,2127,4884,2165,1007,2099,4896,4829,1064,4835,4837,1036,1039] 
set surface_color,  pcol4, surf_pocket4 
set_color pcol5 = [0.902,0.361,0.682]
select surf_pocket5, protein and id [3657,6034,3726,6053,6055,3860,4246,4249,3862,3612,3614,3615,4201,4226,4227,4228,4230,6062,4216,3745] 
set surface_color,  pcol5, surf_pocket5 
set_color pcol6 = [0.702,0.278,0.341]
select surf_pocket6, protein and id [2858,2966,2676,2786,2787,2935,2879,2882,2868,2873,2875,2876,2878,2945,2778,2940,2946,2949,2950,2930,2838,2847,2849,2857,2801,2869] 
set surface_color,  pcol6, surf_pocket6 
set_color pcol7 = [0.902,0.522,0.361]
select surf_pocket7, protein and id [3462,3477,3478,3479,4134,4135,4155,3460,5824,5825,5828,4727,4728,4279,4281,4287,4760,4095,4097,4712,4714,4761,4710,4715,3511] 
set surface_color,  pcol7, surf_pocket7 
set_color pcol8 = [0.702,0.596,0.278]
select surf_pocket8, protein and id [4093,4545,4086,4100,4513,4542,5809,4517,4537,4541,5811,5812,4549,4551,4582,3411,4539,4099,4108,4110,5807,5810,3434,3407] 
set surface_color,  pcol8, surf_pocket8 
   

deselect

orient
