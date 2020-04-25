# encoding: utf-8

module SportDb
  module Import

class League
  attr_reader   :key, :name, :country, :intl
  attr_accessor :alt_names

  ## special import only attribs
  attr_accessor :alt_names_auto    ## auto-generated alt names

  def initialize( key:, name:, alt_names: [], alt_names_auto: [],
                  country: nil, intl: false )
    @key            = key
    @name           = name
    @alt_names      = alt_names
    @alt_names_auto = alt_names_auto
    @country        = country
    @intl           = intl
  end

  def intl?()      @intl == true; end
  def national?()  @intl == false; end
  alias_method   :domestic?, :national?

end   # class League

end   # module Import
end   # module SportDb