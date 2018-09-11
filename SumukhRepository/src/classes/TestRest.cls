@RestResource(urlMapping='/NetsuiteIntegrationTest/*')
global with sharing class TestRest{
    @Httppost
    global static void RestAPI () {
       // String jsonStr = null;
        //integer i=0;
         string respBody = '';
        RestRequest req = RestContext.request;
        RestResponse res = RestContext.response;
        System.debug('jsonStr ===> '+req.requestBody);
        respBody  = req.requestbody.tostring();
//IS_NesuiteP_LmainClass.ProjectNetsuiteP_LResponseObjectClass actualsObj = (IS_NesuiteP_LmainClass.ProjectNetsuiteP_LResponseObjectClass)JSON.deserializeStrict(respBody,IS_NesuiteP_LmainClass.ProjectNetsuiteP_LResponseObjectClass.class);
       Testjson.JSONData actualsObj=(Testjson.JSONData)JSON.deserializeStrict(respBody,Testjson.JSONData.class);
        
        system.debug('Check Json data' +actualsObj);
        
    }
}