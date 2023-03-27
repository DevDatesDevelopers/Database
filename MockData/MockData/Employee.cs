using Newtonsoft.Json;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Text.Json;
using System.Threading.Tasks;

namespace MockData
{
    public sealed class Person 
    {
        //public Guid Id { get; set; }
        //public string FirstName { get; set; }  
        //public string LastName { get; set; }
        //public string Address { get; set; }
        //public string Email { get; set; }
        //public string AboutMe { get; set; }
        //public int YearsOld { get; set; }
        //public Personality Personalit { get; set; }
        //public List<Vehicle> Vechiles { get; set; } = default!;
        //public object Vehicles { get; internal set; }

        //public override string ToString()
        //{
        //    return System.Text.Json.JsonSerializer.Serialize(this, new JsonSerializerOptions { WriteIndented = true });
        //}
        //public enum Personality
        //{
        //    Positive,
        //    Negative,
        //    Neutral
        //}
        //public sealed class Vehicle
        //{
        //    public Guid Id { get; set; }
        //    public Guid EmployeeId { get; set; }
        //    public string Manufacturer { get; set; } = default!;
        //    public string Fuel { get; set; } = default!;
        //    public override string ToString()
        //    {
        //        return System.Text.Json.JsonSerializer.Serialize(this, new JsonSerializerOptions { WriteIndented = true });
        //    }
        //}
        public string FirstName { get; set; }
        public string LastName { get; set; }
        public DateTime DateFBirth { get; set; }
        public string GenderSelection { get; set; }
        public string Bio { get; set; }
        public string Email { get; set; }
        public DateTime Created { get; set; }
        public DateTime Modified { get; set; }
        public string ModifiedBy { get; set; }

        //public static Bogus.DataSets.Name.Gender Gender
        public override string ToString()
        {
            return System.Text.Json.JsonSerializer.Serialize(this, new JsonSerializerOptions { WriteIndented = true });
        }
    }
}
