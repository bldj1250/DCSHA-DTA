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

load "data/FGFR1.pdb", protein
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

load "data/FGFR1.pdb_points.pdb.gz", points
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
select surf_pocket1, protein and id [5026,5028,4396,4424,3767,3816,3818,3819,3760,3761,3762,3764,3765,4425,5009,5008,5021,5024,4868,4972,4974,4387,4896,4897,3983,3984,3967,4344,4366,4349,4370,4975,4977] 
set surface_color,  pcol1, surf_pocket1 
set_color pcol2 = [0.416,0.278,0.702]
select surf_pocket2, protein and id [5180,5069,5196,5464,5195,5471,4416,5073,5074,5076,5079,5182,5491,5462,5181,5515,5499,1731,5068,1716,1717,1718,5072,1588,1590,1591,1327] 
set surface_color,  pcol2, surf_pocket2 
set_color pcol3 = [0.902,0.361,0.878]
select surf_pocket3, protein and id [5245,5247,2231,2233,2235,2236,2237,2238,2239,5584,5586,2695,2701,2702,5549,5551,5552,5547,5548,5550,5545,2704,5235,5268,2218,2230,2227,2219] 
set surface_color,  pcol3, surf_pocket3 
set_color pcol4 = [0.702,0.278,0.380]
select surf_pocket4, protein and id [3559,4068,4069,3999,3576,3568,3572,3580,4294,4295,4297,4299,4303,4306,3565,3557,3558,3560,3535,3540,3543,3544] 
set surface_color,  pcol4, surf_pocket4 
set_color pcol5 = [0.902,0.620,0.361]
select surf_pocket5, protein and id [5552,5237,2704,5235,2705,5120,5268,5158,2702] 
set surface_color,  pcol5, surf_pocket5 
   

deselect

orient
