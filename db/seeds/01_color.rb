if Color.count < 5
  5.times do |c|
    hx2 = c % 2 == 0 && c != 3 ? Faker::Color.hex_color : nil
    mat = c % 3 == 0 && c != 0 ? File.open(Dir['app/assets/images/alligator_sample.jpg'].sample) : nil
    Color.create! [
      title: Faker::Color.color_name,
      material: mat,
      hex1: Faker::Color.hex_color,
      hex2: hx2
    ]
  end
end
