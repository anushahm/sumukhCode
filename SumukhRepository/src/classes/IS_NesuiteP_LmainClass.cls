public class IS_NesuiteP_LmainClass {
    
    public class ProjectNetsuiteP_LResponseObjectClass{
        public final Boolean Status;
        public final NetsuiteP_LListdataResponseObjectClass Data;
        public ProjectNetsuiteP_LResponseObjectClass(NetsuiteP_LListdataResponseObjectClass Data, Boolean Status){
            this.Data = Data;
            this.Status = Status;
        }
    }
    public class NetsuiteP_LListdataResponseObjectClass{
        public final List<NetsuiteP_LdataResponseObjectClass> Revenue;
        public final List<NetsuiteP_LdataResponseObjectClass> Discount;
        public final List<NetsuiteP_LdataResponseObjectClass> People_Cost_Employee;
        public final List<NetsuiteP_LdataResponseObjectClass> People_Cost_Contractor;
        public final List<NetsuiteP_LdataResponseObjectClass> Facility_Cost;
        public final List<NetsuiteP_LdataResponseObjectClass> Other_Cost_Travel;
        public final List<NetsuiteP_LdataResponseObjectClass> Other_Cost_Immigration;
        public final List<NetsuiteP_LdataResponseObjectClass> Other_Cost_Professional_Fees;
        public final List<NetsuiteP_LdataResponseObjectClass> Other_Cost_Others;
        public NetsuiteP_LListdataResponseObjectClass(List<NetsuiteP_LdataResponseObjectClass> Revenue,List<NetsuiteP_LdataResponseObjectClass> Discount,
                                                      List<NetsuiteP_LdataResponseObjectClass> People_Cost_Employee,List<NetsuiteP_LdataResponseObjectClass> People_Cost_Contractor,
                                                      List<NetsuiteP_LdataResponseObjectClass> Facility_Cost,List<NetsuiteP_LdataResponseObjectClass> Other_Cost_Travel,
                                                      List<NetsuiteP_LdataResponseObjectClass> Other_Cost_Immigration,List<NetsuiteP_LdataResponseObjectClass> Other_Cost_Professional_Fees,
                                                      List<NetsuiteP_LdataResponseObjectClass> Other_Cost_Others ){
                                                          this.Revenue = Revenue; 
                                                          this.Discount = Discount;
                                                          this.People_Cost_Employee = People_Cost_Employee; 
                                                          this.People_Cost_Contractor = People_Cost_Contractor;
                                                          this.Facility_Cost = Facility_Cost; 
                                                          this.Other_Cost_Travel = Other_Cost_Travel;
                                                          this.Other_Cost_Immigration = Other_Cost_Immigration; 
                                                          this.Other_Cost_Professional_Fees = Other_Cost_Professional_Fees; 
                                                          this.Other_Cost_Others = Other_Cost_Others;                                               
                                                      }
    }
    
    
    public class NetsuiteP_LdataResponseObjectClass {
        public final String project_id;
        public final String period;
        public final String amount;
        public final String num;
        public final String sub_practice;
        public final String practice;
        public final String type;
        public final String dt;
        public final String s_customer;
        public final String s_region;
        public final String s_subsidiary;
        public final String s_account_name;
        
        public NetsuiteP_LdataResponseObjectClass(String project_id,String period,String amount,String num,String sub_practice,String practice,
                                                  String type,String dt,String s_customer,String s_region,String s_subsidiary,String s_account_name){
                                                      this.project_id = project_id;
                                                      this.period = period;
                                                      this.amount = amount;
                                                      this.num = num;
                                                      this.sub_practice = sub_practice;
                                                      this.practice = practice;
                                                      this.type = type;
                                                      this.dt = dt;
                                                      this.s_customer = s_customer;
                                                      this.s_region = s_region;
                                                      this.s_subsidiary=s_subsidiary;
                                                      this.s_account_name = s_account_name;
                                                  }                                    
        
    }
}