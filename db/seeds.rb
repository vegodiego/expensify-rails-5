# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

today = Date.today                       
yesterday = Date.today - 1.days
day1 = Date.today - 2.days
day2 = Date.today - 3.days
day3 = Date.today - 4.days



Expense.create(kind: "Transfer", concept: "Transfer0", category: "Travel", amount: 300000, created_at: day3.strftime("%FT%T%:z"), updated_at: day3.strftime("%FT%T%:z"))
Expense.create(kind: "Payment", concept: "Payment0", category: "Fun", amount: 100000, created_at: day2.strftime("%FT%T%:z"), updated_at: day2.strftime("%FT%T%:z"))
Expense.create(kind: "Withdrawal", concept: "Withdrawal0", category: "Education", amount: 100000, created_at: day1.strftime("%FT%T%:z"), updated_at: day1.strftime("%FT%T%:z"))
Expense.create(kind: "Payment", concept: "Payment1", category: "Home", amount: 200000, created_at: yesterday.strftime("%FT%T%:z"), updated_at: yesterday.strftime("%FT%T%:z"))
Expense.create(kind: "Purchase", concept: "Purchase0", category: "Services", amount: 400000, created_at: today.strftime("%FT%T%:z"), updated_at: today.strftime("%FT%T%:z"))

Expense.create(kind: "Withdrawal", concept: "Withdrawal1", category: "Grocery", amount: 200000, created_at: "2020-03-09 23:40:21", updated_at: "2020-03-09 23:40:21")
Expense.create(kind: "Purchase", concept: "Purchase1", category: "Restaurants", amount: 100000, created_at: "2020-03-19 23:40:21", updated_at: "2020-03-19 23:40:21")

Expense.create(kind: "Payment", concept: "Payment2", category: "Services", amount: 400000, created_at: "2020-02-05 23:40:21", updated_at: "2020-02-05 23:40:21")
Expense.create(kind: "Transfer", concept: "Transfer1", category: "Car", amount: 300000, created_at: "2020-02-19 23:40:21", updated_at: "2020-02-19 23:40:21")

Expense.create(kind: "Payment", concept: "Payment2", category: "Travel", amount: 400000, created_at: "2020-01-07 23:40:21", updated_at: "2020-01-07 23:40:21")
Expense.create(kind: "Transfer", concept: "Transfer2", category: "Fun", amount: 300000, created_at: "2020-01-15 23:40:21", updated_at: "2020-01-15 23:40:21")
Expense.create(kind: "Withdrawal", concept: "Withdrawal2", category: "Education", amount: 200000, created_at: "2020-01-19 23:40:21", updated_at: "2020-01-19 23:40:21")
Expense.create(kind: "Purchase", concept: "Purchase2", category: "Home", amount: 100000, created_at: "2020-01-25 23:40:21", updated_at: "2020-01-25 23:40:21")

Expense.create(kind: "Payment", concept: "Payment4", category: "Restaurants", amount: 100000, created_at: "2019-12-13 23:40:21", updated_at: "2019-12-13 23:40:21")

Expense.create(kind: "Withdrawal", concept: "Withdrawal3", category: "Car", amount: 300000, created_at: "2019-11-09 23:40:21", updated_at: "2019-11-09 23:40:21")
Expense.create(kind: "Transfer", concept: "Transfer3", category: "Grocery", amount: 200000, created_at: "2019-11-19 23:40:21", updated_at: "2019-11-19 23:40:21")

Expense.create(kind: "Purchase", concept: "Purchase3", category: "Services", amount: 400000, created_at: "2019-10-02 23:40:21", updated_at: "2019-10-02 23:40:21")

Expense.create(kind: "Payment", concept: "Payment5", category: "Home", amount: 100000, created_at: "2019-08-19 23:40:21", updated_at: "2019-08-19 23:40:21")

Expense.create(kind: "Purchase", concept: "Purchase4", category: "Travel", amount: 400000, created_at: "2019-06-01 23:40:21", updated_at: "2019-06-01 23:40:21")
Expense.create(kind: "Withdrawal", concept: "Withdrawal4", category: "Fun", amount: 300000, created_at: "2019-06-05 23:40:21", updated_at: "2019-06-05 23:40:21")
Expense.create(kind: "Transfer", concept: "Transfer4", category: "Education", amount: 200000, created_at: "2019-06-19 23:40:21", updated_at: "2019-06-19 23:40:21")








