class ClientSearch
  extend Forwardable

  def_delegators :@clients, :map, :each, :size, :empty?, :first, :join
  attr_reader :clients

  def initialize(clients)
    @clients = clients
  end

  def self.find(first_name, last_name, city, state, facility_id)
    where = ''
    if !first_name.blank? || !last_name.blank?
      where << " exists (select 1 from people p where p.id = c.id "
      where << " and first_name like '#{first_name}%' " if !first_name.blank?
      where << " and last_name like '#{last_name}%' " if !last_name.blank?
      where << " )"
    end
    if !city.blank? || !state.blank?
      where << " and " if where.length > 0
      where << " exists (select 1 from people p join street_addresses a on p.street_address_id = a.id where p.id = c.id "
      where << " and city like '#{city}%' " if !city.blank?
      where << " and state like '#{state}%' " if !state.blank?
      where << " )"
    end
    if !facility_id.blank?
      where << " and " if where.length > 0
      where << " facility_id = #{facility_id}"
    end

    sql = "select * from clients c where "
    sql << where
    Client.includes(:person, :address).find_by_sql(sql).to_a
  end


end
