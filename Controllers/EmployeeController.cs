using System;
using System.Collections.Generic;
using System.Data;
using System.Linq;
using System.Web;
using System.Web.Mvc;
using WebApplication1.Models;

namespace WebApplication1.Controllers
{
    public class EmployeeController : Controller
    {
        public ActionResult Index()
        {
            return View(Employee.List(2));
        }

        public ActionResult Create()
        {
            ViewData["Department"] = CommonConstant.BindDepartment();
            ViewData["Status"] = CommonConstant.BindStatus();
            return View();
        }

        [HttpPost]
        public ActionResult Create(Employee obj)
        {
            try
            {
                if (ModelState.IsValid)
                {
                    //Employee obj = new Employee();
                    //obj.Emp_Name = collection["Emp_Name"].ToString();
                    //obj.Emp_DOB = Convert.ToDateTime(collection["Emp_DOB"].ToString());
                    //obj.Emp_Department = Convert.ToDecimal(collection["Emp_Department"].ToString());
                    //obj.Emp_Status = Convert.ToInt32(collection["Emp_Status"].ToString());
                    Employee.Add(obj);
                    ViewBag.Message = "Employee Added Successfully";
                    return RedirectToAction("Index"); 
                }
                else
                    return View();
            }
            catch (Exception ex)
            {
                return View();
            }
        }

        public ActionResult Edit(decimal id)
        {
            ViewData["Department"] = CommonConstant.BindDepartment();
            ViewData["Status"] = CommonConstant.BindStatus();
            Employee obj = Employee.Find(id);
            if (obj != null)
                return View(obj);
            else
                return RedirectToAction("Index");
        }

        [HttpPost]
        public ActionResult Edit(decimal id, Employee employee)
        {
            try
            {
                if (ModelState.IsValid)
                {
                    Employee obj = Employee.Find(id);
                    if (obj != null)
                    {
                        obj = employee;
                        Employee.Update(obj);
                        ViewBag.Message = "Employee Updated Successfully";
                    }
                    return RedirectToAction("Index"); 
                }
                else
                    return View();
            }
            catch (Exception ex)
            {
                return View();
            }
        }

        public ActionResult Delete(decimal id)
        {
            try
            {
                Employee.Delete(id);
                EmployeeSalary.DeleteByEmployee(id);
                ViewBag.Message = "Employee Deleted Successfully";
                return RedirectToAction("Index");
            }
            catch (Exception ex)
            {
                return View();
            }
        }
    }
}
