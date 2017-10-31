require 'test_helper'

class Resolvers::CreatePerformanceTest < ActiveSupport::TestCase
	def perform(args = {})
		Resolvers::CreatePerformance.new.call(nil, args, nil)
	end

	test 'success' do 
		performance = perform(
			title: 'Test Performance',
      		place: 'Nowhere',
      		about: 'Nothing'
		)

	assert performance.persisted?
	assert_equal performance.title, 'Test Performance'
	assert_equal performance.place, 'Nowhere'
	assert_equal performance.about, 'Nothing'
	end
end
