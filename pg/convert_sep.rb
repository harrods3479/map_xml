require 'csv'

# data_path = 'data/rasp.csv'
data_path = ARGV[0]
# output_path = 'output/bus.xml'
output_path = ARGV[1]

output = []

car_status = ARGV[2]
if car_status == 'up'
    car = "乗車"
elsif car_status == 'down'
    car = "降車"
else
    car = ""
end

output.push('<?xml version="1.0" encoding="UTF-8"?>')
output.push("<markers>")

temp_data = CSV.read(data_path)
temp_data.each do |line|
  if line.include?('no data')
    # puts 'no'
  else
    # puts "[#{line[0]}] #{line[2]}: #{line[3]}: #{line[4]}"
    # <marker category="Attr_01" lat="36.2219716667" lng="137.96977" contact="" data="乗車1人"/>
    if car == "乗車"
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
    end
    line_str = '  <marker category="' + _attr + '" lat="'+ line[2] +'" lng="' + line[3] + '" contact="' + line[5] + '" data="' + car + line[4] + '人"/>'
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