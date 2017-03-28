class Service
  class << self

    def flash_sale
      Deal.all.update_all(is_live:false)
      todays_deal = Deal.where(publish_date: Time.current.to_date).first
      todays_deal.update_columns(is_live: true) if todays_deal.present?
    end

  end
end
