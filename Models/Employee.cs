using System;
using System.Collections.Generic;
using System.ComponentModel.DataAnnotations;
using System.Data;
using System.Data.SqlClient;
using System.Linq;
using System.Web;
using System.Web.Mvc;

namespace WebApplication1.Models
{
    public class Employee
    {
        #region Properties
        [Display(Name = "Id")]
        [Key]
        public decimal Emp_Id { get; set; }

        [Display(Name = "Name")]
        [Required(ErrorMessage = "Name is required")]
        public string Emp_Name { get; set; }

        [Display(Name = "Date of Birth")]
        [Required(ErrorMessage = "Date of Birth is required")]
        [DisplayFormat(ApplyFormatInEditMode = true, DataFormatString = "{0:yyyy-MM-dd}")]
        [DataType(DataType.Date)]
        public DateTime Emp_DOB { get; set; }

        [Display(Name = "Department")]
        //[Required(ErrorMessage = "Department is required")]
        [Required(ErrorMessage = "{0} is required.")]
        public decimal Emp_Department { get; set; }

        [Display(Name = "Department")]
        public string Emp_DepartmentName { get; set; }

        [Display(Name = "Status")]
        public int Emp_Status { get; set; }
        #endregion

        #region Methods
        public static decimal Add(Employee obj)
        {
            decimal Id = 0;
            string cmdText = "AddEmployee_sp";
            SqlConnection con = new SqlConnection(CommonConstant.CONNECTIONSTRING);
            SqlCommand cmd = new SqlCommand(cmdText, con);
            cmd.CommandType = CommandType.StoredProcedure;
            cmd.Parameters.AddWithValue("Emp_Name", obj.Emp_Name);
            cmd.Parameters.AddWithValue("Emp_DOB", obj.Emp_DOB);
            cmd.Parameters.AddWithValue("Emp_Department", obj.Emp_Department);
            cmd.Parameters.AddWithValue("Emp_Status", obj.Emp_Status);
            con.Open();
            Id = Convert.ToDecimal(cmd.ExecuteScalar());
            con.Close();
            return Id;
        }

        public static List<Employee> List(int Status)
        {
            List<Employee> list = new List<Employee>();
            string cmdText = "ListEmployee_sp";
            SqlConnection con = new SqlConnection(CommonConstant.CONNECTIONSTRING);
            SqlCommand cmd = new SqlCommand(cmdText, con);
            cmd.CommandType = CommandType.StoredProcedure;
            cmd.Parameters.AddWithValue("Status", Status);
            SqlDataReader dr;
            con.Open();
            dr = cmd.ExecuteReader();
            while (dr.Read())
            {
                Employee obj = new Employee();
                obj.Emp_Id = Convert.ToDecimal(dr.GetValue(dr.GetOrdinal("Emp_Id")));
                obj.Emp_Name = Convert.ToString(dr.GetValue(dr.GetOrdinal("Emp_Name")));
                obj.Emp_DOB = Convert.ToDateTime(dr.GetValue(dr.GetOrdinal("Emp_DOB")));
                obj.Emp_Department = Convert.ToDecimal(dr.GetValue(dr.GetOrdinal("Emp_Department")));
                obj.Emp_DepartmentName = Convert.ToString(dr.GetValue(dr.GetOrdinal("Emp_DepartmentName")));
                obj.Emp_Status = Convert.ToInt32(dr.GetValue(dr.GetOrdinal("Emp_Status")));
                list.Add(obj);
            }
            if (!dr.IsClosed)
                dr.Close();
            con.Close();
            return list;
        }

        public static List<SelectListItem> ListEmployee(int Status)
        {
            List<SelectListItem> list = new List<SelectListItem>();
            string cmdText = "ListEmployee_sp";
            SqlConnection con = new SqlConnection(CommonConstant.CONNECTIONSTRING);
            SqlCommand cmd = new SqlCommand(cmdText, con);
            cmd.CommandType = CommandType.StoredProcedure;
            cmd.Parameters.AddWithValue("Status", Status);
            SqlDataReader dr;
            con.Open();
            dr = cmd.ExecuteReader();
            while (dr.Read())
            {
                SelectListItem obj = new SelectListItem();
                obj.Value = Convert.ToString(dr.GetValue(dr.GetOrdinal("Emp_Id")));
                obj.Text = Convert.ToString(dr.GetValue(dr.GetOrdinal("Emp_Name")));
                list.Add(obj);
            }
            if (!dr.IsClosed)
                dr.Close();
            con.Close();
            return list;
        }

        public static Employee Find(decimal Id)
        {
            Employee obj = null;
            string cmdText = "FindEmployee_sp";
            SqlConnection con = new SqlConnection(CommonConstant.CONNECTIONSTRING);
            SqlCommand cmd = new SqlCommand(cmdText, con);
            cmd.CommandType = CommandType.StoredProcedure;
            cmd.Parameters.AddWithValue("Emp_Id", Id);
            SqlDataReader dr;
            con.Open();
            dr = cmd.ExecuteReader();
            while (dr.Read())
            {
                obj = new Employee();
                obj.Emp_Id = Convert.ToDecimal(dr.GetValue(dr.GetOrdinal("Emp_Id")));
                obj.Emp_Name = Convert.ToString(dr.GetValue(dr.GetOrdinal("Emp_Name")));
                obj.Emp_DOB = Convert.ToDateTime(dr.GetValue(dr.GetOrdinal("Emp_DOB")));
                obj.Emp_Department = Convert.ToDecimal(dr.GetValue(dr.GetOrdinal("Emp_Department")));
                obj.Emp_DepartmentName = Convert.ToString(dr.GetValue(dr.GetOrdinal("Emp_DepartmentName")));
                obj.Emp_Status = Convert.ToInt32(dr.GetValue(dr.GetOrdinal("Emp_Status")));
            }
            if (!dr.IsClosed)
                dr.Close();
            con.Close();
            return obj;
        }

        public static int Update(Employee obj)
        {
            int count = 0;
            string cmdText = "UpdateEmployee_sp";
            SqlConnection con = new SqlConnection(CommonConstant.CONNECTIONSTRING);
            SqlCommand cmd = new SqlCommand(cmdText, con);
            cmd.CommandType = CommandType.StoredProcedure;
            cmd.Parameters.AddWithValue("Emp_Id", obj.Emp_Id);
            cmd.Parameters.AddWithValue("Emp_Name", obj.Emp_Name);
            cmd.Parameters.AddWithValue("Emp_DOB", obj.Emp_DOB);
            cmd.Parameters.AddWithValue("Emp_Department", obj.Emp_Department);
            cmd.Parameters.AddWithValue("Emp_Status", obj.Emp_Status);
            con.Open();
            count = cmd.ExecuteNonQuery();
            con.Close();
            return count;
        }

        public static int Delete(decimal Id)
        {
            int count = 0;
            string cmdText = "DeleteEmployee_sp";
            SqlConnection con = new SqlConnection(CommonConstant.CONNECTIONSTRING);
            SqlCommand cmd = new SqlCommand(cmdText, con);
            cmd.CommandType = CommandType.StoredProcedure;
            cmd.Parameters.AddWithValue("Emp_Id", Id);
            con.Open();
            count = cmd.ExecuteNonQuery();
            con.Close();
            return count;
        }
        #endregion
    }
}