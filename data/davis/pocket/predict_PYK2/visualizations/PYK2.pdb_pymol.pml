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

load "data/PYK2.pdb", protein
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

load "data/PYK2.pdb_points.pdb.gz", points
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
select surf_pocket1, protein and id [4458,4470,4562,3484,3486,3482,3474,3475,3476,3480,3481,3479,4431,4584,4459,4719,4558,4560,4561,4583,4585,3818,4575,4576,4577,4578,4556,3682,3538,3680,3681,3478,3535,3537,3665,4045,4046,3503,3505,3508,3517,3515,3518,3783,3497,3500,3502,3504,3506,3507,3494,4711,4713,4714,4464,4107,4456,4102,4486,4096,4068,4552,4485,4051,4062,4555] 
set surface_color,  pcol1, surf_pocket1 
set_color pcol2 = [0.490,0.278,0.702]
select surf_pocket2, protein and id [835,814,865,924,937,925,2954,2800,2936,837,839,851,853,859,861,858,2953,2951,2941,2961,2935,2545,2547,2768,2770,2771,2795,2775,2772,2773,2774,2542,2546,801,810,2783,803] 
set surface_color,  pcol2, surf_pocket2 
set_color pcol3 = [0.902,0.361,0.682]
select surf_pocket3, protein and id [1322,2170,2171,2172,2173,724,822,1062,720,799,2141,2142,1295,2144,1100,2150,2152,2156,1321,1318,2158,2160,1372,2136,1362,1067,1286,1072,1075,1256] 
set surface_color,  pcol3, surf_pocket3 
set_color pcol4 = [0.702,0.408,0.278]
select surf_pocket4, protein and id [741,1313,1314,1321,1350,1351,724,739,1362,354,357,405,407,1044,1045,1025,1021,1022,1061] 
set surface_color,  pcol4, surf_pocket4 
   

deselect

orient
