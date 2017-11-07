class Resolvers::CreateApplause < GraphQL::Function
	argument :performanceId, types.ID

	type Types::ApplauseType

	def call(_obj, args, ctx) 
		Applause.create!(
			performance: Performance.find_by(id: args[:performanceId]),
			artist: ctx[:current_user]
		)
	end 
end