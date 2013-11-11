class PagesHandler

  ALL_PAGES =
      [
          BambooPage.new('bamboo', 30.seconds, 'https://build.numerexfast.com/bamboo/telemetry.action?filter=favourites'),
          Page.new('zenkai', 20.seconds)
      ]

  class << self

    def instance
      @@instance ||= PagesHandler.new
    end

  end

  def next!
    @current_index = (@current_index + 1) % @pages.length
    @current_page  = @pages[@current_index]
  end

  def current
    @current_page
  end

  private

  def initialize
    @pages = ALL_PAGES
    @current_index = 0
    @current_page  = @pages[@current_index]
  end

end