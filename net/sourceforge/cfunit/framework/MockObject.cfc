<!---
*** CFUnit Mock Object                                         ***
*** http://cfunit.sourceforge.net                              ***

*** @verion 1.0                                                ***
***          Robert Blackburn (http://www.rbdev.net)           ***
***          Initial Creation                                  ***
--->
<cfcomponent output="false" hint="The mock object is used to mimic a real object. For example it can be used to substitute object like a DAO or Fa�ade object so that the unit test can be performed independently of outside systems. This is both good for more stable test and allows for better performance. For help documentation on how to use mock objects please visit the CFUnit web site: http://cfunit.sourceforge.net">
	<cffunction name="init" returntype="any" hint="The initialization process (constructor) of the mock object. This will NOT in turn initialize the mocked object; if needed that must be done separately by the calling page.">
		<cfargument name="component" required="yes" type="string" hint="The name of the component to create a mock object for.">
		
		<!--- get a copy of our current mockObject --->
		<cfset var mockObject = this />
		<cfset var mockObjectMetaData = getMetaData( mockObject ) />
		
		<cfset this.mockRequests = structNew() />
		<cfset this.mockReturns = structNew() />
		
		<cfset this.cfunitPackage = listDeleteAt(mockObjectMetaData.name, listLen(mockObjectMetaData.name, "."), ".") />
		<cfset this.cfunitPath = listDeleteAt(mockObjectMetaData.path, listLen(mockObjectMetaData.path, "\"), "\") />
		
		<!--- Overrite the mockobject with the real object --->
		<cfset this = createObject("component", arguments.component) />
		
		<!--- Mix in the mock object with the real object --->
		<cfset structAppend(this, mockObject, "true") />
		
		<!---Return the mixed objects --->
		<cfreturn this />
	</cffunction>
	
	<cffunction name="createFunctionStub" returntype="any" hint="Returns a stub of a function which can be used for overriding it. This is used by the CFC internally, and should not need to be executed outside the CFC.">
		<cfargument name="name" required="yes" type="string" hint="The name of the method to generate a stub for.">
		
		<cfset var package = this.cfunitPackage&".mockstubs"/>
		<cfset var path = this.cfunitPath&"\mockstubs"/>
		<cfset var componentName = "mockFunction_"&arguments.name />
		<cfset var mockFunction = ""/>
		<cfset var mockFunctionContents = "" />
		
		<cfif NOT fileExists(path&"/"&componentName&".cfc")>
			<cfset mockFunctionContents = "<cfcomponent output=""false""><cffunction name="""&arguments.name&""" returntype=""any""><cfreturn this.invokeMockFunction( methodName="""&arguments.name&""", args=arguments ) /></cffunction></cfcomponent>" />
			<cffile action="write" file="#path#/#componentName#.cfc" output="#mockFunctionContents#">
		</cfif>
		
		<cfset mockFunction = createObject("component", package&"."&componentName) />
		
		<cfreturn mockFunction[arguments.name] />
		
	</cffunction>
	
	<cffunction name="overrideFunction" access="public" returntype="void" hint="This will override the native function of the mock object with one that will have no effect. Each request to the over ridden method will be recorded (see: getRequest). By default the response of this method will be a blank string, but this can be changed to returns a specific response (see: addResult)">
		<cfargument name="name" required="yes" type="string" hint="The name of the method to over ride">
		<cfargument name="mockReturn" required="false" type="any" hint="Optionally, the result the over ridden method should return when it is called.">
				
		<cfset variables[arguments.name] = this.createFunctionStub( arguments.name ) />
		<cfset this[arguments.name] = variables[arguments.name] />
		
		<cfset this.mockReturns[ arguments.name ] = arrayNew( 1 ) />	
		<cfset this.mockRequests[ arguments.name ] = arrayNew( 1 ) />
		
		<cfif structKeyExists(arguments,"mockReturn")>
			<cfset arrayAppend( this.mockReturns[ arguments.name ], arguments.mockReturn) />
		</cfif>
	</cffunction>
	
	<cffunction name="addResult" access="public" returntype="void" hint="Adds a result to the list of responses for a method. You can add more then one result per method. The result will be cycled through in the order they were added. After the last result is returned the cycle will reset and the next result returned will be the first reposnce again.">
		<cfargument name="name" required="yes" type="string" hint="The name of the method to add the responce to.">
		<cfargument name="mockReturn" required="false" type="any" hint="The result to add to the list of responces.">
		
		<cfif structKeyExists(arguments,"mockReturn")>
			<cfset arrayAppend( this.mockReturns[ arguments.name ], arguments.mockReturn) />
		</cfif>
	</cffunction>
	
	<cffunction name="invokeMockFunction" returntype="any" hint="Internal method used to invoke a method. You should not need to call this directly.">
		<cfargument name="methodName" type="string" required="true" hint="The original name of the method being called.">
		<cfargument name="args" type="struct" required="true" hint="The arguments that were passed into the method">
		
		<cfset var ret = "" />
		<cfset var i = 0 />
		
		<cfif structKeyExists(this.mockReturns, methodName)>
			<!--- Get the current result index --->
			<cfset i = (arrayLen(this.mockRequests[ arguments.methodName ]) MOD arrayLen(this.mockReturns[ arguments.methodName ]))+1>
			<!--- Get the result --->
			<cfset ret = this.mockReturns[methodName][i] />
		</cfif>
		
		<cfset arrayAppend( this.mockRequests[ arguments.methodName ], arguments.args ) />
		
		<cfreturn ret />
			
	</cffunction>
	
	<cffunction name="getRequestCount" returntype="numeric" hint="Returns how many time a method was called.">
		<cfargument name="methodName" type="string" required="true" hint="The name of the method to get the count for.">
		<cfreturn arrayLen(this.mockRequests[ arguments.methodName ]) />
	</cffunction>
	
	<cffunction name="getRequest" returntype="struct" hint="Gets the information about a request to a function. This returns a structure of the arguments passed in.">
		<cfargument name="methodName" type="string" required="true" hint="The name of the method to get request information for.">
		<cfargument name="index" type="numeric" required="true" hint="The number of the request to get information for. For example: if you need the information about the fourth request to this method, then you would need to pass in '4' here.">
		<cfreturn this.mockRequests[ arguments.methodName ][ arguments.index ] />
	</cffunction>
		
</cfcomponent>