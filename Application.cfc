<cfcomponent name="Application.cfc">
	
<!--- constructor --->
<cfscript>
	this.name = "cfunit";
	this.applicationTimeout = CreateTimeSpan(0, 0, 30, 0);
	this.sessionManagement = true;

	this.mappings = {
		"/test" = getDirectoryFromPath(getCurrentTemplatePath()),
		"/transfer" = expandPath("../"),
		"/net" = expandPath("./net")
	};

</cfscript>
<cfsetting showdebugoutput="false" requesttimeout="#(60 * 60)#">

</cfcomponent>