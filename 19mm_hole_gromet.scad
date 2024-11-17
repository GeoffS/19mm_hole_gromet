include <../OpenSCADdesigns/MakeInclude.scad>
include <../OpenSCADdesigns/chamferedCylinders.scad>

grometOD = 19.5;
grometID = 7.5;
grometFlangeOD = grometOD + 9;
grometFlangeZ = 4;
grometFlangeCZ = 1.4;
grometZ = grometFlangeZ + 5;
grometCZ = 1.6;

module itemModule()
{
	difference()
	{
		union()
		{
			// cylinder(d=grometFlangeOD, h=grometFlangeZ);
			translate([0,0,grometFlangeZ]) mirror([0,0,1]) simpleChamferedCylinder(d=grometFlangeOD, h=grometFlangeZ, cz=grometFlangeCZ);
			// cylinder(d=grometOD, h=grometZ);
			simpleChamferedCylinder(d=grometOD, h=grometZ, cz=grometCZ);
		}
		// Hole:
		tcy([0,0,-1], d=grometID, h=100);
		translate([0,0,grometZ/2]) 
		{
			doubleZ() translate([0,0,grometZ/2-grometID/2-2]) cylinder(d1=0, d2=20, h=10);
		}

		// Slit:
		sY = 2;
		tcu([-grometOD/2,-sY/2,-1], [100, sY, 100]);
		tcy([-grometOD/2,0    ,-1], d=sY, h=100);
	}
}

module clip(d=0)
{
	// tc([-200, -400-d, -10], 400);
}

if(developmentRender)
{
	display() itemModule();
}
else
{
	itemModule();
}
