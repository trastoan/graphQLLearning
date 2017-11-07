require 'test_helper'

class Resolvers::CreatePerformanceTest < ActiveSupport::TestCase
	def perform(artist: nil, **args)
		Resolvers::CreatePerformance.new.call(nil, args, current_user: artist)
	end

	test 'success' do 
		artist = create :artist
		performance = perform(
			title: 'Test Performance',
      		place: 'Nowhere',
      		about: 'Nothing',
      		artist: artist
		)

	assert performance.persisted?
	assert_equal performance.title, 'Test Performance'
	assert_equal performance.place, 'Nowhere'
	assert_equal performance.about, 'Nothing'
	assert_equal performance.artist, artist
	end
end
