Types::QueryType = GraphQL::ObjectType.define do
  name "Query"
  
  field :allPerformances, function: Resolvers::PerformanceSearch
  field :allArtists, function: Resolvers::ArtistSearch  
end
