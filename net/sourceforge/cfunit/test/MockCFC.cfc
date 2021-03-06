<cfcomponent name="MockCFC" hint="An imitation CFC used for testing CFC assertions.">

	<cfproperty name="prop" type="string" />

	<cffunction name="getProp" access="public" output="false" returntype="string">
		<cfreturn variables.prop />
	</cffunction>

	<cffunction name="setProp" access="public" output="false" returntype="void">
		<cfargument name="prop" type="string" required="true" />
		<cfset variables.prop = arguments.prop />
		<cfreturn />
	</cffunction>
	
	<cffunction name="fakeFunction">
		<cfthrow message="fakeFunction() not overridden" type="fakeFunctionInvoked">
	</cffunction>
	
	<cffunction name="fakePrivateFunction" access="private">
		<cfthrow message="fakeFunction() not overridden" type="fakeFunctionInvoked">
	</cffunction>
	
	<cffunction name="callFakePrivateFunction" access="public">
		<cfset fakePrivateFunction() />
	</cffunction>
	
</cfcomponent>