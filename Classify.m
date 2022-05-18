function Class = Classify(Weights,Biases,Features)
scores = Biases + sum((Weights .* Features));
max_score = max(scores);
max_score_index = find(scores == max_score);
Class = max_score_index - 1;
