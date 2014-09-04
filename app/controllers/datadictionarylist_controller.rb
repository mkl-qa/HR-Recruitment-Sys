class DatadictionarylistController < ApplicationController
  def index
    @data_dictionaries = DataDictionary.where( "id < ?", "900").order("id")
  end
end
