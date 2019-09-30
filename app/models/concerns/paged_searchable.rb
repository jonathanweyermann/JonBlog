module PagedSearchable
  extend ActiveSupport::Concern

	def paged_search(page, query)
		if_searched(query).order('created_at DESC').paginate(per_page: 10, page: page)
	end

	private

	def if_searched(query)
		return all unless query.present?
		search(query)
	end

  def search(query)
    raise NotImplementedError, "superclass did not define #self.search(quote)"
  end
end
