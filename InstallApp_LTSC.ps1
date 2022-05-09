try {
	add-provisionedappxpackage -online -packagepath 73fdd6dba1514a7aa22bfb547c0ec41b.appxbundle -dependencypackagepath Microsoft.NET.Native.Framework.1.7_1.7.27413.0_x64__8wekyb3d8bbwe.appx,Microsoft.NET.Native.Runtime.1.7_1.7.27422.0_x64__8wekyb3d8bbwe.appx,Microsoft.VCLibs.140.00_14.0.27810.0_x64__8wekyb3d8bbwe.appx -licensepath 73fdd6dba1514a7aa22bfb547c0ec41b_License1.xml -Region "all"
} catch {
	exit 1
}
exit 0