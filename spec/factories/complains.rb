FactoryBot.define do
  factory :complain do
    sequence(:company) { |seq| "Company test #{seq}" }
    street { 'Avenida Jorge' }
    neighbourhood { 'Vila Maria' }
    city { 'São Paulo' }
    state { 'SP' }
    country { 'Brasil' }
  end
end
