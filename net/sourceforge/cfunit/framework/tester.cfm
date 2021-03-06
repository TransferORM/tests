


<cfset variables.asserter = createObject("component", "Assert").init() />

<cfif structKeyExists(attributes, "asserter")>
	<cfset caller[attributes.asserter] = variables.asserter >
</cfif>

<cffunction name="countTestCases" returntype="numeric" access="public" hint="Counts the number of test cases executed by run(TestResult result).">
	<cfreturn 1>
</cffunction>

<cffunction name="createResult" returntype="TestResult" access="public" hint="Creates a default TestResult object">
	<cfreturn CreateObject("Component","TestResult").init()>
</cffunction>

<cffunction name="run" returntype="void" access="public" hint="Runs the test case and collects the results in TestResult.">
	<cfargument name="result" required="Yes" type="any" hint="The TestResult which will be used to execute this test.">
	<cfset ARGUMENTS.result.run( this )>
</cffunction>

<cffunction name="runBare" returntype="void" access="public" hint="Runs the bare test sequence.">
	<cfset var exception = "">
	
	<cfset setUp()>
	
	<cftry>
		<cfset runTest()>
		<cfcatch type="Any">
			<cfset exception = CFCATCH>
		</cfcatch>
	</cftry>

	<cftry>
		<cfset tearDown()>
		<cfcatch type="Any">
			<cfif NOT Len(Trim( exception ))>
				<cfset exception = CFCATCH>
			</cfif>
		</cfcatch>
	</cftry>

	<cfif Len(Trim( exception ))>
		<cfthrow object="#exception#">
	</cfif>
</cffunction>

<cffunction name="runTest" returntype="void" access="public" hint="Override to run the test and assert its state.">
	
	<cfset var cd = GetMetadata( this ) />
	<cfset var cname = cd["name"] />		
	<cfset var methods = variables.asserter.arrayConcat(ArrayNew(1), cd["FUNCTIONS"]) />
	<cfset var runMethod = structNew() />
	<cfset var e = "" />
	<cfset var i = 0 />
	<cfset var methodCount = 0 />
			
	<cfloop condition="#StructKeyExists(cd, 'EXTENDS')#">
		<cfset cd = cd["EXTENDS"]>
		<cfif StructKeyExists(cd, "FUNCTIONS")>
			<cfset methods = ArrayConcat(methods, cd["FUNCTIONS"])>
		</cfif>
	</cfloop>
	
	<cfset methodCount = arrayLen( methods ) />
	<cfloop from="1" to="#methodCount#" index="i">
	   	<cfif methods[i]["name"] IS getName()>
			<cfset runMethod = methods[i]>
			<cfbreak>
		</cfif>
	</cfloop>
		
	<cfif structIsEmpty( runMethod )>
		<cfset variables.asserter.fail( "Test "&getName()&"() was not found in " & cname )>
	</cfif>

	<cfif structKeyExists(runMethod, "ACCESS")>
		<cfif runMethod["ACCESS"] NEQ "public">
			<cfset variables.asserter.fail( "Access to test "&getName()&"() was no public in " & cname )>
		</cfif>
	</cfif>
	
	<cfinvoke component="#this#" method="#runMethod['name']#"></cfinvoke>
	
</cffunction>

<cffunction name="setUp" returntype="void" access="package" hint="Sets up the fixture, for example, open a network connection. This method is called before a test is executed.">
</cffunction>

<cffunction name="tearDown" returntype="void" access="package" hint="Tears down the fixture, for example, close a network connection. This method is called after a test is executed.">
</cffunction>

 <cffunction name="getString" returntype="string" access="public" hint="Returns a string representation of the test case">
	<cfset var cd = GetMetadata( this ) >
	<cfreturn getName() & "(" & cd["name"] & ")">
</cffunction>

<cffunction name="getName" returntype="string" access="public" hint="Gets the name of a TestCase">
	<cfif IsDefined("VARIABLES.fName")>
		<cfreturn VARIABLES.fName />
	<cfelse>
		<cfreturn ""/>
	</cfif>
</cffunction>

<cffunction name="setName" returntype="string" access="public" hint="Sets the name of a TestCase">
	<cfargument name="name" required="Yes" type="string" hint="The name of the test case">
	<cfset variables.fName = ARGUMENTS.name>
</cffunction>

<cffunction name="execute" access="remote" returntype="void" output="yes" hint="Executes this test">		
	<cfargument name="html" required="No" default="false" type="boolean" hint="Set to true if output should be in HTML. Otherwise output is in plain text." />
	<cfargument name="verbose" required="No" default="false" type="numeric" hint="The level verbosity. 0=None, 1=Normal, 2=Extra Detail." />
	
	<cfset var thisTest = "" />
	
	<!--- HTML output --->
	<cfif arguments.html>
		<cfset thisTest = createObject("component", "TestSuite").init( this )>
		
		<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
		
		<html>
		<head>
			<title>CFUnit - #getMetaData(this).name#</title>
		</head>
		
		<body>
			<cfinvoke component="TestRunner" method="run">
				<cfinvokeargument name="test" value="#thisTest#">
				<cfinvokeargument name="name" value="">	
				<cfinvokeargument name="verbose" value="#arguments.verbose#">
			</cfinvoke>
		</body>
		</html>
		
	<!--- Detailed text output --->
	<cfelseif arguments.verbose IS 2>
		<cfset thisTest = CreateObject("component", "CFEclipseFacade").init()>
		<cfset thisTest.execute( this )>
	
	<!--- Basic text output --->
	<cfelse>
		<cfset thisTest = createObject("component", "TestSuite").init( this )>
		<cfset thisTest = trim(createObject("component", "TestRunner").textrun( thisTest, "", arguments.verbose )) />
		<cfsetting showdebugoutput="No" enablecfoutputonly="Yes" />
		<cfcontent type="text/plain" reset="yes" />
		<cfoutput>#thisTest#</cfoutput>
		<cfreturn />
	</cfif>
	
</cffunction>

<cfset structAppend(caller, variables, false ) />
