//
// Vivado(TM)
// rundef.js: a Vivado-generated Runs Script for WSH 5.1/5.6
// Copyright 1986-2014 Xilinx, Inc. All Rights Reserved.
//

var WshShell = new ActiveXObject( "WScript.Shell" );
var ProcEnv = WshShell.Environment( "Process" );
var PathVal = ProcEnv("PATH");
if ( PathVal.length == 0 ) {
  PathVal = "C:/Xlinx_2014.2/SDK/2014.2/bin;C:/Xlinx_2014.2/Vivado/2014.2/ids_lite/ISE/bin/nt64;C:/Xlinx_2014.2/Vivado/2014.2/ids_lite/ISE/lib/nt64;C:/Xlinx_2014.2/Vivado/2014.2/bin;";
} else {
  PathVal = "C:/Xlinx_2014.2/SDK/2014.2/bin;C:/Xlinx_2014.2/Vivado/2014.2/ids_lite/ISE/bin/nt64;C:/Xlinx_2014.2/Vivado/2014.2/ids_lite/ISE/lib/nt64;C:/Xlinx_2014.2/Vivado/2014.2/bin;" + PathVal;
}

ProcEnv("PATH") = PathVal;

var RDScrFP = WScript.ScriptFullName;
var RDScrN = WScript.ScriptName;
var RDScrDir = RDScrFP.substr( 0, RDScrFP.length - RDScrN.length - 1 );
var ISEJScriptLib = RDScrDir + "/ISEWrap.js";
eval( EAInclude(ISEJScriptLib) );


ISEStep( "vivado",
         "-log blk_memory.vds -m64 -mode batch -messageDb vivado.pb -source blk_memory.tcl" );



function EAInclude( EAInclFilename ) {
  var EAFso = new ActiveXObject( "Scripting.FileSystemObject" );
  var EAInclFile = EAFso.OpenTextFile( EAInclFilename );
  var EAIFContents = EAInclFile.ReadAll();
  EAInclFile.Close();
  return EAIFContents;
}
