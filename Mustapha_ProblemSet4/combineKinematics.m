function output = combineKinematics(trials, var)
%This function computes all the spike counts given for a particular angle
%across all trials. It then determines how many of these spike counts are
%unique.


combinedKinematics = [];

for i = 1:trials
    currentKinematics = Kinematics.Trials{1, i}(:,var);
    combinedKinematics = vertcat(combinedKinematics, currentKinematics);
end

output = combinedKinematics;
end