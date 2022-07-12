

function newPsth(spikeCounts, binEdges, time, unit, bar_bool)
%This function returns a peri-stimulus time histogram for a neuron
%dependent on the spikes that are found in bins of a specified size.

%This is done using a given set of bin edges and spike counts.
% The histogram finds spikes perbin across all trials, so the intial cell is 
%converted to a one dimensional array and each spike is 
%allocated to the bin that its spike time is in.
%Standard error of mean is also calculated among the bins, which is then
%displayed as an error bar for the bars that represent the bin counts. Also
%takes in boolean value to determine if the plot should be bar or line.




%There is one more edge than total number of bins, due to there being an
%edge for the start and end of the recording time span. To get bins to line
%up with edges, edges are averaged with the length of the subsequent edge 
%to get mid-point edges correspoding to each bin.
get_bins = (binEdges(1:end-1) + binEdges(2:end)) / 2; 

spike_std = std(spikeCounts);
se = spike_std./sqrt(length(spikeCounts));
ebs = ones(size(spikeCounts)) .* se;


if bar_bool == 1
hold on;
bar(get_bins, spikeCounts, color);
sem = errorbar(get_bins, spikeCounts, ebs, ebs);
sem.Color = 'k';                            
sem.LineStyle = 'none';
hold off;
else
plot(get_bins, spikeCounts,'LineWidth',2);
%plot(get_bins, spikeCounts - ebs, 'k' ,'LineWidth',2);
%plot(get_bins, spikeCounts + ebs, 'k' ,'LineWidth',2);

end
set(gca, 'TickDir', 'out', 'Box', 'off');
xlabel('Time (ms)'); 
ylabel('Spikes / 10ms'); 
axis tight;
title(sprintf('Peri Stimulus Time Histogram of Bin length 10ms for unit %d (ms)', unit));


end
