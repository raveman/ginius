# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

# creating default roles
['registered', 'admin', 'banned', 'manager'].each do |role|
	Role.find_or_create_by({name: role})
end

raveman = User.create(email: "raveman@raveman.ru", password: "welcome123", first_name:"Bob", last_name: "Ershov")
ar = Role.find_by_name(:admin)
raveman.role = [ar]
raveman.save!

admin = User.create(email: "admin@ginius.ru", password: "giniuswelcome")
admin.role = [ar]
admin.save!