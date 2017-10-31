class Resolvers::CreatePerformance < GraphQL::Function 
	argument :title, !types.String
	argument :about, !types.String
	argument :place, !types.String

	type Types::PerformanceType

	def call(_obj, args, _ctx) 
		Performance.create!(
			title: args[:title],
			about: args[:about],
			place: args[:place]
		)
	end
end