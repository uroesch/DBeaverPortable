; -----------------------------------------------------------------------------
; Custom Java Locator with a preference on OpenJDK as it generally works
; great with DBeaver
; Author: Urs Roesch <github@bun.ch>
; Disclaimer: I fudged myself through this not fully understanding every
;   NSIS concept.
;   Large parts of the code are copied verbatim from the Java/Init segment tho.
; -----------------------------------------------------------------------------

${SegmentFile}
${DisableHook} Java Init ; Disable or it will override the JAVA_HOME

!macro FindCommonJavaDirectory _JavaBits
	ClearErrors
	${If} ${FileExists} $PortableAppsDirectory\CommonFiles\OpenJDK${_JavaBits}
		StrCpy $JavaDirectory $PortableAppsDirectory\CommonFiles\OpenJDK${_JavaBits}
	${ElseIf} ${FileExists} $PortableAppsDirectory\CommonFiles\OpenJDKJRE${_JavaBits}
		StrCpy $JavaDirectory $PortableAppsDirectory\CommonFiles\OpenJDKJRE${_JavaBits}
	${ElseIf} ${FileExists} $PortableAppsDirectory\CommonFiles\JDK${_JavaBits}
		StrCpy $JavaDirectory $PortableAppsDirectory\CommonFiles\JDK${_JavaBits}
	${ElseIf} ${FileExists} $PortableAppsDirectory\CommonFiles\Java${_JavaBits}
		StrCpy $JavaDirectory $PortableAppsDirectory\CommonFiles\Java${_JavaBits}
	${EndIf}
!macroend
!define FindCommonJavaDirectory `!insertmacro FindCommonJavaDirectory`

${SegmentInit}
	; If [Activate]:Java=find|require, search for Java in the following
	; locations (in order):
	;
	;  - PortableApps.com CommonFiles (..\CommonFiles\{Java,JDK,JRE})
	;  - Registry (HKLM\Software\JavaSoft\Java Runtime Environment)
	;  - %JAVA_HOME%
	;  - Anywhere in %PATH% (with SearchPath)
	;  - %WINDIR%\Java (from Windows 98, probably obsolete now we don't it)
	;
	; If it's in none of those, give up. [Activate]:Java=require will then
	; abort, [Activate]:Java=find will set it to the non-existent CommonFiles
	; location. %JAVA_HOME% is then set to the location.
	
	ClearErrors
	${GetParentUNC} $EXEDIR $PortableAppsDirectory
	${ReadLauncherConfig} $JavaMode Activate Java
	${If} $JavaMode == find
	${OrIf} $JavaMode == require
		${If} $Bits != 64
			MessageBox MB_OK|MB_ICONSTOP "This version of DBeaver requires a 64bit runtime environment."
			Quit
		${Else}
			${FindCommonJavaDirectory} '64'
		${EndIf}
		${IfNot} ${FileExists} $JavaDirectory
			ClearErrors
			ReadRegStr $0 HKLM "Software\JavaSoft\Java Runtime Environment" CurrentVersion
			ReadRegStr $JavaDirectory HKLM "Software\JavaSoft\Java Runtime Environment\$0" JavaHome
			${If} ${Errors}
			${OrIfNot} ${FileExists} $JavaDirectory\bin\java.exe
			${AndIfNot} ${FileExists} $JavaDirectory\bin\javaw.exe
				ClearErrors
				ReadEnvStr $JavaDirectory JAVA_HOME
				${If} ${Errors}
				${OrIfNot} ${FileExists} $JavaDirectory\bin\java.exe
				${AndIfNot} ${FileExists} $JavaDirectory\bin\javaw.exe
					ClearErrors
					SearchPath $JavaDirectory java.exe
					${IfNot} ${Errors}
						${GetParent} $JavaDirectory $JavaDirectory
						${GetParent} $JavaDirectory $JavaDirectory
					${Else}
						StrCpy $JavaDirectory $WINDIR\Java
						${IfNot} ${FileExists} $JavaDirectory\bin\java.exe
						${AndIfNot} ${FileExists} $JavaDirectory\bin\javaw.exe
							StrCpy $JavaDirectory $PortableAppsDirectory\CommonFiles\Java
							${DebugMsg} "Unable to find Java installation."
						${EndIf}
					${EndIf}
				${EndIf}
			${EndIf}
		${EndIf}

		; If Java is required and not found, quit; if it is, check if
		; [Launch]:ProgramExecutable is java.exe or javaw.exe.
		${If} $JavaMode == require
			${IfNot} ${FileExists} $JavaDirectory
				;=== Java Portable is missing
				MessageBox MB_OK|MB_ICONSTOP `$(LauncherNoJava)`
				Quit
			${EndIf}
			${IfThen} $ProgramExecutable == java.exe ${|} StrCpy $UsingJavaExecutable true ${|}
			${IfThen} $ProgramExecutable == javaw.exe ${|} StrCpy $UsingJavaExecutable true ${|}
			${If} $UsingJavaExecutable == true
			${AndIfNot} ${FileExists} $JavaDirectory\bin\$ProgramExecutable
				;=== The required Java binary (java.exe or javaw.exe) is missing.
				MessageBox MB_OK|MB_ICONSTOP `$(LauncherNoJava)`
				Quit
			${EndIf}
		${EndIf}

		; Now set %JAVA_HOME% to the path (still may not exist
		${DebugMsg} "Selected Java path: $JavaDirectory"
		${SetEnvironmentVariablesPath} JAVA_HOME $JavaDirectory
	${ElseIfNot} ${Errors}
		${InvalidValueError} [Activate]:Java $JavaMode
	${EndIf}
!macroend
