# frozen_string_literal: true

## Application Helpers
module ApplicationHelpers
  # Get the website name from site.yml
  def website_name
    data.site.name
  end

  # Get the base url from data
  def base_url
    data.site.base_url
  end

  # Permalink url for sharing
  def permalink_url
    full_url(current_page.url)
  end

  # Get the title from frontmatter if any
  def frontmatter_title
    current_page.data.title
  end

  # If there's a title in frontmatter then join them with the website_name
  def local_title(page = current_page)
    dont_append = page.data.dont_append_page_title

    if dont_append
      frontmatter_title
    elsif frontmatter_title
      [frontmatter_title, website_name].join(' | ')
    end
  end

  # Page title is localized or title
  def page_title
    local_title || website_name
  end
  
  # Use frontmatter for meta description
  def meta_description(page = current_page)
    if content_for?(:meta_description)
      yield_content(:meta_description)
    elsif page.data.description
      page.data.description
    else
      data.site.meta_description
    end
  end

  # Robots is current page data or default
  def robots
    current_page.data.robots || 'noydir,noodp,index,follow'
  end

  # Get full url
  def full_url(url)
    URI.join(base_url, url).to_s
  end
end