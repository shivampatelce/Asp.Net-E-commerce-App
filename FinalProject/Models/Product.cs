using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace FinalProject.Models
{
	public class Product
	{
		public int ProductID { get; set; }
		public string Name { get; set; }
		public string Brand { get; set; }
		public string ModelName { get; set; }
		public int Price { get; set; }

		public Product(int ProductID, string  Name, string Brand, string ModelName, int Price)
		{
			this.ProductID = ProductID;
			this.Name = Name;
			this.Brand = Brand;
			this.ModelName = ModelName;
			this.Price = Price;
		}
	}
}