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

load "data/EPHA8.pdb", protein
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

load "data/EPHA8.pdb_points.pdb.gz", points
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
select surf_pocket1, protein and id [5002,5018,5158,4977,4979,4981,4982,5578,6025,6027,6029,5934,5920,5928,4996,4998,4993,5159,4966,4968,4970,5017,4965,4967,4971,4972,5572,5523,5524,5329,5401,5154,5157,5948,5949,5328,5301,6019,6021,6022,6023,5141,5546,5549,5550] 
set surface_color,  pcol1, surf_pocket1 
set_color pcol2 = [0.302,0.278,0.702]
select surf_pocket2, protein and id [7115,7117,7149,7151,7231,7291,7293,7259,7261,7646,7264,7437,7677,7676,7433,7463,7436,7150,7161,7162,7127,7228,7438,7669,7300,7292,7702,7703,7128] 
set surface_color,  pcol2, surf_pocket2 
set_color pcol3 = [0.631,0.361,0.902]
select surf_pocket3, protein and id [6682,6478,6479,6480,6481,7581,7590,7593,6426,6674,6668,6524,6453,6454,6456,6448,6678,6676,6683,6685,6687,7320,7620,6686,7575,7580,7609,5656,5657,5658,6464,6466,7611,6461,7592,7306,7332,7335] 
set surface_color,  pcol3, surf_pocket3 
set_color pcol4 = [0.678,0.278,0.702]
select surf_pocket4, protein and id [1980,1998,1983,1907,1911,4935,4962,1747,5024,1972,1975,1909,1913,4941,1910,1912,1915,4936,4933] 
set surface_color,  pcol4, surf_pocket4 
set_color pcol5 = [0.902,0.361,0.682]
select surf_pocket5, protein and id [1495,1498,815,1491,1489,539,541,1486,552,1203,1205,830,1204] 
set surface_color,  pcol5, surf_pocket5 
set_color pcol6 = [0.702,0.278,0.341]
select surf_pocket6, protein and id [1495,1498,815,541,1203,1205,1278,1515,437,438,1277] 
set surface_color,  pcol6, surf_pocket6 
set_color pcol7 = [0.902,0.522,0.361]
select surf_pocket7, protein and id [1067,355,652,1112,1113,336,1069,633,1084,627,351,353,629,337,649,348] 
set surface_color,  pcol7, surf_pocket7 
set_color pcol8 = [0.702,0.596,0.278]
select surf_pocket8, protein and id [6521,6525,6668,6669,6519,6520,6524,6643,6502,6501,6540,6541,6512,6526,6529,6539,7335] 
set surface_color,  pcol8, surf_pocket8 
   

deselect

orient
