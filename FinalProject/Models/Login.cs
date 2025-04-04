using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace FinalProject.Models
{
	public class Login
	{
        public string FirstName { get; set; }
        public string LastName { get; set; }

        public Login(string firstName, string lastName)
        {
            FirstName = firstName;
            LastName = lastName;
        }
    }
}