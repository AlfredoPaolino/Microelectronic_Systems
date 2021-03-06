The approach used to build the Windowing Register File is the following:

1) Divide & Conquer approach in order to split the work into smaller components, which are:
> Register Management Logic : Behavioral;
> Address Translation Unit : Behavioral;
> Physical RF : Behavioral;

All the components are packed into a top-level entity:
> WRF : Structural;

(Refer to WRF_diagram.jpg for a visual image of our design)

2) RML - Register Management Logic
This component is in charge of managing the registers CWP,SWP,CANSAVE,CANRESTORE which are used to perform computation of the physical address. In particular:
> CWP : Is a register which points to the active window.
> SWP : Is a register which points to the last window saved in memory.
> CANSAVE : Is a register holding a count of how many CALLs to subroutines we can perform without needing to SPILL registers into memory.
> CANRESTORE : Is a register holding a count of how many RETURNs from subroutines we can perform without accessing memory to FILL the RF.

When SPILL or FILL is required, the RML issues an increasing/decreasing sequence of addresses and takes the control over the physical RF. At this moment, the process of SPILL/FILL is activating the proper control signals to the physical RF. It is worth mentioning that a MMU correctly reads the signals generated by the RML and readily reads or writes the registers to/from the memory it is wired to. The whole procedure lasts 2*N clock cycles, then the control is transferred again to the external unit driving the WRF.

3) ATU - Address Translation Unit
This component is in charge of converting the logical address provided by the external signals into the physical address needed to properly access the physicalRF. It is a pure block of combinational logic.

4) physicalRF
The only discussion to be done for this component is about the #bits of the input address. In fact, we split the address range into two halves and we use the lower half (2*N*F registers) for IN/LOCALS/OUT and the upper half (M registers) for the GLOBALS. Even if, we have a wider addressable space, our implementation of the ATU always maps to existing registers which are 2*N*F+M (which clearly aren't covering the whole addressable space that corresponds to 2^ceil(log2(2*N*F+M)) ).


