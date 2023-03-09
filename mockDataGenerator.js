const sql = require('mssql');
const faker = require('faker');

const config = {
  server: 'localhost',
  database: 'mydb',
  user: 'sa',
  password: 'mypassword',
  options: {
    enableArithAbort: true,
    trustServerCertificate: true,
  },
};

async function connect() {
  try {
    await sql.connect(config);
    console.log('Connected to the database');
  } catch (error) {
    console.error(error);
  }
}

async function insertGenders() {
  const genders = [
    { DisplayName: 'Male' },
    { DisplayName: 'Female' },
    { DisplayName: 'Non-binary' },
  ];

  for (let gender of genders) {
    try {
      await sql.query`
        INSERT INTO Genders (DisplayName, Created, Modified, ModifiedBy)
        VALUES (${gender.DisplayName}, GETDATE(), GETDATE(), 'Admin')
      `;
      console.log(`Inserted gender ${gender.DisplayName}`);
    } catch (error) {
      console.error(error);
    }
  }
}

async function insertUsers() {
  const genders = await sql.query`SELECT Id FROM Genders`;

  for (let i = 0; i < 10; i++) {
    const name = faker.name.findName();
    const dob = faker.date.past(50);
    const genderId = faker.random.arrayElement(genders.recordset).Id;
    const bio = faker.lorem.sentence();
    const email = faker.internet.email();
    try {
      await sql.query`
        INSERT INTO Users (Name, DateOfBirth, GenderId, Bio, Email, Created, Modified, ModifiedBy)
        VALUES (${name}, ${dob.toISOString()}, ${genderId}, ${bio}, ${email}, GETDATE(), GETDATE(), 'Admin')
      `;
      console.log(`Inserted user ${name}`);
    } catch (error) {
      console.error(error);
    }
  }
}

connect()
  .then(insertGenders)
  .then(insertUsers)
  .catch((error) => console.error(error));
