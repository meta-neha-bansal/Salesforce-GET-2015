/*
 * Name:RestrictContactByName
 * Since:27-1-2015
 * Description:This trigger is to not Allow any teacher to insert/update if that teacher is teaching Hindi.
 */ 
trigger RestrictContactByName on Contact (before insert, before update) {
	
	//check contacts prior to insert or update for invalid data
	For (Contact c : Trigger.New) {
		if(c.LastName == 'INVALIDNAME') {	//invalidname is invalid
			c.AddError('The Last Name "'+c.LastName+'" is not allowed for DML');
		}

	}



}