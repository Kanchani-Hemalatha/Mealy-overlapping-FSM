
//================================================================================================
//                  MEALY OVERLAPPING MODULE DEFINITION								  
//================================================================================================
module mealy_fsm_overlapping(input clk,input reset,input din,output reg dout);
  
  parameter s0=3'b000,s1=3'b001,s2=3'b010,s3=3'b011;
  
  reg[2:0] current_state,next_state;
  
  always@(posedge clk or posedge reset)begin
    if(reset) begin
      current_state<=s0;
      
     end else
      current_state<=next_state;
  end
  
  always@(*)begin
      case(current_state)
        
      	s0:	if(din )begin
        		dout<=1'b0;
        		next_state<=s1;end
      		else begin
        		dout<=0;
        		next_state<=s0;end
      	s1:	if(din )begin
        		dout<=1'b0;
        		next_state<=s1;end
      		else begin
        		dout<=1'b0;
        		next_state<=s2;end
       	s2:	if(din )begin
        		dout<=1'b0;
        		next_state<=s3;end
      		else begin
        		dout<=1'b0;
        		next_state<=s0;end
       	s3:	if(din )begin
        		dout<=1'b0;
        		next_state<=s1;end
      		else begin
        		dout=1'b1;
        		next_state<=s2;end

      	default:next_state<=s0;
      endcase
  end
 
endmodule:mealy_fsm_overlapping
