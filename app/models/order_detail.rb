class OrderDetail < ApplicationRecord
  belongs_to :item
  belongs_to :order
  # ステータス（0=支払待ち / 1=支払済み / 2=制作中 / 3=発送準備中 / 4=発送済み）
  enum making_status: {
    not_produced: 0,
    waiting_for_deposit: 1,
    production: 2,
    complete: 3
  }

end
