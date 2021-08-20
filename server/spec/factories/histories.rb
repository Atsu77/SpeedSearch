FactoryBot.define do
  factory :history do
    url "https://example.com"
    title "1番目のタイトル"
    association :user

    after(:create) do |history|
      create(:history_tag, history: history, tag: create(:tag))
    end
  end
end
