using Bogus;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using static MockData.Person;

namespace MockData
{
    public class DataGenerator
    {
        //public static Faker<Vehicle> GetVehicleGenerator(Guid employeeId)
        //{
        //    return new Faker<Vehicle>()
        //        .RuleFor(v => v.Id, _ => Guid.NewGuid())
        //        .RuleFor(v => v.EmployeeId, _ => employeeId)
        //        .RuleFor(v => v.Manufacturer, f => f.Vehicle.Manufacturer())
        //        .RuleFor(v => v.Fuel, f => f.Vehicle.Fuel());
        //}
        //public static Faker<Employee> GetEmployeeGenerator()
        //{
        //    return new Faker<Employee>()
        //        .RuleFor(e => e.Id, _ => Guid.NewGuid())
        //        .RuleFor(e => e.FirstName, f => f.Name.FirstName())
        //        .RuleFor(e => e.LastName, f => f.Name.LastName())
        //        .RuleFor(e => e.Address, f => f.Address.FullAddress())
        //        .RuleFor(e => e.Email, (f, e) => f.Internet.Email(e.FirstName, e.LastName))
        //        .RuleFor(e => e.AboutMe, f => f.Lorem.Paragraph(1))
        //        .RuleFor(e => e.YearsOld, f => f.Random.Int(18, 90))
        //        .RuleFor(e => e.Personalit, f => f.PickRandom<Personality>())
        //        .RuleFor(e => e.Vehicles, (_, e) =>
        //        {
        //            return GetBogusVehicleData(e.Id);
        //        });
        //}

        //private static object GetBogusVehicleData(object id)
        //{
        //    throw new NotImplementedException();
        //}

        //public static readonly List<Employee> Employees = new();
        //public static readonly List<Vehicle> Vehicles = new();
        //public const int NumberOfEmployees = 5;
        //public const int NumberOfVehiclesPerEmployee = 2;

        //private static List<Vehicle> GetBogusVehicleData(Guid employeeId)
        //{
        //    var vehicleGenerator = GetVehicleGenerator(employeeId);
        //    var generatedVehicles = vehicleGenerator.Generate(NumberOfVehiclesPerEmployee);
        //    Vehicles.AddRange(generatedVehicles);
        //    return generatedVehicles;
        //}
        //public static void InitBogusData()
        //{
        //    var employeeGenerator = GetEmployeeGenerator();
        //    var generatedEmployees = employeeGenerator.Generate(NumberOfEmployees);
        //    Employees.AddRange(generatedEmployees);
        //}
        public static Faker<Person> GetPersonGenerator()
        {
            return new Faker<Person>()
                .RuleFor(e => e.FirstName, f => f.Name.FirstName())
                .RuleFor(e => e.LastName, f => f.Name.LastName())
                .RuleFor(e => e.DateFBirth, f => f.Person.DateOfBirth)
                .RuleFor(e => e.GenderSelection, f => f.Person.Gender.ToString())
                .RuleFor(e => e.Bio, f => f.Lorem.Paragraph(1))
                .RuleFor(e => e.Email, (f, e) => f.Internet.Email(e.FirstName, e.LastName))
                /*.RuleFor(e => e.Created, f => f.PickRandom)*/
                .RuleFor(e => e.Modified, f => f.Date.Recent())
                .RuleFor(e => e.ModifiedBy, (f, e) => f.Name.FirstName());

        }
        public static readonly List<Person> Persons = new List<Person>();
        public const int NumOfPeople = 7;
        public static void ResultData()
        {
            var generated = GetPersonGenerator();
            var generatedU = generated.Generate(NumOfPeople);
            Persons.AddRange(generatedU);
        }
    }
}
