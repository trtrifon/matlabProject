function [min_value, min_position] = compute_min_values(num, region_positions, type)

if strcmp(type, 'total')
    column = 5;
elseif strcmp(type, 'male')
    column = 14;
elseif strcmp(type, 'female')
    column = 23;
else 
    column = -1;
end


min_value = zeros((size(region_positions,2)),1);
min_position = zeros((size(region_positions,2)),1);

for iter = 1 : size(region_positions, 2)
    if iter == size(region_positions, 2)
        [min_value(iter), min_position(iter)] = min(num((region_positions(iter)+1:size(num,1)-4),column));
        min_position(iter) = min_position(iter) + region_positions(iter);
    else
        [min_value(iter), min_position(iter)] = min(num((region_positions(iter)+1:region_positions(iter+1)-1),column));
        min_position(iter) = min_position(iter) + region_positions(iter);
    end
end