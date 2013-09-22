
nozzle_edges = 4;
nozzle_edgeradius = 3;
nozzle_edgerotate = true;
nozzle_length = 50;
nozzle_dillation = 24;
nozzle_wall = 1;
nozzle_scale = 0.75;
nozzle_tilt = 18;

mntholes_numberof = 4;
mntholes_angles = [ 90, 270, 0, 180 ];

$fn = 64;

module nozzle_shape( r, h )
{
	if ( nozzle_edges < 20 && nozzle_edgeradius > 0 )
		for ( a = [0:nozzle_edges] )
			rotate( [ 0, 0, 360/nozzle_edges * a ] )
				translate( [ r- nozzle_edgeradius, 0, 0 ] )
					cylinder( r = nozzle_edgeradius, h = h, center = true, $fn = 16 );
	else
		cylinder( r = r, h = h, center = true, $fn = nozzle_edges );
}

difference(){
	translate( [ -30, 2, 0 ] )
		cube([15,3,10]);
	flow();
	translate([ -25, 0,5 ])
	rotate([90,0,0])
		cylinder(r=2,h=20, center =true);
}

difference(){
	translate( [ -30, -5, 0 ] )
		cube([15,3,10]);
	flow();
	translate([ -25, 0,5 ])
	rotate([90,0,0])
		cylinder(r=2,h=20, center =true);
}

difference()
{
	union()
	{

		for ( a = [1:mntholes_numberof] )
			rotate( [ 0, 0, mntholes_angles[a-1] ] )
			{
				translate( [ 10, 8, 0 ] )
					cube( [ 20, 16, 3 ], center = true );
				translate( [ 8, 10, 0 ] )
					cube( [ 16, 20, 3 ], center = true );
				translate( [ 16, 16, 0 ] )
					cylinder( r = 4, h = 3, center = true, $fn = 16 );
			}

		hull()
		{
			cylinder( r = 20.5, h = 3, center = true );
			rotate( [ 0, nozzle_tilt, 0 ] )
			translate( [ 0, 0, nozzle_length ] )
				scale( [ nozzle_scale, 1 / nozzle_scale, 1 ] )
					rotate( [ 0, 0, nozzle_edgerotate ? 180 / nozzle_edges : 0 ] )
						nozzle_shape( r = nozzle_dillation/2+nozzle_wall*max(nozzle_scale,1/nozzle_scale), h = 1 );
		}
	}

	for ( a = [1:mntholes_numberof] )
		rotate( [ 0, 0, mntholes_angles[a-1] ] )
			translate( [ 16, 16, 0 ] )
				cylinder( r = 1.6, h = 5, center = true, $fn = 16 );

	flow();
}

module flow() {
	hull()
	{
		translate( [ 0, 0, -1.5 ] )
		cylinder( r = 20.5 - nozzle_wall, h = 1, center = true );
			rotate( [ 0, nozzle_tilt, 0 ] )
		translate( [ 0, 0, nozzle_length ] )
			//cylinder( r = nozzle_dillation * cos( 180 / nozzle_edges )/2, h = 1.5, center = true );
			scale( [ nozzle_scale, 1 / nozzle_scale, 1 ] )
				rotate( [ 0, 0, nozzle_edgerotate ? 180 / nozzle_edges : 0 ] )
					nozzle_shape( r = nozzle_dillation/2, h = 1.5 );
	}
}

