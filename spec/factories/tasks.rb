FactoryBot.define do

  factory :task do
    name { 'Test task' }
    user
    project
  end

end