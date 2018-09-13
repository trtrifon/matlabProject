function max_age = find_max_age(txt, region_positions, position)

max_age = zeros((size(region_positions,2)),1);

for iter = 1:size(region_positions,2)
    age = str2double(txt(position(iter)+4,3));
    max_age(iter) = age(1:1);
end