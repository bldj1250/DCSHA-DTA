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

load "data/TLK2.pdb", protein
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

load "data/TLK2.pdb_points.pdb.gz", points
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
select surf_pocket1, protein and id [3900,3901,3733,3734,3757,3773,3918,3919,4051,4048,4081,158,159,4945,157,156,171,173,162,4074,4077,4791,182,183,184,3748,150,151,4043,4047,4049,129,4041,4035,4040,3737,181,3741,4923,4920,4922,4924,4111,4937,4938,4939,4940,4774,4790,4810,4802,3902] 
set surface_color,  pcol1, surf_pocket1 
set_color pcol2 = [0.302,0.278,0.702]
select surf_pocket2, protein and id [4825,4916,4228,4376,3772,4393,3885,3716,3717,3713,4419,4397,4411,4826,3902,4370,4367,4810,4802,4915,4427,4920,4922,4924,3900,3901,3724,3733,3734,3757,3773,3720,3722,3719] 
set surface_color,  pcol2, surf_pocket2 
set_color pcol3 = [0.631,0.361,0.902]
select surf_pocket3, protein and id [5119,5120,5510,5508,5509,5145,5146,5446,5473,5491,4791,167,183,185,188,190,191,4482,4483,202,189,5395,5444,5477,4439,4441,4442,4443,4480,4789,4790,4797,4798,4799,4800,5156,5158] 
set surface_color,  pcol3, surf_pocket3 
set_color pcol4 = [0.678,0.278,0.702]
select surf_pocket4, protein and id [1109,1113,2107,2113,2144,1112,3809,3810,1142,1143,2118,2120,2108,3872,3874,2146,1108,1114,1115,1117,1119,1120,1110] 
set surface_color,  pcol4, surf_pocket4 
set_color pcol5 = [0.902,0.361,0.682]
select surf_pocket5, protein and id [2326,2319,2322,2323,2328,3478,3481,3482,2412,3488,3479,3483,3477,2272,2273,2274,2277,2312] 
set surface_color,  pcol5, surf_pocket5 
set_color pcol6 = [0.702,0.278,0.341]
select surf_pocket6, protein and id [5395,5477,5426,5478,4442,4469,4480,4471,4470,5446] 
set surface_color,  pcol6, surf_pocket6 
set_color pcol7 = [0.902,0.522,0.361]
select surf_pocket7, protein and id [4728,4974,4975,4993,4727,5015,5017,5020,5032,5286,5886,4688,4978] 
set surface_color,  pcol7, surf_pocket7 
set_color pcol8 = [0.702,0.596,0.278]
select surf_pocket8, protein and id [5194,5204,5197,5200,5202,5220,5543,5102,5129,5101,5097,5099] 
set surface_color,  pcol8, surf_pocket8 
   

deselect

orient
