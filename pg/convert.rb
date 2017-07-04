require 'csv'

# data_path = 'data/rasp.csv'
data_path_up = ARGV[0]
data_path_down = ARGV[1]
# output_path = 'output/bus.xml'
output_path = ARGV[2]

output = []

output.push('<?xml version="1.0" encoding="UTF-8"?>')
output.push("<markers>")

temp_data_up = CSV.read(data_path_up)
temp_data_up.each do |line|
  if line.include?('no data')
    # puts 'no'
  else
    if line[4] == '0'
        _attr = "Attr_00"
    elsif line[4] == '1'
        _attr = "Attr_01"
    elsif line[4] == '2' || line[4] == '3'
        _attr = "Attr_02"
    elsif line[4] == '4' || line[4] == '5'
        _attr = "Attr_03"
    else 
        _attr = "Attr_04"        
    end
    line_str = '  <marker category="' + _attr + '" lat="'+ line[2] +'" lng="' + line[3] + '" contact="' + line[5] + '" data="乗車' + line[4] + '人"/>'
    output.push(line_str)
  end
end

temp_data_down = CSV.read(data_path_down)
temp_data_down.each do |line|
  if line.include?('no data')
    # puts 'no'
  else
    if line[4] == '0'
        _attr = "Attr_00"
    elsif line[4] == '1'
        _attr = "Attr_05"
    elsif line[4] == '2' || line[4] == '3'
        _attr = "Attr_06"
    elsif line[4] == '4' || line[4] == '5'
        _attr = "Attr_07"
    else 
        _attr = "Attr_08"        
    end
    line_str = '  <marker category="' + _attr + '" lat="'+ line[2] +'" lng="' + line[3] + '" contact="' + line[5] + '" data="降車' + line[4] + '人"/>'
    output.push(line_str)
  end
end

output.push("</markers>")

puts output

File.open(output_path,"w") do |text|
    for l in output
        text.puts(l)
    end
end