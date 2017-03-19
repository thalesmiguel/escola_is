FactoryGirl.define do
  factory :estudante do
    nome { Faker::StarWars.character }
    numero_de_registro { Faker::Number.number(10) }
  end
end
