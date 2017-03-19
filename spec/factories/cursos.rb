FactoryGirl.define do
  factory :curso do
    nome { Faker::StarWars.planet }
    descricao { Faker::Lorem.sentence }
  end
end
