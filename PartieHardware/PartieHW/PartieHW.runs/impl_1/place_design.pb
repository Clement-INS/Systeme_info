
Q
Command: %s
53*	vivadotcl2 
place_design2default:defaultZ4-113h px? 
?
@Attempting to get a license for feature '%s' and/or device '%s'
308*common2"
Implementation2default:default2
xc7k70t2default:defaultZ17-347h px? 
?
0Got license for feature '%s' and/or device '%s'
310*common2"
Implementation2default:default2
xc7k70t2default:defaultZ17-349h px? 
P
Running DRC with %s threads
24*drc2
82default:defaultZ23-27h px? 
V
DRC finished with %s
79*	vivadotcl2
0 Errors2default:defaultZ4-198h px? 
e
BPlease refer to the DRC report (report_drc) for more information.
80*	vivadotclZ4-199h px? 
p
,Running DRC as a precondition to command %s
22*	vivadotcl2 
place_design2default:defaultZ4-22h px? 
P
Running DRC with %s threads
24*drc2
82default:defaultZ23-27h px? 
V
DRC finished with %s
79*	vivadotcl2
0 Errors2default:defaultZ4-198h px? 
e
BPlease refer to the DRC report (report_drc) for more information.
80*	vivadotclZ4-199h px? 
U

Starting %s Task
103*constraints2
Placer2default:defaultZ18-103h px? 
}
BMultithreading enabled for place_design using a maximum of %s CPUs12*	placeflow2
82default:defaultZ30-611h px? 
v

Phase %s%s
101*constraints2
1 2default:default2)
Placer Initialization2default:defaultZ18-101h px? 
?

Phase %s%s
101*constraints2
1.1 2default:default29
%Placer Initialization Netlist Sorting2default:defaultZ18-101h px? 
?
r%sTime (s): cpu = %s ; elapsed = %s . Memory (MB): peak = %s ; gain = %s ; free physical = %s ; free virtual = %s
480*common2.
Netlist sorting complete. 2default:default2
00:00:002default:default2
00:00:002default:default2
1994.8522default:default2
0.0002default:default2
600132default:default2
707542default:defaultZ17-722h px? 
Z
EPhase 1.1 Placer Initialization Netlist Sorting | Checksum: c3e50259
*commonh px? 
?

%s
*constraints2?
?Time (s): cpu = 00:00:00 ; elapsed = 00:00:00.02 . Memory (MB): peak = 1994.852 ; gain = 0.000 ; free physical = 60013 ; free virtual = 707542default:defaulth px? 
?
r%sTime (s): cpu = %s ; elapsed = %s . Memory (MB): peak = %s ; gain = %s ; free physical = %s ; free virtual = %s
480*common2.
Netlist sorting complete. 2default:default2
00:00:002default:default2
00:00:002default:default2
1994.8522default:default2
0.0002default:default2
600132default:default2
707542default:defaultZ17-722h px? 
?

Phase %s%s
101*constraints2
1.2 2default:default2F
2IO Placement/ Clock Placement/ Build Placer Device2default:defaultZ18-101h px? 
E
%Done setting XDC timing constraints.
35*timingZ38-35h px? 
g
RPhase 1.2 IO Placement/ Clock Placement/ Build Placer Device | Checksum: e71698b0
*commonh px? 
?

%s
*constraints2?
?Time (s): cpu = 00:00:00.54 ; elapsed = 00:00:00.38 . Memory (MB): peak = 2027.859 ; gain = 33.008 ; free physical = 60009 ; free virtual = 707542default:defaulth px? 
}

Phase %s%s
101*constraints2
1.3 2default:default2.
Build Placer Netlist Model2default:defaultZ18-101h px? 
P
;Phase 1.3 Build Placer Netlist Model | Checksum: 1e1f6e030
*commonh px? 
?

%s
*constraints2?
?Time (s): cpu = 00:00:00.77 ; elapsed = 00:00:00.53 . Memory (MB): peak = 2067.508 ; gain = 72.656 ; free physical = 60007 ; free virtual = 707532default:defaulth px? 
z

Phase %s%s
101*constraints2
1.4 2default:default2+
Constrain Clocks/Macros2default:defaultZ18-101h px? 
M
8Phase 1.4 Constrain Clocks/Macros | Checksum: 1e1f6e030
*commonh px? 
?

