FactoryBot.define do
	factory :performance do
		artist
		sequence( :title) {|i| "Performance #{i}"}
		sequence( :about) {|i| "About an incredible #{i} performance"}
		sequence( :place) {|i| "#{i} Street"}
	end
end