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

load "data/TNIK.pdb", protein
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

load "data/TNIK.pdb_points.pdb.gz", points
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
select surf_pocket1, protein and id [230,233,234,229,232,231,844,845,850,286,284,245,1343,1350,1351,1251,1266,1340,1342,830,1265,846,287,402,403,825,386,246,861,862,865,1239,868,870,892,855] 
set surface_color,  pcol1, surf_pocket1 
set_color pcol2 = [0.302,0.278,0.702]
select surf_pocket2, protein and id [8705,8707,10291,9936,10286,8713,8402,8404,8397,10384,10278,10284,10606,10608,10614,10618,10620,10616,10303,10295,10297,10299,8411,10625,10630,8723] 
set surface_color,  pcol2, surf_pocket2 
set_color pcol3 = [0.631,0.361,0.902]
select surf_pocket3, protein and id [8724,8705,8707,9161,9164,9163,9185,10291,9572,9936,10286,9573,9945,9951,9943,9947,9950,8703,8698,9186,9169,9183,9184,9151,9562,8723,9961,10303,10295,10297,10299,10302,9190] 
set surface_color,  pcol3, surf_pocket3 
set_color pcol4 = [0.678,0.278,0.702]
select surf_pocket4, protein and id [1591,1593,1654,1657,1638,1600,1487,1490,1491,1493,1201,1425,1429,1433,1434,1435,1383,1205,1494,1427,1546,1573,1572] 
set surface_color,  pcol4, surf_pocket4 
set_color pcol5 = [0.902,0.361,0.682]
select surf_pocket5, protein and id [695,4,7,183,184,332,333,172,1,5,668,173,367,368,369,670,671,672,673,667,669,366,329,330,331,356] 
set surface_color,  pcol5, surf_pocket5 
set_color pcol6 = [0.702,0.278,0.341]
select surf_pocket6, protein and id [9082,9036,8637,8665,8885,8927,8928,8636,8966,8668] 
set surface_color,  pcol6, surf_pocket6 
set_color pcol7 = [0.902,0.522,0.361]
select surf_pocket7, protein and id [8942,8943,8944,8432,8433,8434,8435,8437,8974,8970,8456,8550,8535,8536,8552,8973,8429,8431,8439,8947,8440] 
set surface_color,  pcol7, surf_pocket7 
set_color pcol8 = [0.702,0.596,0.278]
select surf_pocket8, protein and id [10541,10600,10532,10544,10534,8288,8289] 
set surface_color,  pcol8, surf_pocket8 
   

deselect

orient
