function [max_value, max_position] = compute_max_values(num, region_positions, type)

if strcmp(type, 'total')
    column = 5;
elseif strcmp(type, 'male')
    column = 14;
elseif strcmp(type, 'female')
    column = 23;
else 
    column = -1;
end


max_value = zeros((size(region_positions,2)),1);
max_position = zeros((size(region_positions,2)),1);

for iter = 1 : size(region_positions, 2)
    if iter == size(region_positions, 2)
        [max_value(iter), max_position(iter)] = max(num((region_positions(iter)+1:size(num,1)-4),column));
        max_position(iter) = max_position(iter) + region_positions(iter);
    else
        [max_value(iter), max_position(iter)] = max(num((region_positions(iter)+1:region_positions(iter+1)-1),column));
        max_position(iter) = max_position(iter) + region_positions(iter);
    end
end