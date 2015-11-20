class Member < ActiveRecord::Base
	def self.ethnic()
		et = ['Asian',
		'Indian',
		'African Americans',
		'Asian Americans',
		'European',
		'British',
		'Jewish',
		'Latino',
		'Native American',
		'Arabic']
	end
end
