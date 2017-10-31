class Resolvers::CreateArtist < Graphql::Function 
	AuthProviderInput = Graphql::InputObjectType.define do
		name 'AuthProviderSignupData'

		argument :email, Types::AuthProviderEmailInput
	end

	argument :name, !types.String
	argument :about, types.String
	argument :email, !AuthProviderInput

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