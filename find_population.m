function [tot_pop, m_pop, f_pop] = find_population(population, region_positions)

    tot_pop = zeros((size(region_positions,2)),1);
    m_pop = zeros((size(region_positions,2)),1);
    f_pop = zeros((size(region_positions,2)),1);
    
    for iter = 1:size(region_positions,2)
        
        tot_pop(iter) = population(region_positions(iter), 5);
        m_pop(iter) = population(region_positions(iter), 14);
        f_pop(iter) = population(region_positions(iter), 23);
        
    end

end