%s
*constraints2?
?Time (s): cpu = 00:00:00.77 ; elapsed = 00:00:00.53 . Memory (MB): peak = 2067.508 ; gain = 72.656 ; free physical = 60007 ; free virtual = 707532default:defaulth px? 
I
4Phase 1 Placer Initialization | Checksum: 1e1f6e030
*commonh px? 
?

%s
*constraints2?
?Time (s): cpu = 00:00:00.77 ; elapsed = 00:00:00.53 . Memory (MB): peak = 2067.508 ; gain = 72.656 ; free physical = 60007 ; free virtual = 707532default:defaulth px? 
x

Phase %s%s
101*constraints2
2 2default:default2+
Final Placement Cleanup2default:defaultZ18-101h px? 
K
6Phase 2 Final Placement Cleanup | Checksum: 1e1f6e030
*commonh px? 
?

%s
*constraints2?
?Time (s): cpu = 00:00:00.77 ; elapsed = 00:00:00.54 . Memory (MB): peak = 2067.508 ; gain = 72.656 ; free physical = 60007 ; free virtual = 707532default:defaulth px? 
?
aNo place-able instance is found; design doesn't contain any instance or all instances are placed
5*	placeflowZ30-281h px? 
=
(Ending Placer Task | Checksum: e71698b0
*commonh px? 
?

%s
*constraints2?
?Time (s): cpu = 00:00:00.77 ; elapsed = 00:00:00.54 . Memory (MB): peak = 2067.508 ; gain = 72.656 ; free physical = 60009 ; free virtual = 707552default:defaulth px? 
Z
Releasing license: %s
83*common2"
Implementation2default:defaultZ17-83h px? 
?
G%s Infos, %s Warnings, %s Critical Warnings and %s Errors encountered.
28*	vivadotcl2
402default:default2
02default:default2
02default:default2
02default:defaultZ4-41h px? 
^
%s completed successfully
29*	vivadotcl2 
place_design2default:defaultZ4-42h px? 
H
&Writing timing data to binary archive.266*timingZ38-480h px? 
D
Writing placer database...
1603*designutilsZ20-1893h px? 
=
Writing XDEF routing.
211*designutilsZ20-211h px? 
J
#Writing XDEF routing logical nets.
209*designutilsZ20-209h px? 
J
#Writing XDEF routing special nets.
210*designutilsZ20-210h px? 
?
r%sTime (s): cpu = %s ; elapsed = %s . Memory (MB): peak = %s ; gain = %s ; free physical = %s ; free virtual = %s
480*common2)
Write XDEF Complete: 2default:default2
00:00:00.032default:default2
00:00:00.022default:default2
2067.5082default:default2
0.0002default:default2
600072default:default2
707532default:defaultZ17-722h px? 
?
 The %s '%s' has been generated.
621*common2

checkpoint2default:default2?
?/home/omre/4A/projetAutomEtHW/projet/Systeme_info/Systeme_info/PartieHardware/PartieHW/PartieHW.runs/impl_1/CheminDesDonnees_placed.dcp2default:defaultZ17-1381h px? 
k
%s4*runtcl2O
;Executing : report_io -file CheminDesDonnees_io_placed.rpt
2default:defaulth px? 
?
?report_io: Time (s): cpu = 00:00:00.12 ; elapsed = 00:00:00.18 . Memory (MB): peak = 2067.508 ; gain = 0.000 ; free physical = 59989 ; free virtual = 70735
*commonh px? 
?
%s4*runtcl2?
xExecuting : report_utilization -file CheminDesDonnees_utilization_placed.rpt -pb CheminDesDonnees_utilization_placed.pb
2default:defaulth px? 
?
?report_utilization: Time (s): cpu = 00:00:00.07 ; elapsed = 00:00:00.09 . Memory (MB): peak = 2067.508 ; gain = 0.000 ; free physical = 60002 ; free virtual = 70748
*commonh px? 
?
%s4*runtcl2l
XExecuting : report_control_sets -verbose -file CheminDesDonnees_control_sets_placed.rpt
2default:defaulth px? 
?
?report_control_sets: Time (s): cpu = 00:00:00.04 ; elapsed = 00:00:00.07 . Memory (MB): peak = 2067.508 ; gain = 0.000 ; free physical = 60002 ; free virtual = 70748
*commonh px? 


End Record