FactoryBot.define do
  factory :tag, class: 'Tags' do
    sequence(:tag_name) { |n| "Tag_#{n}"}
  end
end
