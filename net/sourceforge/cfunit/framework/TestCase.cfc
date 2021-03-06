<!---
*** CFUnit Runner File                                         ***
*** http://cfunit.sourceforge.net                              ***

*** @verion 1.0                                                ***
***          Robert Blackburn (http://www.rbdev.net)           ***
***          Initial Creation                                  ***

A test case defines the fixture to run multiple tests. To define a test case<br>
<ol>
	<li>implement a subclass of TestCase</li>
	<li>define instance variables that store the state of the fixture</li>
	<li>initialize the fixture state by overriding <code>setUp</code></li>
	<li>clean-up after a test by overriding <code>tearDown</code></li>
</ol>
Each test runs in its own fixture so there
can be no side effects among test runs.
Here is an example:
<pre>
	<cfcomponent displayname="MathTest" extends="TestCase">
		<cfproperty name="fValue1" type="numeric">
		<cfproperty name="fValue2" type="numeric">
		
		<cffunction name="setUp" returntype="void" access="public">
			<cfset var fValue1 = 2.0>
			<cfset var fValue2 = 3.0>
		</cffunction>
	</cfcomponent>
</pre>

For each test implement a method which interacts
with the fixture. Verify the expected results with assertions specified
by calling <code>assertTrue</code> with a boolean.
<pre>
	...
	<cffunction name="testAdd" returntype="void" access="public">
		<cfset var result = fValue1 + fValue2>
		<cfinvoke method="assertEquals">
			<cfinvokeargument name="expected" value="#numberFormat(5.0)#">
			<cfinvokeargument name="actual" value="#numberFormat(result)#">
		</cfinvoke>
	</cffunction>
	...
</pre>
Once the methods are defined you can run them. The framework supports
both a static type safe and more dynamic way to run a test.
In the static way you override the runTest method and define the method to
be invoked.
<pre>
	...
	<cffunction name="runTest" returntype="void" access="public">
		<cfset testAdd()>
	</cffunction>
	...
</pre>
The dynamic way uses reflection to implement <code>runTest</code>. It dynamically finds
and invokes a method.
In this case the name of the test case has to correspond to the test method
to be run.
<pre>
	<cfset result = CreateObject("component", "net.sourceforge.cfunit.framework.TestCase").createResult()>
	<cfinvoke component="MathTest" method="init" returnvariable="test">
		<cfinvokeargument name="name" value="testAdd">
	</cfinvoke>
	<cfset test.run( result )>
</pre>
The tests to be run can be collected into a TestSuite. CFUnit provides
different <i>test runners</i> which can run a test suite and collect the results.
A test runner either expects a static method <code>suite</code> as the entry
point to get a test to run or it will extract the suite automatically.
<pre>
	<cffunction name="suite" returntype="Test" access="public">
		<cfset var suite = CreateObject("component", "TestSuite").init()>
		<cfset suite.addTest( CreateObject("component", "MathTest").init("testAdd") )>
		<cfset suite.addTest( CreateObject("component", "MathTest").init("testDivideByZero") )>
		<cfreturn suite> 
	</cffunction>
</pre>

Based JUnit code
http://cvs.sourceforge.net/viewcvs.py/junit/junit/junit/framework/TestCase.java?view=markup
--->
<cfcomponent extends="Assert" hint="A test case defines the fixture to run multiple tests.">
	
	<!--- Import core testing methods --->
	<cfmodule template="tester.cfm">
		
	<cffunction name="init" returntype="TestCase" access="public" hint="Constructs a test case with the given name.">
		<cfargument name="name" required="No" default="" type="string" hint="The name of the test case">
		
		<cfset setName( arguments.name )>
		
		<cfreturn this>
	</cffunction>
	
</cfcomponent>