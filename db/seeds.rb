# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

#creating dummy data for login 
%w(manager employee).each do |a|
	use = User.new
	use.email = "#{a}@gmail.com"
	use.password = 'leavesystem'
	use.password_confirmation = 'leavesystem'
	use.role = a.to_s
	use.name = a.to_s
	use.save

	puts "#{a} has been created successfully"
end