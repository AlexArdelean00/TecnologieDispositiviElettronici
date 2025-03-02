Title ""

Controls {
}

IOControls {
	outputFile="/home/tcad/DB/2021/device/2D__diode/2D_diode"
	EnableSections
}

Definitions {
	Constant "ConstantProfileDefinition_substrate" {
		Species = "BoronActiveConcentration"
		Value = 1e+16
	}
	AnalyticalProfile "AnalyticalProfileDefinition_top" {
		Species = "PhosphorusActiveConcentration"
		Function = Gauss(PeakPos = 0, PeakVal = 1e+19, ValueAtDepth = 1e+16, Depth = 3)
		LateralFunction = Gauss(Factor = 0.8)
	}
	Refinement "RefinementDefinition_all" {
		MaxElementSize = ( 5 5 )
		MinElementSize = ( 0.1 0.1 )
		RefineFunction = MaxTransDiff(Variable = "DopingConcentration",Value = 1)
	}
	Refinement "RefinementDefinition_bottom" {
		MaxElementSize = ( 5 5 )
		MinElementSize = ( 0.1 0.1 )
		RefineFunction = MaxLenInt(Interface("Silicon","Contact"), Value=1, factor=0.2)
	}
}

Placements {
	Constant "ConstantProfile_substrate" {
		Reference = "ConstantProfileDefinition_substrate"
		EvaluateWindow {
			Element = region ["subsrtate"]
		}
	}
	AnalyticalProfile "AnalyticalProfilePlacement_top" {
		Reference = "AnalyticalProfileDefinition_top"
		ReferenceElement {
			Element = Line [(3 0) (17 0)]
		}
	}
	Refinement "RefinementPlacement_all" {
		Reference = "RefinementDefinition_all"
		RefineWindow = region ["subsrtate"]
	}
	Refinement "RefinementPlacement_bottom" {
		Reference = "RefinementDefinition_bottom"
		RefineWindow = region ["subsrtate"]
	}
}

