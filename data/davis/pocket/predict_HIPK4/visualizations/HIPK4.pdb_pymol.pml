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

load "data/HIPK4.pdb", protein
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

load "data/HIPK4.pdb_points.pdb.gz", points
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
select surf_pocket1, protein and id [189,301,303,130,133,188,134,149,129,131,135,136,137,729,728,726,288,305,166,304,1287,1291,1293,1153,1285,1286,1289,1141,779,1168,1169,579,734,747,727,1140] 
set surface_color,  pcol1, surf_pocket1 
set_color pcol2 = [0.302,0.278,0.702]
select surf_pocket2, protein and id [415,412,440,443,409,625,627,629,4511,4519,444,622,597,599,601,619,623,611,689,691,381,338,647,648,649,650,4480,4513,4520,416,383,418,419,4473,4475,4476,4477,4478,473,441,470,471,477,500,501,504] 
set surface_color,  pcol2, surf_pocket2 
set_color pcol3 = [0.631,0.361,0.902]
select surf_pocket3, protein and id [1143,1144,1145,1136,1488,1490,1475,1142,795,796,798,799,797,1456,1454,3787,3825,3788,3823,3806,3789,1477,1478,1688,1739,3808,3810,3811,3813,3809] 
set surface_color,  pcol3, surf_pocket3 
set_color pcol4 = [0.678,0.278,0.702]
select surf_pocket4, protein and id [4008,4020,4023,4025,4027,1395,1396,1418,1416,1323,1325,1363,1365,4045,1313,1319,1440,1366,1575,1576,1441,4019,4013,4017] 
set surface_color,  pcol4, surf_pocket4 
set_color pcol5 = [0.902,0.361,0.682]
select surf_pocket5, protein and id [3993,3995,3997,158,3991,167,168,169,402,4018,4017,361,364,4015,1110,1111,1112,1456,1129,1435,1436,1442,1426,1312,1314,1293] 
set surface_color,  pcol5, surf_pocket5 
set_color pcol6 = [0.702,0.278,0.341]
select surf_pocket6, protein and id [2777,2781,3211,3212,972,973,3192,3193,3195,3014,3013,3016,3105,3106,3121,3122,2778,2825,2826,1005,3049,974,3048] 
set surface_color,  pcol6, surf_pocket6 
set_color pcol7 = [0.902,0.522,0.361]
select surf_pocket7, protein and id [2414,2438,2429,2431,2460,1705,1706,2579,2391,2413,2545,2546,2547,2548,904,901,890,882,895,899] 
set surface_color,  pcol7, surf_pocket7 
set_color pcol8 = [0.702,0.596,0.278]
select surf_pocket8, protein and id [2832,2874,2875,2956,3171,3172,3173,2841,2986,3194,3196,3121,3122,2838,2871] 
set surface_color,  pcol8, surf_pocket8 
   

deselect

orient
