module V1
  class DocumentationController < ActionController::Base
    def index
      render file: Api::DocSelectorService.call('1'), layout: false
      rescue ActionView::MissingTemplate => error
        raise ActionController::RoutingError.new('Documentation with current version not found.')
    end
  end
end
