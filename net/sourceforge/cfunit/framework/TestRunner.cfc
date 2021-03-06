<!---
*** CFUnit Runner File                                         ***
*** http://cfunit.sourceforge.net                              ***

*** @verion 1.0                                                ***
***          Robert Blackburn (http://www.rbdev.net)           ***
***          Initial Creation                                  ***

*** @verion 1.1                                                ***
***          Mark Mandel (http://www.compoundtheory.com)       ***
***          New design / clean up markup                      ***

*** @verion 1.2                                                ***
***          Robert Blackburn (http://www.rbdev.net)           ***
***          Bug fixes / clean up                              ***

Runs and outputs results of a Test, TestCase or TestSuite
--->
<cfcomponent>
	<cffunction name="qrun" access="public" output="true" returntype="string" hint="An alternative running method used for quickly executing the test. This will not process or output the results in any way, it will simply return true for a successful run and false for a failure or error.">
		<cfargument name="test" required="Yes" type="any" hint="The test to execute.">
		<cfargument name="name" required="Yes" type="string" hint="The name to use during this test.">
		<cfargument name="verbose" required="No" default="true" type="boolean" hint="Turns on/off verbose mode">
		<cfargument name="listener" required="No" type="any" hint="An optional test listener">
		
		<cfset var results = ""/>
		
		<cfinvoke component="TestCase" method="createResult" returnvariable="results">
		</cfinvoke>
		
		<cfif structKeyExists(arguments, "listener")>
			<cfset results.addListener( arguments.listener ) />
		</cfif>
		
		<cfif IsDefined("ARGUMENTS.test.suite")>
			<cfset ARGUMENTS.test.suite().run( results ) />
		<cfelse>
			<cfset ARGUMENTS.test.run( results ) />
		</cfif>
		
		<cfif results.errorCount() GT 0>
			<cfreturn "Error"/>
		<cfelseif results.failureCount() GT 0>
			<cfreturn "Failure"/>
		<cfelse>
			<cfreturn "Success"/>
		</cfif>

	</cffunction>
	
	<cffunction name="run" access="public" output="Yes" returntype="void" hint="Main method for running the tests and displaying the results.">
		<cfargument name="test" required="Yes" type="any" hint="The test to execute.">
		<cfargument name="name" required="Yes" type="string" hint="The name to use during this test.">
		<cfargument name="verbose" required="No" default="true" type="boolean" hint="Turns on/off verbose mode">
		<cfargument name="styled" required="No" default="true" type="boolean" hint="Turns on/off styled mode">
		<cfargument name="listener" required="No" type="any" hint="An optional test listener">
		
		<cfset var startTime = 0 />
		<cfset var endTime = 0 />
		<cfset var execTime = 0 />
		<cfset var count = 0 />
		<cfset var styleType = "unknown" />
		<cfset var msg = "TBD" />
		<cfset var it = 0 />
		<cfset var thisMessage = "" />
		<cfset var results = "" />
		
		<cfsilent>
			<cfinvoke component="TestCase" method="createResult" returnvariable="results" />
			
			<cfif structKeyExists(arguments, "listener")>
				<cfset results.addListener( arguments.listener ) />
			</cfif>
			
			<cfset startTime = getTickCount()>
			
			<cfif IsDefined("ARGUMENTS.test.suite")>
				<cfset arguments.test.suite().run( results ) />
			<cfelse>
				<cfset arguments.test.run( results ) />
			</cfif>
			
			<cfset endTime = getTickCount()>
			<cfset execTime = endTime-startTime>
			
			<cfset logResults( results ) />
			<cfset processResults( results ) />
		</cfsilent>
		
		<cfoutput>
			#outputResults(results, execTime, arguments.verbose, arguments.styled)#
		</cfoutput>
		
	</cffunction>
	
	<cffunction name="logResults" access="public" returntype="void" output="false" hint="Log the results">
		<cfargument name="results" required="yes" type="any" hint="The TestResult object to log">

		<cfset var it = "" />
		<cfset var thisMessage = "" />
		<cfset var id = createUUID() />
		<cfset var i = 0 />
		<cfset var c = 0 />

		<cfset var counts = "#results.runCount()#:#results.failureCount()#:#results.errorCount()#" />
		
		<!--- TODO: Add ability to disable logging --->
		
		<cfif arguments.results.wasSuccessful()>
			<cflog file="cfunit" text="#id#|SUCCESS|#counts#|" type="information">
		<cfelse>
			<cfset it = arguments.results.errors()>
			<cfset c = arrayLen( it ) />
			<cfloop from="1" to="#c#" index="i">
				<cflog file="cfunit" text="#id#|ERROR|#counts#|#it[i].getString()#" type="error">
			</cfloop>
		
			<cfset it = arguments.results.failures()>
			<cfset c = arrayLen( it ) />
			<cfloop from="1" to="#c#" index="i">
				<cflog file="cfunit" text="#id#|FAILUE|#counts#|#it[i].getString()#" type="error">
			</cfloop>
		</cfif>
		
		<cfreturn />
	</cffunction>
	
	<cffunction name="processResults" access="public" returntype="void" output="false" hint="This method is used to do any extra processing of results. This can be overridden to save results to a DB or log file.">
		<cfargument name="results" required="yes" type="any" hint="The TestResult object to process">
		<cfreturn />
	</cffunction>
	
	<cffunction name="outputResults" access="public" returntype="void" output="true" hint="Outputs the test results on screen. This can be overridden to customize the results output.">
		<cfargument name="results" required="yes" type="any" hint="The TestResult object to output">
		<cfargument name="executeTime" required="no" default="0" type="numeric" hint="The time it took to execute all the tests">
		<cfargument name="verbose" required="No" default="true" type="boolean" hint="Turns on/off verbose mode">
		<cfargument name="styled" required="No" default="true" type="boolean" hint="Turns on/off styled mode">
		
		<cfset var css = "" />
		<cfset var styleType = "" />
		<cfset var msg = "" />
		<cfset var it = "" />
		<cfset var i = 0 />
		<cfset var c = 0 />
		
		<cfif arguments.styled>
			<cfsavecontent variable="css">
			<style type="text/css" media="all">

				##cfunit-testresults {
					padding: auto;
					margin: 2em;
					font-family: Verdana, Geneva, san-serif;
					font-size: x-small;
					text-align: left;
				}
				
				##cfunit-testresults table tr {
					padding: 0;
					margin: 0;
				}
				
				ul##cfunit-error-list,
				ul##cfunit-failure-list
				{
				 	list-style: none;
				 	padding: 0px;
				 	margin: 0px;
				}
				
				ul##cfunit-error-list > li,
				ul##cfunit-failure-list > li
				{
					padding: 0.5em;
				}
				
				ul##cfunit-error-list td.header {
					background: ##f04a42;
				}

				ul##cfunit-failure-list td.header {
					background: ##f1ab41;
				}
				
				##cfunit-testresults table th {
					border: 1px solid black;
					padding: 0.8em;
					margin: 0;
					text-align:center;
				}
				##cfunit-testresults table td {
					border: 1px solid black;
					padding: 0.8em;
					margin: 0;
					vertical-align: top;
					font-family: Verdana, Geneva, san-serif;
					font-size: x-small;
				}

				.error table##cfunit-results  {
					border: 1px solid ##660000;
					background: ##f04a42;
				}
				
				.failure table##cfunit-results  {
					border: 1px solid ##660000;
					background: ##f1ab41;
				}

				.success table##cfunit-results  {
					border: 1px solid ##006600;
					background: ##66cc66;
					/*background: ##a6a6ff;*/
				}

				table##cfunit-results td{
					width:33%;
					text-align:center;
				}
			</style>			
			</cfsavecontent>
			<cfhtmlhead text="#css#">
		</cfif>
		
		<cfif results.errorCount() GT 0>
			<cfset styleType = "error">
			<cfset msg = "Error">
		<cfelseif results.failureCount() GT 0>
			<cfset styleType = "failure">
			<cfset msg = "Failure">
		<cfelse>
			<cfset styleType = "success">
			<cfset msg = "Success">
		</cfif>
	
		<div id="cfunit-testresults" class="#styleType#">
		<h2 id="status">#msg#</h2>
		<table id="cfunit-results">
			<tr>
				<th>Tests</th>
				<th>Errors</th>
				<th>Failures</th>
			</tr>
			<tr>
				<td>#results.runCount()#</td>
				<td>#results.errorCount()#</td>
				<td>#results.failureCount()#</td>
			</tr>
		</table>
		<cfif ARGUMENTS.verbose>
			<cfif arguments.executeTime GT 0>
				Execution Time: #arguments.executeTime# ms
			</cfif>
			<cfif NOT results.wasSuccessful()>
				<cfif results.errorCount()>
					<ul id="cfunit-error-list">
						<cfset it = results.errors()>
						<cfset c = arrayLen( it ) />
						<cfloop from="1" to="#c#" index="i">
							<li><h3>Error #i#</h3>
								#outputError( it[i] )#
							</li>
						</cfloop>
					</ul>
				</cfif>
									
				<cfif results.failureCount()>
					<ul id="cfunit-failure-list">
						<cfset it = results.failures()>
						<cfset c = arrayLen( it ) />
						<cfloop from="1" to="#c#" index="i">
							<li><h3>Failure #i#</h3>
								#outputError( it[i] )#
							</li>
						</cfloop>
					</ul>
				</cfif>
				
			</cfif>
		</cfif>
		</div>
	</cffunction>
	
	<cffunction name="outputError" access="private" returntype="void" output="true" hint="Used to output a single error/failure message.">
		<cfargument name="testFailure" type="any" required="Yes" hint="The test failure">

		<cfset var iterator = arguments.testFailure.thrownException().tagContext.iterator() />
		<cfset var context = 0 />
		
		<table>
			<tr>
				<td class="header">Test</td>
				<td>#arguments.testFailure.failedTest().getString()#</td>
			</tr>
			<tr>
				<td class="header">Message</td>
				<td>#HTMLEditFormat( arguments.testFailure.thrownException().message )#</td>
			</tr>
			<cfif Len(arguments.testFailure.thrownException().detail)>
			<tr>
				<td class="header">Detail</td>
				<td>#HTMLEditFormat( arguments.testFailure.thrownException().detail )#</td>
			</tr>
			</cfif>
			<cfif StructKeyExists(arguments.testFailure.thrownException(), "sql")>
			<tr>
				<td class="header">SQL</td>
				<td>#arguments.testFailure.thrownException().sql#
			        <cfif StructKeyExists(arguments.testFailure.thrownException(), "where")><p>#replaceNoCase(arguments.testFailure.thrownException().where, ",(", "<br/>(", "all")#</p></cfif>
				</td>
			</tr>
			</cfif>
			<!--- if it's a assert error, we don't need this stuff --->
			<cfif NOT arguments.testFailure.thrownException().type eq "AssertionFailedError">
			<tr>
				<td class="header">Type</td>
				<td>#arguments.testFailure.thrownException().type#</td>
			</tr>
			<tr>
				<td class="header">Tag Context</td>
				<td>
					<ol>
						<cfloop condition="#iterator.hasNext()#">
							<cfset context = iterator.next()>
							<li>
								#context.template#:#context.line#
							</li>
						</cfloop>
					</ol>
				</td>
			</tr>
			</cfif>

		</table>
	</cffunction>
	
	<cffunction name="textrun" access="public" output="No" returntype="string" hint="An alternative running method used to output the results in plain text. This will still process the results just like the main run method, but will always output them in plain text.">
		<cfargument name="test" required="Yes" type="any" hint="The TestResult object to output">
		<cfargument name="name" required="Yes" type="string" hint="The name to use during this test.">
		<cfargument name="verbose" required="No" default="true" type="boolean" hint="Turns on/off verbose mode">
		
		<cfset var content = ""/>
		<cfset var status = "Unknown"/>
		<cfset var messages = ArrayNew(1)/>
		<cfset var startTime = 0/>
		<cfset var endTime = 0/>
		<cfset var execTime = 0/>
		<cfset var it = 0 />
		<cfset var i = 0 />
		<cfset var c = 0 />
		
		<cfsilent>
			<cfinvoke component="TestCase" method="createResult" returnvariable="results">
			</cfinvoke>
			
			<cfset startTime = getTickCount()>
			
			<cfif IsDefined("ARGUMENTS.test.suite")>
				<cfset ARGUMENTS.test.suite().run( results ) />
			<cfelse>
				<cfset ARGUMENTS.test.run( results ) />
			</cfif>
			
			<cfset endTime = getTickCount()>
			<cfset execTime = endTime-startTime>
			
			<cfset processResults( results ) />
			
			<cfif results.errorCount() GT 0>
				<cfset status = "Error" />
			<cfelseif results.failureCount() GT 0>
				<cfset status = "Failure" />
			<cfelse>
				<cfset status = "Success" />
			</cfif>
			
			
			<cfif NOT results.wasSuccessful()>
				
				<cfif results.errorCount()>
					<cfset it = results.errors()>
					<cfset c = arrayLen( it ) />
					<cfloop from="1" to="#c#" index="i">
						<cfset ArrayAppend(messages, "[error] #it[i].getString()#: #it[i].thrownException().Detail#") />
					</cfloop>
				</cfif>
				
				<cfif results.failureCount()>
					<cfset it = results.failures()>
					<cfset c = arrayLen( it ) />
					<cfloop from="1" to="#c#" index="i">
						<cfset ArrayAppend(messages, "[failure] #it[i].getString()#") />
					</cfloop>
				</cfif>
			</cfif>
			
			
		</cfsilent>
			
		<cfsavecontent variable="content"><cfoutput>
