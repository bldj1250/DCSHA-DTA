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

load "data/FGFR4.pdb", protein
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

load "data/FGFR4.pdb_points.pdb.gz", points
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
select surf_pocket1, protein and id [3638,3639,3640,3644,3645,3694,3697,4219,3856,4220,3642,3696,3841,3853,3643,3646,3647,3658,3650,3657,4724,4265,3661,4831,4836,4850,4830,3858,4833,4835,4837,3985,4017,3674,3676,3952,4851,3951,3953,3957,3857,3960,3963,3986,4701,4965,4995,4964,4726,4727,4738,4853,4947,4852,4858,4860,4859,3664,3670,3671,3677,4978,3954,3956,3932,3666,4828,4100,4256,4752,4753,4240,4225,4236,4262,4259] 
set surface_color,  pcol1, surf_pocket1 
set_color pcol2 = [0.416,0.278,0.702]
select surf_pocket2, protein and id [5927,5929,5930,5931,5932,5933,5935,5290,5306,4348,5287,5289,5309,5313,5256,5337] 
set surface_color,  pcol2, surf_pocket2 
set_color pcol3 = [0.902,0.361,0.878]
select surf_pocket3, protein and id [5135,5137,4686,5009,4940,4689,4942,5008] 
set surface_color,  pcol3, surf_pocket3 
set_color pcol4 = [0.702,0.278,0.380]
select surf_pocket4, protein and id [5890,5893,4485,4487,5814,5516,5533,4488,4490,5815,5839] 
set surface_color,  pcol4, surf_pocket4 
set_color pcol5 = [0.902,0.620,0.361]
select surf_pocket5, protein and id [4182,4171,4173,4179,3873,3870,4175,3943,3464,3942,3482,3445,3446] 
set surface_color,  pcol5, surf_pocket5 
   

deselect

orient
