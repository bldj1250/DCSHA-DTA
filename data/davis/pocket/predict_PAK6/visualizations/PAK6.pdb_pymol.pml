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

load "data/PAK6.pdb", protein
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

load "data/PAK6.pdb_points.pdb.gz", points
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
select surf_pocket1, protein and id [4621,4622,4623,4550,4577,4579,4581,4593,878,883,908,794,842,814,3743,3745,4048,841,839,3772,781,784,4055,4056,4313,4346,4347,4329,4331,795,775,769,771,763,767,4649,885,888,3768,758,4321,788,4314] 
set surface_color,  pcol1, surf_pocket1 
set_color pcol2 = [0.365,0.278,0.702]
select surf_pocket2, protein and id [3117,3119,3167,3267,3699,3115,3118,3700,3701,3705,3685,3710,3713,3120,3121,3114,3116,3165,3168,799,802,803,4077,4078,3751,3729,3723,3726,3753,5200,5203,809,798,800,3752,4154,3282,3679,4161] 
set surface_color,  pcol2, surf_pocket2 
set_color pcol3 = [0.792,0.361,0.902]
select surf_pocket3, protein and id [758,759,4307,4298,4304,755,756,760,788,3140,3141,3142,4186,4188,4187,3349,3351,4314,3360,3355,3361,4293,4303] 
set surface_color,  pcol3, surf_pocket3 
set_color pcol4 = [0.702,0.278,0.533]
select surf_pocket4, protein and id [787,4158,4185,4160,4161,4175,4178,3142,3148,4187,3149,3284,3134] 
set surface_color,  pcol4, surf_pocket4 
set_color pcol5 = [0.902,0.361,0.361]
select surf_pocket5, protein and id [395,3405,3407,3408,3409,3411,3410,3412,2990,2956,3443,3381,364,365,3380] 
set surface_color,  pcol5, surf_pocket5 
set_color pcol6 = [0.702,0.533,0.278]
select surf_pocket6, protein and id [3283,3153,3149,787,4161,803,3134,3133,3168] 
set surface_color,  pcol6, surf_pocket6 
   

deselect

orient
