public class Testjson{
    public class JSONData{
        
        public final List<results> results{get;set;} // for Result array
        public  final Info info{get;set;}
       // public JSONData(results )
        
    }
    
    //lets create result object  i.e inner class
    public class results{
        
        public final string gender{get;set;}
        public list<Name> name{get;set;}
        public final Location location{get;set;}
        public final string email{get;set;}
        public final Login login{get;set;}
        public final  Dob dob{get;set;}
        public final Registered registered{get;set;}
        public final string phone{get;set;}
        public final string cell{get;set;}
        public  final Id  id{get;set;}
        public final Picture picture{get;set;}
        public final string nat{get;set;}
    }
    
    public class Name{
        
        public final string title{get;set;}
        public final string first{get;set;}
        public final string last{get;set;}
    }
    
    public class Location{
        
        
        public final string street{get;set;}
        public final string city{get;set;}
        public final string state{get;set;}
        public final string postcode{get;set;}
        public final Cordinates coordinates{get;set;}
        public final string timezone{get;set;}
        
    }
    
    public class Cordinates{
        public final string latitude{get;set;}
        public final string longitude{get;set;}
    }
    
    public class timezone{
        public final string offset{get;set;}
        public final string description{get;set;}
        
    }
    
    public class Login{
        
        
        public final string uuid{get;set;}
        public final string username{get;set;}
        public final string password{get;set;}
        public final string salt{get;set;}
        public final string md5{get;set;}
        public final string sha1{get;set;}
        public final string sha256{get;set;}
        
    }
    
    public class dob{
        
        public final date date1{get;set;}
        public final string age{get;set;}
        
    }
    
    public class registered{
        
        public final date date1{get;set;}
        public final string age{get;set;}
    }
    
    public class id{
        
        public final string name{get;set;}
        public final string value{get;set;}
    }
    
    public class picture{
        
        public final string large{get;set;}
        public final string medium{get;set;}
        public final string thumbnail{get;set;}
        
    }
    
    public class Info{
        
        public final string seed{get;set;}
        public final string results{get;set;}
        public final string page{get;set;}
        public final string version{get;set;}
        
    }
}