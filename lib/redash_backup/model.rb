require 'active_record'
require 'pg'

class Connector < ActiveRecord::Base
  self.abstract_class = true
  establish_connection
end

class Dashboard < Connector
  has_many :widgets
  scope :active, -> { where(is_draft: false, is_archived: false) }
end

class Query < Connector
  scope :active, -> { where(is_draft: false, is_archived: false) }
  scope :inactive, -> do
    left_joins(visualizations: { widgets: :dashboard })
      .where('
        queries.is_archived = false
        AND dashboards.is_draft = false
        AND dashboards.is_archived = false
      ')
  end
  has_many :visualizations
end

class Visualization < Connector
  self.inheritance_column = :_type_disabled
  belongs_to :query
  has_many :widgets
end

class Widget < Connector
  belongs_to :visualization
  belongs_to :dashboard
end
