FactoryBot.define do
  factory :company do
    sequence(:name) { |seq| "Company test #{seq}" }
  end
end
