	<!---
	*** CFUnit Runner File                                         ***
	*** http://cfunit.sourceforge.net                              ***
	
	*** @verion 1.0                                                ***
	***          Robert Blackburn (http://www.rbdev.net)           ***
	***          Initial Creation                                  ***
	
	A <code>TestResult</code> collects the results of executing
	a test case. It is an instance of the Collecting Parameter pattern.
	The test framework distinguishes between <i>failures</i> and <i>errors</i>.
	A failure is anticipated and checked for with assertions. Errors are
	unanticipated problems like an <code>ArrayIndexOutOfBoundsException</code>.
	
	Based JUnit code
	http://cvs.sourceforge.net/viewcvs.py/junit/junit/junit/framework/TestResult.java?view=markup
	
	--->
	<cfcomponent hint="A TestResult collects the results of executing a test case.">
		<cfproperty name="fFailures" type="array">
		<cfproperty name="fErrors" type="array">
		<cfproperty name="fListeners" type="array">
		<cfproperty name="fRunTests" type="numeric">
		<cfproperty name="fStop" type="boolean">
		
		<cffunction name="init" returntype="TestResult" access="public" hint="Test result constructor">
			<cfset variables.fFailures = arrayNew(1)>
			<cfset variables.fErrors = arrayNew(1)>
			<cfset variables.fListeners = ArrayNew(1)>
			<cfset variables.fRunTests = 0>
			<cfreturn this>
		</cffunction>
		
		<cffunction name="wasSuccessful" returntype="boolean" access="public" hint="Returns whether the entire test was successful or not">
			<cfif failureCount() IS 0 AND errorCount() IS 0>
				<cfreturn true>
			<cfelse>
				<cfreturn false>
			</cfif>
		</cffunction>
		
		<!--- Test Management --->
		<cffunction name="run" returntype="void" access="public" hint="Returns an Enumeration for the failures">
			<cfargument name="test" required="Yes" type="any" hint="">
						
			<cfset startTest( arguments.test )>
	
			<cfset runProtected( arguments.test )>
	
			<cfset endTest( arguments.test )>
		</cffunction>
		
		<cffunction name="startTest" returntype="void" access="public" hint="Informs the result that a test will be started.">
			<cfargument name="test" required="Yes" type="any" hint="">
			
			<cfset var listeners = cloneListeners() />
			<cfset var i = 0 />
			<cfset var listenersCount = arrayLen( listeners ) />
			
			<cfset variables.fRunTests = variables.fRunTests + 1 />	
	
			<cfloop from="1" to="#listenersCount#" index="i">
			   <cfset listeners[i].startTest( arguments.test ) />
			</cfloop>
			
		</cffunction>
	
		<cffunction name="runProtected" returntype="void" access="public" hint="Runs a TestCase">
			<cfargument name="test" required="Yes" type="any" hint="">
						
			<cftry>	
				<cfinvoke component="#arguments.test#" method="runBare" />
				
				<cfcatch type="AssertionFailedError">
					<cfset addFailure(arguments.test, cfcatch )>
				</cfcatch>
				<cfcatch type="java.lang.ThreadDeath">
					<cfthrow message="#cfcatch.Message#" type="#cfcatch.Type#" errorcode="#CFCATCH.ErrNumber#" detail="#cfcatch.Detail#">
				</cfcatch>
				<cfcatch type="Any">
					<cfset addError(arguments.test, cfcatch )> 
				</cfcatch>
			</cftry>
		</cffunction>
		
		<cffunction name="endTest" returntype="void" access="public" hint="Informs the result that a test was completed">
			<cfargument name="test" required="Yes" type="any" hint="">
			
			<cfset var listeners = cloneListeners() />
			<cfset var i = 0 />
			<cfset var listenersCount = arrayLen( listeners ) />
	
			<cfloop from="1" to="#listenersCount#" index="i">
			   <cfset listeners[i].endTest( arguments.test ) />
			</cfloop>
			
		</cffunction>
		
		
		<cffunction name="runCount" returntype="numeric" access="public" hint="Gets the number of run tests">
			<cfreturn variables.fRunTests>
		</cffunction>
		
		<!--- Error List Management --->
		<cffunction name="addError" returntype="void" access="public" hint="Adds an error to the list of errors. The passed in exception caused the error.">
			<cfargument name="test" required="Yes" type="any" hint="">
			<cfargument name="t" required="Yes" type="any" hint="">
			
			<cfset var listeners = cloneListeners() />
			<cfset var i = 0 />
			<cfset var listenersCount = arrayLen( listeners ) />
			
			<cfset arrayAppend(variables.fErrors, createObject("Component", "TestFailure").init(ARGUMENTS.test, ARGUMENTS.t) ) >
			
			<cfloop from="1" to="#listenersCount#" index="i">
			   <cfset listeners[i].addMessage( arguments.test, arguments.t, "ERROR" ) />
			</cfloop>
			
		</cffunction>
		
		<cffunction name="errorCount" returntype="numeric" access="public" hint="Gets the number of detected errors.">
			<cfreturn arrayLen( variables.fErrors ) />		
		</cffunction>
		
		<cffunction name="errors" returntype="any" access="public" hint="Returns an Enumeration for the errors">
			<cfreturn VARIABLES.fErrors />	
		</cffunction>
		
		<!--- Failure List Management --->
		<cffunction name="addFailure" returntype="void" access="public" hint="Adds a failure to the list of failures. The passed in exception caused the failure.">
			<cfargument name="test" required="Yes" type="any" hint="">
			<cfargument name="t" required="Yes" type="any" hint="">
			
			<cfset var listeners = cloneListeners() />
			<cfset var i = 0 />
			<cfset var listenersCount = arrayLen( listeners ) />
			
			<cfset arrayAppend(variables.fFailures, createObject("Component", "TestFailure").init(ARGUMENTS.test, ARGUMENTS.t) ) >
			
			<cfloop from="1" to="#listenersCount#" index="i">
			   <cfset listeners[i].addMessage( arguments.test, arguments.t, "FAILURE" ) />
			</cfloop>
			
		</cffunction>
		
		<cffunction name="failureCount" returntype="numeric" access="public" hint="Gets the number of detected failures">
			<cfreturn arrayLen( variables.fFailures )>
		</cffunction>
		
		<cffunction name="failures" returntype="any" access="public" hint="Returns an Enumeration for the failures">
			<cfreturn VARIABLES.fFailures />	
		</cffunction>
		
		<!--- Listener Management --->
		<cffunction name="addListener" returntype="void" access="public" hint="Registers a TestListener">
			<cfargument name="listener" required="Yes" type="any" hint="">
			<cfset ArrayAppend(VARIABLES.fListeners, ARGUMENTS.listener) >
		</cffunction>
			
		<cffunction name="cloneListeners" returntype="array" access="public" hint="Returns a copy of the listeners">
			<cfreturn VARIABLES.fListeners>
		</cffunction>
		
	</cfcomponent>