#status#<cfif ARGUMENTS.verbose>
Execution Time: #execTime# ms
#ArrayToList(messages, Chr(10) )#</cfif>
		</cfoutput></cfsavecontent>
		
		<cfreturn content />
		
	</cffunction>
	
	<cffunction name="getJSTrace" access="private" output="No" returntype="string">
		<cfargument name="exception" type="any" required="Yes">
		
		<cfset var tc = ARGUMENTS.exception.TagContext />
		<cfset var len = ArrayLen(tc) />
		<cfset var trace = "" />
		<cfset var i = 0 />
		<cfset var x = "" />
		<cfset var thisTemplate = "" />
		<cfset var thisID = "" />
		
		<cfloop from="1" to="#len#" index="i">
			<cfif tc[i].template CONTAINS "\CF-INF\cfcomponents\">
				<cfset x = Len(tc[i].template)-(FindNoCase("\CF-INF\cfcomponents\", tc[i].template)+20)>
				<cfset thisTemplate = Replace(Right(tc[i].template, x), "\", "." , "all")>
			<cfelse>
				<cfset thisTemplate = tc[i].template>
			</cfif>
			
			<cfif StructKeyExists(tc[i], "ID")>
				<cfset thisID = tc[i].ID & "--->">
			<cfelse>
				<cfset thisID = "--->">
			</cfif>
			
			<cfset trace = ListPrepend(trace, JSStringFormat(thisID)&JSStringFormat(thisTemplate)&":"&tc[i].line, "|")>
		</cfloop>

		<cfset trace = Replace(trace, "|", "\n\r", "all")>
		
		<cfreturn trace>
	</cffunction>
</cfcomponent>