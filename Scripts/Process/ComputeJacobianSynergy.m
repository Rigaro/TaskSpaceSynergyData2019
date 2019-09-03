function synergy = ComputeJacobianSynergy(qShoulder, qElbow, alpha, upperArmLength, lowerArmLength)
    qShoulder_DOM = qShoulder - alpha;
    %Compute the desired elbow velocity
    synergy = (upperArmLength * cos(qShoulder_DOM) + lowerArmLength * cos(qShoulder_DOM + qElbow)) / (lowerArmLength * cos(qShoulder_DOM + qElbow));
end