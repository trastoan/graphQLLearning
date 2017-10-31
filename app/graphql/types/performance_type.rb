Types::PerformanceType = GraphQL::ObjectType.define do
	name 'Performance'

	field :id, !types.ID
	field :title, !types.String
	field :place, !types.String
	field :about, !types.String

end
