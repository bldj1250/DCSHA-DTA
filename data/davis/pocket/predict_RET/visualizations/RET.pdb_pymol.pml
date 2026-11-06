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

load "data/RET.pdb", protein
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

load "data/RET.pdb_points.pdb.gz", points
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
select surf_pocket1, protein and id [6291,6867,6315,6318,6321,6323,6868,5696,5697,5698,5700,5701,5755,6147,6942,6288,6271,5890,6266,5757,5735,5905,5906,5907,6950,6951,5733,5734,5758,5737,5738,6944,6948,6849,6846,5736,5703,6838,6292] 
set surface_color,  pcol1, surf_pocket1 
set_color pcol2 = [0.278,0.278,0.702]
select surf_pocket2, protein and id [1521,1505,1506,1507,1512,1532,382,387,390,1516,1351,1352,1546,289,241,261,263,391,270,267,271,413,414,1508,1491,1341,1343,2067,2073,1383,1385,2083] 
set surface_color,  pcol2, surf_pocket2 
set_color pcol3 = [0.576,0.361,0.902]
select surf_pocket3, protein and id [7075,7126,7127,7128,593,7077,7058,7060,7071,7074,7069,6974,7135,6975,7256,7173,7232,7234,7236,7258,7237,7056,6801,7172,6807] 
set surface_color,  pcol3, surf_pocket3 
set_color pcol4 = [0.616,0.278,0.702]
select surf_pocket4, protein and id [851,850,557,876,669,972,305,807,687,558] 
set surface_color,  pcol4, surf_pocket4 
set_color pcol5 = [0.902,0.361,0.792]
select surf_pocket5, protein and id [5729,5723,5721,5728,5722,5727,6974,6815,7114,6009,6005,5979,6965,6966,6973,6975,7107,7079,7078,6950,6951,6952,5734,6949,6852,6840,6841] 
set surface_color,  pcol5, surf_pocket5 
set_color pcol6 = [0.702,0.278,0.447]
select surf_pocket6, protein and id [594,597,984,981,1156,979,1170,1172,1175,279,280,580,582,583,574,962,963,964,7104,7100,7102,7103,7105] 
set surface_color,  pcol6, surf_pocket6 
set_color pcol7 = [0.902,0.361,0.361]
select surf_pocket7, protein and id [7149,7150,7151,8636,8633,8637,7120,8634,7165,7125,7130,7136,7116,7117,7139,7480,7481,7164,7425,7429,7148,7143] 
set surface_color,  pcol7, surf_pocket7 
set_color pcol8 = [0.702,0.447,0.278]
select surf_pocket8, protein and id [7574,7536,7572,7573,2452,7465,7467,7535,2454,2450,7601,8684,8695] 
set surface_color,  pcol8, surf_pocket8 
set_color pcol9 = [0.902,0.792,0.361]
select surf_pocket9, protein and id [293,295,296,297,298,314,316,1315,1284,1316,1245,1545,1568,288,1558] 
set surface_color,  pcol9, surf_pocket9 
   

deselect

orient
