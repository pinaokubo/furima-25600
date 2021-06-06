class Category < ActiveHash::Base
  self.data = [
    { id: 0, name: '--' },
    { id: 1, name: 'ファッション' },
    { id: 2, name: 'グルメ・飲料' },
    { id: 3, name: '日用品・ヘルスケア' },
    { id: 4, name: 'コスメ・ヘアケア' },
    { id: 5, name: 'ベビー・キッズ' },
    { id: 6, name: '家電' },
    { id: 7, name: 'スポーツ・アウトドア' },
    { id: 8, name: 'エンタメ・ホビー ' },
    { id: 9, name: 'その他' }
  ]
  include ActiveHash::Associations
  has_many :products
end
