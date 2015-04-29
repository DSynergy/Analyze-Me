module ApplicationHelper

    BACKGROUND = ['ankor', 'aspen', 'beats', 'berlin', 'budapest', 'buenos_aires', 'copper', 'cusco',
   'cz', 'dcmetro', 'Denver', 'Haup', 'iguazu', 'jamaica', 'jamaica_country', 'Japan', 'Jelly_Fish',
   'Kebler', 'rio', 'salt_flats', 'telluride', 'tokyo', 'uyuni']

  def randomized_background_image
    images = BACKGROUND.each {|image| ["#{image}.JPG"]}
    images[rand(images.size)]
  end

end
