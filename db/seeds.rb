# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)
  require 'json'
  require 'open-uri'
 i = 1	
 while i<=200
	puts url = "https://idfy.0x10.info/api/idfy-status?type=json&query=list_member&page=#{i}"
    data = JSON.load(open(url))
    members = data['members']
    
    members.each do |member|
      attributes = member
      Member.create(attributes)
    end
    puts i+=1
end    