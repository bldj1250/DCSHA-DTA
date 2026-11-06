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

load "data/PRKD2.pdb", protein
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

load "data/PRKD2.pdb_points.pdb.gz", points
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
select surf_pocket1, protein and id [2905,2907,4836,2896,5190,5191,5215,5202,5203,1333,1334,4243,4245,4248,5484,2901,4254,4251,4269,5330,5332,5334,5347,5360,5174,5357,5359,1225,5476,5477,2906,4238,4239,4241,4247,4285,4288,5326,5230,4287,5324,2925,4233,4232,2920,4811,4809,4810,5229,4267,4403,4405,4558,5327,5328,5333,5335,4586,4788,4235,4787,4807,4388] 
set surface_color,  pcol1, surf_pocket1 
set_color pcol2 = [0.278,0.298,0.702]
select surf_pocket2, protein and id [347,349,905,906,350,615,921,920,541,639,638,922,573,574,575,576,577,578,600,614,540] 
set surface_color,  pcol2, surf_pocket2 
set_color pcol3 = [0.533,0.361,0.902]
select surf_pocket3, protein and id [3771,3773,3796,3664,3737,3661,3663,3047,3768,3770,3032,3735,3731,3734,3800,3025,3028] 
set surface_color,  pcol3, surf_pocket3 
set_color pcol4 = [0.565,0.278,0.702]
select surf_pocket4, protein and id [6180,6236,6237,6183,6453,6454,6225,6311,5022,6242,6276,6278,6281,6230,6416,6422,6425,6411,6420] 
set surface_color,  pcol4, surf_pocket4 
set_color pcol5 = [0.902,0.361,0.878]
select surf_pocket5, protein and id [6296,6288,6580,6582,6293,6295,6564,6255,6258,6525,6643] 
set surface_color,  pcol5, surf_pocket5 
set_color pcol6 = [0.702,0.278,0.533]
select surf_pocket6, protein and id [2243,2366,1981,2262,2367,2368,2380,2381,2244,2245,2255,2264,2391,2097,2256,2407] 
set surface_color,  pcol6, surf_pocket6 
set_color pcol7 = [0.902,0.361,0.490]
select surf_pocket7, protein and id [6149,6152,6160,6140,6141,6143,6146,6132,6121,5074,5612,5105,5609,5640,5607,5601,5616] 
set surface_color,  pcol7, surf_pocket7 
set_color pcol8 = [0.702,0.329,0.278]
select surf_pocket8, protein and id [3878,4201,3885,3886,4748,3911,4300,4298,4297,1339,1360,1363,1361,1359,1368,1373] 
set surface_color,  pcol8, surf_pocket8 
set_color pcol9 = [0.902,0.620,0.361]
select surf_pocket9, protein and id [3641,3361,3363,3063,3064,3351,3354,3067,3083,3105,3104,3108,3120,3141] 
set surface_color,  pcol9, surf_pocket9 
set_color pcol10 = [0.702,0.631,0.278]
select surf_pocket10, protein and id [1411,1414,1416,1281,1283,1294,1034,1035,1443,1402,1403,1404,1401] 
set surface_color,  pcol10, surf_pocket10 
   

deselect

orient
