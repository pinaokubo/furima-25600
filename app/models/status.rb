class Status < ActiveHash::Base
  self.data = [
    { id: 0, data: '--' },
    { id: 1, data: '新品・未使用' },
    { id: 2, data: '未使用に近い' },
    { id: 3, data: '目立った傷や汚れなし' },
    { id: 4, data: 'やや傷や汚れあり' },
    { id: 5, data: '傷や汚れあり' }
  ]
  include ActiveHash::Associations
  has_many :products
end
