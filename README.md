# Elma7eCPU -  An 8 bit CPU design
A complete 5-stage non-pipelined 8-bit CPU architecture that runs in Modelsim simulation. This CPU has 4 components: a register file, an ALU, a program counter, and memory.

## Instructions
<pre>
Terms:
R = register
rOut = destination register
rIn = first operand register
rIn2 = second operand register
X = unused
</pre>

| Instruction | Form | Implementation | OPCODE |
| --- | --- | --- | --- |
| ADD | RRR |	rOut = rIn + rIn2 | 00
| SUB |	RRR	| rOut = rIn - rIn2 | 01
| AND |	RRR	| rOut = rIn ^ rIn2 | 10
| INC |	RRX	| rOut = rIn + 1 | 11


## Component Block Diagrams

Register file:

![Register file]


ALU:

![ALU]


PC:

![PC]

Memory:

![Memory]
