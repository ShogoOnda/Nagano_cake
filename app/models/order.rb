class Order < ApplicationRecord

  # 注文ステータス（0=支払待ち / 1=支払済み / 2=制作中 / 3=発送準備中 / 4=発送済み）
  enum order_status: {
      waiting: 0,
      paid_up: 1,
      making:2,
      preparing: 3,
      shipped: 4
  }

end
