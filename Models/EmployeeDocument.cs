using System;
using System.Collections.Generic;
using System.ComponentModel.DataAnnotations;
using System.Data;
using System.Data.SqlClient;
using System.Linq;
using System.Web;

namespace WebApplication1.Models
{
    public class EmployeeDocument
    {
        #region Properties
        [Display(Name = "Id")]
        [Key]
        public decimal EmpDoc_Id { get; set; }

        [Display(Name = "Employee")]
        [Required(ErrorMessage = "Employee is required")]
        public decimal EmpDoc_Employee { get; set; }

        [Display(Name = "Employee Name")]
        public string EmpDoc_EmployeeName { get; set; }

        [Display(Name = "Document Type")]
        [Required(ErrorMessage = "Document Type is required")]
        public decimal EmpDoc_Type { get; set; }

        [Display(Name = "Document Type")]
        public string EmpDoc_TypeName { get; set; }

        [Display(Name = "Document")]
        public string EmpDoc_File { get; set; }

        public HttpPostedFileBase EmpDoc_FileUpload { get; set; }

        [Display(Name = "Status")]
        public int EmpDoc_Status { get; set; }
        #endregion

        #region Methods
        public static decimal Add(EmployeeDocument obj)
        {
            decimal Id = 0;
            string cmdText = "AddEmployeeDocument_sp";
            SqlConnection con = new SqlConnection(CommonConstant.CONNECTIONSTRING);
            SqlCommand cmd = new SqlCommand(cmdText, con);
            cmd.CommandType = CommandType.StoredProcedure;
            cmd.Parameters.AddWithValue("EmpDoc_Employee", obj.EmpDoc_Employee);
            cmd.Parameters.AddWithValue("EmpDoc_Type", obj.EmpDoc_Type);
            cmd.Parameters.AddWithValue("EmpDoc_File", obj.EmpDoc_File);
            cmd.Parameters.AddWithValue("EmpDoc_Status", obj.EmpDoc_Status);
            con.Open();
            Id = Convert.ToDecimal(cmd.ExecuteScalar());
            con.Close();
            return Id;
        }

        public static List<EmployeeDocument> FindByEmployee(decimal Id)
        {
            List<EmployeeDocument> list = new List<EmployeeDocument>();
            string cmdText = "FindEmployeeDocumentByEmployee_sp";
            SqlConnection con = new SqlConnection(CommonConstant.CONNECTIONSTRING);
            SqlCommand cmd = new SqlCommand(cmdText, con);
            cmd.CommandType = CommandType.StoredProcedure;
            cmd.Parameters.AddWithValue("EmpDoc_Employee", Id);
            SqlDataReader dr;
            con.Open();
            dr = cmd.ExecuteReader();
            while (dr.Read())
            {
                EmployeeDocument obj = new EmployeeDocument();
                obj.EmpDoc_Id = Convert.ToDecimal(dr.GetValue(dr.GetOrdinal("EmpDoc_Id")));
                obj.EmpDoc_Employee = Convert.ToDecimal(dr.GetValue(dr.GetOrdinal("EmpDoc_Employee")));
                obj.EmpDoc_EmployeeName = Convert.ToString(dr.GetValue(dr.GetOrdinal("EmpDoc_EmployeeName")));
                obj.EmpDoc_Type = Convert.ToDecimal(dr.GetValue(dr.GetOrdinal("EmpDoc_Type")));
                obj.EmpDoc_TypeName = Convert.ToString(dr.GetValue(dr.GetOrdinal("EmpDoc_TypeName")));
                obj.EmpDoc_File = Convert.ToString(dr.GetValue(dr.GetOrdinal("EmpDoc_File")));
                obj.EmpDoc_Status = Convert.ToInt32(dr.GetValue(dr.GetOrdinal("EmpDoc_Status")));
                list.Add(obj);
            }
            if (!dr.IsClosed)
                dr.Close();
            con.Close();
            return list;
        }

