<?xml version="1.0" encoding="UTF-8"?>
<Workflow xmlns="http://soap.sforce.com/2006/04/metadata">
    <alerts>
        <fullName>Student Data Update</fullName>
        <protected>false</protected>
        <recipients>
            <type>creator</type>
        </recipients>
        <template>unfiled$public/Student_Data_Update</template>
    </alerts>
    <fieldUpdates>
        <fullName>marital status Updation</fullName>
        <field>Married__c</field>
        <literalValue>1</literalValue>
        <notifyAssignee>false</notifyAssignee>
        <operation>Literal</operation>
        <protected>false</protected>
    </fieldUpdates>
    <rules>
        <fullName>Marital status Updataion</fullName>
        <actions>
            <name>marital status Updation</name>
            <type>FieldUpdate</type>
        </actions>
        <active>true</active>
        <formula>NOT( ISBLANK( WifeName__c ) )</formula>
        <triggerType>onAllChanges</triggerType>
    </rules>
    <rules>
        <fullName>Student Data Update</fullName>
        <actions>
            <name>Student Data Update</name>
            <type>Alert</type>
        </actions>
        <active>true</active>
        <formula>AND(ISCHANGED( LastModifiedDate ), NOT( ISBLANK(  email__c  ) ) )</formula>
        <triggerType>onAllChanges</triggerType>
    </rules>
</Workflow>
