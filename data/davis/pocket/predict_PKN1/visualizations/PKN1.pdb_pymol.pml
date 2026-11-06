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

load "data/PKN1.pdb", protein
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

load "data/PKN1.pdb_points.pdb.gz", points
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
select surf_pocket1, protein and id [5859,4798,4799,4802,4785,4842,4841,4777,4779,4784,7025,7027,4778,4781,5852,5855,5857,5858,5774,5850,5773,5223,5353,4944,5358,4960,4961,5734,3793,5758,3814,5746,5749,3788,5397,5401,5747,5394,5752,4791,3784,7065,7063] 
set surface_color,  pcol1, surf_pocket1 
set_color pcol2 = [0.278,0.298,0.702]
select surf_pocket2, protein and id [4819,4821,5052,5053,4817,5859,4799,4802,4975,5073,5075,5874,5872,5857,5858,4962,4961,5106,5049,5076,5077,5079,5082,5880,3810,3813,3814,3815,3826,3828,3835,3836,3838,5882,3848,4805] 
set surface_color,  pcol2, surf_pocket2 
set_color pcol3 = [0.533,0.361,0.902]
select surf_pocket3, protein and id [1689,1691,1692,1703,1702,3274,2437,2450,2451,3442,3272,3273,1657,2425,2429,1661,3028,3033,3270,3269,3258,3261,1695,1700,1731,1698,1741,3422,3424,3426,3035,3040,3041,3042,3291,3286,1690,1693,1732,1763,2443,2439,2441,4024] 
set surface_color,  pcol3, surf_pocket3 
set_color pcol4 = [0.565,0.278,0.702]
select surf_pocket4, protein and id [3895,4069,3893,3896,1843,1845,1914,4068,4070,1886,1890,3949,1810,3948,1809,1808,1833,4032,1832,1834,1838,3885,3897,1860,3900,3902,3903,3904] 
set surface_color,  pcol4, surf_pocket4 
set_color pcol5 = [0.902,0.361,0.878]
select surf_pocket5, protein and id [3782,6020,3767,3770,3771,3745,6335,6011,3739,3773,3752,6304,3740,6323,6363,6296,6310,6313,6324,6330,6318,6019,3794,3796,6009,3766,6279,6282,6018] 
set surface_color,  pcol5, surf_pocket5 
set_color pcol6 = [0.702,0.278,0.533]
select surf_pocket6, protein and id [1776,1795,1767,1748,1750,1751,2275,2277,2286,1714,1713,2028,2030,2061,2064,2029,2032,2007] 
set surface_color,  pcol6, surf_pocket6 
set_color pcol7 = [0.902,0.361,0.490]
select surf_pocket7, protein and id [769,3519,190,766,3520,3523,158,167,3184,3186,3646,759,2506,3679,3682,3659,3660,2501,119,122,163,2504,2505] 
set surface_color,  pcol7, surf_pocket7 
set_color pcol8 = [0.702,0.329,0.278]
select surf_pocket8, protein and id [4020,4017,4016,4018,3991,1762,4032,1761,1785,1758,1763,4058,3038,3040,3041,4062,1968,1964,1966,1967,4059] 
set surface_color,  pcol8, surf_pocket8 
set_color pcol9 = [0.902,0.620,0.361]
select surf_pocket9, protein and id [3317,3318,3319,3320,3322,2016,3377,1990,1991,1993,3000,3056,3001,3017,1992,3075,3315,3102,3327,3076,1959] 
set surface_color,  pcol9, surf_pocket9 
set_color pcol10 = [0.702,0.631,0.278]
select surf_pocket10, protein and id [7306,7309,7310,4616,4612,4628,5247,4619,7297] 
set surface_color,  pcol10, surf_pocket10 
   

deselect

orient
