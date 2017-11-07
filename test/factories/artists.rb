FactoryBot.define do
	factory :artist do
		sequence(:name) { |i| "Artist #{i}"}
		sequence(:email) {|i| "artist#{i}@example.com" }
		password {'123456'}
	end
end