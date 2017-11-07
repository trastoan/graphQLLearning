class Resolvers::CreatePerformance < GraphQL::Function 
	
	argument :title, !types.String
	argument :about, types.String
	argument :place, !types.String

	type Types::PerformanceType

	def call(obj, args, ctx) 
		Performance.create!(
			title: args[:title],
			about: args[:about],
			place: args[:place],
			artist: ctx[:current_user]
		)

	rescue ActiveRecord::RecordInvalid => e
		GraphQL::ExecutionError.new("Invalid input: #{e.record.errors.full_messages.join(', ')}")
	end

end