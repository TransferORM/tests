<cfsilent>
	<cfset webroot = ExpandPath("/") />
	<cfset absDir = ExpandPath("../") />
	<cfset cfcPath = listChangeDelims( replaceNoCase(absDir,webroot, ""), ".", "\")  />

	<cfset tests = ArrayNew(1)>
	
	<cfdirectory action="list" directory="#absDir#/test" name="qTests" filter="Test*.cfc" />
	
	<cfloop query="qTests">
		<cfset arrayAppend(tests, cfcPath & ".test." & listFirst(qTests.name, ".") ) />
	</cfloop>
	
	<cfset testsuite = CreateObject("component", "#cfcPath#.framework.TestSuite").init( tests )>

</cfsilent>

<cfinvoke component="#cfcPath#.framework.TestRunner" method="run">
	<cfinvokeargument name="test" value="#testsuite#">
	<cfinvokeargument name="name" value="">	
</cfinvoke>

<cfoutput query="qTests">
<ul>
	<li><a href="#qTests.name#?method=execute&html=1&verbose=1">#qTests.name#</a></li>
</ul>
</cfoutput>



