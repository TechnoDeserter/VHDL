module BCD (W, X, Y, Z,a,b,c,d,e,f,g);
input W, X, Y, Z;
output a,b,c,d,e,f,g;
reg a,b,c,d,e,f,g;
always @ (W or X or Y or Z)  
	begin
	a =  (W|Y)| ~(X ^Z);
	b = ~X|~(Y^Z) |W;
	c = X|~Y|Z;
	d = (~X&Y)|(X & ~Y & Z)|(~X&~Z)|(~Z&Y) |Z;
	e = (~X&~Z)|(Y&~Z);
	f = (~Y&X)|(~Z&~Y)|(X&~Z) |W ;
	g = (Y&~Z)| (X ^ Y)| W;
end
endmodule

module BDC_tb;
reg W, X, Y, Z; 
wire a,b,c,d,e,f,g;
BCD U1(W,X,Y,Z,a,b,c,d,e,f,g);

initial
	begin
     
		$display("| Binary\t| plus10\t| X\t| Y\t| Z\t| a1\t| b1\t| c1\t| d1\t| e1\t| f1\t| g1\t|| a2\t| b2\t| c2\t| d2\t| e2\t| f2\t| g2\t| \t ");
        $display("-------------------------------------------------------------------------------------------------------------------------------------------------------------------------");
		W =1'b0; X =1'b0; Y =1'b0; Z =1'b0;
		
		#8
        
		$finish;
end
always #8 W =~W;
always #4 X=~X;
always #2 Y=~Y;
always #1 Z=~Z;

initial begin

  $monitor("| %g\t\t| 10\t\t| %b\t| %b\t| %b\t| 0\t| 1\t| 1\t| 0\t| 0\t| 0\t| 0\t|| %b\t| %b\t| %b\t| %b\t| %b\t| %b\t| %b\t| 1%g\n-------------------------------------------------------------------------------------------------------------------------------------------------------------------------", 
  $time,X,Y,Z,a,b,c,d,e,f,g,$time);
end

endmodule