require 'search_object/plugin/graphql'

class Resolvers::PerformanceSearch
	include SearchObject.module(:graphql)

	scope { Performance.all }


	type !types[Types::PerformanceType]

	PerformanceFilter = GraphQL::InputObjectType.define do
		name 'PerformanceFilter'

		argument :OR, -> { types[PerformanceFilter] }

		argument :title_contains, types.String
		argument :about_contains, types.String
		argument :place_contains, types.String
	end

	option :filter, type: PerformanceFilter, with: :apply_filter
	option :first, type: types.Int, with: :apply_first
	option :skip, type: types.Int, with: :apply_skip

	def apply_first(scope, value)
		scope.limit(value)
	end


	def apply_skip(scope, value)
		scope.offset(value)
	end


	def apply_filter(scope, value)
		branches = normalize_filters(value).reduce { |a, b| a.or(b) }
		scope.merge branches
	end

	def normalize_filters(value, branches = [])
		scope = Performance.all

		scope = scope.where('title Like ?', "%#{value['title_contains']}%") if value['title_contains']
		scope = scope.where('about Like ?', "%#{value['about_contains']}%") if value['about_contains']
		scope = scope.where('place Like ?', "%#{value['place_contains']}%") if value['place_contains']

		branches << scope

		value['OR'].reduce(branches) { |s, v| normalize_filters(v,s) } if value['OR'].present?

		branches
	end



end
