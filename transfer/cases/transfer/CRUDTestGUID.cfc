<cfcomponent name="CRUDTest" extends="test.transfer.cases.BaseCase">

<cffunction name="testNew" hint="" access="public" returntype="void" output="false">
	<cfscript>
		var basic = getTransfer().new("BasicGUID");

		assertEqualsBasic(basic.getClassName(), "BasicGUID");
	</cfscript>
</cffunction>

<cffunction name="testCreate" hint="" access="public" returntype="void" output="false">
	<cfscript>
		var basic = getTransfer().new("BasicGUID");
		var count = 0;

		var qAmount = 0;
	</cfscript>
	<!--- see if the amount is more --->
	<cfquery name="qAmount" datasource="#getDataSource().getName()#" username="#getDataSource().getUsername()#" password="#getDataSource().getUsername()#">
		select count(*) as amount
		from
		tbl_basicguid
	</cfquery>

	<cfscript>
		count = qAmount.amount;
		getTransfer().create(basic);
	</cfscript>
	<cfquery name="qAmount" datasource="#getDataSource().getName()#" username="#getDataSource().getUsername()#" password="#getDataSource().getUsername()#">
		select count(*) as amount
		from
		tbl_basicguid
	</cfquery>
	<cfscript>
		assertEqualsBasic(count + 1, qAmount.amount);
	</cfscript>
</cffunction>

<cffunction name="testEdit" hint="" access="public" returntype="void" output="false">
	<cfscript>
		var basic = getTransfer().new("BasicGUID");

		var qSelect = 0;

		getTransfer().create(basic);

		basic.setString("george");

		getTransfer().update(basic);
	</cfscript>
	<cfquery name="qSelect" datasource="#getDataSource().getName()#" username="#getDataSource().getUsername()#" password="#getDataSource().getUsername()#">
		select basic_string
		from
		tbl_basicguid
		where
		idbasic = <cfqueryparam value="#basic.getIDBasic()#" cfsqltype="cf_sql_varchar">
	</cfquery>
	<cfscript>
		assertEqualsBasic(qSelect.basic_string, basic.getString());
	</cfscript>
</cffunction>

<cffunction name="testDelete" hint="" access="public" returntype="void" output="false">
	<cfscript>
		var basic = getTransfer().new("BasicGUID");
		var count = 0;

		var qAmount = 0;
		getTransfer().create(basic);
	</cfscript>
	<!--- see if the amount is less --->
	<cfquery name="qAmount" datasource="#getDataSource().getName()#" username="#getDataSource().getUsername()#" password="#getDataSource().getUsername()#">
		select count(*) as amount
		from
		tbl_basicguid
	</cfquery>

	<cfscript>
		count = qAmount.amount;
		getTransfer().delete(basic);
	</cfscript>
	<cfquery name="qAmount" datasource="#getDataSource().getName()#" username="#getDataSource().getUsername()#" password="#getDataSource().getUsername()#">
		select count(*) as amount
		from
		tbl_basicguid
	</cfquery>
	<cfscript>
		assertEqualsBasic(count - 1, qAmount.amount);
	</cfscript>
</cffunction>

<cffunction name="testReGet" hint="" access="public" returntype="void" output="false">
	<cfscript>
		var basic = getTransfer().new("BasicGUID");
		var getBasic = 0;
		getTransfer().create(basic);

		getBasic = getTransfer().get("BasicGUID", basic.getIDBasic());

		assertSameBasic(basic, getBasic);
	</cfscript>
</cffunction>

<cffunction name="testGet" hint="" access="public" returntype="void" output="false">
	<cfscript>
		var basic = getTransfer().new("BasicGUID");
		var getBasic = 0;
		getTransfer().create(basic);

		getTransfer().discard(basic);

		getBasic = getTransfer().get("BasicGUID", basic.getIDBasic());

		assertEqualsBasic(basic.getIDBasic(), getBasic.getIDBasic());
	</cfscript>
</cffunction>

<cffunction name="testChange" hint="" access="public" returntype="void" output="false">
	<cfscript>
		var basic = getTransfer().new("BasicGUID");
		var getBasic = 0;

		basic.setString("fred");
		basic.setNumeric(1);

		getTransfer().create(basic);

		basic.setString("Fred");

		assertEqualsBasic("Fred", basic.getString());

		getTransfer().update(basic);

		getTransfer().discard(basic);

		getBasic = getTransfer().get("BasicGUID", basic.getIDBasic());

		assertEqualsBasic(basic.getIDBasic(), getBasic.getIDBasic());
		assertEqualsBasic(basic.getString(), getBasic.getString());
	</cfscript>
</cffunction>

</cfcomponent>