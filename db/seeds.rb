# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

users = User.create([
  {
    type: "Student",
    firstname: "Antonio",
    lastname: "Stud",
    email: "a@stud.it",
    email_confirmation: "a@stud.it",
    password: "Miao1.",
    password_confirmation: "Miao1.",
    birthday: "09/09/1995",
    state: "Italy",
    city: "Rome",
    address: "Via Roma, 8"
  },
  {
    type: "Student",
    firstname: "Joao",
    lastname: "Stud",
    email: "a@stud.br",
    email_confirmation: "a@stud.br",
    password: "Miao1.",
    password_confirmation: "Miao1.",
    birthday: "09/09/1995",
    state: "Brazil",
    city: "Sao Paulo",
    address: "Rua dos meninos"
  },
  {
    type: "Volunteer",
    firstname: "Best",
    lastname: "Vol",
    email: "a@vol.it",
    email_confirmation: "a@vol.it",
    password: "Miao1.",
    password_confirmation: "Miao1.",
    birthday: "09/09/1995",
    state: "Italy",
    city: "Rome",
    address: "Via Roma, 8"
  },
  {
    type: "Family",
    firstname: "Cenci",
    lastname: "Fam",
    email: "a@fam.br",
    email_confirmation: "a@fam.br",
    password: "Miao1.",
    password_confirmation: "Miao1.",
    birthday: "09/09/1995",
    state: "Brazil",
    city: "Rio de Janeiro",
    address: "Rua de casa"
  }
])

users.each do |user|
  user.email_activate
end
