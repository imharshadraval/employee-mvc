using System;
using System.Collections.Generic;
using System.Configuration;
using System.Linq;
using System.Web;
using System.Web.Mvc;
using System.Web.UI.WebControls;

namespace WebApplication1.Models
{
    public class CommonConstant
    {
        public static string CONNECTIONSTRING = ConfigurationManager.ConnectionStrings["connectionString"].ToString();

        public static List<SelectListItem> BindDepartment()
        {
            List<SelectListItem> listItems = new List<SelectListItem>();

            try
            {
                SelectListItem item = new SelectListItem();
                //item.Value = "0";
                //item.Text = "--Select--";
                //listItems.Add(item);

                item = new SelectListItem();
                item.Value = "1";
                item.Text = "Software Developer";
                listItems.Add(item);

                item = new SelectListItem();
                item.Value = "2";
                item.Text = "Support";
                listItems.Add(item);
            }
            catch (Exception)
            {
                throw;
            }

            return listItems;
        }

        public static List<SelectListItem> BindStatus()
        {
            List<SelectListItem> listItems = new List<SelectListItem>();

            try
            {
                SelectListItem item = new SelectListItem();
                item.Value = "1";
                item.Text = "Active";
                listItems.Add(item);

                item = new SelectListItem();
                item.Value = "0";
                item.Text = "Inactive";
                listItems.Add(item);
            }
            catch (Exception)
            {
                throw;
            }

            return listItems;
        }
    }
}