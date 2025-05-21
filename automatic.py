import streamlit as st
import mysql.connector
import pandas as pd

st.title("Health Care Management System")
try:
   connect=mysql.connector.connect(host="localhost",user="root",password="sakthi7",database="Healthcare")
   cursor=connect.cursor()
   print("connected")
except:
   print("Not connected")

if "report" not in st.session_state:  
    try:
       cursor.execute("drop procedure if exists details;")
       Query1=""" create procedure report(in n varchar(30))
begin 
select Name,Hospital,Doctor,DateofAdmission,Discharge_Date,TestResults,BillingAmount from Patients as p
left join admissions a on a.Patient_Id=p.Patient_Id
left join billing b on b.Patient_Id=p.Patient_Id
left join medicalrecords m on m.Patient_Id=p.Patient_Id
where Name=n;
end """ 
       cursor.execute(Query1)
       connect.commit()
       st.session_state.report=True
    except Exception as e:
        st.error(f"Error procedure:{e}") 
 
name_input=st.text_input("Enter Patient Name:")

if name_input:
    try:
       cursor.callproc("report",(name_input,))
       for output in cursor.stored_results():
          data=output.fetchall()
          columns=[col[0] for col in output.description]
          result=pd.DataFrame(data,columns=columns)
          st.dataframe(result)
          file=result.to_csv(index=False)
          st.download_button("Report",file,"patient_report.csv")
    except Exception as e:
        st.error(f"Error fetching:{e}")      
cursor.close()
connect.close()        
    
    
    