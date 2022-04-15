VERSION 6
BEGIN SCHEMATIC
    BEGIN ATTR DeviceFamilyName "spartan3"
        DELETE all:0
        EDITNAME all:0
        EDITTRAIT all:0
    END ATTR
    BEGIN NETLIST
        SIGNAL PC(5:1)
        SIGNAL New_PC(5:0)
        SIGNAL PC(5:0)
        SIGNAL LastCarry
        SIGNAL Branch
        SIGNAL Instr(4:0)
        SIGNAL Instr(23:0)
        SIGNAL Instr(18:15)
        SIGNAL RegBase
        SIGNAL Instr(18:16)
        SIGNAL Instr(14:11)
        SIGNAL RegDest
        SIGNAL Instr(10:7)
        SIGNAL RdRegB(3:0)
        SIGNAL WrReg(3:0)
        SIGNAL Instr(3:0)
        SIGNAL Clk
        SIGNAL RegWr
        SIGNAL RdDataB(15:0)
        SIGNAL RdDataS(15:0)
        SIGNAL ALUOP(3:0)
        SIGNAL Instr(13:4)
        SIGNAL N_En
        SIGNAL O_En
        SIGNAL Z_En
        SIGNAL C_En
        SIGNAL XLXN_11
        SIGNAL XLXN_12
        SIGNAL XLXN_13
        SIGNAL XLXN_14
        SIGNAL INW0(15:0)
        SIGNAL INW1(15:0)
        SIGNAL MemWr
        SIGNAL OUTW0(15:0)
        SIGNAL Instr(8:4)
        SIGNAL DataOUT(15:0)
        SIGNAL ALU_OUT(15:0)
        SIGNAL WrData(15:0)
        SIGNAL Mem2Reg
        SIGNAL XLXN_17(4:0)
        SIGNAL XLXN_18(4:0)
        SIGNAL Instr(23:19)
        SIGNAL OV_En
        PORT Input Clk
        PORT Input INW0(15:0)
        PORT Input INW1(15:0)
        PORT Output OUTW0(15:0)
        BEGIN BLOCKDEF PC_Update
            TIMESTAMP 2021 12 27 14 47 46
            LINE N 320 352 384 352 
            RECTANGLE N 64 -176 320 432 
            LINE N 384 16 320 16 
            RECTANGLE N 320 4 384 28 
            LINE N 384 -32 320 -32 
            RECTANGLE N 320 52 384 76 
            LINE N 320 64 384 64 
            RECTANGLE N 0 -140 64 -116 
            LINE N 64 -128 0 -128 
            LINE N 64 144 0 144 
            LINE N 64 224 0 224 
            LINE N 64 176 0 176 
            RECTANGLE N 0 260 64 284 
            LINE N 64 272 0 272 
            LINE N 64 96 0 96 
        END BLOCKDEF
        BEGIN BLOCKDEF ProgCnt
            TIMESTAMP 2021 12 26 15 59 18
            RECTANGLE N 64 -128 320 0 
            RECTANGLE N 320 -108 384 -84 
            LINE N 320 -96 384 -96 
            RECTANGLE N 0 -60 64 -36 
            LINE N 64 -48 0 -48 
            LINE N 64 -100 0 -100 
        END BLOCKDEF
        BEGIN BLOCKDEF ROM32x24
            TIMESTAMP 2021 12 26 16 26 32
            RECTANGLE N 64 -64 320 0 
            RECTANGLE N 0 -44 64 -20 
            LINE N 64 -32 0 -32 
            RECTANGLE N 320 -44 384 -20 
            LINE N 320 -32 384 -32 
        END BLOCKDEF
        BEGIN BLOCKDEF MUX_D
            TIMESTAMP 2021 12 27 14 47 57
            RECTANGLE N 64 -192 320 0 
            LINE N 64 -160 0 -160 
            RECTANGLE N 0 -108 64 -84 
            LINE N 64 -96 0 -96 
            RECTANGLE N 0 -44 64 -20 
            LINE N 64 -32 0 -32 
            RECTANGLE N 320 -172 384 -148 
            LINE N 320 -160 384 -160 
        END BLOCKDEF
        BEGIN BLOCKDEF File_Regs
            TIMESTAMP 2021 12 27 18 42 51
            RECTANGLE N 64 -384 432 0 
            LINE N 64 -352 0 -352 
            LINE N 64 -288 0 -288 
            RECTANGLE N 0 -236 64 -212 
            LINE N 64 -224 0 -224 
            RECTANGLE N 0 -172 64 -148 
            LINE N 64 -160 0 -160 
            RECTANGLE N 0 -108 64 -84 
            LINE N 64 -96 0 -96 
            RECTANGLE N 0 -44 64 -20 
            LINE N 64 -32 0 -32 
            RECTANGLE N 432 -364 496 -340 
            LINE N 432 -352 496 -352 
            RECTANGLE N 432 -300 496 -276 
            LINE N 432 -288 496 -288 
        END BLOCKDEF
        BEGIN BLOCKDEF ALU
            TIMESTAMP 2021 12 29 17 52 5
            LINE N 64 -544 0 -544 
            RECTANGLE N 320 -44 384 -20 
            LINE N 320 -32 384 -32 
            LINE N 64 -288 0 -288 
            LINE N 64 -224 0 -224 
            LINE N 64 -160 0 -160 
            LINE N 64 -96 0 -96 
            RECTANGLE N 0 -364 64 -340 
            LINE N 64 -352 0 -352 
            LINE N 320 -528 384 -528 
            LINE N 320 -464 384 -464 
            LINE N 320 -400 384 -400 
            LINE N 320 -336 384 -336 
            RECTANGLE N 64 -576 320 44 
            LINE N 64 -32 0 -32 
            RECTANGLE N 0 4 64 28 
            LINE N 64 16 0 16 
            RECTANGLE N 0 -492 64 -468 
            LINE N 64 -480 0 -480 
            RECTANGLE N 0 -428 64 -404 
            LINE N 64 -416 0 -416 
        END BLOCKDEF
        BEGIN BLOCKDEF DataMem
            TIMESTAMP 2021 12 29 18 12 11
            RECTANGLE N 64 -384 368 0 
            LINE N 64 -352 0 -352 
            RECTANGLE N 0 -108 64 -84 
            LINE N 64 -96 0 -96 
            RECTANGLE N 0 -44 64 -20 
            LINE N 64 -32 0 -32 
            RECTANGLE N 368 -364 432 -340 
            LINE N 368 -352 432 -352 
            RECTANGLE N 368 -44 432 -20 
            LINE N 368 -32 432 -32 
            RECTANGLE N 0 -300 64 -276 
            LINE N 64 -288 0 -288 
            RECTANGLE N 0 -236 64 -212 
            LINE N 64 -224 0 -224 
            LINE N 64 -160 0 -160 
        END BLOCKDEF
        BEGIN BLOCKDEF MUX2V16
            TIMESTAMP 2021 12 30 12 14 33
            RECTANGLE N 64 -192 320 0 
            LINE N 64 -160 0 -160 
            RECTANGLE N 320 -172 384 -148 
            LINE N 320 -160 384 -160 
            RECTANGLE N 0 -44 64 -20 
            LINE N 64 -32 0 -32 
            RECTANGLE N 0 -108 64 -84 
            LINE N 64 -96 0 -96 
        END BLOCKDEF
        BEGIN BLOCKDEF CTRL
            TIMESTAMP 2022 1 13 20 1 13
            RECTANGLE N 0 -684 64 -660 
            LINE N 64 -672 0 -672 
            LINE N 320 -672 384 -672 
            LINE N 320 -608 384 -608 
            LINE N 320 -544 384 -544 
            LINE N 320 -480 384 -480 
            LINE N 320 -416 384 -416 
            LINE N 320 -352 384 -352 
            LINE N 320 -288 384 -288 
            LINE N 320 -224 384 -224 
            LINE N 320 -160 384 -160 
            LINE N 320 -96 384 -96 
            RECTANGLE N 320 -44 384 -20 
            LINE N 320 -32 384 -32 
            RECTANGLE N 64 -704 320 92 
        END BLOCKDEF
        BEGIN BLOCK U_PC ProgCnt
            PIN PC(5:0) PC(5:0)
            PIN New_PC(5:0) New_PC(5:0)
            PIN Clk Clk
        END BLOCK
        BEGIN BLOCK U_ROM ROM32x24
            PIN Addr(4:0) PC(5:1)
            PIN Data(23:0) Instr(23:0)
        END BLOCK
        BEGIN BLOCK U_New_PC PC_Update
            PIN CarryOUT LastCarry
            PIN Offset(4:0) Instr(4:0)
            PIN Branch Branch
            PIN PC(5:0) PC(5:0)
            PIN New_PC(5:0) New_PC(5:0)
            PIN N XLXN_14
            PIN OV XLXN_11
            PIN C XLXN_12
            PIN BranchType(2:0) Instr(18:16)
            PIN Z XLXN_13
        END BLOCK
        BEGIN BLOCK U_MUX_Base MUX_D
            PIN Sel RegBase
            PIN I0(3:0) Instr(14:11)
            PIN I1(3:0) Instr(18:15)
            PIN Y(3:0) RdRegB(3:0)
        END BLOCK
        BEGIN BLOCK U_MUX_Dest MUX_D
            PIN Sel RegDest
            PIN I0(3:0) Instr(3:0)
            PIN I1(3:0) Instr(10:7)
            PIN Y(3:0) WrReg(3:0)
        END BLOCK
        BEGIN BLOCK U_Regs_File File_Regs
            PIN Clk Clk
            PIN WrEn RegWr
            PIN RdRegB(3:0) RdRegB(3:0)
            PIN RdRegS(3:0) Instr(3:0)
            PIN WrReg(3:0) WrReg(3:0)
            PIN WRData(15:0) WrData(15:0)
            PIN RdDataB(15:0) RdDataB(15:0)
            PIN RdDataS(15:0) RdDataS(15:0)
        END BLOCK
        BEGIN BLOCK U_ALU ALU
            PIN Clk Clk
            PIN N_En N_En
            PIN OV_En O_En
            PIN Z_En Z_En
            PIN C_En C_En
            PIN C_Status LastCarry
            PIN RdDataB(15:0) RdDataB(15:0)
            PIN RdDataS(15:0) RdDataS(15:0)
            PIN ALUOP(3:0) ALUOP(3:0)
            PIN ANDlit(9:0) Instr(13:4)
            PIN N XLXN_14
            PIN OV XLXN_11
            PIN Z XLXN_13
            PIN C XLXN_12
            PIN Y(15:0) ALU_OUT(15:0)
        END BLOCK
        BEGIN BLOCK U_DataMem DataMem
            PIN Clk Clk
            PIN Wr MemWr
            PIN INW0(15:0) INW0(15:0)
            PIN INW1(15:0) INW1(15:0)
            PIN Addr(4:0) Instr(8:4)
            PIN DataIn(15:0) RdDataS(15:0)
            PIN OUTW0(15:0) OUTW0(15:0)
            PIN DataOut(15:0) DataOUT(15:0)
        END BLOCK
        BEGIN BLOCK U_MUX_Data MUX2V16
            PIN Sel Mem2Reg
            PIN I0(15:0) ALU_OUT(15:0)
            PIN I1(15:0) DataOUT(15:0)
            PIN Y(15:0) WrData(15:0)
        END BLOCK
        BEGIN BLOCK U_CTRL CTRL
            PIN OP(4:0) Instr(23:19)
            PIN MemWr MemWr
            PIN Mem2Reg Mem2Reg
            PIN RegWr RegWr
            PIN RegDest RegDest
            PIN RegBase RegBase
            PIN Branch Branch
            PIN N_En N_En
            PIN OV_En OV_En
            PIN Z_En Z_En
            PIN C_En C_En
            PIN ALUOP(3:0) ALUOP(3:0)
        END BLOCK
    END NETLIST
    BEGIN SHEET 1 7040 5440
        BEGIN INSTANCE U_PC 288 1744 R0
            BEGIN DISPLAY 0 -128 ATTR InstName
                FONT 28 "Arial"
            END DISPLAY
        END INSTANCE
        BEGIN INSTANCE U_ROM 1120 1232 R0
            BEGIN DISPLAY 0 -184 ATTR InstName
                FONT 28 "Arial"
            END DISPLAY
        END INSTANCE
        BEGIN BRANCH PC(5:1)
            WIRE 928 1200 992 1200
            WIRE 992 1200 1120 1200
            BEGIN DISPLAY 992 1200 ATTR Name
                ALIGNMENT SOFT-BCENTER
            END DISPLAY
        END BRANCH
        BUSTAP 832 1200 928 1200
        BEGIN INSTANCE U_New_PC 288 704 R0
            BEGIN DISPLAY 0 -308 ATTR InstName
                FONT 28 "Arial"
            END DISPLAY
        END INSTANCE
        BEGIN BRANCH New_PC(5:0)
            WIRE 96 576 288 576
            WIRE 96 576 96 1040
            WIRE 96 1040 96 1696
            WIRE 96 1696 288 1696
            BEGIN DISPLAY 96 1040 ATTR Name
                ALIGNMENT SOFT-TVCENTER
            END DISPLAY
        END BRANCH
        BEGIN BRANCH PC(5:0)
            WIRE 672 768 832 768
            WIRE 832 768 832 1200
            WIRE 832 1200 832 1520
            WIRE 832 1520 832 1648
            WIRE 672 1648 832 1648
            BEGIN DISPLAY 832 1520 ATTR Name
                ALIGNMENT SOFT-TVCENTER
            END DISPLAY
        END BRANCH
        BEGIN BRANCH LastCarry
            WIRE 672 1040 672 1056
            BEGIN DISPLAY 672 1040 ATTR Name
                ALIGNMENT SOFT-VLEFT
            END DISPLAY
        END BRANCH
        BEGIN BRANCH Branch
            WIRE 672 672 720 672
            BEGIN DISPLAY 720 672 ATTR Name
                ALIGNMENT SOFT-LEFT
            END DISPLAY
        END BRANCH
        BEGIN BRANCH Instr(4:0)
            WIRE 672 720 1168 720
            WIRE 1168 720 1520 720
            BEGIN DISPLAY 1168 720 ATTR Name
                ALIGNMENT SOFT-BCENTER
            END DISPLAY
        END BRANCH
        BEGIN BRANCH Instr(23:0)
            WIRE 1504 1200 1616 1200
            WIRE 1616 1200 1616 1424
            WIRE 1616 1424 1616 1600
            WIRE 1616 1600 1616 1808
            WIRE 1616 1808 1616 1936
            WIRE 1616 1936 1616 2032
            WIRE 1616 640 1616 720
            WIRE 1616 720 1616 800
            WIRE 1616 800 1616 880
            WIRE 1616 880 1616 944
            WIRE 1616 944 1616 1168
            WIRE 1616 1168 1616 1200
            BEGIN DISPLAY 1616 1424 ATTR Name
                ALIGNMENT SOFT-TVCENTER
            END DISPLAY
        END BRANCH
        BUSTAP 1616 720 1520 720
        BUSTAP 1616 880 1712 880
        BUSTAP 1616 944 1712 944
        BEGIN BRANCH Instr(18:15)
            WIRE 1712 944 1808 944
            WIRE 1808 944 1936 944
            BEGIN DISPLAY 1808 944 ATTR Name
                ALIGNMENT SOFT-BCENTER
            END DISPLAY
        END BRANCH
        BEGIN BRANCH RegBase
            WIRE 1920 816 1936 816
            BEGIN DISPLAY 1920 816 ATTR Name
                ALIGNMENT SOFT-RIGHT
            END DISPLAY
        END BRANCH
        BEGIN BRANCH Instr(18:16)
            WIRE 224 976 288 976
            WIRE 224 976 224 1168
            WIRE 224 1168 768 1168
            WIRE 768 800 768 1168
            WIRE 768 800 1136 800
            WIRE 1136 800 1520 800
            BEGIN DISPLAY 1136 800 ATTR Name
                ALIGNMENT SOFT-BCENTER
            END DISPLAY
        END BRANCH
        BUSTAP 1616 800 1520 800
        BEGIN BRANCH Instr(14:11)
            WIRE 1712 880 1808 880
            WIRE 1808 880 1936 880
            BEGIN DISPLAY 1808 880 ATTR Name
                ALIGNMENT SOFT-BCENTER
            END DISPLAY
        END BRANCH
        BEGIN INSTANCE U_MUX_Base 1936 976 R0
            BEGIN DISPLAY 0 -312 ATTR InstName
                FONT 28 "Arial"
            END DISPLAY
        END INSTANCE
        BEGIN INSTANCE U_MUX_Dest 1952 1632 R0
            BEGIN DISPLAY 0 -312 ATTR InstName
                FONT 28 "Arial"
            END DISPLAY
        END INSTANCE
        BEGIN BRANCH RegDest
            WIRE 1920 1472 1952 1472
            BEGIN DISPLAY 1920 1472 ATTR Name
                ALIGNMENT SOFT-RIGHT
            END DISPLAY
        END BRANCH
        BUSTAP 1616 1600 1712 1600
        BEGIN BRANCH Instr(10:7)
            WIRE 1712 1600 1824 1600
            WIRE 1824 1600 1952 1600
            BEGIN DISPLAY 1824 1600 ATTR Name
                ALIGNMENT SOFT-BCENTER
            END DISPLAY
        END BRANCH
        BEGIN INSTANCE U_Regs_File 2784 1040 R0
            BEGIN DISPLAY 0 -504 ATTR InstName
                FONT 28 "Arial"
            END DISPLAY
        END INSTANCE
        BEGIN BRANCH RdRegB(3:0)
            WIRE 2320 816 2528 816
            WIRE 2528 816 2784 816
            BEGIN DISPLAY 2528 816 ATTR Name
                ALIGNMENT SOFT-BCENTER
            END DISPLAY
        END BRANCH
        BEGIN BRANCH WrReg(3:0)
            WIRE 2336 1472 2544 1472
            WIRE 2544 944 2784 944
            WIRE 2544 944 2544 1200
            WIRE 2544 1200 2544 1472
            BEGIN DISPLAY 2544 1200 ATTR Name
                ALIGNMENT SOFT-TVCENTER
            END DISPLAY
        END BRANCH
        BEGIN BRANCH Instr(3:0)
            WIRE 1712 1168 1728 1168
            WIRE 1728 1168 1728 1536
            WIRE 1728 1536 1952 1536
            WIRE 1728 1168 2016 1168
            WIRE 2016 1168 2352 1168
            WIRE 2352 880 2352 1168
            WIRE 2352 880 2784 880
            BEGIN DISPLAY 2016 1168 ATTR Name
                ALIGNMENT SOFT-BCENTER
            END DISPLAY
        END BRANCH
        BUSTAP 1616 1168 1712 1168
        BEGIN BRANCH Clk
            WIRE 2736 688 2784 688
            BEGIN DISPLAY 2736 688 ATTR Name
                ALIGNMENT SOFT-RIGHT
            END DISPLAY
        END BRANCH
        BEGIN BRANCH RegWr
            WIRE 2736 752 2784 752
            BEGIN DISPLAY 2736 752 ATTR Name
                ALIGNMENT SOFT-RIGHT
            END DISPLAY
        END BRANCH
        BEGIN INSTANCE U_ALU 3728 1168 R0
            BEGIN DISPLAY 0 -696 ATTR InstName
                FONT 28 "Arial"
            END DISPLAY
        END INSTANCE
        BEGIN BRANCH RdDataB(15:0)
            WIRE 3280 688 3440 688
            WIRE 3440 688 3728 688
            BEGIN DISPLAY 3440 688 ATTR Name
                ALIGNMENT SOFT-BCENTER
            END DISPLAY
        END BRANCH
        BEGIN BRANCH RdDataS(15:0)
            WIRE 3280 752 3408 752
            WIRE 3408 752 3408 1264
            WIRE 3408 1264 4400 1264
            WIRE 3408 752 3456 752
            WIRE 3456 752 3728 752
            BEGIN DISPLAY 3456 752 ATTR Name
                ALIGNMENT SOFT-BCENTER
            END DISPLAY
        END BRANCH
        BEGIN BRANCH Clk
            WIRE 3648 624 3728 624
            BEGIN DISPLAY 3648 624 ATTR Name
                ALIGNMENT SOFT-RIGHT
            END DISPLAY
        END BRANCH
        BEGIN BRANCH ALUOP(3:0)
            WIRE 3520 816 3632 816
            WIRE 3632 816 3728 816
            BEGIN DISPLAY 3632 816 ATTR Name
                ALIGNMENT SOFT-BCENTER
            END DISPLAY
        END BRANCH
        BEGIN BRANCH Instr(13:4)
            WIRE 3520 1184 3600 1184
            WIRE 3600 1184 3728 1184
            BEGIN DISPLAY 3600 1184 ATTR Name
                ALIGNMENT SOFT-BCENTER
            END DISPLAY
        END BRANCH
        BEGIN BRANCH N_En
            WIRE 3664 880 3728 880
            BEGIN DISPLAY 3664 880 ATTR Name
                ALIGNMENT SOFT-RIGHT
            END DISPLAY
        END BRANCH
        BEGIN BRANCH O_En
            WIRE 3664 944 3728 944
            BEGIN DISPLAY 3664 944 ATTR Name
                ALIGNMENT SOFT-RIGHT
            END DISPLAY
        END BRANCH
        BEGIN BRANCH Z_En
            WIRE 3664 1008 3728 1008
            BEGIN DISPLAY 3664 1008 ATTR Name
                ALIGNMENT SOFT-RIGHT
            END DISPLAY
        END BRANCH
        BEGIN BRANCH C_En
            WIRE 3664 1072 3728 1072
            BEGIN DISPLAY 3664 1072 ATTR Name
                ALIGNMENT SOFT-RIGHT
            END DISPLAY
        END BRANCH
        BEGIN BRANCH LastCarry
            WIRE 3664 1136 3728 1136
            BEGIN DISPLAY 3664 1136 ATTR Name
                ALIGNMENT SOFT-RIGHT
            END DISPLAY
        END BRANCH
        BEGIN BRANCH XLXN_11
            WIRE 160 368 160 928
            WIRE 160 928 288 928
            WIRE 160 368 4256 368
            WIRE 4256 368 4256 768
            WIRE 4112 768 4256 768
        END BRANCH
        BEGIN BRANCH XLXN_12
            WIRE 176 352 176 880
            WIRE 176 880 288 880
            WIRE 176 352 4288 352
            WIRE 4288 352 4288 640
            WIRE 4112 640 4288 640
        END BRANCH
        BEGIN BRANCH XLXN_13
            WIRE 144 320 4320 320
            WIRE 4320 320 4320 704
            WIRE 144 320 144 800
            WIRE 144 800 288 800
            WIRE 4112 704 4320 704
        END BRANCH
        BEGIN BRANCH XLXN_14
            WIRE 112 288 112 848
            WIRE 112 848 288 848
            WIRE 112 288 4368 288
            WIRE 4368 288 4368 832
            WIRE 4112 832 4368 832
        END BRANCH
        BEGIN INSTANCE U_DataMem 4400 1296 R0
            BEGIN DISPLAY 0 -504 ATTR InstName
                FONT 28 "Arial"
            END DISPLAY
        END INSTANCE
        BEGIN BRANCH Clk
            WIRE 4384 944 4400 944
            BEGIN DISPLAY 4384 944 ATTR Name
                ALIGNMENT SOFT-RIGHT
            END DISPLAY
        END BRANCH
        BEGIN BRANCH INW0(15:0)
            WIRE 4384 1008 4400 1008
        END BRANCH
        BEGIN BRANCH INW1(15:0)
            WIRE 4384 1072 4400 1072
        END BRANCH
        BEGIN BRANCH MemWr
            WIRE 4384 1136 4400 1136
            BEGIN DISPLAY 4384 1136 ATTR Name
                ALIGNMENT SOFT-RIGHT
            END DISPLAY
        END BRANCH
        BEGIN BRANCH OUTW0(15:0)
            WIRE 4832 944 4848 944
        END BRANCH
        BUSTAP 1616 1808 1712 1808
        BEGIN BRANCH Instr(8:4)
            WIRE 1712 1808 2592 1808
            WIRE 2592 1808 4336 1808
            WIRE 4336 1200 4336 1808
            WIRE 4336 1200 4400 1200
            BEGIN DISPLAY 2592 1808 ATTR Name
                ALIGNMENT SOFT-BCENTER
            END DISPLAY
        END BRANCH
        BEGIN BRANCH DataOUT(15:0)
            WIRE 4832 1264 4912 1264
            WIRE 4912 1168 4976 1168
            WIRE 4912 1168 4912 1216
            WIRE 4912 1216 4912 1264
            BEGIN DISPLAY 4912 1216 ATTR Name
                ALIGNMENT SOFT-TVCENTER
            END DISPLAY
        END BRANCH
        BEGIN BRANCH ALU_OUT(15:0)
            WIRE 4112 1136 4176 1136
            WIRE 4176 1136 4176 1424
            WIRE 4176 1424 4736 1424
            WIRE 4736 1424 4960 1424
            WIRE 4960 1232 4976 1232
            WIRE 4960 1232 4960 1424
            BEGIN DISPLAY 4736 1424 ATTR Name
                ALIGNMENT SOFT-BCENTER
            END DISPLAY
        END BRANCH
        BEGIN BRANCH WrData(15:0)
            WIRE 2768 1008 2784 1008
            WIRE 2768 1008 2768 1488
            WIRE 2768 1488 3376 1488
            WIRE 3376 1488 5424 1488
            WIRE 5360 1104 5424 1104
            WIRE 5424 1104 5424 1488
            BEGIN DISPLAY 3376 1488 ATTR Name
                ALIGNMENT SOFT-BCENTER
            END DISPLAY
        END BRANCH
        BEGIN BRANCH Mem2Reg
            WIRE 4960 1056 4960 1072
            WIRE 4960 1072 4960 1104
            WIRE 4960 1104 4976 1104
            BEGIN DISPLAY 4960 1072 ATTR Name
                ALIGNMENT SOFT-TVCENTER
            END DISPLAY
        END BRANCH
        BEGIN INSTANCE U_MUX_Data 4976 1264 R0
            BEGIN DISPLAY 32 40 ATTR InstName
                FONT 28 "Arial"
            END DISPLAY
        END INSTANCE
        BUSTAP 1616 1936 1712 1936
        IOMARKER 4848 944 OUTW0(15:0) R0 28
        IOMARKER 4384 1072 INW1(15:0) R180 28
        IOMARKER 4384 1008 INW0(15:0) R180 28
        BEGIN BRANCH Clk
            WIRE 256 1632 288 1632
            WIRE 288 1632 288 1648
        END BRANCH
        IOMARKER 256 1632 Clk R180 28
        BEGIN BRANCH Instr(23:19)
            WIRE 1712 1936 1776 1936
            WIRE 1776 1936 1936 1936
            BEGIN DISPLAY 1776 1936 ATTR Name
                ALIGNMENT SOFT-BCENTER
            END DISPLAY
        END BRANCH
        BEGIN INSTANCE U_CTRL 1936 2608 R0
            BEGIN DISPLAY 0 -824 ATTR InstName
                FONT 28 "Arial"
            END DISPLAY
        END INSTANCE
        BEGIN BRANCH ALUOP(3:0)
            WIRE 2320 2576 2384 2576
            BEGIN DISPLAY 2384 2576 ATTR Name
                ALIGNMENT SOFT-LEFT
            END DISPLAY
        END BRANCH
        BEGIN BRANCH C_En
            WIRE 2320 2512 2432 2512
            BEGIN DISPLAY 2432 2512 ATTR Name
                ALIGNMENT SOFT-LEFT
            END DISPLAY
        END BRANCH
        BEGIN BRANCH Z_En
            WIRE 2320 2448 2432 2448
            BEGIN DISPLAY 2432 2448 ATTR Name
                ALIGNMENT SOFT-LEFT
            END DISPLAY
        END BRANCH
        BEGIN BRANCH OV_En
            WIRE 2320 2384 2416 2384
            BEGIN DISPLAY 2416 2384 ATTR Name
                ALIGNMENT SOFT-LEFT
            END DISPLAY
        END BRANCH
        BEGIN BRANCH N_En
            WIRE 2320 2320 2416 2320
            BEGIN DISPLAY 2416 2320 ATTR Name
                ALIGNMENT SOFT-LEFT
            END DISPLAY
        END BRANCH
        BEGIN BRANCH Branch
            WIRE 2320 2256 2400 2256
            BEGIN DISPLAY 2400 2256 ATTR Name
                ALIGNMENT SOFT-LEFT
            END DISPLAY
        END BRANCH
        BEGIN BRANCH RegBase
            WIRE 2320 2192 2400 2192
            WIRE 2400 2192 2416 2192
            BEGIN DISPLAY 2416 2192 ATTR Name
                ALIGNMENT SOFT-LEFT
            END DISPLAY
        END BRANCH
        BEGIN BRANCH RegDest
            WIRE 2320 2128 2416 2128
            BEGIN DISPLAY 2416 2128 ATTR Name
                ALIGNMENT SOFT-LEFT
            END DISPLAY
        END BRANCH
        BEGIN BRANCH RegWr
            WIRE 2320 2064 2400 2064
            BEGIN DISPLAY 2400 2064 ATTR Name
                ALIGNMENT SOFT-LEFT
            END DISPLAY
        END BRANCH
        BEGIN BRANCH Mem2Reg
            WIRE 2320 2000 2416 2000
            BEGIN DISPLAY 2416 2000 ATTR Name
                ALIGNMENT SOFT-LEFT
            END DISPLAY
        END BRANCH
        BEGIN BRANCH MemWr
            WIRE 2320 1936 2416 1936
            BEGIN DISPLAY 2416 1936 ATTR Name
                ALIGNMENT SOFT-LEFT
            END DISPLAY
        END BRANCH
    END SHEET
END SCHEMATIC
