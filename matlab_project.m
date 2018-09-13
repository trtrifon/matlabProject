% Matlab project

%Question_1

[num,txt,raw] = xlsread('apogr_2011.xlsx', 'Sheet1');

%Question_2

region = txt(:,3);  % select the column that contains the names of regions.

region_positions = find_region_positions(region);

%Question_3

[total_population, male_population, female_population] = find_population(num, region_positions);

%Question_4
% Compute max values

[max_values_total_population, max_tot_position] = compute_max_values(num, region_positions, 'total');

[max_values_male_population, max_m_position] = compute_max_values(num, region_positions, 'male');

[max_values_female_population, max_f_position] = compute_max_values(num, region_positions, 'female');

max_age_total_population = find_max_age(txt, region_positions, max_tot_position);

max_age_male_population = find_max_age(txt, region_positions, max_m_position);

max_age_female_population = find_max_age(txt, region_positions, max_f_position);

% Compute min values

[min_values_total_population, min_tot_position] = compute_min_values(num, region_positions, 'total');

[min_values_male_population, min_m_position] = compute_min_values(num, region_positions, 'male');

[min_values_female_population, min_f_position] = compute_min_values(num, region_positions, 'female');

min_age_total_population = find_min_age(txt, region_positions, min_tot_position);

min_age_male_population = find_min_age(txt, region_positions, min_m_position);

min_age_female_population = find_min_age(txt, region_positions, min_f_position);

% Compute standard deviation

total_population_std = compute_std_value(num, region_positions, 'total');

male_population_std = compute_std_value(num, region_positions, 'male');

female_population_std = compute_std_value(num, region_positions, 'female');


% Compute mean values

total_population_mean_value = compute_mean_value(num, region_positions, 'total');

male_population_mean_value = compute_mean_value(num, region_positions, 'male');

female_population_mean_value = compute_mean_value(num, region_positions, 'female');

% Question_5

%plot min values of male and female population per region
  
fig1 = figure;

regions = [{'East Macedonia and Thrace'}, {'Central Macedonia'}, {'West Macedonia'}, {'Hpeiros'}, {'Thessaly'}, {'Central Greece'} ...
            , {'Ionian Islands'}, {'West Greece'}, {'Peloponese'}, {'Attica'}, {'North Aigean'} ...
            , {'South Aigean'}, {'Crete'}];   
        
plot(region_positions, min_values_male_population, '-*b', region_positions, min_values_female_population, '-^r');

for K = 1:size(region_positions,2)
  text(region_positions(K),min_values_male_population(K),num2str(min_values_male_population(K)));
  text(region_positions(K),min_values_female_population(K),num2str(min_values_female_population(K)));
end

set(gca, 'XTick', region_positions, 'XTickLabel', regions);
set(gcf,'units','normalized','outerposition',[0 0 1 1]);

xlabel('Region');
ylabel('Population');
legend('male population', 'female population', 'Location', 'northwest');
title('Min values of male/female population per region');

hold on;

%Question_6

fig2 = figure;

sc1 = scatter(region_positions, min_values_male_population,'g','filled');

hold on;

sc2 = scatter(region_positions, min_values_female_population,'r','filled');

for K = 1:size(region_positions,2)
  text(region_positions(K),min_values_male_population(K),num2str(min_values_male_population(K)));
  text(region_positions(K),min_values_female_population(K),num2str(min_values_female_population(K)));
end

set(gca, 'XTick', region_positions, 'XTickLabel', regions);
set(gcf,'units','normalized','outerposition',[0 0 1 1]);

xlabel('Region');
ylabel('Population');
legend([sc1, sc2], {'male population','female population'}, 'Location', 'northwest');
title('Min values of male/female population per region');

hold on;

%Question_7

fig3 = figure;

mean_values = [male_population_mean_value'; female_population_mean_value'];

bar(region_positions, mean_values');

set(gca, 'XTick', region_positions, 'XTickLabel', regions);
set(gcf,'units','normalized','outerposition',[0 0 1 1]);

xlabel('Region');
ylabel('Population');
legend({'male', 'female'});
title('Mean values of male/female population per region');

hold on;

%Question_8

save_figure(fig1, 'Figure_1.png');

save_figure(fig2, 'Figure_2.png');

save_figure(fig3, 'Figure_3.png');


