class Search < ApplicationRecord

  def search_lodgings

    lodgings = Lodging.all
    lodgings = lodgings.where(['name LIKE ?', "%#{keywords}"]) if keywords.present?
    lodgings = lodgings.where(['availability_from <= ?', check_in]) if check_in.present?
    lodgings = lodgings.where(['availability_to >= ?', check_out]) if check_out.present?
    lodgings = lodgings.where(['daily_fee >= ?', daily_fee_min]) if daily_fee_min.present?
    lodgings = lodgings.where(['daily_fee <= ?', daily_fee_max]) if daily_fee_max.present?
    lodgings = lodgings.where(['location LIKE ?', location]) if location.present?
    lodgings = lodgings.where(['pets_accepted LIKE ?', pets_accepted]) if pets_accepted.present?
    lodgings = lodgings.where(['parking_lot LIKE ?', parking_lot]) if parking_lot.present?
    lodgings = lodgings.where(['breakfast_included LIKE ?', breakfast_included]) if breakfast_included.present?
    lodgings = lodgings.where(['single_bed == ?', single_bed]) if single_bed.present?
    lodgings = lodgings.where(['double_bed == ?', double_bed]) if double_bed.present?
    lodgings = lodgings.where(['rooms == ?', rooms]) if rooms.present?
    lodgings = lodgings.where(['bathrooms == ?', bathrooms]) if bathrooms.present?
    lodgings = lodgings.where(['jacuzzi LIKE ?', jacuzzi]) if jacuzzi.present?
    lodgings = lodgings.where(['gym LIKE ?', gym]) if gym.present?
    lodgings = lodgings.where(['smoke_free LIKE ?', smoke_free]) if smoke_free.present?

    return lodgings
  end
end
