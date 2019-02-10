# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
BillList.create(title: 'Lunch in McD Bangalore', description: 'On Saturday, 9 February 2019')

BillItem.create([
  {
    user: "Aguero",
    paid_amount: "10",
    bill_list_id: 1
  },
  {
    user: "Sterling",
    paid_amount: "10",
    bill_list_id: 1
  },
  {
    user: "Morata",
    paid_amount: "5",
    bill_list_id: 1
  },
  {
    user: "Otamendi",
    paid_amount: "50",
    bill_list_id: 1
  },
  {
    user: "Gabriel",
    paid_amount: "25",
    bill_list_id: 1
  }
])