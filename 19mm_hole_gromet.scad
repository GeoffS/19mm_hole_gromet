include <../OpenSCADdesigns/MakeInclude.scad>

grometOD = 19.3;
grometID = 7.5;
grometFlangeOD = grometOD + 8;
grometFlangeZ = 2;
grometZ = 8;

module itemModule()
{
	difference()
	{
		union()
		{
			cylinder(d=grometFlangeOD, h=grometFlangeZ);
			cylinder(d=grometOD, h=grometZ);
		}
		// Hole:
		tcy([0,0,-1], d=grometID, h=100);
		translate([0,0,grometZ/2]) 
		{
			doubleZ() translate([0,0,grometZ/2-grometID/2-2.5]) cylinder(d1=0, d2=20, h=10);
		}

		// Slit:
		tcu([0,-0.5,-1], [100, 1, 100]);
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
