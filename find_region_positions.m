function pos = find_region_positions(regions)
    str = 'REGION';   
    
    find_region = strncmpi(str, regions(:,1), length(str)); % extract where is the string REGION
    
    j = 1;
    tmp_pos = zeros(size(regions,1));
    for iter = 1 : size(find_region,1)
        if find_region(iter) == 1
            tmp_pos(j) = iter - 4;
            j = j+1;
        end
    end
    
    pos = nonzeros(tmp_pos)';
    
end