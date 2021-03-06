<!--- 
*** CFUnit CFEClispe Facade                                    ***
*** http://cfunit.sourceforge.net                              ***

*** @verion 1.0                                                ***
***          Robert Blackburn (http://www.rbdev.net)           ***
***          Initial Creation                                  ***

*** @verion 1.1                                                ***
***          Robert Blackburn (http://www.rbdev.net)           ***
***          Added comments/documentation                      ***

This is a facade CFC used by CFEclipse to execute tests. This facade is also a 
listener class which means it can be used to replace CFUnit's default listener 
to output the test results in a way which can be consumed by CFEclipse. In fact, 
this CFC can be overridden to output information specific for your needs; just 
keep in mind there are element CFEclispe will be expecting, like the first line 
meta data and the test headers. But you can easily override the outputMessage() 
function to output extra data which may be specific to your organization or 
systems.
 --->

<cfcomponent hint="This is a facade CFC used by CFEclipse to execute tests. This facade is also a listener class which means it can be used to replace CFUnit's default listener to output the test results in a way which can be consumed by CFEclipse. In fact, this CFC can be overridden to output information specific for your needs; just keep in mind there are element CFEclispe will be expecting, like the first line meta data and the test headers. But you can easily override the outputMessage() function to output extra data which may be specific to your organization or systems.">
	
	<cffunction name="init" returntype="CFEclipseFacade" access="public" hint="This is the initialization (the constructor) of the CFC. This function should always be called to initialize this object before calling any other method.">
		<!--- This variable is the location of the CFUnit framework. If the 
		framework and the facade are in the same location leave this value 
		blank. But this can be set if the facade is moved to a directory outside
		the framework's folder (for example: if the framework is located in a 
		folder not accessible via HTTP calls).  --->
		<cfset variables.cfunit_location = "">
		
		<!--- Line break variable, used for conveneince later.  --->
		<cfset variables.br = chr(13) />
		
		<!--- Return self --->
		<cfreturn this />
	</cffunction>
	
	<cffunction name="execute" returntype="void" access="remote" hint="The is the main method used in the facade. This will be called by CFEclipse to execute a test. It is called remotely (via HTTP call). Results out displayed in a format which can be consumed by CFEclipse">
		<cfargument name="test" required="true" type="any" hint="The name of the TestCase to execute.">
		<cfset var testsuite = 0 />
		<cfset var c = 0 />
		
		<cfsilent>
			<!--- We need to shutoff debug output to prevent it from invalidating the results. --->
			<cfsetting showdebugoutput="false" enablecfoutputonly="true" />
			
			<!--- Because this method is called remotely, in a single HTTP call, we need to initialize this object before continuing. --->
			<cfset init() />
			
			<!--- Create a TestSuite object for this TestCase --->
			<cfset testsuite = CreateObject("component", "#variables.cfunit_location#TestSuite").init( arguments.test ) />
			<cfset c = testsuite.testCount() />
		</cfsilent>
	
		<!--- Begin outputting the result in plan/text format  --->
		<cfcontent type="text/plain" reset="true">
		<!--- The very first line of our output should be the meta data of the results, including how may tests we expect to run, which framework will be used, and the version of the output format. --->
		<cfoutput>{version=1.0:framework=cfunit:count=#trim( c )#}#variables.br#</cfoutput>
		<!--- Run the result using a test runner, using this object as the listener so that we can output the results. --->
		<cfinvoke component="#variables.cfunit_location#TestRunner" method="qrun">
			<cfinvokeargument name="test" value="#testsuite#">
			<cfinvokeargument name="name" value="">	
			<cfinvokeargument name="listener" value="#this#">	
		</cfinvoke>
	</cffunction>
	
	<cffunction name="getTests" returntype="void" access="remote" hint="This method is used by CFEclispe to retrieve a list of TestCases in a specific system directory.">
		<cfargument name="location" required="true" type="string" hint="The OS specific location on the server to get a list of tests for.">
		
		<cfset var directory = "" />
		<cfset var root = listChangeDelims( replaceNoCase(arguments.location, expandPath("/"), ""), ".", "\")  />
		
		<cfsilent>
			<!--- We need to shutoff debug output to prevent it from invalidating the results. --->
			<cfsetting showdebugoutput="false" enablecfoutputonly="true" />
			
			<!--- Because this method is called remotely, in a single HTTP call, we need to initialize this object before continuing. --->
			<cfset init() />
			
			<!--- CHECK: to see if the 'location' passed in is a file --->
			<cfif fileExists( arguments.location )>
				
				<!--- Remove file extention --->
				<cfset arguments.location = listDeleteAt(arguments.location, listLen(arguments.location, "."), ".") />
				
				<!--- Convert to CFC path --->
				<cfset arguments.location = listChangeDelims( replaceNoCase(arguments.location, expandPath("/"), ""), ".", "\")  />
							
			<!--- CHECK: to see if the location passed in is a directory --->
			<cfelseif directoryExists( arguments.location )>
				<!--- Get all the CFCs whose name begin with 'Test*' --->
				<cfdirectory action="list" directory="#arguments.location#" name="directory" filter="Test*.cfc" />
			</cfif>
			
		</cfsilent>
		
		<!--- Output list of tests in the requested location --->
		<cfcontent type="text/plain" reset="true">
		<cfif isQuery( directory )>
			<cfoutput query="directory">#root#.#listFirst( directory.name, "." )##variables.br#</cfoutput>
		<cfelse>
			<cfoutput>#arguments.location#</cfoutput>			
		</cfif>
		
	</cffunction>
	
	<cffunction name="startTest" returntype="void" access="public" output="true" hint="This method will be called by a TestRunner each time a new test begins.">
		<cfargument name="test" required="Yes" type="any" hint="The TestCase that is about to run">
		<cfset var n = trim( arguments.test.getName() ) />
		
		<!--- Output the header for this test --->
		<cfoutput>[#n#]#variables.br#</cfoutput>
		
		<!--- TODO: Had to remove <cfflush>	to avoid errors when the tested code
		uses cfcontent, cfcookie, cfform, cfheader, cfhtmlhead, cflocation, or 
		SetLocale. CFFlush may some day be used to create a sort of streaming 
		output of the results (which is why the results are returned in plain 
		text instead of XML, so that someday this may be possible). ) --->		
	</cffunction>

	<cffunction name="addMessage" returntype="void" access="public" hint="This method will be called by a TestRunner whenever there is a message invoked (errors or failures)">
		<cfargument name="test" required="Yes" type="any" hint="The TestCase that resulted in the message">
		<cfargument name="thrown" required="Yes" type="any" hint="The thrown meesage">
		<cfargument name="type" required="Yes" type="any" hint="The type of message (ERROR|FAILURE)">
		
		<cfset outputMessage( arguments.test, arguments.thrown, arguments.type ) />
	</cffunction>

	<cffunction name="endTest" returntype="void" access="public" output="true" hint="This method will be called by a TestRunner each time a test finishes.">
		<cfargument name="test" required="Yes" type="any" hint="">
	</cffunction>
	
	<cffunction name="outputMessage" access="private" returntype="void" output="true" hint="This function is used to output a error or failure message. This was separated out into its own method instead of displaying it inside addMessage for scalability.">
		<cfargument name="test" required="Yes" type="any" hint="The TestCase that resulted in the message">
		<cfargument name="thrown" required="Yes" type="any" hint="The thrown meesage">
		<cfargument name="type" required="Yes" type="any" hint="The type of message (ERROR|FAILURE)">

		<cfset var iterator = arguments.thrown.tagContext.iterator() />
		<cfset var context = 0 />
		
		<cfset var message = arguments.thrown.message />
		<cfset var dtype = arguments.type />
		<cfset var details = "" />
		
		<!--- If the thrown message has details, output them, but use HTMLEditFormat to allow cleaner text output --->
		<cfif Len(arguments.thrown.detail)>
			<cfset details = details & variables.br & HTMLEditFormat( arguments.thrown.detail ) />
		</cfif>
		
		<!--- If the thrown message came form SQL, add SQL specific details --->
		<cfif structKeyExists(arguments.thrown, "sql")>
			<cfset details = details & variables.br & arguments.thrown.sql />
		</cfif>
		
		<!--- If the thrown message was not a failure, add more details --->
		<cfif NOT arguments.thrown.type eq "AssertionFailedError">
			<cfset dtype = dtype & ":"& arguments.thrown.type />
			<cfloop condition="#iterator.hasNext()#">
				<cfset context = iterator.next()>
				<cfset details = details & variables.br & context.template&":"&context.line />
			</cfloop>
		</cfif>
		
		<!--- Output the details --->
		<cfoutput>#dtype##variables.br##message##details##variables.br#</cfoutput>
		
	</cffunction>
</cfcomponent>
