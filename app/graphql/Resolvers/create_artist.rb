class Resolvers::CreateArtist < GraphQL::Function 
	AuthProviderInput = GraphQL::InputObjectType.define do
		name 'AuthProviderSignupData'

		argument :email, Types::AuthProviderEmailInput
	end

	argument :name, !types.String
	argument :about, types.String
	argument :authProvider, !AuthProviderInput

	type Types::ArtistType

	def call(_obj, args, _ctx) 
		Artist.create!(
			name: args[:name],
			about: args[:about],
			email: args[:authProvider][:email][:email],
			password: args[:authProvider][:email][:password]
		)
	end
end