        public static List<EmployeeDocument> List()
        {
            List<EmployeeDocument> list = new List<EmployeeDocument>();
            string cmdText = "ListEmployeeDocument_sp";
            SqlConnection con = new SqlConnection(CommonConstant.CONNECTIONSTRING);
            SqlCommand cmd = new SqlCommand(cmdText, con);
            cmd.CommandType = CommandType.StoredProcedure;
            SqlDataReader dr;
            con.Open();
            dr = cmd.ExecuteReader();
            while (dr.Read())
            {
                EmployeeDocument obj = new EmployeeDocument();
                obj.EmpDoc_Id = Convert.ToDecimal(dr.GetValue(dr.GetOrdinal("EmpDoc_Id")));
                obj.EmpDoc_Employee = Convert.ToDecimal(dr.GetValue(dr.GetOrdinal("EmpDoc_Employee")));
                obj.EmpDoc_EmployeeName = Convert.ToString(dr.GetValue(dr.GetOrdinal("EmpDoc_EmployeeName")));
                obj.EmpDoc_Type = Convert.ToDecimal(dr.GetValue(dr.GetOrdinal("EmpDoc_Type")));
                obj.EmpDoc_TypeName = Convert.ToString(dr.GetValue(dr.GetOrdinal("EmpDoc_TypeName")));
                obj.EmpDoc_File = Convert.ToString(dr.GetValue(dr.GetOrdinal("EmpDoc_File")));
                obj.EmpDoc_Status = Convert.ToInt32(dr.GetValue(dr.GetOrdinal("EmpDoc_Status")));
                list.Add(obj);
            }
            if (!dr.IsClosed)
                dr.Close();
            con.Close();
            return list;
        }

        public static EmployeeDocument Find(decimal Id)
        {
            EmployeeDocument obj = null;
            string cmdText = "FindEmployeeDocument_sp";
            SqlConnection con = new SqlConnection(CommonConstant.CONNECTIONSTRING);
            SqlCommand cmd = new SqlCommand(cmdText, con);
            cmd.CommandType = CommandType.StoredProcedure;
            cmd.Parameters.AddWithValue("EmpDoc_Id", Id);
            SqlDataReader dr;
            con.Open();
            dr = cmd.ExecuteReader();
            while (dr.Read())
            {
                obj = new EmployeeDocument();
                obj.EmpDoc_Id = Convert.ToDecimal(dr.GetValue(dr.GetOrdinal("EmpDoc_Id")));
                obj.EmpDoc_Employee = Convert.ToDecimal(dr.GetValue(dr.GetOrdinal("EmpDoc_Employee")));
                obj.EmpDoc_EmployeeName = Convert.ToString(dr.GetValue(dr.GetOrdinal("EmpDoc_EmployeeName")));
                obj.EmpDoc_Type = Convert.ToDecimal(dr.GetValue(dr.GetOrdinal("EmpDoc_Type")));
                obj.EmpDoc_TypeName = Convert.ToString(dr.GetValue(dr.GetOrdinal("EmpDoc_TypeName")));
                obj.EmpDoc_File = Convert.ToString(dr.GetValue(dr.GetOrdinal("EmpDoc_File")));
                obj.EmpDoc_Status = Convert.ToInt32(dr.GetValue(dr.GetOrdinal("EmpDoc_Status")));
            }
            if (!dr.IsClosed)
                dr.Close();
            con.Close();
            return obj;
        }

        public static int Update(EmployeeDocument obj)
        {
            int count = 0;
            string cmdText = "UpdateEmployeeDocument_sp";
            SqlConnection con = new SqlConnection(CommonConstant.CONNECTIONSTRING);
            SqlCommand cmd = new SqlCommand(cmdText, con);
            cmd.CommandType = CommandType.StoredProcedure;
            cmd.Parameters.AddWithValue("EmpDoc_Id", obj.EmpDoc_Id);
            cmd.Parameters.AddWithValue("EmpDoc_Employee", obj.EmpDoc_Employee);
            cmd.Parameters.AddWithValue("EmpDoc_Type", obj.EmpDoc_Type);
            cmd.Parameters.AddWithValue("EmpDoc_File", obj.EmpDoc_File);
            cmd.Parameters.AddWithValue("EmpDoc_Status", obj.EmpDoc_Status);
            con.Open();
            count = cmd.ExecuteNonQuery();
            con.Close();
            return count;
        }

        public static int Delete(decimal Id)
        {
            int count = 0;
            string cmdText = "DeleteEmployeeDocument_sp";
            SqlConnection con = new SqlConnection(CommonConstant.CONNECTIONSTRING);
            SqlCommand cmd = new SqlCommand(cmdText, con);
            cmd.CommandType = CommandType.StoredProcedure;
            cmd.Parameters.AddWithValue("EmpDoc_Id", Id);
            con.Open();
            count = cmd.ExecuteNonQuery();
            con.Close();
            return count;
        }

        public static int DeleteByEmployee(decimal Id)
        {
            int count = 0;
            string cmdText = "DeleteEmployeeDocumentByEmployee_sp";
            SqlConnection con = new SqlConnection(CommonConstant.CONNECTIONSTRING);
            SqlCommand cmd = new SqlCommand(cmdText, con);
            cmd.CommandType = CommandType.StoredProcedure;
            cmd.Parameters.AddWithValue("EmpDoc_Employee", Id);
            con.Open();
            count = cmd.ExecuteNonQuery();
            con.Close();
            return count;
        }
        #endregion
    }
}