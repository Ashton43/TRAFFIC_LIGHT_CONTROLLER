`define TRUE 1'b1 
`define FALSE 1'b0
module testbench; 
wire [1:0] MAIN_SIG, COUNTRY_SIG; 
reg VEHICLE_ON_COUNTRY_ROAD; 
reg CLOCK, CLEAR; 

signal_control SC(MAIN_SIG, COUNTRY_SIG, VEHICLE_ON_COUNTRY_ROAD, CLOCK, CLEAR); 

initial 
 $monitor($time, " Main Sig = %b Country Sig = %b Vehicle_on_country = %b", 
 MAIN_SIG, COUNTRY_SIG, VEHICLE_ON_COUNTRY_ROAD); 

initial 
begin 
 CLOCK = `FALSE; 
 forever #5 CLOCK = ~CLOCK; 
end 

initial 
begin 
 CLEAR = `TRUE;
 repeat (5) @(negedge CLOCK); 
 CLEAR = `FALSE; 
end  
initial 
begin 
 VEHICLE_ON_COUNTRY_ROAD = `FALSE; 
 repeat(20)@(negedge CLOCK); VEHICLE_ON_COUNTRY_ROAD = `TRUE; 
 repeat(10)@(negedge CLOCK); VEHICLE_ON_COUNTRY_ROAD = `FALSE; 
 repeat(20)@(negedge CLOCK); VEHICLE_ON_COUNTRY_ROAD = `TRUE; 
 repeat(10)@(negedge CLOCK); VEHICLE_ON_COUNTRY_ROAD = `FALSE; 
 repeat(20)@(negedge CLOCK); VEHICLE_ON_COUNTRY_ROAD = `TRUE; 
 repeat(10)@(negedge CLOCK); VEHICLE_ON_COUNTRY_ROAD = `FALSE; 
 repeat(10)@(negedge CLOCK); 
$stop; 
end 
endmodule 
