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

load "data/MST1R.pdb", protein
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

load "data/MST1R.pdb_points.pdb.gz", points
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
select surf_pocket1, protein and id [3994,4455,4785,3991,3993,4287,4456,4285,282,263,265,268,4778,4780,4800,4782,4784,248,249,4304,4001,4002,4003,4004,4462,4463,5040,5041,4457,4502,4503,4036,4037,4040,4479,3606,3608,4010,4015,4008,3989,3995,3998,4272] 
set surface_color,  pcol1, surf_pocket1 
set_color pcol2 = [0.302,0.278,0.702]
select surf_pocket2, protein and id [9167,9194,9195,8809,8813,8804,8806,8781,8782,8803,9278,9280,8763,8757,8376,8775,8534,8389,8391,8392,8393,8394,8185,8244,8190,8243,8202,8186,8188,8783,9273,9274] 
set surface_color,  pcol2, surf_pocket2 
set_color pcol3 = [0.631,0.361,0.902]
select surf_pocket3, protein and id [3764,3768,1862,2442,1857,1858,1850,2434,3741,3749,3751,3756,3760,2426,1851,1853,1351,1352,3754,1355,3753,2435,2436,2441,3357,3370] 
set surface_color,  pcol3, surf_pocket3 
set_color pcol4 = [0.678,0.278,0.702]
select surf_pocket4, protein and id [3606,3608,4010,4012,4015,4033,3977,3979,4036,4040,4034,4042,260,262,266,263,265,268,3605,261,4504,3604,3613,295,3618,3624,3625,3629] 
set surface_color,  pcol4, surf_pocket4 
set_color pcol5 = [0.902,0.361,0.682]
select surf_pocket5, protein and id [1196,1180,1194,1179,794,796,792,795,797,1207,1210,1198,1036,828,829] 
set surface_color,  pcol5, surf_pocket5 
set_color pcol6 = [0.702,0.278,0.341]
select surf_pocket6, protein and id [1979,1981,1983,1985,1986,2965,1992,2962,2964,2966,2069,2951,3191,2948,2973,2975,2931] 
set surface_color,  pcol6, surf_pocket6 
set_color pcol7 = [0.902,0.522,0.361]
select surf_pocket7, protein and id [8225,9278,9279,9144,9181,9280,9173,9485,9170,9169,9467,9476,9482,9483,9465,9478,8226,7646,9466,9296,9180,9277,9301,9302,9293,9294] 
set surface_color,  pcol7, surf_pocket7 
set_color pcol8 = [0.702,0.596,0.278]
select surf_pocket8, protein and id [9462,9431,7601,9480,9495,9857,9859,9588,9559,9587,9590,9526,9562,9884] 
set surface_color,  pcol8, surf_pocket8 
   

deselect

orient
