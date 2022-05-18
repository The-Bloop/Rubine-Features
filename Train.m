function [weights , bias] = Train(samples)
%disp('Training Starts')
class_samples = [];
means = [];
avg_cov = zeros(13,13);
for i = 1:10
    class_samples = samples(:,:,i);
    class_mean = sum(class_samples,2,'omitnan')./12;
    means = [means class_mean];
    class_cov = cov(class_samples','omitrows');
    avg_cov = avg_cov + class_cov;
end
%disp('Average Covarience Found')

avg_cov = avg_cov ./ 11;
denom = -10 + (12*10);
avg_cov = avg_cov ./ denom;
avg_cov_inv = inv(avg_cov);
abc = [];
weights = [];
weight = [];
bias = [];

%disp('Finding Weights and Biases')
for j = 1:10
    class_means = means(:,j);
    abc = avg_cov_inv .* class_means;
    weight = sum(abc,2,'omitnan');
    class_bias = (-1/2)*sum((weight .* class_means),'all','omitnan');
    bias = [bias class_bias];
    weights = [weights weight];  
end
%disp('Done with Weights and Biases')

