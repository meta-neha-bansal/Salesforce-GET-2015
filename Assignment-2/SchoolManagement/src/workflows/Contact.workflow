<?xml version="1.0" encoding="UTF-8"?>
<Workflow xmlns="http://soap.sforce.com/2006/04/metadata">
    <alerts>
        <fullName>Birthday Email Alert</fullName>
        <protected>false</protected>
        <recipients>
            <type>accountOwner</type>
        </recipients>
        <template>unfiled$public/Birthday_Email_Alert</template>
    </alerts>
    <alerts>
        <fullName>Teacher Updation Alert</fullName>
        <protected>false</protected>
        <recipients>
            <type>creator</type>
        </recipients>
        <template>unfiled$public/Teacher_Updation_Alert</template>
    </alerts>
    <rules>
        <fullName>Birthday Email Alert</fullName>
        <actions>
            <name>Birthday Email Alert</name>
            <type>Alert</type>
        </actions>
        <active>true</active>
        <formula>AND( NOT ( ISBLANK(Birthdate ) ) , NOT ( ISBLANK( Email ) ))</formula>
        <triggerType>onAllChanges</triggerType>
    </rules>
    <rules>
        <fullName>Teacher_Updation_Alert</fullName>
        <actions>
            <name>Teacher Updation Alert</name>
            <type>Alert</type>
        </actions>
        <active>false</active>
        <formula>AND(NOT(ISBLANK( Email )), Experience__c &gt; 5)</formula>
        <triggerType>onAllChanges</triggerType>
    </rules>
</Workflow>
