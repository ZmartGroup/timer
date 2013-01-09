# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)


User.create(name: 'Kim', email: 'kim.fransman@gmail.com', password: 'password')
User.create(name: 'Micke', email: 'mikael.bjorkman@gmail.com', password: 'password')
User.create(name: 'Niklas', email: 'niklas.lun@gmail.com', password: 'password')
User.create(name: 'Adrian', email: 'adrian@zmartdev.co.za', password: 'password')
User.create(name: 'Quentin', email: 'quentin@zmartdev.co.za', password: 'password')

Category.create(name: 'PPM')
Category.create(name: 'Server Admin')
Category.create(name: 'Electricity Maintenance')
Category.create(name: 'Website')
Category.create(name: 'Support')
Category.create(name: 'Cohabitants')