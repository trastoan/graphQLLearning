require 'test_helper'

class Resolvers::PerformanceSearchTest < ActiveSupport::TestCase
	def find(args)
		Resolvers::PerformanceSearch.call(nil, args, nil) 
	end

	test 'skip option' do
		performance = create :performance, title: 'old'
		
		create :performance, title: 'new'

		assert_equal find(skip: 1), [performance]
	end

	test 'first option' do
		performance = create :performance, title: 'old'
		
		create :performance, title: 'new'

		assert_equal find(first: 1), [performance]		
	end

	test 'filter option' do
		performance1 = create :performance, title: 'perf1', about: 'per1 about', place: 'street 1'
		performance2 = create :performance, title: 'perf2', about: 'per2 about', place: 'street 2'
		performance3 = create :performance, title: 'perf3', about: 'per3 about', place: 'street 3'

		result = find(
			filter: {
				'title_contains' => 'perf1', 
				'OR' => [{
					'place_contains' => 'street 2',
					'OR' => [{
						'about_contains' => 'per3'
					}]
				}, {
				'title_contains' => 'perf2'
				}]
			}
		)

		assert_equal result.map(&:title).sort, [performance1, performance2, performance3].map(&:title).sort
	end
end