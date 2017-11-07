require 'test_helper'

class Resolvers::CreateApplauseTest < ActiveSupport::TestCase
	def perform(artist: nil, **args) 
		Resolvers::CreateApplause.new.call(nil, args, current_user: artist)
	end

	def record_id(record)
		GraphQLLearningSchema.id_from_object(record, nil, nil)
	end

	test 'success' do
		artist = create :artist
		performance = create :performance

		applause = perform(
			artist: artist, 
			performanceId: record_id(performance)
		)

		assert applause.persisted?
		assert_equal applause.artist, artist
		assert_equal applause.performance, performance
	end

	test 'failure' do
		assert perform.is_a? GraphQL::ExecutionError
	end

end