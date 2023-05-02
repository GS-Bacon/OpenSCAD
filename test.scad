pole_lengh=120/2;
pole_OR=34/2;
flange_OR=40/2;
flange_thin=1;
bearing_Cangle=36;
bearing_OR=47/2;
bearing_thin=7.5;
outpole_lengh=(pole_lengh+flange_thin+(bearing_OR-flange_OR)*tan(bearing_Cangle)+bearing_thin);
warll_thin=4;

//ヘッドセットOrbitMX No.20に合せて
module headset_hole(){
    flange=[[-0,-0.01],
            ,[pole_OR,0]
            ,[pole_OR,pole_lengh]
            ,[flange_OR,pole_lengh]
            ,[flange_OR,pole_lengh+flange_thin]
            ,[bearing_OR,pole_lengh+flange_thin+(bearing_OR-flange_OR)*tan(bearing_Cangle)]
            ,[bearing_OR,pole_lengh+flange_thin+(bearing_OR-flange_OR)*tan(bearing_Cangle)+bearing_thin]
            ,[0,pole_lengh+flange_thin+(bearing_OR-flange_OR)*tan(bearing_Cangle)+bearing_thin]
            ];
    rotate_extrude($fn=50){
    polygon(flange);
    }
}

module headset_pole_half(){
    difference(){
        cylinder(h=outpole_lengh-0.1,r=bearing_OR+warll_thin,$fn=50);
        headset_hole();
        }
}


union(){
    headset_pole_half();
    mirror([0, 0, 1])headset_pole_half();
}