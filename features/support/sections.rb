require 'govuk_content_models/test_helpers/factories'

def create_section
  FactoryGirl.create(
    :tag,
    tag_id: "crime",
    tag_type: "section",
    title: "Crime"
  )
end

def create_sections
  create_section
  FactoryGirl.create(
    :tag,
    tag_id: "crime/batman",
    tag_type: "section",
    title: "Batman"
  )
  return ["crime", "crime/batman"].map { |tag_id| Tag.where(tag_id: tag_id, tag_type: 'section').first }
end

def select_section(section)
  select section.title, :from => "artefact[sections][]"
end

def unselect_section(section)
  tag_id = section.tag_id
  within(:xpath, "//option[@value='#{tag_id}'][@selected='selected']/../..") do
    # Can't rely on the Remove button here, as JavaScript may not have loaded
    # and the buttons aren't full of progressive enhancement goodness
    select "Select a section", from: "artefact[sections][]"
  end
end

def add_section(artefact, section)
  # Ugh, inconsistent section getting and setting
  artefact.sections = (artefact.sections + [section]).map(&:tag_id)
  artefact.save!
end
