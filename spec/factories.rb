FactoryGirl.define do
  factory :basic do
    full_name "John"
    phone "9898989898"
  end

  factory :education do
    degree "B Tech"
    college "my college"
    location "bangalore"
    year_of_grad 2015
    gpa 6.7
  end

  factory :project do
    title "project1"
    description "desc1"
  end
end
