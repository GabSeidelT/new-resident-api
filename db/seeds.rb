@resident_admin = Resident.create(name: "admin",
    email: "admin@gmail.com", 
    whatsapp: 49984033000,
    registration_id: 12312312,
    initial_date: Date.parse('2016-08-20'),
    final_date: Date.parse('2016-08-20'),
    )
@resident_admin = Resident.create(name: "user",
    email: "user@gmail.com", 
    whatsapp: 49984033000,
    registration_id: 12312312,
    initial_date: Date.parse('2016-08-20'),
    final_date: Date.parse('2016-08-20'),
    )

User.create(email: "admin@gmail.com",
    password: 123123,
    resident_id: @resident_admin.id,
    status: 1)
User.create(email: "user@gmail.com",
    password: 123123,
    resident_id: 2)

Company.create({
    name: "Teste1",
    website: "teste.com",
    email: "tetes@teste.com",
    lat: "-28.094055594591385",
    long: "-59.666432075954965",
    telephone: "12341234"
})
Company.create({
    name: "Teste2",
    website: "teste.com",
    email: "tetes@teste.com",
    lat: "-30.094055594591385",
    long: "-89.666432075954965",
    telephone: "12341234"
})