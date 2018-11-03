module V1
  class DocumentationController < ActionController::Base
    def index
      render file: Api::DocSelectorService.call(self), layout: false
      rescue ActionView::MissingTemplate
        render html: 'Documentation api-file not found.', status: 404
    end
  end
end
