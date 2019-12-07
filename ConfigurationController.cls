public with sharing class ConfigurationController {
    public ConfigurationController() {

    }
    @AuraEnabled(cacheable=true)
    public static List<string> getAllSObjects()
    {
        List<string> SObjectList = new List<string>();

        for(Schema.SObjectType objTyp : Schema.getGlobalDescribe().Values())
        {
            String name = objTyp.getDescribe().getName();      
                SobjectList.add(name);
        }
        System.debug('sObjectList size: '+SObjectList.size());
        return SObjectList;
    }

    @AuraEnabled(cacheable=true)
    public static List<String> getAllLookupFields(string objectName){
        SObjectType obj = Schema.getGlobalDescribe().get(objectName);
        Map<String,Schema.SObjectField> allLookupFields = obj.getDescribe().fields.getMap();
        List<String> lookupList = new List<String>();
        for(Schema.SObjectField field: allLookupFields.values())
        {
            if(field.getDescribe().getType()== Schema.DisplayType.REFERENCE)
            {
                lookupList.add(''+field);
            }
        }
        return lookupList;
    }
}