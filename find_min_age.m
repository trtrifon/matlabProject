function min_age = find_min_age(txt, region_positions, position)

min_age = zeros((size(region_positions,2)),1);

for iter = 1:size(region_positions,2)
    age = str2double(txt(position(iter)+4,3));
    min_age(iter) = age(1:1);
end