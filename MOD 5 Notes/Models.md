EventData
belongs_to :country, city, or person
belongs_to :user
has_many: timeLines

EventData
object.type == country
country.find(EventData.type.id)
object.type == city
city.find(EventData.type.id)
object.type == person
person.find(EventData.type.id)


Person
has_many :event_data
has_many :locations, through: :event_data
has_many :time_lines

TimeLine
belongs_to :user
belongs_to :person
has_many :event_data

Country
has_many :cities

City
belongs_to :country

User
has_many :time_lines
has_many :event_data