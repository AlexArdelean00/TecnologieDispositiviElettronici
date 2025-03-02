File 
{
	#Input file
    	Grid = "2D_diode_msh.tdr"

	#Output files:
	Plot    = "2D_diode.tdr"
	Current = "2D_I-V.plt"
	Output  = "2D_I-V.log"
}

Electrode 
{
	{ Name="top"       Voltage=0.0 }
	{ Name="bottom"    Voltage=0.0 }
}

Physics 
{
	Mobility(
	  DopingDependence)
	Recombination( 
	  SRH(DopingDependence)
	  Avalanche)
	EffectiveIntrinsicDensity(
	  BandGapNarrowing (OldSlotboom))
}

Plot 
{
	eDensity hDensity eCurrent hCurrent
	ElectricField 
	Potential SpaceCharge
	Doping DonorConcentration AcceptorConcentration
}



Math 
{
	Extrapolate
	RelErrControl
	Iterations=20
	NotDamped=50
}

Solve 
{
	# initial Substrate voltage 0.0V
	Poisson
	Coupled { Poisson Electron Hole}

	Quasistationary
	(InitialStep=1e-6 Maxstep=0.005 MinStep=1e-6
	Goal { name="bottom" voltage=1.0 } )
	{ Coupled { Poisson Electron Hole} }
}
