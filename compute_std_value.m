function std_values = compute_std_value(num, region_positions, type)

if strcmp(type, 'total')
    column = 5;
elseif strcmp(type, 'male')
    column = 14;
elseif strcmp(type, 'female')
    column = 23;
else 
    column = -1;
end

std_values = zeros((size(region_positions,2)),1);

for iter = 1: size(region_positions, 2)    
    if iter == size(region_positions, 2)
        tmp_num = num(region_positions(iter)+1:size(num,1)-4,column);
    else
        tmp_num = num(region_positions(iter)+1:region_positions(iter+1)-1,column);
    end
    
    tmp_num = tmp_num(~isnan(tmp_num));
    std_values(iter) = std(tmp_num);
end

end